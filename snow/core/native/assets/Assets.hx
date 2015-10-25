package snow.core.native.assets;

import snow.types.Types;
import snow.api.buffers.Uint8Array;
import snow.api.Promise;
import snow.api.Debug.*;
import snow.core.native.io.IO.FileSeek;

import stb.Image;

@:allow(snow.system.assets.Assets)
class Assets implements snow.modules.interfaces.Assets {

    var app: snow.Snow;
    function new( _app:snow.Snow ) app = _app;
    function onevent(event:SystemEvent):Void {}
    function shutdown() {}

//images

    public function image_info_from_load(_path:String, ?_components:Int = 4) : Promise {

        assertnull(_path);

        return new Promise(function(resolve, reject) {

            var _load = app.io.data_load(_path);
            
            _load.then(function(_file:Uint8Array) {

                var _image = image_info_from_bytes_direct(_path, _file, _components);

                if(_image == null) {
                    reject(Error.error('failed to load `$_path` as image. reason: `${stb.Image.failure_reason()}`'));
                } else {
                    resolve(_image);
                }

            }).error(reject);

        }); //promise

    } //image_info_from_load

    public function image_info_from_bytes(_id:String, _bytes:Uint8Array, ?_components:Int = 4) : Promise {

        assertnull(_id);
        assertnull(_bytes);

        return new Promise(function(resolve, reject) {

            var _image = image_info_from_bytes_direct(_id, _bytes, _components);

            if(_image == null) {
                reject(Error.error('failed to load `$_id` from bytes. reason: `${stb.Image.failure_reason()}`'));
            } else {
                resolve(_image);
            }

        }); //promise

    } //image_info_from_bytes

    function image_info_from_bytes_direct(_id:String, _bytes:Uint8Array, ?_components:Int=4) : ImageInfo {

        var _image_bytes = _bytes.toBytes();
        var _info = stb.Image.load_from_memory(_image_bytes.getData(), _image_bytes.length, _components);

        if(_info == null) {
            return null;
        }

        var _pixel_bytes : haxe.io.Bytes = haxe.io.Bytes.ofData(_info.bytes);

        return {
            id : _id,
            bpp : _info.req_comp,
            width : _info.w,
            height : _info.h,
            width_actual : _info.w,
            height_actual : _info.h,
            bpp_source : _info.comp,
            pixels : new Uint8Array( _pixel_bytes )
        };
    
    } //info_from_bytes

            /** Create an image info from raw (already decoded) image pixels. */
    public function image_info_from_pixels(_id:String, _width:Int, _height:Int, _pixels:Uint8Array, ?_bpp:Int=4) : ImageInfo {

        assertnull( _id );
        assertnull( _pixels );

        return {
            id : _id,
            bpp : _bpp,
            width : _width,
            height : _height,
            width_actual : _width,
            height_actual : _height,
            bpp_source : _bpp,
            pixels : _pixels
        };

    } //image_info_from_pixels

//audio

    public function audio_load_info(_path:String, ?_load:Bool=true, ?_format:AudioFormatType) : AudioInfo {

        if(_format == null) _format = audio_format_from_ext(_path);

        var _info = switch(_format) {
            case wav: Wav.from_file(app, _path, _load);
            case ogg: Ogg.from_file(app, _path, _load);
            case pcm: PCM.from_file(app, _path, _load);
            case _: null;
        } //switch _format

        if(_info == null) throw Error.error('Assets / audio / failed to load `$_path` as `$_format`');

        return _info;

    } //audio_load_info

    public function audio_info_from_bytes(_bytes:Uint8Array, _format:AudioFormatType) : AudioInfo {

        assertnull(_bytes);

        var _id = 'audio_info_from_bytes/$_format';

        var _info = switch(_format) {
            case wav: Wav.from_bytes(app, _id, _bytes);
            case ogg: Ogg.from_bytes(app, _id, _bytes);
            case pcm: PCM.from_bytes(app, _id, _bytes);
            case _ : null;
        } //switch _format

        if(_info == null) throw Error.error('failed to process bytes for $_id');

        return _info;

    } //audio_info_from_bytes

    public function audio_seek_source( _info:AudioInfo, _to:Int ) : Bool {

        return switch(_info.format) {
            case wav: Wav.seek(app, _info, _to);
            case ogg: Ogg.seek(app, _info, _to);
            case pcm: PCM.seek(app, _info, _to);
            case _:   false;
        }

    } //audio_seek_source

    public function audio_load_portion( _info:AudioInfo, _start:Int, _len:Int ) : AudioDataBlob {

        return switch(_info.format) {
            case wav: Wav.portion(app, _info, _start, _len);
            case ogg: Ogg.portion(app, _info, _start, _len);
            case pcm: PCM.portion(app, _info, _start, _len);
            case _: null;
        }

    } //audio_load_portion

//helpers

    function audio_format_from_ext(_path:String) : AudioFormatType {

        var _ext = haxe.io.Path.extension(_path);
        return switch(_ext) {
            case 'wav': wav;
            case 'ogg': ogg;
            case 'pcm': pcm;
            case _: unknown;
        }

    } //audio_format_from_ext

} //Assets


@:allow(snow.core.native.assets.Assets)
private class Wav {

    static function from_file(app:snow.Snow, _path:String, _load:Bool) : AudioInfo {
        return null;
    } //from_file

    static function from_bytes(app:snow.Snow, _path:String, _bytes:Uint8Array) : AudioInfo {
        return null;
    } //from_bytes

    static function portion(app:snow.Snow, _info:AudioInfo, _start:Int, _len:Int) : AudioDataBlob {
        return null;
    } //load_portion

    static function seek(app:snow.Snow, _info:AudioInfo, _to:Int) : Bool {
        return false;
    } //seek

} //Wav


@:allow(snow.core.native.assets.Assets)
private class Ogg {

    static function from_file(app:snow.Snow, _path:String, _load:Bool) : AudioInfo {
        return null;
    } //from_file

    static function from_bytes(app:snow.Snow, _path:String, _bytes:Uint8Array) : AudioInfo {
        return null;
    } //from_bytes

    static function portion(app:snow.Snow, _info:AudioInfo, _start:Int, _len:Int) : AudioDataBlob {
        return null;
    } //load_portion

    static function seek(app:snow.Snow, _info:AudioInfo, _to:Int) : Bool {
        return false;
    } //seek

} //Ogg

@:allow(snow.core.native.assets.Assets)
private class PCM {

    static function portion(app:snow.Snow, _info:AudioInfo, _start:Int, _len:Int) : AudioDataBlob {

        if(_info.handle != null) {

            if(_start == -1) seek(app, _info, _start);

            var _complete = false;
            var _read_len = _len;
            var _n_elements = 1;
            var _current_pos = app.io.module.file_tell(_info.handle);
            var _distance_to_end = _info.data.length_pcm - _current_pos;

            if(_distance_to_end <= _read_len) {
                _read_len = _distance_to_end;
                _complete = true;
            }

            if(_read_len > 0) {

                log("pcm / reading $_read_len bytes from $_start");

                    //resize to fit the requested/remaining length
                var _byte_gap = (_read_len & 0x03);
                var _samples = new Uint8Array(_read_len + _byte_gap);
                var _elements_read = app.io.module.file_read(_info.handle, _samples, _read_len, _n_elements);

                    //if no elements were read, it was an error
                    //or end of file so either way it's complete.
                if(_elements_read == 0) _complete = true;

                log("pcm / total read $_read_len bytes, complete? $_complete");

                return {
                    bytes: _samples,
                    complete: _complete
                }

            } //_read_len > 0

        } //_info.handle != null

        return null;

    } //load_portion

    static function seek(app:snow.Snow, _info:AudioInfo, _to:Int) : Bool {

        if(_info.handle != null) {
            app.io.module.file_seek(_info.handle, _to, FileSeek.set);
        }

        return false;
    } //seek

    static function from_file(app:snow.Snow, _path:String, _load:Bool) : AudioInfo {

        var _handle = app.io.module.file_handle(_path, 'rb');
        if(_handle == null) return null;

        var _length = app.io.module.file_size(_handle);
        var _samples : Uint8Array = null;

        if(_load) {
            _samples = new Uint8Array(_length);
            var _read = app.io.module.file_read(_handle, _samples, _length, 1);
            if(_read != _length) {
                _samples = null;
                return null;
            }
        } //_load

        //the sound format values are sane defaults -
        //change these values right before creating the sound itself.

        return {

            id:     _path,
            handle: _handle,
            format: AudioFormatType.pcm,

            data: {
                samples         : _samples,
                length          : _length,
                length_pcm      : _length,
                channels        : 1,
                rate            : 44100,
                bitrate         : 88200,
                bits_per_sample : 16
            }

        } //return

    } //from_file

    static function from_bytes(app:snow.Snow, _id:String, _bytes:Uint8Array) : AudioInfo {

        return {

            id:     _id,
            handle: null,
            format: AudioFormatType.pcm,

            data: {
                samples         : _bytes,
                length          : _bytes.length,
                length_pcm      : _bytes.length,
                channels        : 1,
                rate            : 44100,
                bitrate         : 88200,
                bits_per_sample : 16
            }

        } //return

    } //from_bytes


} //PCM

