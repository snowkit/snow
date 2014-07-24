package snow.assets;

import snow.io.IO;
import snow.types.Types;
import snow.utils.ByteArray;
import snow.utils.Libs;
import snow.assets.AssetSystem;

/**  An asset that contains audio file `audio` as an `AudioInfo`. Get assets from the `Assets` class, via `app.assets` */
class AssetAudio extends Asset {

        /** The `AudioInfo` this asset contains */
    public var audio : AudioInfo;
    public var format : AudioFormatType;
    public var load_full : Bool = true;


    public function new( _assets:Assets, _info:AssetInfo, _format:AudioFormatType, ?_load:Bool=true ) {

        super( _assets, _info );
        type = AssetType.audio;
        format = _format;
        load_full = _load;

    } //new


    public function load( ?onload:AssetAudio->Void ) {

        loaded = false;
            //clear any old data in case
        audio = null;
            //load the new data
        assets.system.audio_load_info( info.path, format, load_full, function( ?_audio:AudioInfo ) {

            audio = _audio;

            loaded = true;

            if(onload != null) {
                onload( this );
            }

        });

    } //load

} //AssetAudio