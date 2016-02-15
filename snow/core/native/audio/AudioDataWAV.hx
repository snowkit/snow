package snow.core.native.audio;

import snow.types.Types;
import snow.api.Debug.*;
import snow.api.buffers.Uint8Array;
import snow.core.native.io.IO.FileSeek;

private typedef WavChunk = { id:String, offset:Int, data:Uint8Array, data_length:Int }
private typedef WavHandle = { handle:FileHandle, offset:Int }

class AudioDataWAV extends AudioData {

    public var data_offset : Int;
    public var handle : FileHandle;

    inline public function new(_app:snow.Snow, _handle:FileHandle, _offset:Int, _opt:AudioDataOptions) {

        handle = _handle;
        data_offset = _offset;

        super(_app, _opt);

    } //new

    override public function destroy() {

        if(handle != null) {
            app.io.module.file_close(handle);
        }

        handle = null;

    } //destroy

    override public function seek(_to:Int) : Bool {

        var _result = app.io.module.file_seek(handle, data_offset + _to, FileSeek.set);

        return _result == 0;

    } //seek

    override public function portion(_into:Uint8Array, _start:Int, _len:Int, _into_result:Array<Int>) : Array<Int> {

        if(_start != -1) {
            seek(_start+data_offset);
        }

        var _complete = false;
        var _read_len = _len;
        var _current_pos = app.io.module.file_tell(handle) - data_offset;
        var _distance_to_end = length - _current_pos;

        if(_distance_to_end <= _read_len) {
            _read_len = _distance_to_end;
            _complete = true;
        }

        if(_read_len <= 0) {
            _into_result[0] = 0;
            _into_result[1] = 1;
            return _into_result;
        }

        _debug('wav / reading $_read_len bytes from $_start');

            //resize to fit the requested/remaining length
        var _byte_gap = (_read_len & 0x03);
        // var _samples = new Uint8Array(_read_len + _byte_gap);
        var _n_elements = 1;
        var _elements_read = app.io.module.file_read(handle, _into, _read_len, _n_elements);

            //if no elements were read, it was an error
            //or end of file so either way it's complete.
        if(_elements_read == 0) _complete = true;

        _debug('wav / total read $_read_len bytes, complete? $_complete');

        _into_result[0] = _read_len;
        _into_result[1] = (_complete)?1:0;

        return _into_result;

    } //portion

} //AudioDataWaV

class WAV {

    public static function from_file(app:snow.Snow, _path:String, _is_stream:Bool) {

        var _handle = app.io.module.file_handle(_path, 'rb');

        return from_file_handle(app, _handle, _path, _is_stream);

    } //from_file

    public static function from_bytes(app:snow.Snow, _path:String, _bytes:Uint8Array) : AudioData {

        var _handle = app.io.module.file_handle_from_mem(_bytes, _bytes.length);

        return from_file_handle(app, _handle, _path, false);

    } //from_bytes

 //helpers

    static var ID_DATA  = 'data'; 
    static var ID_FMT   = 'fmt '; 
    static var ID_WAVE  = 'WAVE';
    static var ID_RIFF  = 'RIFF';

    public static function from_file_handle(app:snow.Snow, _handle:FileHandle, _path:String, _is_stream:Bool) : AudioData {

        if(_handle == null) return null;

        var _length = 0;
        var _info = new AudioDataWAV(app, _handle, 0, {
            id         : _path,
            is_stream  : _is_stream,
            format     : af_wav,
            samples    : null,
            length     : _length,
            channels   : 1,
            rate       : 44100
        });

        var _header = new Uint8Array(12);
        app.io.module.file_read(_handle, _header, 12, 1);

        var _bytes = _header.toBytes();
        var _file_id = _bytes.getString(0, 4);
        var _file_format = _bytes.getString(8, 4);

        _header = null;
        _bytes = null;

        if(_file_id != ID_RIFF) {
            log('assets / audio / wav / file `$_path` has invalid header (id `$_file_id`, expected RIFF)');
            return null;
        }

        if(_file_format != ID_WAVE) {
            log('assets / audio / wav / file `$_path` has invalid header (id `$_file_format`, expected WAVE)');
            return null;
        }

        var _found_data = false;
        var _found_format = false;
        var _limit = 0;

        while(!_found_format || !_found_data) {

            var _chunk = read_chunk(app, _handle, _is_stream);

            if(_chunk.id == ID_FMT) {
                _found_format = true;

                // 16 bytes                 size /  at
                // short audioFormat;         2  /  0
                // short numChannels;         2  /  2
                // unsigned int sampleRate;   4  /  4
                // unsigned int byteRate;     4  /  8
                // short blockAlign;          2  /  12
                // short bitsPerSample;       2  /  14

                var _format = _chunk.data.toBytes();
                var _bitrate = _format.getInt32(8);
                var _bits_per_sample = _format.getUInt16(14);
                _info.channels = _format.getUInt16(2);
                _info.rate = _format.getInt32(4);
                _format = null;
            } //fmt

            if(_chunk.id == ID_DATA) {
                _found_data = true;
                _info.samples = _chunk.data;
                _info.length = _chunk.data_length;
                _info.data_offset = _chunk.offset;
            } //data

            _chunk.data = null;
            _chunk = null;

            ++_limit;
            
            if(_limit >= 32) break;

        } //while

        return _info;

    } //from_file_handle

    public static function read_chunk(app:snow.Snow, _handle:FileHandle, _is_stream:Bool) : WavChunk {

        var _header_size = 8;
        var _header = new Uint8Array(_header_size);

        app.io.module.file_read(_handle, _header, _header_size, 1);

        var _header_bytes = _header.toBytes();
        var _chunk_id = _header_bytes.getString(0, 4);
        var _chunk_size = _header_bytes.getInt32(4);

        _header = null;
        _header_bytes = null;

        var _data : Uint8Array = null;
        var _pos = app.io.module.file_tell(_handle);


            //We only read data/fmt chunks
        var _is_data = _chunk_id == ID_DATA;
        var _is_fmt  = _chunk_id == ID_FMT;
        var _should_read = _is_data || _is_fmt;

            //we don't need to read the sample data if streaming
        if(_is_data && _is_stream) {
            _should_read = false;
        }

        if(_should_read) {
            _data = new Uint8Array(_chunk_size);
            app.io.module.file_read(_handle, _data, _chunk_size, 1);
        } else {
            app.io.module.file_seek(_handle, _pos+_header_size+_chunk_size, set);
        }

        return {
            id: _chunk_id,
            offset: _pos,
            data: _data,
            data_length: _chunk_size
        }

    } //read_chunk

} //WAV
