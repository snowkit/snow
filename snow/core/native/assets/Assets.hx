package snow.core.native.assets;

import snow.types.Types;
import snow.api.Promise;
import snow.api.Debug.*;

import snow.api.buffers.Uint8Array;
import snow.api.buffers.ArrayBufferView;
import snow.api.buffers.DataView;
import snow.core.native.io.IO.FileSeek;

import stb.Image;

@:allow(snow.systems.assets.Assets)
class Assets implements snow.modules.interfaces.Assets {

    var app: snow.Snow;
    function new( _app:snow.Snow ) app = _app;
    function onevent(event:SystemEvent):Void {}
    function shutdown() {}

//images

    public function image_info_from_load(_path:String, ?_components:Int = 4) : Promise {

        assertnull(_path);

        return new Promise(function(resolve, reject) {

            var _image = image_info_from_load_direct(_path, _components);

            if(_image == null) {
                var reason = load_direct_err == 1 ? 'invalid file handle, file not found?' : stb.Image.failure_reason();
                reject(Error.error('failed to load `$_path` as image. reason: `$reason`'));
            } else {
                resolve(_image);
            }

        }); //promise

    } //image_info_from_load

    var load_direct_err = 0;
    public function image_info_from_load_direct(_path:String, ?_components:Int = 4) : ImageInfo {

        assertnull(_path);

        load_direct_err = 0;

        var _handle = app.io.module.file_handle(_path, 'rb');
        if(_handle == null) {
            load_direct_err = 1;
            return null;
        }

        var _size = app.io.module.file_size(_handle);
        var _file = new Uint8Array(_size);

        if(_size > 0) {
            app.io.module.file_read(_handle, _file, _size, 1);
        }

        app.io.module.file_close(_handle);

        return image_info_from_bytes_direct(_path, _file, _components);

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

    public function image_info_from_bytes_direct(_id:String, _bytes:Uint8Array, ?_components:Int=4) : ImageInfo {

        assertnull(_id);
        assertnull(_bytes);

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


} //Assets

