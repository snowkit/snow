package snow.core.native.assets;

import snow.types.Types;
import snow.utils.Libs;
import snow.io.typedarray.Uint8Array;
import snow.Debug.*;


@:allow(snow.system.assets.Assets)
class Assets implements snow.modules.interfaces.Assets {

    var system: snow.system.assets.Assets;
    function new( _system:snow.system.assets.Assets ) system = _system;

//common

    public function exists( _id:String, ?_strict:Bool=true ) : Bool {

        var listed = system.listed(_id);
        if(_strict) {
            return listed;
        }

            //get the actual path
        var _path = system.path(_id);
        var on_disk = sys.FileSystem.exists(_path);

        return listed || on_disk;

    } //exists

//images

    public function image_load_info( _path:String, ?_components:Int = 4, ?_onload:?ImageInfo->Void ) : ImageInfo {

        var _native_info = snow_assets_image_load_info( _path, _components );
        var info : ImageInfo = null;
        var _bytes = haxe.io.Bytes.ofData( _native_info.data );

        if(_native_info != null) {

            info = {
                id : _native_info.id,
                bpp : _native_info.bpp,
                width : _native_info.width,
                height : _native_info.height,
                width_actual : _native_info.width,
                height_actual : _native_info.height,
                bpp_source : _native_info.bpp_source,
                data : new Uint8Array( _bytes )
            };

        } //native_info != null


        if(_onload != null) {
            _onload( info );
        } //_onload

            //clean up if any
        _native_info = null;

            //return result
        return info;

    } //image_load_info

    public function image_info_from_bytes( _path:String, _data:snow.io.typedarray.Uint8Array, ?_components:Int = 4 ) : ImageInfo {

        var _native_info = snow_assets_image_info_from_bytes( _path, _data.buffer.getData(), _data.byteOffset, _data.byteLength, _components );
        var _out_bytes : haxe.io.Bytes = haxe.io.Bytes.ofData(_native_info.data);

        var info : ImageInfo = {
            id : _native_info.id,
            bpp : _native_info.bpp,
            width : _native_info.width,
            height : _native_info.height,
            width_actual : _native_info.width,
            height_actual : _native_info.height,
            bpp_source : _native_info.bpp_source,
            data : new Uint8Array( _out_bytes )
        };

        _native_info = null;

        return info;

    } //image_info_from_bytes

//audio

    public function audio_load_info( _path:String, ?_format:AudioFormatType, ?_load:Bool = true, ?_onload:?AudioInfo->Void ) : AudioInfo {

        var native_info : NativeAudioInfo = null;

            native_info = switch(_format) {

                case AudioFormatType.wav: {
                    audio_load_wav( _path, _load );
                }

                case AudioFormatType.ogg: {
                    audio_load_ogg( _path, _load );
                }

                case AudioFormatType.pcm: {
                    audio_load_pcm( _path, _load );
                }

                default : null;

            } //switch _format

            if(native_info == null) {
                log(_path + " audio info returned null");
                return null;
            }

                //with audio the bytes data could be null too, this is also an invalid asset
            if(native_info.data == null) {
                log(_path + " audio info data was null");
                return null;
            }

            var _result_bytes = haxe.io.Bytes.ofData(native_info.data.bytes);
            var _result_info : AudioInfo = {

                id:     native_info.id,
                format: native_info.format,
                handle: native_info.handle,

                data: {
                    bytes           : new Uint8Array( _result_bytes ),
                    length          : native_info.data.length,
                    length_pcm      : native_info.data.length_pcm,
                    channels        : native_info.data.channels,
                    rate            : native_info.data.rate,
                    bitrate         : native_info.data.bitrate,
                    bits_per_sample : native_info.data.bits_per_sample
                }

            } //result_info

            native_info = null;

            if(_onload != null) {
                _onload(_result_info);
            } //_onload

        return _result_info;

    } //audio_load_info


    public function audio_info_from_bytes( _path:String, _bytes:Uint8Array, _format:AudioFormatType ) : AudioInfo {

        var native_info : NativeAudioInfo = null;

            native_info = switch(_format) {

                case AudioFormatType.wav: {
                    audio_load_wav_from_bytes( _path, _bytes );
                }

                case AudioFormatType.ogg: {
                    audio_load_ogg_from_bytes( _path, _bytes );
                }

                case AudioFormatType.pcm: {
                    audio_load_pcm_from_bytes( _path, _bytes );
                }

                default : null;

            } //switch _format

            if(native_info == null) {
                log(_path + " audio info returned null");
                return null;
            }

                //with audio the bytes data could be null too, this is also an invalid asset
            if(native_info.data == null) {
                log(_path + " audio info data was null");
                return null;
            }

            var _result_bytes = haxe.io.Bytes.ofData(native_info.data.bytes);
            var _result_info : AudioInfo = {

                id:     native_info.id,
                format: native_info.format,
                handle: native_info.handle,

                data: {
                    bytes           : new Uint8Array( _result_bytes ),
                    length          : native_info.data.length,
                    length_pcm      : native_info.data.length_pcm,
                    channels        : native_info.data.channels,
                    rate            : native_info.data.rate,
                    bitrate         : native_info.data.bitrate,
                    bits_per_sample : native_info.data.bits_per_sample
                }

            } //result_info

            native_info = null;

        return _result_info;

    } //audio_info_from_bytes


    public function audio_seek_source( _info:AudioInfo, _to:Int ) : Bool {

        switch(_info.format) {
            case AudioFormatType.ogg:
                return audio_seek_source_ogg(_info, _to);
            case AudioFormatType.wav:
                return audio_seek_source_wav(_info, _to);
            case AudioFormatType.pcm:
                return audio_seek_source_pcm(_info, _to);
            default:
                return false;
        }

        return false;

    } //audio_seek_source

    public function audio_load_portion( _info:AudioInfo, _start:Int, _len:Int ) : AudioDataBlob {

        var native_blob : NativeAudioDataBlob = null;
        var result_blob : AudioDataBlob = null;

        native_blob = switch(_info.format) {
            case AudioFormatType.ogg:
                audio_load_portion_ogg(_info, _start, _len);
            case AudioFormatType.wav:
                audio_load_portion_wav(_info, _start, _len);
            case AudioFormatType.pcm:
                audio_load_portion_pcm(_info, _start, _len);
            default:
                null;
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
        return snow_assets_audio_load_info_ogg( _path, load, null, 0, 0 );
    } //audio_load_ogg

    function audio_load_ogg_from_bytes( _path:String, _bytes:Uint8Array ) : NativeAudioInfo {
        return snow_assets_audio_load_info_ogg( _path, true, _bytes, _bytes.byteOffset, _bytes.byteLength );
    } //audio_load_ogg

    function audio_load_portion_ogg( _info:AudioInfo, _start:Int, _len:Int ) : NativeAudioDataBlob {
        return snow_assets_audio_read_bytes_ogg( _info, _start, _len );
    } //load_audio_portion_ogg

    function audio_seek_source_ogg( _info:AudioInfo, _to:Int ) : Bool {
        return snow_assets_audio_seek_bytes_ogg( _info, _to );
    } //audio_seek_source_ogg

//wav

    function audio_load_wav( _path:String, ?load:Bool=true ) : NativeAudioInfo {
        return snow_assets_audio_load_info_wav( _path, load, null, 0, 0 );
    } //audio_load_wav

    function audio_load_wav_from_bytes( _path:String, _bytes:Uint8Array ) : NativeAudioInfo {
        return snow_assets_audio_load_info_wav( _path, true, _bytes, _bytes.byteOffset, _bytes.byteLength );
    } //audio_load_wav_from_bytes

    function audio_load_portion_wav( _info:AudioInfo, _start:Int, _len:Int ) : NativeAudioDataBlob {
        return snow_assets_audio_read_bytes_wav( _info, _start, _len );
    } //load_audio_portion_wav

    function audio_seek_source_wav( _info:AudioInfo, _to:Int ) : Bool {
        return snow_assets_audio_seek_bytes_wav( _info, _to );
    } //audio_seek_source_ogg

//pcm

    function audio_load_pcm( _path:String, ?load:Bool=true ) : NativeAudioInfo {
        return snow_assets_audio_load_info_pcm( _path, load, null, 0, 0 );
    } //audio_load_pcm

    function audio_load_pcm_from_bytes( _path:String, _bytes:Uint8Array ) : NativeAudioInfo {
        return snow_assets_audio_load_info_pcm( _path, true, _bytes, _bytes.byteOffset, _bytes.byteLength );
    } //audio_load_pcm

    function audio_load_portion_pcm( _info:AudioInfo, _start:Int, _len:Int ) : NativeAudioDataBlob {
        return snow_assets_audio_read_bytes_pcm( _info, _start, _len );
    } //load_audio_portion_pcm

    function audio_seek_source_pcm( _info:AudioInfo, _to:Int ) : Bool {
        return snow_assets_audio_seek_bytes_pcm( _info, _to );
    } //audio_seek_source_pcm



//Native bindings


    static var snow_assets_image_load_info       = Libs.load( "snow", "snow_assets_image_load_info", 2 );
    static var snow_assets_image_info_from_bytes = Libs.load( "snow", "snow_assets_image_info_from_bytes", 5 );

    static var snow_assets_audio_load_info_ogg   = Libs.load( "snow", "snow_assets_audio_load_info_ogg", 5 );
    static var snow_assets_audio_read_bytes_ogg  = Libs.load( "snow", "snow_assets_audio_read_bytes_ogg", 3 );
    static var snow_assets_audio_seek_bytes_ogg  = Libs.load( "snow", "snow_assets_audio_seek_bytes_ogg", 2 );

    static var snow_assets_audio_load_info_wav   = Libs.load( "snow", "snow_assets_audio_load_info_wav", 5 );
    static var snow_assets_audio_read_bytes_wav  = Libs.load( "snow", "snow_assets_audio_read_bytes_wav", 3 );
    static var snow_assets_audio_seek_bytes_wav  = Libs.load( "snow", "snow_assets_audio_seek_bytes_wav", 2 );

    static var snow_assets_audio_load_info_pcm   = Libs.load( "snow", "snow_assets_audio_load_info_pcm", 5 );
    static var snow_assets_audio_read_bytes_pcm  = Libs.load( "snow", "snow_assets_audio_read_bytes_pcm", 3 );
    static var snow_assets_audio_seek_bytes_pcm  = Libs.load( "snow", "snow_assets_audio_seek_bytes_pcm", 2 );

//Required by module interface

    function init():Void {}
    function update():Void {}
    function destroy():Void {}
    function on_event( event:SystemEvent ):Void {}


} //AssetSystem


    //These interact with the C++ side, where
    // haxe.io.ByteData is passed in directly

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
