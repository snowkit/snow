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
        /** The audio format of this asset */
    public var format : AudioFormatType;
        /** Whether or not this asset is to be loaded in full (or alternatively, streamed). Used from `load` only. */
    public var load_full : Bool = true;


        /** Created from `app.assets.audio` */
    public function new( _assets:Assets, _info:AssetInfo, _format:AudioFormatType, ?_load:Bool=true ) {

        super( _assets, _info );
        type = AssetType.audio;
        format = _format;
        load_full = _load;

    } //new


        /** Called from `app.assets.audio`, or manually, if reloading the asset data at a later point.
            Note this function calls the onload handler in the next frame, so sync code can return. */
    public function load( ?onload:AssetAudio->Void ) {

        loaded = false;
            //clear any old data in case
        audio = null;

            //load the new data
        assets.platform.audio_load_info( info.path, format, load_full, function( ?_audio:AudioInfo ) {

            audio = _audio;

            loaded = true;

            if(onload != null) {
                Snow.next(function(){
                    onload( this );
                });
            }

        }); //audio_load_info

    } //load


} //AssetAudio
