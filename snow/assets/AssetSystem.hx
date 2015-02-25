package snow.assets;

import snow.Snow;
import snow.assets.Assets;
import snow.types.Types;

import snow.utils.ByteArray;
import snow.utils.AbstractClass;


#if snow_web
    @:noCompletion typedef AssetSystem = snow.platform.web.assets.AssetSystem;
#else
    @:noCompletion typedef AssetSystem = snow.platform.native.assets.AssetSystem;
#end


@:noCompletion class AssetSystemBinding implements AbstractClass {

    public var manager : Assets;

//common

        /** Return true if the asset exists or false if not.
            If strict is enabled, it will only check the stored asset list.
            If strict is false, will allow unlisted paths and use platform specific exists checks.
            On web targets, this will return false for unlisted files as http requests for 404's is silly. */
    public function exists( _id:String, ?_strict:Bool=true ) : Bool;

//image

        /** Image info load from file path. Use `app.assets` */
    public function image_load_info( _path:String, ?_components:Int = 4, ?_onload:?ImageInfo->Void ) : ImageInfo;
        /** Image info load from `ByteArray`. Use `app.assets` */
    public function image_info_from_bytes( _path:String, _bytes:ByteArray, ?_components:Int = 4 ) : ImageInfo;

//audio

        /** Audio info loader, use `app.assets`. */
    public function audio_load_info( _path:String, ?_format:AudioFormatType, ?_load:Bool = true, ?_onload:?AudioInfo->Void ) : AudioInfo;
        /** Audio info load from `ByteArray`. use `app.assets`. */
    public function audio_info_from_bytes( _path:String, _bytes:ByteArray, _format:AudioFormatType ) : AudioInfo;





//Native only





    #if snow_native

            /** Audio seek the specified audio info to the given position in bytes. `native` only */
        public function audio_seek_source( _info:AudioInfo, _to:Int ) : Bool;
            /** Audio portion loading (used for streaming or splitting source files into multiple blobs). sizes are in bytes. `native` only */
        public function audio_load_portion( _info:AudioInfo, _start:Int, _len:Int ) : AudioDataBlob;

    #end //snow_native


} //AssetSystemBinding
