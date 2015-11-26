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

@:allow(snow.systems.audio.Audio)
@:log_as('openal')
class Audio implements snow.modules.interfaces.Audio {

    public var device : Device;
    public var context : Context;

    var app : snow.Snow;

    function new(_app:snow.Snow) {

        app = _app;
        instances = new Map();
        buffers = new Map();
        pans = new Map();

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

    function shutdown() {

        //:todo:
        instances = null;
        buffers = null;
        pans = null;

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


    function onevent(event:SystemEvent) {}

//

    var handle_seq = 0;
        /** The map of handles to AL audio instances */
    var instances : Map<AudioHandle, Int>;
        /** A map of handle to pan values */
    var pans : Map<Int, Float>;
        /** A map of audio source to AL buffer handles */
    var buffers : Map<AudioSource, Int>;

    inline function source_of(_handle:AudioHandle) {

        #if debug
            return instances.exists(_handle) ? instances.get(_handle) : -1;
        #else
            return instances.get(_handle);
        #end

    } //source

        /** Play an instance of the given audio source, returning a disposable handle */
    public function play(_source:AudioSource, _volume:Float, _paused:Bool) : AudioHandle {

        assertnull(_source);
        assertnull(_source.asset);
        assertnull(_source.asset.audio);
        assertnull(_source.asset.audio.data);

        var _handle = handle_seq;
        var _instance = AL.genSource();

            AL.sourcef(_instance, AL.GAIN, _volume);
            AL.sourcei(_instance, AL.LOOPING, AL.FALSE);

            AL.sourcef(_instance, AL.PITCH, 1.0);
            AL.source3f(_instance, AL.POSITION, 0.0, 0.0, 0.0);
            AL.source3f(_instance, AL.VELOCITY, 0.0, 0.0, 0.0);

        instances.set(_handle, _instance);

        var _buffer = buffers.get(_source);
        if(_buffer == null) {

            var _data = _source.asset.audio.data;
            var _format = source_format(_data);

            log(' > new buffer / ${_source.asset.id} / $_format');

            _buffer = AL.genBuffer();
            AL.bufferData(_buffer, _format, _data.rate, _data.samples.toBytes().getData(), _data.samples.byteOffset, _data.samples.byteLength);            
            buffers.set(_source, _buffer);

        } //_buffer == null

        AL.sourcei(_instance, AL.BUFFER, _buffer);
        AL.sourcePlay(_instance);

        handle_seq++;

        return _handle;

    } //play

        /** Play and loop a sound instance indefinitely. Use stop to end it.
            Returns a disposable handle */
    public function loop(_source:AudioSource, _volume:Float, _paused:Bool) : AudioHandle {

        var _handle = play(_source, _volume, _paused);
        var _source = source_of(_handle);

        AL.sourcei(_source, AL.LOOPING, AL.TRUE);

        return _handle;

    } //loop

        /** Pause a sound instance by name */
    public function pause(_handle:AudioHandle) : Void {

        var _source = source_of(_handle);
        #if debug if(_source == -1) return; #end

        AL.sourcePause(_source);

    } //pause

        /** Stop a sound instance by name */
    public function stop(_handle:AudioHandle) : Void {

        var _source = source_of(_handle);
        #if debug if(_source == -1) return; #end

        AL.sourceStop(_source);

    } //stop

        /** Set the volume of a sound instance */
    public function volume(_handle:AudioHandle, _volume:Float) : Void {

        var _source = source_of(_handle);
        #if debug if(_source == -1) return; #end

        AL.sourcef(_source, AL.GAIN, _volume);

    } //volume

    static inline var half_pi : Float = 1.5707;

        /** Set the pan of a sound instance. */
    public function pan(_handle:AudioHandle, _pan:Float) : Void {

        var _source = source_of(_handle);
        #if debug if(_source == -1) return; #end
        
        pans.set(_handle, _pan);

        AL.source3f(_source, AL.POSITION, Math.cos((_pan - 1) * (half_pi)), 0, Math.sin((_pan + 1) * (half_pi)));

    } //pan

        /** Set the pitch of a sound instance */
    public function pitch(_handle:AudioHandle, _pitch:Float) : Void {

        var _source = source_of(_handle);
        #if debug if(_source == -1) return; #end

        AL.sourcef(_source, AL.PITCH, _pitch);

    } //pitch

        /** Set the position of a sound instance */
    public function position(_handle:AudioHandle, _time:Float) : Void {

        var _source = source_of(_handle);
        #if debug if(_source == -1) return; #end

        AL.sourcef(_source, AL.SEC_OFFSET, _time);

    } //position

        /** Get the volume of a sound instance */
    public function volume_of(_handle:AudioHandle) : Float {

        var _source = source_of(_handle);
        #if debug if(_source == -1) return 0.0; #end

        return AL.getSourcef(_source, AL.GAIN);

    } //volume_of

        /** Get the pan of a sound instance */
    public function pan_of(_handle:AudioHandle) : Float {

        var _source = source_of(_handle);
        #if debug if(_source == -1) return 0.0; #end

        #if debug
            return pans.exists(_handle) ? pans.get(_handle) : -1;
        #else
            return pans.get(_handle);
        #end

    } //pan_of

        /** Get the pitch of a sound instance */
    public function pitch_of(_handle:AudioHandle) : Float {

        var _source = source_of(_handle);
        #if debug if(_source == -1) return 0.0; #end

        return AL.getSourcef(_source, AL.PITCH);

    } //pitch_of

        /** Get the position of a sound instance */
    public function position_of(_handle:AudioHandle) : Float {

        var _source = source_of(_handle);
        #if debug if(_source == -1) return 0.0; #end

        return AL.getSourcef(_source, AL.SEC_OFFSET);

    } //position_of

//internal

    function source_format(_data:AudioDataInfo) {

        var _format = AL.FORMAT_MONO16;

        if(_data.channels > 1) {
            if(_data.bits_per_sample == 8) {
                _format = AL.FORMAT_STEREO8;
            } else {
                _format = AL.FORMAT_STEREO16;
            }
        } else { //mono
            if(_data.bits_per_sample == 8) {
                _format = AL.FORMAT_MONO8;
            } else {
                _format = AL.FORMAT_MONO16;
            }
        }

        return _format;

    } //source_format

} //Audio

