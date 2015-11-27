package snow.systems.audio;

import snow.api.Emitter;
import snow.systems.audio.AudioSource;
import snow.api.buffers.Uint8Array;

class AudioInstance {

    public var source : AudioSource;

        /** Create a new instance from the given audio source.
            Usually called via `source.instance()`, not directly. */
    public function new(_source:AudioSource) {
        source = _source;
    }

    public function tick() : Void {

    }

    public function has_ended() : Bool {
        return true;
    }

    public function data_get(_into:Uint8Array, _start:Int, _length:Int, _into_result:Array<Int>) : Array<Int> {

        var _assets = source.asset.system;
        return _assets.module.audio_load_portion(source.asset.audio, _into, _start, _length, _into_result);
        
    } //data_get
        
    public function data_seek(_to_samples:Int) : Bool {

        var _assets = source.asset.system;
        return _assets.module.audio_seek_source(source.asset.audio, _to_samples);

    }
    
} //AudioInstance
