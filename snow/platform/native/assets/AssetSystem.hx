package snow.platform.native.assets;

import snow.assets.Assets;
import snow.assets.AssetSystem;
import snow.types.Types;
import snow.utils.Libs;

@:noCompletion class AssetSystem extends AssetSystemBinding {

    public function new( _manager:Assets ) {

        manager = _manager;

    } //new

//common

    override public function exists( _id:String, ?_strict:Bool=true ) : Bool {

        var listed = manager.listed(_id);
        if(_strict) {
            return listed;
        }

            //get the actual path
        var _path = manager.path(_id);
        var on_disk = sys.FileSystem.exists(_path);

        return listed || on_disk;

    } //exists

//images

    override public function image_load_info( _path:String, ?_components:Int = 4, ?_onload:?ImageInfo->Void ) : ImageInfo {

        var _native_info = snow_assets_image_load_info( _path, _components );

        var info : ImageInfo = {
            id : _native_info.id,
            bpp : _native_info.bpp,
            width : _native_info.width,
            height : _native_info.height,
            width_actual : _native_info.width,
            height_actual : _native_info.height,
            bpp_source : _native_info.bpp_source,
            data : new snow.utils.UInt8Array( _native_info.data )
        };

        if(_onload != null) {
            _onload(info);
        } //_onload

        _native_info = null;

        return info;

    } //image_load_info

//audio


    override public function audio_load_info( _path:String, ?_format:AudioFormatType, ?_load:Bool = true, ?_onload:?AudioInfo->Void ) : AudioInfo {

        var info : AudioInfo = null;

            switch(_format) {

                case AudioFormatType.wav: {
                    info = audio_load_wav( _path, _load );
                }

                case AudioFormatType.ogg: {
                    info = audio_load_ogg( _path, _load );
                }

                case AudioFormatType.pcm: {
                    info = audio_load_pcm( _path, _load );
                }

                default : {}

            } //switch _format

            if(info == null) {
                trace(_path + " audio info returned null");
                return null;
            }

                //transform the format
            if(Std.is(info.format, Int)) {
                info.format = audio_format_from_int(cast info.format);
            }

                //with audio the bytes data could be null too, this is also an invalid asset
            if(info.data == null) {
                trace(_path + " audio info data was null");
                return null;
            }

            if(_onload != null) {
                _onload(info);
            } //_onload

        return info;

    } //audio_load_info

    override public function audio_seek_source( _info:AudioInfo, _to:Int ) : Bool {

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

    override public function audio_load_portion( _info:AudioInfo, _start:Int, _len:Int ) : AudioDataBlob {

        switch(_info.format) {
            case AudioFormatType.ogg:
                return audio_load_portion_ogg(_info, _start, _len);
            case AudioFormatType.wav:
                return audio_load_portion_wav(_info, _start, _len);
            case AudioFormatType.pcm:
                return audio_load_portion_pcm(_info, _start, _len);
            default:
                return null;
        }

        return null;

    } //audio_load_portion

//ogg

    function audio_load_ogg( _path:String, ?load:Bool=true ) : AudioInfo {
        return snow_assets_audio_load_info_ogg( _path, load );
    } //audio_load_ogg

    function audio_load_portion_ogg( _info:AudioInfo, _start:Int, _len:Int ) : AudioDataBlob {
        return snow_assets_audio_read_bytes_ogg( _info, _start, _len );
    } //load_audio_portion_ogg

    function audio_seek_source_ogg( _info:AudioInfo, _to:Int ) : Bool {
        return snow_assets_audio_seek_bytes_ogg( _info, _to );
    } //audio_seek_source_ogg

//wav

    function audio_load_wav( _path:String, ?load:Bool=true ) : AudioInfo {
        return snow_assets_audio_load_info_wav( _path, load );
    } //audio_load_wav

    function audio_load_portion_wav( _info:AudioInfo, _start:Int, _len:Int ) : AudioDataBlob {
        return snow_assets_audio_read_bytes_wav( _info, _start, _len );
    } //load_audio_portion_wav

    function audio_seek_source_wav( _info:AudioInfo, _to:Int ) : Bool {
        return snow_assets_audio_seek_bytes_wav( _info, _to );
    } //audio_seek_source_ogg

//pcm

    function audio_load_pcm( _path:String, ?load:Bool=true ) : AudioInfo {
        return snow_assets_audio_load_info_pcm( _path, load );
    } //audio_load_pcm

    function audio_load_portion_pcm( _info:AudioInfo, _start:Int, _len:Int ) : AudioDataBlob {
        return snow_assets_audio_read_bytes_pcm( _info, _start, _len );
    } //load_audio_portion_pcm

    function audio_seek_source_pcm( _info:AudioInfo, _to:Int ) : Bool {
        return snow_assets_audio_seek_bytes_pcm( _info, _to );
    } //audio_seek_source_pcm


//internal

    function audio_format_from_int( _int:Int ) : AudioFormatType {

        switch(_int) {
            case 1: return AudioFormatType.ogg;
            case 2: return AudioFormatType.wav;
            case 3: return AudioFormatType.pcm;
            default: return AudioFormatType.unknown;
        }

    } //audio_format_from_int


//Native bindings


    static var snow_assets_image_load_info       = Libs.load( "snow", "snow_assets_image_load_info", 2 );

    static var snow_assets_audio_load_info_ogg   = Libs.load( "snow", "snow_assets_audio_load_info_ogg", 2 );
    static var snow_assets_audio_read_bytes_ogg  = Libs.load( "snow", "snow_assets_audio_read_bytes_ogg", 3 );
    static var snow_assets_audio_seek_bytes_ogg  = Libs.load( "snow", "snow_assets_audio_seek_bytes_ogg", 2 );

    static var snow_assets_audio_load_info_wav   = Libs.load( "snow", "snow_assets_audio_load_info_wav", 2 );
    static var snow_assets_audio_read_bytes_wav  = Libs.load( "snow", "snow_assets_audio_read_bytes_wav", 3 );
    static var snow_assets_audio_seek_bytes_wav  = Libs.load( "snow", "snow_assets_audio_seek_bytes_wav", 2 );

    static var snow_assets_audio_load_info_pcm   = Libs.load( "snow", "snow_assets_audio_load_info_pcm", 2 );
    static var snow_assets_audio_read_bytes_pcm  = Libs.load( "snow", "snow_assets_audio_read_bytes_pcm", 3 );
    static var snow_assets_audio_seek_bytes_pcm  = Libs.load( "snow", "snow_assets_audio_seek_bytes_pcm", 2 );

} //AssetSystem
