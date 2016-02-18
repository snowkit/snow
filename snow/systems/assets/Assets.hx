package snow.systems.assets;

import snow.api.Promise;
import snow.api.buffers.Uint8Array;
import snow.api.Debug.*;

import snow.systems.assets.Asset;
import snow.types.Types;

/** The asset system class gives you access to fetching and manipulating assets,
    handling loading files and data in a consistent cross platform way */
@:allow(snow.Snow)
class Assets {


        /** If the assets are not relative to the runtime root path, this value can adjust all asset paths. This is automatically handled and exists to allow control. */
    public var root : String = '';

        /** access to module implementation */
    public var module : ModuleAssets;
        /** access to snow from subsystems */
    public var app : Snow;


        /** constructed internally, use `app.assets` */
    function new( _app:Snow ) {

        #if ios
                //This is because of how the files are put into the xcode project
                //for the iOS builds, it stores them inside of /assets to avoid
                //including the root in the project in the Resources/ folder
            root = 'assets/';
        #end

        app = _app;
        module = new ModuleAssets(app);

    } //new

        /** Shutdown and clean up etc. */
    function shutdown() {

        module.shutdown();

    } //shutdown


//Public API

        /** Get the asset path for an asset, adjusted by platform, root etc. */
    public inline function path(_id:String) : String
        return haxe.io.Path.join([root,_id]);

        /** Get an asset as an `AssetBytes`, data stored as `Uint8Array`, using the default processor and provider */
    public inline function bytes(_id:String) : Promise
        return AssetBytes.load(this, _id);

        /** Get an asset as an `AssetText`, data stored as `String`, using the default processor and provider */
    public inline function text(_id:String) : Promise
        return AssetText.load(this, _id);

        /** Get an asset as an `AssetJSON`, data stored as `Dynamic`, using the default processor and provider */
    public inline function json(_id:String) : Promise
        return AssetJSON.load(this, _id);

        /** Get an asset as an `AssetImage`, data stored as `ImageData`, using the default processor and provider */
    public inline function image(_id:String) : Promise
        return AssetImage.load(this, _id);

        /** Get an asset as an `AssetImage`, data stored as `ImageData`, created from image file bytes (not pixels). */
    public inline function image_from_bytes(_id:String, _bytes:Uint8Array) : Promise
        return AssetImage.load_from_bytes(this, _id, _bytes);

        /** Get an asset as an `AssetImage`, data stored as `ImageData`, created from image file pixels */
    public inline function image_from_pixels(_id:String, _width:Int, _height:Int, _pixels:Uint8Array) : AssetImage
        return AssetImage.load_from_pixels(this, _id, _width, _height, _pixels);

        /** Get an asset as an `AssetAudio`, data stored as `AudioData`, using the default processor and provider */
    public inline function audio(_id:String, ?_is_stream:Bool=false) : Promise
        return AssetAudio.load(this, _id, _is_stream);

        /** Get an asset as an `AssetAudio`, data stored as `AudioData`, created from audio file bytes. */
    public inline function audio_from_bytes(_id:String, _bytes:Uint8Array, _format:AudioFormatType) : Promise
        return AssetAudio.load_from_bytes(this, _id, _bytes, _format);

} //Assets
