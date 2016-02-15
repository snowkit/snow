package snow.core.native.audio;

import snow.types.Types;
import snow.api.Debug.*;
import snow.api.buffers.Uint8Array;
import snow.core.native.io.IO.FileSeek;

import ogg.Ogg;

class AudioDataOGG extends AudioData {

    public var handle : FileHandle;
    public var oggfile : OggVorbisFile;

    inline public function new(_app:snow.Snow, _handle:FileHandle, _oggfile:OggVorbisFile, _opt:AudioDataOptions) {

        handle = _handle;
        oggfile = _oggfile;

        super(_app, _opt);

    } //new

    override public function destroy() {

        if(handle != null) {
            app.io.module.file_close(handle);
        }

        handle = null;
        Ogg.ov_clear(oggfile);
        oggfile = null;

    } //destroy

    override public function seek(_to:Int) : Bool {

            //pcm seek is in samples, not bytes
            //:todo: ogg is always 16?
        var _to_samples = haxe.Int64.ofInt(Std.int(_to/16));
        var res = Ogg.ov_pcm_seek(oggfile, _to_samples);

        return res == 0;

    } //seek

    override public function portion(_into:Uint8Array, _start:Int, _len:Int, _into_result:Array<Int>) : Array<Int> {

        var complete = false;
        var word = 2; //1 for 8 bit, 2 for 16 bit. 2 is typical
        var sgned = 1; //0 for unsigned, 1 is typical
        var bit_stream = 1;

        var _read_len = _len;

        if(_start != -1) {
            // log('start was $_start, skipping there first');
            seek(_start);
        }

            //resize to fit the requested length, but pad it slightly to align
        // var byte_gap = (_read_len & 0x03);
        // out_buffer.resize(_read_len + byte_gap);
        //:todo: check these alignment paddings in snow alpha-2.0

        var reading = true;
        var bytes_left = _read_len;
        var total_read = 0;
        var bytes_read = 0;
        var OGG_BUFFER_LENGTH = 128;

        while(reading) {

            var _read_max = OGG_BUFFER_LENGTH;

            if(bytes_left < _read_max) {
                _read_max = bytes_left;
            }

                // Read the decoded sound data
            bytes_read = Ogg.ov_read(oggfile, _into.buffer.getData(), total_read, _read_max, OggEndian.TYPICAL, OggWord.TYPICAL, OggSigned.TYPICAL);

            total_read += bytes_read;
            bytes_left -= bytes_read;

                //at the end?
            if(bytes_read == 0) {
                reading = false;
                complete = true;
            }

            if(total_read >= _read_len) {
                reading = false;
            }

        } //while

            //we need the buffer length to reflect the real size,
            //just in case it read shorter than requested
        if(total_read != _read_len) {
            var byte_gap = (_read_len & 0x03);
            // trace('not matched size $total_read / $_read_len');
            // out_buffer.resize(total_read+byte_gap);
            //:todo: check these alignment paddings in snow alpha-2.0
        }

        _into_result[0] = total_read;
        _into_result[1] = (complete) ? 1 : 0;

        return _into_result;

    } //portion

} //AudioDataOGG


@:allow(snow.core.native.assets.Assets)
class OGG {

    public static function from_file(app:snow.Snow, _path:String, _is_stream:Bool) : AudioData {

        _debug('from file is_stream:$_is_stream `$_path`');

        var _handle = app.io.module.file_handle(_path, 'rb');

        return from_file_handle(app, _handle, _path, _is_stream);

    } //from_file


    public static function from_bytes(app:snow.Snow, _path:String, _bytes:Uint8Array) : AudioData {

        _debug('from bytes `$_path`');

        var _handle = app.io.module.file_handle_from_mem(_bytes, _bytes.length);

        return from_file_handle(app, _handle, _path, false);

    } //from_bytes

    public static function from_file_handle(app:snow.Snow, _handle:FileHandle, _path:String, _is_stream:Bool) : AudioData {

        if(_handle == null) return null;

        var _ogg_file = Ogg.newOggVorbisFile();

        var _ogg = new AudioDataOGG(app, _handle, _ogg_file, {
            id:         _path,
            is_stream:  _is_stream,
            format:     af_ogg,
            samples:    null,
            length:     0,
            channels:   0,
            rate:       0
        });

        // trace('file size is ' + _ogg.data.length);

        var _ogg_result = Ogg.ov_open_callbacks(_ogg, _ogg_file, null, 0, {
            read_fn:  ogg_read,
            seek_fn:  ogg_seek,
            close_fn: null,
            tell_fn:  ogg_tell
        });

        // trace('ov_open_callbacks ' + code(_ogg_result));

        if(_ogg_result < 0) {

            app.io.module.file_close(_handle);

            log('/ snow / ogg file failed to open!? / result:$_ogg_result code: ${code(_ogg_result)}');

            return null;

        } //result < 0

        var _ogg_info = Ogg.ov_info(_ogg_file, -1);

        _debug('path: '+_path);
        _verbose('version: '+Std.int(_ogg_info.version));
        _verbose('serial: '+Std.int(Ogg.ov_serialnumber(_ogg_file,-1)));
        _verbose('seekable: '+Std.int(Ogg.ov_seekable(_ogg_file)));
        _verbose('streams: '+Std.int(Ogg.ov_streams(_ogg_file)));
        _verbose('rate: '+Std.int(_ogg_info.rate));
        _verbose('channels: '+Std.int(_ogg_info.channels));

        _debug('pcm: '+Std.string( Ogg.ov_pcm_total(_ogg_file,-1) ));
        _verbose('raw: '+Std.string( Ogg.ov_raw_total(_ogg_file,-1) ));
        _debug('time: '+Std.string( Ogg.ov_time_total(_ogg_file,-1) ));

        _verbose('ov_bitrate: ' + code(Ogg.ov_bitrate(_ogg_file, -1)));
        _verbose('ov_bitrate_instant: ' + code(Ogg.ov_bitrate_instant(_ogg_file)));
        _verbose('bitrate_lower: '+Std.int(_ogg_info.bitrate_lower));
        _verbose('bitrate_nominal: '+Std.int(_ogg_info.bitrate_nominal));
        _verbose('bitrate_upper: '+Std.int(_ogg_info.bitrate_upper));
        _verbose('bitrate_window: '+Std.int(_ogg_info.bitrate_window));

        _verbose('pcm tell: '+code( cast Ogg.ov_pcm_tell(_ogg_file) ));
        _verbose('raw tell: '+code( cast Ogg.ov_raw_tell(_ogg_file) ));
        _verbose('time tell: '+code( cast Ogg.ov_time_tell(_ogg_file) ));

        var _total_pcm_length : UInt = haxe.Int64.toInt(Ogg.ov_pcm_total(_ogg_file, -1)) * _ogg_info.channels * 2;

        _ogg.channels = _ogg_info.channels;
        _ogg.rate = Std.int(_ogg_info.rate);
        _ogg.length = _total_pcm_length;
        var _bitrate = Std.int(_ogg_info.bitrate_nominal);

        _ogg.seek(0);

        var _comment = Ogg.ov_comment(_ogg_file, -1);
        _verbose('vendor: ' + _comment.vendor);
        for(c in _comment.comments) {
            _verbose('           $c');
        }

        if(!_is_stream) {
            _debug('samples: loading length of $_total_pcm_length');
            _ogg.samples = new Uint8Array(_total_pcm_length);
            _ogg.portion(_ogg.samples, 0, _total_pcm_length, []);
        } else {
            _debug('samples: streams don\'t load samples');
        }

        return _ogg;

    } //from_file_handle

 //helpers

        //converts return code to string
    inline static function code(_code:OggCode) : String {
        return switch(_code){
            case OggCode.OV_EBADHEADER:'OV_EBADHEADER';
            case OggCode.OV_EBADLINK:'OV_EBADLINK';
            case OggCode.OV_EBADPACKET:'OV_EBADPACKET';
            case OggCode.OV_EFAULT:'OV_EFAULT';
            case OggCode.OV_EIMPL:'OV_EIMPL';
            case OggCode.OV_EINVAL:'OV_EINVAL';
            case OggCode.OV_ENOSEEK:'OV_ENOSEEK';
            case OggCode.OV_ENOTAUDIO:'OV_ENOTAUDIO';
            case OggCode.OV_ENOTVORBIS:'OV_ENOTVORBIS';
            case OggCode.OV_EOF:'OV_EOF';
            case OggCode.OV_EREAD:'OV_EREAD';
            case OggCode.OV_EVERSION:'OV_EVERSION';
            case OggCode.OV_FALSE:'OV_FALSE';
            case OggCode.OV_HOLE: 'OV_HOLE';
            case _:'$_code';
        }
    } //code



 //ogg callbacks


        //read function for ogg callbacks
    static function ogg_read(_ogg:AudioDataOGG, size:Int, nmemb:Int, data:haxe.io.BytesData):Int {

        var _total = size * nmemb;
        var _bytes = haxe.io.Bytes.ofData(data);
        var _buffer = new Uint8Array(_bytes);

        //file_read past the end of file may return 0 amount read,
        //which can mislead the amounts, so we work out how much is left if near the end
        var _file_size = _ogg.app.io.module.file_size(_ogg.handle);
        var _file_cur = _ogg.app.io.module.file_tell(_ogg.handle);
        var _read_size = Std.int(Math.min(_file_size-_file_cur, _total));

        var _read_n = _ogg.app.io.module.file_read(_ogg.handle, _buffer, _read_size, 1);
        var _read = (_read_n * _read_size);

        // trace('ogg_read cur:$_file_cur, fs:$_file_size, rs:$_read_size, size:$size, nmemb:$nmemb, read amount:$_read');

        _bytes = null;

        return _read;

    } //ogg_read

        //seek function for ogg callbacks
    static function ogg_seek(_ogg:AudioDataOGG, offset:Int, whence:OggWhence):Void {

        // trace('ogg_seek offset:$offset whence:$whence');

        var _w:FileSeek = switch(whence) {
            case OGG_SEEK_CUR: cur;
            case OGG_SEEK_END: end;
            case OGG_SEEK_SET: set;
        }

        _ogg.app.io.module.file_seek(_ogg.handle, offset, _w);

    } //ogg_seek

        //tell function for ogg callbacks
    static function ogg_tell(_ogg:AudioDataOGG):Int {

        var res = _ogg.app.io.module.file_tell(_ogg.handle);

        // trace('ogg_tell tell:$res');

        return res;

    } //ogg_tell


} //OGG
