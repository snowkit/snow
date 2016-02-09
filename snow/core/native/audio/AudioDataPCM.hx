package snow.core.native.audio;

import snow.types.Types;
import snow.api.Debug.*;
import snow.api.buffers.Uint8Array;
import snow.core.native.io.IO.FileSeek;

class AudioDataPCM extends AudioData {

    public var handle : FileHandle;

    inline public function new(_app:snow.Snow, _handle:FileHandle, _opt:AudioDataOptions) {

        handle = _handle;

        super(_app, _opt);

    } //new

    override public function destroy() {

        if(handle != null) {
            app.io.module.file_close(handle);
            handle = null;
        }

        app = null;
        handle = null;

    } //destroy

    override public function seek(_to:Int) : Bool {

        if(handle == null) return false;

        var _result = app.io.module.file_seek(handle, _to, FileSeek.set);

        return _result == 0;

    } //seek

    override public function portion(_into:Uint8Array, _start:Int, _len:Int, _into_result:Array<Int>) : Array<Int> {

        inline function _fail() {
            _into_result[0] = 0;
            _into_result[1] = 1;
            return _into_result;
        }

        if(handle == null) return _fail();

        if(_start != -1) {
            seek(_start);
        }

        var _complete = false;
        var _read_len = _len;
        var _cur_pos = app.io.module.file_tell(handle);
        var _distance_to_end = length - _cur_pos;

        if(_distance_to_end <= _read_len) {
            _read_len = _distance_to_end;
            _complete = true;
        }

        if(_read_len <= 0) return _fail();

        log('pcm / reading $_read_len bytes from $_start');

            //resize to fit the requested/remaining length
        var _byte_gap = (_read_len & 0x03);
        // var _samples = new Uint8Array(_read_len + _byte_gap);
        var _n_elements = 1;
        var _elements_read = app.io.module.file_read(handle, _into, _read_len, _n_elements);

            //if no elements were read, it was an error
            //or end of file so either way it's complete.
        if(_elements_read == 0) _complete = true;

        log('pcm / total read $_read_len bytes, complete? $_complete');

        _into_result[0] = _read_len;
        _into_result[1] = (_complete)?1:0;

        return _into_result;

    } //portion

} //AudioDataPCM


class PCM {

    public static function from_file(app:snow.Snow, _path:String, _is_stream:Bool) : AudioData {

        var _handle = app.io.module.file_handle(_path, 'rb');
        if(_handle == null) return null;

        var _length = app.io.module.file_size(_handle);
        var _samples : Uint8Array = null;

        if(!_is_stream) {
            _samples = new Uint8Array(_length);
            var _read = app.io.module.file_read(_handle, _samples, _length, 1);
            if(_read != _length) {
                _samples = null;
                return null;
            }
        } //!_is_stream

        //the sound format values are sane defaults -
        //change these values right before creating the sound itself.

        return new AudioDataPCM(app, _handle, {
            id:         _path,
            is_stream:  _is_stream,
            format:     af_pcm,
            samples:    _samples,
            length:     _length,
            channels:   1,
            rate:       44100
        }); //return

    } //from_file

    public static function from_bytes(app:snow.Snow, _id:String, _bytes:Uint8Array) : AudioData {

        return new AudioDataPCM(app, null, {
            id:         _id,
            is_stream:  false,
            format:     af_pcm,
            samples:    _bytes,
            length:     _bytes.length,
            channels:   1,
            rate:       44100
        }); //return

    } //from_bytes


} //PCM
