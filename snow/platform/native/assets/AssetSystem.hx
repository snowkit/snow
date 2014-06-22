package snow.platform.native.assets;

import snow.assets.Assets;
import snow.assets.AssetSystem;
import snow.types.Types;
import snow.utils.Libs;

@:noCompletion class AssetSystem extends AssetSystemBinding {

    public function new( _manager:Assets ) {

        manager = _manager;

    } //new

//images

    override public function image_load_info( _path:String, ?_components:Int = 4, ?_onloaded:?ImageInfo->Void ) : ImageInfo {

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

        if(_onloaded != null) {
            _onloaded(info);
        } //_onloaded

        _native_info = null;

        return info;

    } //image_load_info

//ogg

    override public function audio_load_ogg( asset:AssetInfo, ?load:Bool=true ) : AudioInfo {
        return snow_assets_audio_load_info_ogg( manager._path(asset), load );
    } //audio_load_ogg

    override public function audio_load_portion_ogg( _info:AudioInfo, _start:Int, _len:Int ) : AudioDataBlob {
        return snow_assets_audio_read_bytes_ogg( _info, _start, _len );
    } //load_audio_portion_ogg

    override public function audio_seek_source_ogg( _info:AudioInfo, _to:Int ) : Bool {
        return snow_assets_audio_seek_bytes_ogg( _info, _to );
    } //audio_seek_source_ogg

//wav

    override public function audio_load_wav( asset:AssetInfo, ?load:Bool=true ) : AudioInfo {
        return snow_assets_audio_load_info_wav( manager._path(asset), load );
    } //audio_load_wav

    override public function audio_load_portion_wav( _info:AudioInfo, _start:Int, _len:Int ) : AudioDataBlob {
        return snow_assets_audio_read_bytes_wav( _info, _start, _len );
    } //load_audio_portion_wav

    override public function audio_seek_source_wav( _info:AudioInfo, _to:Int ) : Bool {
        return snow_assets_audio_seek_bytes_wav( _info, _to );
    } //audio_seek_source_ogg

//pcm

    override public function audio_load_pcm( asset:AssetInfo, ?load:Bool=true ) : AudioInfo {
        return snow_assets_audio_load_info_pcm( manager._path(asset), load );
    } //audio_load_pcm

    override public function audio_load_portion_pcm( _info:AudioInfo, _start:Int, _len:Int ) : AudioDataBlob {
        return snow_assets_audio_read_bytes_pcm( _info, _start, _len );
    } //load_audio_portion_pcm

    override public function audio_seek_source_pcm( _info:AudioInfo, _to:Int ) : Bool {
        return snow_assets_audio_seek_bytes_pcm( _info, _to );
    } //audio_seek_source_pcm


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
