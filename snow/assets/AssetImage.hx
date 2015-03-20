package snow.assets;

import snow.io.IO;
import snow.io.typedarray.Uint8Array;
import snow.types.Types;
import snow.utils.Libs;
import snow.assets.Asset;
import snow.assets.AssetSystem;


/**  An asset that contains image file `image` as an `ImageInfo`. Get assets from the `Assets` class, via `app.assets` */
class AssetImage extends Asset {


        /** The `ImageInfo` this asset contains */
    public var image : ImageInfo;
        /** The requested components when loading this image. */
    public var components : Int = 4;


        /** Called from `app.assets` */
    public function new( _assets:Assets, _info:AssetInfo, ?_components:Int=4 ) {

        super( _assets, _info );
        type = AssetType.image;
        components = _components;

    } //new

        /** Called from `app.assets.image`, or manually, if reloading the asset data at a later point.
            Note this function is async by nature, and calls the onload handler in the next frame. */
    public function load( ?onload:AssetImage->Void ) {

        loaded = false;
            //clear any old data in case
        image = null;

            //load the new data
        assets.platform.image_load_info( info.path, components, function( ?_image:ImageInfo ) {

            if(_image != null) {
                image = _image;
                loaded = true;
            }

            if(onload != null) {
                Snow.next(function(){
                    onload( this );
                });
            }

        }); //image_load_info

    } //load

        /** Called from `app.assets.image`, or manually, if reloading the asset data at a later point. This is a synchronous call */
    public function load_from_bytes( bytes:Uint8Array, ?onload:AssetImage->Void ) {

        loaded = false;

                //clear old reference
            image = null;
                //load the new data
            image = assets.platform.image_info_from_bytes( info.path, bytes, components );

            if(onload != null) {
                onload( this );
            }

        loaded = true;

    } //load_from_bytes

        /** Create an image asset from a pre-existing decoded image info. This is a synchronous call */
    public function load_from_pixels( _id:String, _width:Int, _height:Int, _pixels: snow.io.typedarray.Uint8Array, ?onload:AssetImage->Void ) {

        loaded = false;

                //clear old reference
            image = null;
                //image info
            image = {
                id : _id,
                width : _width,
                width_actual : _width,
                height : _height,
                height_actual : _height,
                bpp : 4, //:todo :
                bpp_source : 4,
                data : _pixels
            };

            if(onload != null) {
                onload( this );
            }

        loaded = true;

    } //load_from_pixels


} //AssetImage
