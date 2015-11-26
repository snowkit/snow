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
import snow.modules.openal.ALAudioInstance;

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
        /** The map of audio instances to handles */
    public var instances : Map<Int, ALAudioInstance>;
        /** A map of audio source to AL buffer handles */
    var buffers : Map<AudioSource, Int>;

        /** Play an instance of the given audio source, returning a disposable handle */
    public function play(_source:AudioSource, _volume:Float, _paused:Bool) : AudioHandle {

        assertnull(_source);
        assertnull(_source.asset);
        assertnull(_source.asset.audio);
        assertnull(_source.asset.audio.data);

        var _handle = handle_seq;
        var _instance = new ALAudioInstance(_source, _volume);
        instances.set(_handle, _instance);

        // :todo: _source.singular
        var _buffer = buffers.get(_source);
        if(_buffer == null) {
            var _data = _source.asset.audio.data;
            var _format = source_format(_data);

            log(' > new buffer / ${_source.asset.id} / $_format');

            _buffer = AL.genBuffer();
            AL.bufferData(_buffer, _format, _data.rate, _data.samples.toBytes().getData(), _data.samples.byteOffset, _data.samples.byteLength);            
            buffers.set(_source, _buffer);

        } //_buffer == null

        AL.sourcei(_instance.al_source, AL.BUFFER, _buffer);
        AL.sourcePlay(_instance.al_source);

        handle_seq++;

        return _handle;

    } //play

        /** Play and loop a sound instance indefinitely. Use stop to end it.
            Returns a disposable handle */
    public function loop(_source:AudioSource, _volume:Float, _paused:Bool) : AudioHandle {

        var _handle = play(_source, _volume, _paused);
        var _inst = instances.get(_handle);

        AL.sourcei(_inst.al_source, AL.LOOPING, AL.TRUE);

        return _handle;

    } //loop

        /** Pause a sound instance by name */
    public function pause(_handle:AudioHandle) : Void {

        var _inst = instances.get(_handle);
        if(_inst == null) return;

        AL.sourcePause(_inst.al_source);

    } //pause

        /** Stop a sound instance by name */
    public function stop(_handle:AudioHandle) : Void {

        var _inst = instances.get(_handle);
        if(_inst == null) return;

        AL.sourceStop(_inst.al_source);

    } //stop

        /** Set the volume of a sound instance */
    public function volume(_handle:AudioHandle, _volume:Float) : Void {

        var _inst = instances.get(_handle);
        if(_inst == null) return;

        AL.sourcef(_inst.al_source, AL.GAIN, _volume);

    } //volume

    static inline var half_pi : Float = 1.5707;

        /** Set the pan of a sound instance. */
    public function pan(_handle:AudioHandle, _pan:Float) : Void {

        var _inst = instances.get(_handle);
        if(_inst == null) return;
        _inst.pan = _pan;

        AL.source3f(_inst.al_source, AL.POSITION, Math.cos((_pan - 1) * (half_pi)), 0, Math.sin((_pan + 1) * (half_pi)));

    } //pan

        /** Set the pitch of a sound instance */
    public function pitch(_handle:AudioHandle, _pitch:Float) : Void {

        var _inst = instances.get(_handle);
        if(_inst == null) return;

        AL.sourcef(_inst.al_source, AL.PITCH, _pitch);

    } //pitch

        /** Set the position of a sound instance */
    public function position(_handle:AudioHandle, _time:Float) : Void {

        var _inst = instances.get(_handle);
        if(_inst == null) return;

        AL.sourcef(_inst.al_source, AL.SEC_OFFSET, _time);

    } //position

        /** Get the volume of a sound instance */
    public function volume_of(_handle:AudioHandle) : Float {

        var _inst = instances.get(_handle);
        if(_inst == null) return 0.0;

        return AL.getSourcef(_inst.al_source, AL.GAIN);

    } //volume_of

        /** Get the pan of a sound instance */
    public function pan_of(_handle:AudioHandle) : Float {

        var _inst = instances.get(_handle);
        if(_inst == null) return 0.0;

        return _inst.pan;

    } //pan_of

        /** Get the pitch of a sound instance */
    public function pitch_of(_handle:AudioHandle) : Float {

        var _inst = instances.get(_handle);
        if(_inst == null) return 0.0;

        return AL.getSourcef(_inst.al_source, AL.PITCH);

    } //pitch_of

        /** Get the position of a sound instance */
    public function position_of(_handle:AudioHandle) : Float {

        var _inst = instances.get(_handle);
        if(_inst == null) return 0;

        return AL.getSourcef(_inst.al_source, AL.SEC_OFFSET);

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

