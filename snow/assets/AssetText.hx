package snow.assets;

import snow.io.IO;
import snow.types.Types;
import snow.utils.Libs;
import snow.assets.AssetSystem;
import snow.io.typedarray.Uint8Array;


/**  An asset that contains `text` as a `String`. Get assets from the `Assets` class, via `app.assets` */
class AssetText extends Asset {


        /** The `String` this asset contains */
    public var text : String;
        /** Whether or not this bytes data will load syncronously. Used in `load` only. */
    public var async : Bool = false;


        /** Called from `app.assets.text` */
    public function new( _assets:Assets, _info:AssetInfo, ?_async:Bool=false ) {

        super( _assets, _info );
        type = AssetType.text;
        async = _async;

    } //new

        /** Called from `app.assets.text`, or manually, if reloading the asset data at a later point.
            Note this function calls the onload handler in the next frame, so sync code can return. */
    public function load( ?onload:AssetText->Void ) {

        loaded = false;
            //clear any old data in case
        text = null;

        var p = assets.lib.io.data_load( info.path, { binary:false });
        p.then(function(data:Uint8Array){
            load_from_string( data.toBytes().toString(), onload );
        });

    } //load

    public function load_from_string( _string:String, ?onload:AssetText->Void ) {

        loaded = false;
        text = _string;
        loaded = true;

        if(onload != null) {
            onload( this );
        }

    } //load_from_string


} //AssetText
