package snow.systems.audio;

import snow.api.Emitter;
import snow.systems.audio.AudioSource;
import snow.types.Types.AudioHandle;
import snow.api.buffers.Uint8Array;
import snow.api.Debug.*;

class AudioInstance {

    public var source : AudioSource;
    public var handle : AudioHandle;

    var destroyed = false;

        /** Create a new instance from the given audio source.
            Usually called via `source.instance()`, not directly. */
    public function new(_source:AudioSource, _handle:AudioHandle) {

        source = _source;
        handle = _handle;
        
    }

    public function tick() : Void {

    }

    public function has_ended() : Bool {
        
        assert(destroyed == false, 'snow / Audio / Instance has_ended queried after being destroyed');

        return source.app.audio.state_of(handle) == as_stopped;

    } //has_ended

    public function destroy() {

        assert(destroyed == false, 'snow / Audio / Instance being destroyed more than once');

        source.app.audio.emit(ae_destroyed, handle);
        source.instance_killed(this);
        destroyed = true;
        source = null;
        handle = -1;

    } //destroy

    public function data_get(_into:Uint8Array, _start:Int, _length:Int, _into_result:Array<Int>) : Array<Int> {

        assert(destroyed == false, 'snow / Audio / Instance data_get queried after being destroyed');

        return source.data.portion(_into, _start, _length, _into_result);

    } //data_get
        
    public function data_seek(_to_samples:Int) : Bool {

        assert(destroyed == false, 'snow / Audio / Instance data_seek queried after being destroyed');

        return source.data.seek(_to_samples);

    } //data_seek
    
} //AudioInstance
