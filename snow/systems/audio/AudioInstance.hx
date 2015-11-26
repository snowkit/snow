package snow.systems.audio;

import snow.api.Emitter;
import snow.systems.audio.AudioSource;

@:enum abstract AudioInstanceEv(Int) 
    from Int to Int {
        var ae_end = 0;
}

class AudioInstance {

    public var event : Emitter<AudioInstanceEv>;
    public var source : AudioSource;

        /** Create a new instance from the given audio source.
            Usually called via `source.instance()`, not directly. */
    public function new(_source:AudioSource) {
        source = _source;
        event = new Emitter();
    }

        /** Whether or not the audio is done */
    public function has_ended() : Bool {
        return true;
    }

    public function data_get(_into:haxe.io.BytesData, _start:Int, _length:Int) {
        
    }
        
    public function data_seek(_to:Float) : Bool {
        return false;
    }
    
} //AudioInstance
