package snow.assets;

import snow.io.IO;
import snow.types.Types;
import snow.utils.ByteArray;
import snow.utils.Libs;
import snow.assets.AssetSystem;


/**  An asset that contains byte `bytes` as a `ByteArray`. Get assets from the `Assets` class, via `app.assets` */
class AssetBytes extends Asset {

        /** The `ByteArray` this asset contains */
    public var bytes : ByteArray;
        /** Whether or not this bytes data will load syncronously */
    public var async : Bool = false;


    public function new( _assets:Assets, _info:AssetInfo, ?_async:Bool=false ) {

        super( _assets, _info );
        type = AssetType.bytes;
        async = _async;

    } //new

    public function load( ?onload:AssetBytes->Void ) {

        loaded = false;
            //clear any old data in case
        bytes = null;
            //load the new data
        ByteArray.readFile( info.path, async, function( result:ByteArray ) {

            bytes = result;

            loaded = true;

            if(onload != null) {
                onload( this );
            }

        }); //readFile

    } //load


} //AssetBytes