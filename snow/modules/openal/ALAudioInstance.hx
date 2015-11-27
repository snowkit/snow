package snow.modules.openal;

import snow.api.Debug.*;
import snow.modules.openal.Audio;
import snow.systems.audio.AudioInstance;
import snow.types.Types.AudioHandle;
import snow.modules.openal.AL;

@:log_as('AL sound')
@:allow(snow.modules.openal.Audio)
class ALAudioInstance extends AudioInstance {

        /** The openal audio module */
    public var module : Audio;
        /** the AL source handle */
    public var alsource : Int;
        /** the AL source format */
    public var alformat : Int;
        /** the AL source format */
    public var handle : AudioHandle;
        /** The current pan in -1,1 range */
    var pan : Float = 0.0;
    var looping : Bool = false;

    public function new(_module:Audio, _handle:AudioHandle, _source:snow.systems.audio.AudioSource, _volume:Float) {
                
        super(_source);

        module = _module;
        handle = _handle;
        alsource = new_source(_volume);
        alformat = source_format();

    } //new

    public function init() {

        var _buffer = module.buffers.get(source);

        if(_buffer == null) {

            var _data = source.asset.audio.data;

            log(' > new buffer / ${source.asset.id} / ${alformat}');

            _buffer = AL.genBuffer();
            AL.bufferData(_buffer, alformat, _data.rate, _data.samples.toBytes().getData(), _data.samples.byteOffset, _data.samples.byteLength);            
            module.buffers.set(source, _buffer);

        } //_buffer == null

        AL.sourcei(alsource, AL.BUFFER, _buffer);

    } //init

    function position(_time:Float) {
    
        AL.sourcef(alsource, AL.SEC_OFFSET, _time);
    
    } //position

    function position_of() {
        
        return AL.getSourcef(alsource, AL.SEC_OFFSET);

    } //position_of

    public function destroy() {

        AL.sourceStop(alsource);
        AL.deleteSource(alsource);

    } //destroy


    override function has_ended() {

        return AL.getSourcei(alsource, AL.SOURCE_STATE) == AL.STOPPED;

    } //has_ended

//internal

    inline function new_source(_volume:Float) : Int {
        var _source = AL.genSource();
            AL.sourcef(_source, AL.GAIN, _volume);
            AL.sourcei(_source, AL.LOOPING, AL.FALSE);
            AL.sourcef(_source, AL.PITCH, 1.0);
            AL.source3f(_source, AL.POSITION, 0.0, 0.0, 0.0);
            AL.source3f(_source, AL.VELOCITY, 0.0, 0.0, 0.0);
        return _source;
    }

    function source_format() {

        var _data = source.asset.audio.data;
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

} //ALAudioSource
