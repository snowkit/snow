package snow.modules.openal;

import snow.api.Debug.*;
import snow.types.Types;
import snow.api.Promise;
import snow.api.buffers.Uint8Array;
import snow.api.buffers.Float32Array;
import snow.systems.audio.AudioSource;

import snow.modules.openal.AL;
import snow.modules.openal.AL.Context;
import snow.modules.openal.AL.Device;

@:log_as('openal')
@:allow(snow.modules.openal)
@:allow(snow.systems.audio.Audio)
class Audio implements snow.modules.interfaces.Audio {

    public var device : Device;
    public var context : Context;

    var app : snow.Snow;

    function new(_app:snow.Snow) {

        app = _app;
        instances = new Map();
        buffers = new Map();

        log('init');
        device = ALC.openDevice();

        if(device == null) {
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

        if(event.type == se_tick) {
            if(app.audio.active) {

                for(_handle in instances.keys()) {
                    var _snd = instances.get(_handle);
                        _snd.tick();

                    if(_snd.has_ended()) {
                        instances.remove(_handle);
                        app.audio.emit(ae_end, _handle);
                        _snd.destroy();
                        _snd = null;
                    }

                }
            }
        }

    } //onevent

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

        ALC.suspendContext(context);
        ALC.makeContextCurrent(cast null);

    } //suspend

    public function resume() {

        log('resuming context');

        ALC.processContext(context);
        ALC.makeContextCurrent(context);

    } //resume

//

    var handle_seq = 0;
        /** The map of handles to AL audio instances */
    var instances : Map<AudioHandle, ALAudioInstance>;
        /** A map of audio source to AL buffer handles */
    var buffers : Map<AudioSource, Int>;

    inline function instance_of(_handle:AudioHandle) : ALAudioInstance {

        return instances.get(_handle);

    } //instance_of

        /** Play an instance of the given audio source, returning a disposable handle */
    public function play(_source:AudioSource, _volume:Float, _paused:Bool) : AudioHandle {

        assertnull(_source);
        assertnull(_source.asset);
        assertnull(_source.asset.audio);
        assertnull(_source.asset.audio.data);

        var _handle = handle_seq;
        var _snd = switch(_source.is_stream) {
            case false: new ALAudioInstance(this, _handle, _source, _volume);
            case true : new ALAudioStreamInstance(this, _handle, _source, _volume);
        } 

        _snd.init();
        instances.set(_handle, _snd);

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
        var _snd = instance_of(_handle);
        _snd.looping = true;

        if(!_snd.source.is_stream) {
            AL.sourcei(_snd.alsource, AL.LOOPING, AL.TRUE);
        }

        return _handle;

    } //loop

        /** Pause a sound instance by name */
    public function pause(_handle:AudioHandle) : Void {

        var _snd = instance_of(_handle);
        #if debug if(_snd == null) return; #end

        AL.sourcePause(_snd.alsource);

    } //pause

        /** Stop a sound instance by name */
    public function stop(_handle:AudioHandle) : Void {

        var _snd = instance_of(_handle);
        #if debug if(_snd == null) return; #end

        AL.sourceStop(_snd.alsource);

    } //stop

        /** Set the volume of a sound instance */
    public function volume(_handle:AudioHandle, _volume:Float) : Void {

        var _snd = instance_of(_handle);
        #if debug if(_snd == null) return; #end

        AL.sourcef(_snd.alsource, AL.GAIN, _volume);

    } //volume

    static inline var half_pi : Float = 1.5707;

        /** Set the pan of a sound instance. */
    public function pan(_handle:AudioHandle, _pan:Float) : Void {

        var _snd = instance_of(_handle);
        #if debug if(_snd == null) return; #end
        
        _snd.pan = _pan;

        AL.source3f(_snd.alsource, AL.POSITION, Math.cos((_pan - 1) * (half_pi)), 0, Math.sin((_pan + 1) * (half_pi)));

    } //pan

        /** Set the pitch of a sound instance */
    public function pitch(_handle:AudioHandle, _pitch:Float) : Void {

        var _snd = instance_of(_handle);
        #if debug if(_snd == null) return; #end

        AL.sourcef(_snd.alsource, AL.PITCH, _pitch);

    } //pitch

        /** Set the position of a sound instance */
    public function position(_handle:AudioHandle, _time:Float) : Void {

        var _snd = instance_of(_handle);
        #if debug if(_snd == null) return; #end

        _snd.position(_time);

    } //position

        /** Get the volume of a sound instance */
    public function volume_of(_handle:AudioHandle) : Float {

        var _snd = instance_of(_handle);
        #if debug if(_snd == null) return 0.0; #end

        return AL.getSourcef(_snd.alsource, AL.GAIN);

    } //volume_of

        /** Get the pan of a sound instance */
    public function pan_of(_handle:AudioHandle) : Float {

        var _snd = instance_of(_handle);
        #if debug if(_snd == null) return 0.0; #end

        return _snd.pan;

    } //pan_of

        /** Get the pitch of a sound instance */
    public function pitch_of(_handle:AudioHandle) : Float {

        var _snd = instance_of(_handle);
        #if debug if(_snd == null) return 0.0; #end

        return AL.getSourcef(_snd.alsource, AL.PITCH);

    } //pitch_of

        /** Get the position of a sound instance */
    public function position_of(_handle:AudioHandle) : Float {

        var _snd = instance_of(_handle);
        #if debug if(_snd == null) return 0.0; #end

        return _snd.position_of();

    } //position_of

//internal


} //Audio

