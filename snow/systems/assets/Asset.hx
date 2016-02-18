package snow.systems.assets;

import snow.systems.assets.Asset;
import snow.systems.assets.Assets;
import snow.types.Types;
import snow.api.buffers.Uint8Array;
import snow.api.Promise;
import snow.api.Debug.*;


/**  An asset base class. Get assets from the `app.assets` */
class Asset {

        /** The asset system */
    public var system : Assets;
        /** The id of this asset, i.e `assets/image.png` */
    public var id : String;
        /** True if this asset has completely loaded. */
    public var loaded : Bool = false;
        /** A convenience type id when dealing with the base class.
            This is an Int because it can be any number for custom types,
            by default uses AssetType for the base types. */
    public var type : Int;


        /** Called from subclasses, by `app.assets` */
    public function new( _system:Assets, _id:String, _type:Int=0 ) {

        assertnull( _id );
        assertnull( _system );

        system = _system;
        type = _type;
        id = _id;

    } //new

        /** Implemented by subclasses to clean up their data and references. */
    public function destroy() {

    }

} //Asset


//Image



    class AssetImage extends snow.systems.assets.Asset {

        public var image (default,set): ImageData;

        public function new(_system:Assets, _id:String, _image:ImageData) {

            super(_system, _id, at_image);
            image = _image;

        } //new

        //Public API

                /** Reloads the bytes from the stored id, using the default processor, returning a promise for the asset. */
            public function reload() : Promise {

                loaded = false;

                return new Promise(function(resolve, reject) {

                    var _load = system.app.io.data_flow(system.path(id), provider);

                    _load.then(
                        function(_image:ImageData){
                            image = _image;
                            resolve(this);
                        }
                    ).error(reject);

                }); //promise

            } //reload

            override public function destroy() {

                image.destroy();
                image = null;

            }

                /** Reload the asset from bytes */
            public function reload_from_bytes(_bytes:Uint8Array) {

                loaded = false;

                return new Promise(function(resolve, reject){

                    var _load = system.module.image_info_from_bytes(id, _bytes);

                    _load.then(function(_image:ImageData){
                        image = _image;
                        resolve(this);
                    }).error(reject);

                });

            } //reload_from_bytes

                /** Reload the asset from already decoded pixels */
            public function reload_from_pixels(_width:Int, _height:Int, _pixels:Uint8Array) {

                loaded = false;

                image = system.module.image_info_from_pixels(id, _width, _height, _pixels);

            } //reload_from_bytes

        //Public Static API

            public static function load(_system:Assets, _id:String) : Promise {

                assertnull( _id );
                assertnull( _system );

                return new AssetImage(_system, _id, null).reload();

            } //load

            public static function load_from_bytes(_system:Assets, _id:String, _bytes:Uint8Array) : Promise {

                assertnull( _id );
                assertnull( _bytes );
                assertnull( _system );

                return new AssetImage(_system, _id, null).reload_from_bytes(_bytes);

            } //load_from_bytes

            public static function load_from_pixels(_system:Assets, _id:String, _width:Int, _height:Int, _pixels:Uint8Array) : AssetImage {

                assertnull( _id );
                assertnull( _pixels );
                assertnull( _system );

                var info = _system.module.image_info_from_pixels(_id, _width, _height, _pixels);

                return new AssetImage(_system, _id, info);

            } //load_from_pixels

                /** A default io provider, using image_info_from_load from the asset module.
                    Promises ImageData. Takes an asset path, not an asset id (use assets.path(id))*/
            public static function provider(_app:snow.Snow, _path:String) : Promise {

                return _app.assets.module.image_info_from_load(_path);

            } //provider

                /** A convenience io processor, using image_info_from_bytes, from the asset module. Promises ImageData */
            public static function processor(_app:snow.Snow, _id:String, _data:Uint8Array) : Promise {

                if(_data == null) return Promise.reject(Error.error("AssetImage processor: data was null"));

                return _app.assets.module.image_info_from_bytes(_id, _data);

            } //load

        //Internal

                /** Set the image contained to a new value */
            function set_image(_image:ImageData) {

                loaded = _image != null;
                return image = _image;

            } //set_image

    } //AssetImage


//Audio


    class AssetAudio extends snow.systems.assets.Asset {

        public var audio (default,set): AudioData;

        public function new(_system:Assets, _id:String, _audio:AudioData) {

            super(_system, _id, at_audio);
            audio = _audio;

        } //new

        //Public API

                /** Reloads the audio from the stored id, using audio module `data_from_load`, returning a promise for the asset. */
            public function reload(?_is_stream:Bool=false) : Promise {

                loaded = false;

                return new Promise(function(resolve, reject) {

                    var _load = system.app.audio.module.data_from_load(system.path(id), _is_stream);

                    _load.then(
                        function(_audio:AudioData){
                            audio = _audio;
                            resolve(this);
                        }
                    ).error(reject);

                }); //promise

            } //reload

            override public function destroy() {
            
                audio.destroy();
                audio = null;
            
            } //destroy

                /** Reload the asset from bytes */
            public function reload_from_bytes(_bytes:Uint8Array, _format:AudioFormatType) {

                loaded = false;

                return new Promise(function(resolve, reject){

                    var _load = system.app.audio.module.data_from_bytes(id, _bytes, _format);

                    _load.then(function(_audio:AudioData){
                        audio = _audio;
                        resolve(this);
                    }).error(reject);

                });

            } //reload_from_bytes

        //Public Static API

            public static function load(_system:Assets, _id:String, ?_is_stream:Bool=false) : Promise {

                assertnull( _id );
                assertnull( _system );

                return new AssetAudio(_system, _id, null).reload(_is_stream);

            } //load

            public static function load_from_bytes(_system:Assets, _id:String, _bytes:Uint8Array, _format:AudioFormatType) : Promise {

                assertnull( _id );
                assertnull( _bytes );
                assertnull( _system );

                return new AssetAudio(_system, _id, null).reload_from_bytes(_bytes, _format);

            } //load_from_bytes

        //Internal

                /** Set the audio contained to a new value */
            function set_audio(_audio:AudioData) {

                loaded = _audio != null;
                return audio = _audio;

            } //set_audio

    } //AssetAudio


//Bytes


    class AssetBytes extends Asset {

        public var bytes (default,set): Uint8Array;

        public function new(_system:Assets, _id:String, _bytes:Uint8Array) {

            super(_system, _id, at_bytes);
            bytes = _bytes;

        } //new

        //Public API

                /** Reloads the bytes from it's stored id, using the default processor, returning a promise for the asset. */
            public function reload() : Promise {

                return new Promise(function(resolve, reject) {

                    system.app.io.data_flow(system.path(id)).then(function(_bytes:Uint8Array){

                        bytes = _bytes;
                        resolve(this);

                    }).error(reject);

                }); //promise

            } //reload

            override public function destroy() {
                //:note: can't set the buffer on js, this is mostly for cpp gc anyway
                #if snow_native if(bytes != null) bytes.buffer = null; #end
                bytes = null;
            }

        //Static API

                /** Create a new AssetBytes from an id, which returns a promise for the asset. */
            public static function load( _system:Assets, _id:String ) : Promise {

                return new AssetBytes(_system, _id, null).reload();

            } //load


        //Internal

                /** Set the bytes contained to a new value */
            function set_bytes(_bytes:Uint8Array) {

                loaded = _bytes != null;
                return bytes = _bytes;

            } //set_bytes

    } //AssetBytes


//Text


    class AssetText extends Asset {

        public var text (default,set): String;

        public function new(_system:Assets, _id:String, _text:String) {

            super(_system, _id, at_text);
            text = _text;

        } //new

        //Public API

                /** Reloads the text from it's stored id, returning a promise for the asset. */
            public function reload() : Promise {

                return new Promise(function(resolve, reject) {

                    system.app.io.data_flow(system.path(id), processor).then(function(_text:String){

                        text = _text;
                        resolve(this);

                    }).error(reject);

                }); //promise

            } //reload

            override public function destroy() {
                text = null;
            }

        //Static API

                /** Create a new AssetText from an id, which returns a promise for the asset. */
            public static function load( _system:Assets, _id:String ) : Promise {

                return new AssetText(_system, _id, null).reload();

            } //load

                /** A default text processor for the data processor API */
            public static function processor(_app:snow.Snow, _id:String, _data:Uint8Array) : Promise {

                if(_data == null) return Promise.reject(Error.error("AssetText processor: data was null"));

                var _string = _data.toBytes().toString();
                    //:note: can't set the buffer on js, this is mostly for cpp gc anyway
                    #if snow_native _data.buffer = null; #end
                    _data = null;

                return Promise.resolve(_string);

            } //processor

        //Internal

                /** Set the text contained to a new value */
            function set_text(_text:String) {

                loaded = _text != null;
                return text = _text;

            } //set_text

    } //AssetText

//JSON

    class AssetJSON extends Asset {

        /** The json data stored in the asset */
        public var json (default,set): Dynamic;

        public function new( _system:snow.systems.assets.Assets, _id:String, _json:Dynamic ) {

            super(_system, _id, at_json);
            json = _json;

        } //new

        //Public API

                /** Reloads the json from it's stored id, returning a promise for the asset. */
            public function reload() : Promise {

                return new Promise(function(resolve, reject) {

                    system.app.io.data_flow(system.path(id), processor).then(function(_json:Dynamic){

                        json = _json;
                        resolve(this);

                    }).error(reject);

                }); //promise

            } //reload

            override public function destroy() {
                json = null;
            }

        //Static API

                /** Create a new AssetJSON from an id, which returns a promise for the asset. */
            public static function load( _system:snow.systems.assets.Assets, _id:String ) : Promise {

                return new AssetJSON(_system, _id, null).reload();

            } //load

                /** A default json processor for the data processor API */
            public static function processor(_app:snow.Snow, _id:String, _data:Uint8Array) : Promise {

                if(_data == null) return Promise.reject(Error.error("AssetJSON: data was null"));

                return new Promise(function(resolve, reject) {

                    var _data_json : Dynamic = null;

                    try { 
                        _data_json = haxe.Json.parse(_data.toBytes().toString()); 
                        _data = null;
                    } catch(e:Dynamic) {
                        _data = null;
                        return reject(Error.parse(e));
                    }

                    return resolve(_data_json);

                }); //promise

            } //processor

        //Internal

                /** Set the json contained to a new value */
            function set_json(_json:Dynamic) {

                loaded = _json != null;
                return json = _json;

            } //set_json

    } //AssetJSON
