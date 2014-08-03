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
            If strict is enabled, it will only check the asset list, not on disk.
            On web targets, this will return false for unlisted files */
    public function exists( _id:String, ?_strict:Bool=true ) : Bool;

//image

        /** Image info load from file path */
    public function image_load_info( _path:String, ?_components:Int = 4, ?_onload:?ImageInfo->Void ) : ImageInfo;
        /** Image info load from `ByteArray` */
    public function image_info_from_bytes( _path:String, _bytes:ByteArray, ?_components:Int = 4 ) : ImageInfo;

//audio

        /** Audio info loader */
    public function audio_load_info( _path:String, ?_format:AudioFormatType, ?_load:Bool = true, ?_onload:?AudioInfo->Void ) : AudioInfo;

#if snow_native

        /** Audio seek the specified audio info to the given position in bytes. `native` only */
    public function audio_seek_source( _info:AudioInfo, _to:Int ) : Bool;
        /** Audio portion loading (used for streaming or splitting source files into multiple blobs). sizes are in bytes. `native` only */
    public function audio_load_portion( _info:AudioInfo, _start:Int, _len:Int ) : AudioDataBlob;

#end //snow_native


} //AssetSystemBinding