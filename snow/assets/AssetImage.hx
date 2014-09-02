package snow.assets;

import snow.io.IO;
import snow.types.Types;
import snow.utils.ByteArray;
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
            Note this function calls the onload handler in the next frame, so sync code can return.*/
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
                // Snow.next(function(){
                    onload( this );
                // });
            }

        });

    } //load

        /** Called from `app.assets.image`, or manually, if reloading the asset data at a later point.
            Note this function calls the onload handler in the next frame, so sync code can return. */
    public function load_from_bytes( bytes:ByteArray, ?onload:AssetImage->Void ) {

        loaded = false;
            //clear any old data in case
        image = null;
            //load the new data
        image = assets.platform.image_info_from_bytes( info.path, bytes, components );
            //set flag since there is no load time for this, usually sync
        loaded = true;

        if(onload != null) {
            Snow.next(function(){
                onload( this );
            });
        }

    } //load


} //AssetImage
