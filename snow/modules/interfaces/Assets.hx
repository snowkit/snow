package snow.modules.interfaces;

import snow.types.Types;
import snow.api.buffers.Uint8Array;
import snow.api.Promise;

@:noCompletion
@:allow(snow.systems.assets.Assets)
interface Assets {

    private var app: snow.Snow;
    private function onevent(event:SystemEvent):Void;
    private function shutdown():Void;

//image

        /** Image info load from file path. Use `app.assets`. Returns a promise for ImageData */
    function image_info_from_load( _path:String, ?_components:Int = 4 ) : Promise;
        /** Create an image info from image bytes. Use `app.assets` */
    function image_info_from_bytes( _path:String, _bytes:Uint8Array, ?_components:Int = 4 ) : Promise;
        /** Create an image info from raw (already decoded) image pixels. */
    function image_info_from_pixels( _id:String, _width:Int, _height:Int, _pixels:Uint8Array, ?_bpp:Int=4 ) : ImageData;

} //Assets
