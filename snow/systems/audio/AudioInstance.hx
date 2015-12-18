package snow.systems.audio;

import snow.api.Emitter;
import snow.systems.audio.AudioSource;
import snow.types.Types.AudioHandle;
import snow.api.buffers.Uint8Array;

class AudioInstance {

    public var source : AudioSource;
    public var handle : AudioHandle;

        /** Create a new instance from the given audio source.
            Usually called via `source.instance()`, not directly. */
    public function new(_source:AudioSource, _handle:AudioHandle) {
        source = _source;
        handle = _handle;
    }

    public function tick() : Void {

    }

    public function has_ended() : Bool {
            
        return source.app.audio.state_of(handle) == as_stopped;

    } //has_ended

    public function data_get(_into:Uint8Array, _start:Int, _length:Int, _into_result:Array<Int>) : Array<Int> {
        //:todo:        
        #if snow_native
        return source.app.assets.module.audio_load_portion(source.info, _into, _start, _length, _into_result);
        #else
        return null;
        #end

    } //data_get
        
    public function data_seek(_to_samples:Int) : Bool {
        //:todo:
        #if snow_native
        return source.app.assets.module.audio_seek_source(source.info, _to_samples);
        #else
        return null;
        #end

    }
    
} //AudioInstance
