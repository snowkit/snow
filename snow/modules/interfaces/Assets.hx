package snow.modules.interfaces;

import snow.types.Types;
import snow.io.typedarray.Uint8Array;

@:allow(snow.system.io.IO)
interface Assets {

    private function init():Void;
    private function update():Void;
    private function destroy():Void;
    private function on_event( event:SystemEvent ):Void;

//common

        /** Return true if the asset exists or false if not.
            If strict is enabled, it will only check the stored asset list.
            If strict is false, will allow unlisted paths and use platform specific exists checks.
            On web targets, this will return false for unlisted files as http requests for 404's is silly. */
    function exists( _id:String, ?_strict:Bool=true ) : Bool;

//image

        /** Image info load from file path. Use `app.assets` */
    function image_load_info( _path:String, ?_components:Int = 4, ?_onload:?ImageInfo->Void ) : ImageInfo;
        /** Image info load from `snow.io.typedarray.Uint8Array`. Use `app.assets` */
    function image_info_from_bytes( _path:String, _bytes:Uint8Array, ?_components:Int = 4 ) : ImageInfo;

//audio

        /** Audio info loader, use `app.assets`. */
    function audio_load_info( _path:String, ?_format:AudioFormatType, ?_load:Bool = true, ?_onload:?AudioInfo->Void ) : AudioInfo;
        /** Audio info load from `Uint8Array`. use `app.assets`. */
    function audio_info_from_bytes( _path:String, _bytes:Uint8Array, _format:AudioFormatType ) : AudioInfo;





//Native only





    #if snow_native

            /** Audio seek the specified audio info to the given position in bytes. `native` only */
        function audio_seek_source( _info:AudioInfo, _to:Int ) : Bool;
            /** Audio portion loading (used for streaming or splitting source files into multiple blobs). sizes are in bytes. `native` only */
        function audio_load_portion( _info:AudioInfo, _start:Int, _len:Int ) : AudioDataBlob;

    #end //snow_native


} //Assets
