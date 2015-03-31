package snow.system.assets;

import snow.system.assets.Assets;
import snow.types.Types;
import snow.io.typedarray.Uint8Array;


/**  An asset base class. Get assets from the `app.assets` */
class Asset {


        /** The asset manager associated with this asset */
    public var system : Assets;
        /** The id of this asset like `assets/image.png` */
    public var id : String;
        /** The `AssetInfo` of this asset */
    public var info : AssetInfo;
        /** The concrete type this asset holds (useful when handling as Asset base class) */
    public var type : AssetType;
        /** True if this asset has completely loaded. Only changed through `load` and when load completes */
    public var loaded : Bool = false;


        /** Called from subclasses, by `app.assets` */
    public function new( _system:Assets, _info:AssetInfo ) {

        system = _system;
        info = _info;
        id = info.id;

    } //new


} //Asset


//Audio

        /**  An asset that contains audio file `audio` as an `AudioInfo`. Get assets from the `Assets` class, via `app.assets` */
        class AssetAudio extends Asset {


                /** The `AudioInfo` this asset contains */
            public var audio : AudioInfo;
                /** The audio format of this asset. */
            public var format : AudioFormatType;
                /** Whether or not this asset is to be loaded in full (or alternatively, streamed). Used from `load` only. */
            public var load_full : Bool = true;


                /** Created from `app.assets.audio`.  */
            public function new( _system:Assets, _info:AssetInfo, _format:AudioFormatType, ?_load:Bool=true ) {

                super( _system, _info );
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
                system.module.audio_load_info( info.path, format, load_full, function( ?_audio:AudioInfo ) {

                    audio = _audio;

                    loaded = true;

                    if(onload != null) {
                        Snow.next(function(){
                            onload( this );
                        });
                    }

                }); //audio_load_info

            } //load


                /** Called from `app.assets.audio`, or manually, if reloading the asset data at a later point. This is a synchronous call */
            public function load_from_bytes( bytes:snow.io.typedarray.Uint8Array, format:AudioFormatType, ?onload:AssetAudio->Void ) {

                loaded = false;

                        //clear old reference
                    audio = null;
                        //load the new data
                    audio = system.module.audio_info_from_bytes( info.path, bytes, format );

                    if(onload != null) {
                        onload( this );
                    }

                loaded = true;

            } //load


        } //AssetAudio


//Image


        /**  An asset that contains image file `image` as an `ImageInfo`. Get assets from the `Assets` class, via `app.assets` */
        class AssetImage extends Asset {


                /** The `ImageInfo` this asset contains */
            public var image : ImageInfo;
                /** The requested components when loading this image. */
            public var components : Int = 4;


                /** Called from `app.assets` */
            public function new( _system:Assets, _info:AssetInfo, ?_components:Int=4 ) {

                super( _system, _info );
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
                system.module.image_load_info( info.path, components, function( ?_image:ImageInfo ) {

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
                    image = system.module.image_info_from_bytes( info.path, bytes, components );

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


//Bytes


        /**  An asset that contains byte `bytes` as a `Uint8Array`. Get assets from the `Assets` class, via `app.assets` */
        class AssetBytes extends Asset {


                /** The `Uint8Array` this asset contains */
            public var bytes : Uint8Array;
                /** Whether or not this bytes data will load syncronously. Used in `load` only. */
            public var async : Bool = false;


                /** Called from `app.assets` */
            public function new( _system:Assets, _info:AssetInfo, ?_async:Bool=false ) {

                super( _system, _info );
                type = AssetType.bytes;
                async = _async;

            } //new

                /** Called from `app.assets.bytes`, or manually, if reloading the asset data at a later point.
                    Note this function calls the onload handler in the next frame, so sync code can return. */
            public function load( ?onload:AssetBytes->Void ) {

                loaded = false;
                    //clear any old data in case
                bytes = null;

                var p = system.app.io.data_load( info.path, { binary:true });
                p.then(function(data:Uint8Array){

                    load_from_bytes(data, onload);

                });

            } //load

                /** This function is a synchronous call. */
            public function load_from_bytes( _bytes:Uint8Array, ?onload:AssetBytes->Void ) {

                loaded = false;

                    bytes = _bytes;

                loaded = true;

                if(onload != null) {
                    onload( this );
                }

            } //load_from_bytes


        } //AssetBytes


//Text


        /**  An asset that contains `text` as a `String`. Get assets from the `Assets` class, via `app.assets` */
        class AssetText extends Asset {


                /** The `String` this asset contains */
            public var text : String;
                /** Whether or not this bytes data will load syncronously. Used in `load` only. */
            public var async : Bool = false;


                /** Called from `app.assets.text` */
            public function new( _system:Assets, _info:AssetInfo, ?_async:Bool=false ) {

                super( _system, _info );
                type = AssetType.text;
                async = _async;

            } //new

                /** Called from `app.assets.text`, or manually, if reloading the asset data at a later point.
                    Note this function calls the onload handler in the next frame, so sync code can return. */
            public function load( ?onload:AssetText->Void ) {

                loaded = false;
                    //clear any old data in case
                text = null;

                var p = system.app.io.data_load( info.path, { binary:false });
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
