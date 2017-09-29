package snow.modules.openal;

import snow.api.Debug.*;
import snow.systems.audio.AudioSource;
import snow.systems.audio.AudioInstance;
import snow.types.Types.AudioHandle;

import snow.modules.openal.AL;
import snow.modules.openal.Audio;

@:log_as('AL sound')
@:allow(snow.modules.openal.Audio)
class ALSound {

    public var instance : AudioInstance;
    public var source : AudioSource;
    public var module : Audio;

    public var alsource : Int;
    public var alformat : Int;

        /** The current pan in -1,1 range */
    var pan : Float = 0.0;
    var looping : Bool = false;
    var current_time = 0.0;

    public function new(_module:Audio, _source:snow.systems.audio.AudioSource, _instance:AudioInstance) {
                
        module = _module;
        source = _source;
        instance = _instance;

        alsource = new_source();
        alformat = source_format();

    } //new

    public function init() {

        var _buffer:ALuint = module.buffers.get(source.source_id);

        if(_buffer == AL.NONE) {

            var _data = source.data;

            _buffer = AL.genBuffer();

            _debug(' > new buffer ${_data.id} / format ${alformat} / buffer $_buffer');

            if(_data.samples != null) {
                AL.bufferData(_buffer, alformat, _data.rate, _data.samples.buffer, _data.samples.byteOffset, _data.samples.byteLength); 
            } else {
                _buffer = AL.NONE;
                log(' > new buffer ${_data.id} / created with AL.NONE buffer!');
            }

            err('new buffer');

            _debug('new buffer made for source / `${source.data.id}` / `${source.source_id}` / $_buffer');

            module.buffers.set(source.source_id, _buffer);

        } else { //_buffer == 0

            _debug('existing buffer found for source / `${source.data.id}` / `${source.source_id}` / $_buffer');

        }

        AL.sourcei(alsource, AL.BUFFER, _buffer);

        err('attach buffer');

    } //init

    function position(_time:Float) {
    
        AL.sourcef(alsource, AL.SEC_OFFSET, _time);
    
    } //position

    function position_of() {
        
        return AL.getSourcef(alsource, AL.SEC_OFFSET);

    } //position_of

    public function destroy() {

            //clear error state
        AL.getError();

        if(AL.getSourcei(alsource, AL.SOURCE_STATE) == AL.PLAYING) {
            AL.sourceStop(alsource);
            err('stop alsource');
        }

            //detach buffer
        if(AL.getSourcei(alsource, AL.BUFFER) != 0) {
            AL.sourcei(alsource, AL.BUFFER, 0);
            err('detach buffer');
        }

        AL.deleteSource(alsource);

        err('delete alsource');

        // alsource = 0;

    } //destroy

    public function tick() : Void {
        
        instance.tick();
        current_time += module.app.host.tick_delta;

    } //tick

//internal

    inline function new_source() : Int {
        var _source = AL.genSource();
            AL.sourcef(_source, AL.GAIN, 1.0);
            AL.sourcei(_source, AL.LOOPING, AL.FALSE);
            AL.sourcef(_source, AL.PITCH, 1.0);
            AL.source3f(_source, AL.POSITION, 0.0, 0.0, 0.0);
            AL.source3f(_source, AL.VELOCITY, 0.0, 0.0, 0.0);
        return _source;
    }

    inline function err(reason:String) {
        return module.err(reason);
    }

    function source_format() {

        var _format = AL.FORMAT_MONO16;

        if(source.data.channels > 1) {
            if(source.data.bits_per_sample == 8) {
                _format = AL.FORMAT_STEREO8;
                _debug('source format: stereo 8');
            } else {
                _format = AL.FORMAT_STEREO16;
                _debug('source format: stereo 16');
            }
        } else { //mono
            if(source.data.bits_per_sample == 8) {
                _format = AL.FORMAT_MONO8;
                _debug('source format: mono 8');
            } else {
                _format = AL.FORMAT_MONO16;
                _debug('source format: mono 16');
            }
        }

        return _format;

    } //source_format

} //ALAudioSource
