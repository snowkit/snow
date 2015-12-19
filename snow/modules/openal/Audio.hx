package snow.modules.openal;

import snow.api.Debug.*;
import snow.types.Types;
import snow.api.Promise;
import snow.api.buffers.Uint8Array;
import snow.api.buffers.Float32Array;
import snow.systems.audio.AudioSource;
import snow.systems.audio.AudioInstance;

import snow.modules.openal.AL;
import snow.modules.openal.AL.Context;
import snow.modules.openal.AL.Device;
import snow.modules.openal.ALSound;
import snow.modules.openal.ALStream;

@:log_as('openal')
@:allow(snow.modules.openal)
@:allow(snow.systems.audio.Audio)
class Audio implements snow.modules.interfaces.Audio {

    public var device : Device;
    public var context : Context;

    var handle_seq = 0;
    var instances : Map<AudioHandle, ALSound>;
        /** A map of audio source to AL buffer handles */
    var buffers : Map<AudioSource, ALuint>;

    var app : snow.Snow;
    function new(_app:snow.Snow) {

        app = _app;
        instances = new Map();
        buffers = new Map();

        log('init');
        device = ALC.openDevice();

        if(device == null) {
            app.audio.active = false;
            log('failed / didn\'t create device!');
            return;
        }

        log('created device / ${device} / ${ ALCError.desc(ALC.getError(device)) }');

        context = ALC.createContext(device, null);
        log('created context / ${context} / ${ ALCError.desc(ALC.getError(device)) }');

        ALC.makeContextCurrent(context);
        log('set current / ${ ALCError.desc(ALC.getError(device)) }');

    } //new

    function onevent(event:SystemEvent) {

        if(event.type == se_ready) {

            app.audio.on(ae_destroyed, on_instance_destroyed);

        } //ready

        if(event.type == se_tick) {
            if(app.audio.active) {
                for(_handle in instances.keys()) {
                    var _snd = instances.get(_handle);
                        _snd.tick();

                    //:todo: determining when it ends
                    if(_snd.looping && !_snd.source.is_stream) {
                        if(_snd.current_time >= _snd.source.duration()) {
                            _snd.current_time = 0.0;
                            app.audio.emit(ae_end, _handle);
                        }
                    }

                    if(_snd.instance.has_ended()) {
                        app.audio.emit(ae_end, _handle);
                        _snd.instance.destroy();
                    }

                }
            }
        }

    } //onevent

    function on_instance_destroyed(_handle:AudioHandle) {

        // log('instance was destroyed: $_handle');

        var _snd = instances.get(_handle);

        if(_snd != null) {
            _snd.destroy();
            _snd = null;
        }

        instances.remove(_handle);

    } //_handle

    function shutdown() {

        //:todo:
        for(_snd in instances) {
            AL.sourceStop(_snd.alsource);
            AL.deleteSource(_snd.alsource);
        } instances = null;

        for(_buffer in buffers) {
            AL.deleteBuffer(_buffer);
        } buffers = null;

        ALC.makeContextCurrent(cast null);
        log('invalidate context / ${ ALCError.desc(ALC.getError(device)) }');

        ALC.destroyContext(context);
        log('destroyed context / ${ ALCError.desc(ALC.getError(device)) }');

        ALC.closeDevice(device);
        log('closed device / ${ ALCError.desc(ALC.getError(device)) }');

        device = null;
        context = null;

    } //shutdown

    public function suspend() {

        log('suspending context');
        log(ALError.desc(AL.getError()));
        log(ALCError.desc(ALC.getError(device)));

        #if android
            log('android: alc suspend');
            ALC.androidSuspend();
        #end

        ALC.suspendContext(context);
        ALC.makeContextCurrent(cast null);

    } //suspend

    public function resume() {

        log('resuming context');

        #if android
            log('android: alc resume');
            ALC.androidResume();
        #end

        ALC.processContext(context);
        ALC.makeContextCurrent(context);

        log(ALError.desc(AL.getError()));
        log(ALCError.desc(ALC.getError(device)));

    } //resume

    inline function snd_of(_handle:AudioHandle) : ALSound {

        return instances.get(_handle);

    } //snd_of

        /** Play an instance of the given audio source, returning a disposable handle */
    public function play(_source:AudioSource, _volume:Float, _paused:Bool) : AudioHandle {

        assertnull(_source);
        assertnull(_source.info);
        assertnull(_source.info.data);

        var _handle = handle_seq;
        var _inst = _source.instance(_handle);
        var _snd = switch(_source.is_stream) {
            case false: new ALSound(this, _source, _inst);
            case true : new ALStream(this, _source, _inst);
        }

        _snd.init();
        instances.set(_handle, _snd);

        AL.sourcef(_snd.alsource, AL.GAIN, _volume);

        if(!_paused) {
            AL.sourcePlay(_snd.alsource);
        }

        handle_seq++;

        return _handle;

    } //play

        /** Play and loop a sound instance indefinitely. Use stop to end it.
            Returns a disposable handle */
    public function loop(_source:AudioSource, _volume:Float, _paused:Bool) : AudioHandle {

        var _handle = play(_source, _volume, _paused);
        var _snd = snd_of(_handle);
        _snd.looping = true;

        if(!_snd.source.is_stream) {
            AL.sourcei(_snd.alsource, AL.LOOPING, AL.TRUE);
        }

        return _handle;

    } //loop

    public function pause(_handle:AudioHandle) : Void {

        var _snd = snd_of(_handle);
        #if debug if(_snd == null) return; #end

        AL.sourcePause(_snd.alsource);

    } //pause

    public function unpause(_handle:AudioHandle) : Void {

        var _snd = snd_of(_handle);
        #if debug if(_snd == null) return; #end

        AL.sourcePlay(_snd.alsource);

    } //unpause

    public function stop(_handle:AudioHandle) : Void {

        var _snd = snd_of(_handle);
        #if debug if(_snd == null) return; #end

        AL.sourceStop(_snd.alsource);

    } //stop

        /** Set the volume of a sound instance */
    public function volume(_handle:AudioHandle, _volume:Float) : Void {

        var _snd = snd_of(_handle);
        #if debug if(_snd == null) return; #end

        AL.sourcef(_snd.alsource, AL.GAIN, _volume);

    } //volume

    static inline var half_pi : Float = 1.5707;

        /** Set the pan of a sound instance. */
    public function pan(_handle:AudioHandle, _pan:Float) : Void {

        var _snd = snd_of(_handle);
        #if debug if(_snd == null) return; #end

        _snd.pan = _pan;

        AL.source3f(_snd.alsource, AL.POSITION, Math.cos((_pan - 1) * (half_pi)), 0, Math.sin((_pan + 1) * (half_pi)));

    } //pan

        /** Set the pitch of a sound instance */
    public function pitch(_handle:AudioHandle, _pitch:Float) : Void {

        var _snd = snd_of(_handle);
        #if debug if(_snd == null) return; #end

        AL.sourcef(_snd.alsource, AL.PITCH, _pitch);

    } //pitch

        /** Set the position of a sound instance */
    public function position(_handle:AudioHandle, _time:Float) : Void {

        var _snd = snd_of(_handle);
        #if debug if(_snd == null) return; #end

        _snd.position(_time);

    } //position

        /** Get the volume of a sound instance */
    public function volume_of(_handle:AudioHandle) : Float {

        var _snd = snd_of(_handle);
        #if debug if(_snd == null) return 0.0; #end

        return AL.getSourcef(_snd.alsource, AL.GAIN);

    } //volume_of

        /** Get the pan of a sound instance */
    public function pan_of(_handle:AudioHandle) : Float {

        var _snd = snd_of(_handle);
        #if debug if(_snd == null) return 0.0; #end

        return _snd.pan;

    } //pan_of

        /** Get the pitch of a sound instance */
    public function pitch_of(_handle:AudioHandle) : Float {

        var _snd = snd_of(_handle);
        #if debug if(_snd == null) return 0.0; #end

        return AL.getSourcef(_snd.alsource, AL.PITCH);

    } //pitch_of

        /** Get the position of a sound instance */
    public function position_of(_handle:AudioHandle) : Float {

        var _snd = snd_of(_handle);
        #if debug if(_snd == null) return 0.0; #end

        return _snd.position_of();

    } //position_of

        /** Get the playback state of a handle */
    public function state_of(_handle:AudioHandle) : AudioState {

        var _snd = snd_of(_handle);
        if(_snd == null || !app.audio.active) return as_invalid;

        return switch(AL.getSourcei(_snd.alsource, AL.SOURCE_STATE)) {
            case AL.PLAYING:                as_playing;
            case AL.PAUSED:                 as_paused;
            case AL.STOPPED, AL.INITIAL:    as_stopped;
            case _:                         as_invalid;
        }

    } //state_of

        /** Get the looping state of a handle */
    public function loop_of(_handle:AudioHandle) : Bool {

        var _snd = snd_of(_handle);
        #if debug if(_snd == null) return false; #end

        return _snd.looping;

    } //loop_of

        /** Get the audio instance of a handle, use with caution. */
    public function instance_of(_handle:AudioHandle) : AudioInstance {

        var _snd = snd_of(_handle);
        if(_snd == null) return null;

        return _snd.instance;

    } //instance_of

//internal


} //Audio

