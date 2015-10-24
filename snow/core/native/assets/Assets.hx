package snow.core.native.assets;

import snow.types.Types;
import snow.api.buffers.Uint8Array;
import snow.api.Promise;
import snow.api.Debug.*;

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

    public function audio_load_info( _path:String, ?_load:Bool = true, ?_format:AudioFormatType ) : AudioInfo {

        if(_format == null) {
            var _ext = haxe.io.Path.extension(_path);
            _format = switch(_ext) {
                case 'wav': AudioFormatType.wav;
                case 'ogg': AudioFormatType.ogg;
                case 'pcm': AudioFormatType.pcm;
                case _: AudioFormatType.unknown;
            }
        }

        var _native_info : NativeAudioInfo = switch(_format) {
            case AudioFormatType.wav: audio_load_wav( _path, _load );
            case AudioFormatType.ogg: audio_load_ogg( _path, _load );
            case AudioFormatType.pcm: audio_load_pcm( _path, _load );
            case _: null;
        } //switch _format

            //:todo:
        if(_native_info == null) throw Error.error('failed to load $_path : does the file exist?');
        if(_native_info.data == null) throw Error.error('failed to load $_path : data was null.');

        var _result_bytes = haxe.io.Bytes.ofData(_native_info.data.bytes);
        var _result_info : AudioInfo = {

            id:     _native_info.id,
            format: _native_info.format,
            handle: _native_info.handle,

            data: {
                samples         : new Uint8Array( _result_bytes ),
                length          : _native_info.data.length,
                length_pcm      : _native_info.data.length_pcm,
                channels        : _native_info.data.channels,
                rate            : _native_info.data.rate,
                bitrate         : _native_info.data.bitrate,
                bits_per_sample : _native_info.data.bits_per_sample
            }

        } //result_info

        _native_info = null;

        return _result_info;

    } //audio_load_info


    public function audio_info_from_bytes( _bytes:Uint8Array, _format:AudioFormatType ) : AudioInfo {

        assertnull(_bytes);

        var _id = 'audio_info_from_bytes/$_format';

        var _native_info : NativeAudioInfo = switch(_format) {
                case AudioFormatType.wav: audio_load_wav_from_bytes( _id, _bytes );
                case AudioFormatType.ogg: audio_load_ogg_from_bytes( _id, _bytes );
                case AudioFormatType.pcm: audio_load_pcm_from_bytes( _id, _bytes );
                case _ : null;
            } //switch _format

                //:todo:
            if(_native_info == null) throw Error.error('failed to process bytes for $_id');
            if(_native_info.data == null) throw Error.error('failed to process bytes for $_id, data was null.');

            var _result_bytes = haxe.io.Bytes.ofData(_native_info.data.bytes);
            var _result_info : AudioInfo = {

                id:     _native_info.id,
                format: _native_info.format,
                handle: _native_info.handle,

                data: {
                    samples         : new Uint8Array( _result_bytes ),
                    length          : _native_info.data.length,
                    length_pcm      : _native_info.data.length_pcm,
                    channels        : _native_info.data.channels,
                    rate            : _native_info.data.rate,
                    bitrate         : _native_info.data.bitrate,
                    bits_per_sample : _native_info.data.bits_per_sample
                }

            } //result_info

            _native_info = null;

        return _result_info;

    } //audio_info_from_bytes


    public function audio_seek_source( _info:AudioInfo, _to:Int ) : Bool {

        switch(_info.format) {
            case AudioFormatType.ogg: return audio_seek_source_ogg(_info, _to);
            case AudioFormatType.wav: return audio_seek_source_wav(_info, _to);
            case AudioFormatType.pcm: return audio_seek_source_pcm(_info, _to);
            case _: return false;
        }

        return false;

    } //audio_seek_source

    public function audio_load_portion( _info:AudioInfo, _start:Int, _len:Int ) : AudioDataBlob {

        var native_blob : NativeAudioDataBlob = null;
        var result_blob : AudioDataBlob = null;

        native_blob = switch(_info.format) {
            case AudioFormatType.ogg: audio_load_portion_ogg(_info, _start, _len);
            case AudioFormatType.wav: audio_load_portion_wav(_info, _start, _len);
            case AudioFormatType.pcm: audio_load_portion_pcm(_info, _start, _len);
            case _: null;
        }

        if(native_blob != null) {
            var _result_bytes = haxe.io.Bytes.ofData(native_blob.bytes);
            result_blob = {
                bytes: new Uint8Array( _result_bytes ),
                complete: native_blob.complete
            }
        }

        return result_blob;

    } //audio_load_portion

//ogg

    function audio_load_ogg( _path:String, ?load:Bool=true ) : NativeAudioInfo {
        // return assets_audio_load_info_ogg( _path, load, null, 0, 0 );
        return null;
    } //audio_load_ogg

    function audio_load_ogg_from_bytes( _path:String, _bytes:Uint8Array ) : NativeAudioInfo {
        // return assets_audio_load_info_ogg( _path, true, _bytes.toBytes().getData(), _bytes.byteOffset, _bytes.byteLength );
        return null;
    } //audio_load_ogg

    function audio_load_portion_ogg( _info:AudioInfo, _start:Int, _len:Int ) : NativeAudioDataBlob {
        // return assets_audio_read_bytes_ogg( _info, _start, _len );
        return null;
    } //load_audio_portion_ogg

    function audio_seek_source_ogg( _info:AudioInfo, _to:Int ) : Bool {
        // return assets_audio_seek_bytes_ogg( _info, _to );
        return false;
    } //audio_seek_source_ogg

//wav

    function audio_load_wav( _path:String, ?load:Bool=true ) : NativeAudioInfo {
        // return assets_audio_load_info_wav( _path, load, null, 0, 0 );
        return null;
    } //audio_load_wav

    function audio_load_wav_from_bytes( _path:String, _bytes:Uint8Array ) : NativeAudioInfo {
        // return assets_audio_load_info_wav( _path, true, _bytes.toBytes().getData(), _bytes.byteOffset, _bytes.byteLength );
        return null;
    } //audio_load_wav_from_bytes

    function audio_load_portion_wav( _info:AudioInfo, _start:Int, _len:Int ) : NativeAudioDataBlob {
        // return assets_audio_read_bytes_wav( _info, _start, _len );
        return null;
    } //load_audio_portion_wav

    function audio_seek_source_wav( _info:AudioInfo, _to:Int ) : Bool {
        // return assets_audio_seek_bytes_wav( _info, _to );
        return false;
    } //audio_seek_source_ogg

//pcm

    function audio_load_pcm( _path:String, ?load:Bool=true ) : NativeAudioInfo {
        // return assets_audio_load_info_pcm( _path, load, null, 0, 0 );
        return null;
    } //audio_load_pcm

    function audio_load_pcm_from_bytes( _path:String, _bytes:Uint8Array ) : NativeAudioInfo {
        // return assets_audio_load_info_pcm( _path, true, _bytes.toBytes().getData(), _bytes.byteOffset, _bytes.byteLength );
        return null;
    } //audio_load_pcm

    function audio_load_portion_pcm( _info:AudioInfo, _start:Int, _len:Int ) : NativeAudioDataBlob {
        // return assets_audio_read_bytes_pcm( _info, _start, _len );
        return null;
    } //load_audio_portion_pcm

    function audio_seek_source_pcm( _info:AudioInfo, _to:Int ) : Bool {
        // return assets_audio_seek_bytes_pcm( _info, _to );
        return false;
    } //audio_seek_source_pcm


}


private typedef NativeAudioInfo = {
    id : String,
    format : Int,
    data : NativeAudioDataInfo,
    handle : AudioHandle
}

private typedef NativeAudioDataInfo = {
    length : Int,
    length_pcm : Int,
    channels : Int,
    rate : Int,
    bitrate : Int,
    bits_per_sample : Int,
    bytes : haxe.io.BytesData
}

private typedef NativeAudioDataBlob = {
    bytes : haxe.io.BytesData,
    complete : Bool
}


