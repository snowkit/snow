import snow.api.buffers.Uint8Array;
import snow.api.buffers.Int16Array;
import snow.systems.audio.AudioInstance;
import snow.systems.audio.AudioSource;
import snow.types.Types;

class OoohSource extends AudioSource {

    public function new(app:snow.Snow) {

        super(app, new AudioData(app, {
            id : 'oooh',
            is_stream: true,
            channels: 2,
            rate: 44100
        }));

            //tenth of a second
        stream_buffer_length = Std.int(44100/10);
        stream_buffer_length += (stream_buffer_length & 0x03);

            //make sure enough buffers
        stream_buffer_count = 8;

    } //new

    override function instance(_handle:AudioHandle) : AudioInstance {
        return new Oooh(this, _handle);
    }

} //OoohSource

class Oooh extends AudioInstance {
    
    public var freq = 220.0;
    var counter = 0.0;

    override function data_get(_into:Uint8Array, _start:Int, _length:Int, _res:Array<Int>) : Array<Int> {

        //view the bytes as short
        var ints = new Int16Array(_into.buffer);
            //2 bytes per sample
        var _samples = (_length/2);
        var _samples_per_channel = Std.int(_samples/2);

        for(i in 0..._samples_per_channel) {

            //left
            ints[i*2] = Std.int(Math.cos(counter)*32767);
            //right
            ints[i*2+1] = Std.int(Math.cos(counter-0.4)*32767);

            counter += 1.0/source.data.rate*freq*2;
        
        }

        _res[0] = _length;
        _res[1] = 0;

        ints = null;

        return _res;

    }

    override function has_ended() {
        return false;
    }

}