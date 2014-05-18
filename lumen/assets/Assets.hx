package lumen.assets;

import lumen.io.IO;
import lumen.LumenTypes;
import lumen.utils.ByteArray;
import lumen.utils.Libs;


class Asset {
    public var id : String;
    public var info : AssetInfo;
    public function new( _info:AssetInfo ) {
        info = _info;
        id = info.id;
    }
} //Asset


class AssetBytes extends Asset {

    public var data : ByteArray;
    public function new( _info:AssetInfo, _data:ByteArray ) {
        super( _info );
        data = _data;
    }

} //AssetBytes

class AssetText extends Asset {

    public var text : String;
    public function new( _info:AssetInfo, _data:String ) {
        super( _info );
        text = _data;
    }

} //AssetText

typedef AssetImageOptions = {
    components : Int
} //AssetImageOptions

class AssetImage extends Asset {

    public var data : ImageInfo;
    public function new( _info:AssetInfo, _data:ImageInfo ) {
        super( _info );
        data = _data;
    }

} //AssetImage

typedef AssetAudioOptions = {
    ? type : String,
    ? load : Bool
} //AssetAudioOptions

class AssetAudio extends Asset {

    public var data : AudioInfo;
    public function new( _info:AssetInfo, _data:AudioInfo ) {
        super( _info );
        data = _data;
    }

} //AssetAudio


class Assets {

    public var list : Map<String, AssetInfo>;
    public var assets_root : String = '';
    public var manifest_path : String = 'manifest';

    var lib : Lumen;

    public function new( _lib:Lumen ) {

        #if ios
                //This is because of how the files are put into the xcode project
                //for the iOS builds, it stores them inside of /assets to avoid
                //including the root in the project in the Resources/ folder
            assets_root = 'assets/';
        #end

        lib = _lib;
        list = new Map();

    } //new

    public function add( _list:Array<AssetInfo> ) {

        for(_asset in _list) {

                //we transform the types by extension for common files.
                //these are just hints anyway, lumen won't enforce them.
                //unknown file formats will remain "binary" or "template" etc.
                //:todo: ideally this can be gleaned from the enums?
            var images = ["psd", "bmp", "tga", "gif", "jpg", "png"];
            var sounds = ["pcm", "ogg", "wav"];

            if( Lambda.has(images, _asset.ext) ) {
                _asset.type = 'image';
            } else if(Lambda.has(sounds, _asset.ext)) {
                _asset.type = 'sound';
            }

            lib._debug('/ lumen /    added asset ${_asset.id} at ${_asset.path} (${_asset.type}) ');

            list.set(_asset.id, _asset);

        } //for each

    } //add

    public function get( _id:String ) : AssetInfo {

        return list.get(_id);

    } //get

    public function exists( _id:String ) : Bool {

        return list.exists(_id);

    } //exists

    public function path( _id:String ) : String {

        if( exists(_id) ) {
            return assets_root + get(_id).path;
        }

        return "";

    } //path

    public function get_bytes( _id:String ) : AssetBytes {

        if(exists(_id)) {

            var asset = get(_id);
            var bytes_data = ByteArray.readFile( _path(asset) );

            return new AssetBytes( asset, bytes_data );

        } else {
            exists_error(_id);
        }

        return null;

    } //get_bytes

    public function get_text( _id:String ) : AssetText {

        //get_bytes will complain if it's missing
        var bytes = get_bytes( _id );

        if(bytes != null) {

                //if the bytes are null it failed and isn't a valid asset, so we return null
            if(bytes.data == null) {
                load_error(_id, "byte data was null");
                return null;
            }

            return new AssetText( bytes.info, bytes.data.toString() );
        }

        return null;

    } //get_text

    public function get_image( _id:String, ?options:AssetImageOptions ) : AssetImage {

        if(exists(_id)) {

            if(options == null) {
                options = { components : 4 };
            }

            var asset = get(_id);
            var _image_info = lumen_assets_image_load_info( _path(asset), options.components );

            if(_image_info == null) {
                load_error(_id, "image info returned null");
                return null;
            }

                //with images the bytes data could be null too, this is also an invalid asset
            if(_image_info.data == null) {
                load_error(_id, "image info data was null");
                return null;
            }

            return new AssetImage( asset, _image_info );

        } else {
            exists_error(_id);
        }

        return null;

    } //get_image

    public function get_audio( _id:String, ?options:AssetAudioOptions ) : AssetAudio {

        if(exists(_id)) {

            var asset = get(_id);
            var _audio_info : AudioInfo = null;

                //handle default options.
                //type defaults to extension and
                //load is true for loading the whole now,
                //streaming sounds request false etc.
            if(options == null) {
                options = { type:asset.ext, load:true }
            } else {
                if(options.type == null || options.type == "") {
                    options.type = asset.ext;
                }
                if(options.load == null) {
                    options.load = true;
                }
            }

            switch(options.type) {

                case 'wav' : {
                    _audio_info = audio_load_wav( asset, options.load );
                }

                case 'ogg' : {
                    _audio_info = audio_load_ogg( asset, options.load );
                }

                case 'pcm' : {
                    _audio_info = audio_load_pcm( asset, options.load );
                }

                default : {
                    load_error(_id, "unrecognised audio type (" + options.type + ")");
                }

            } //switch options.type

            if(_audio_info == null) {
                load_error(_id, "audio info returned null");
                return null;
            }

                //transform the format
            if(Std.is(_audio_info.format, Int)) {
                _audio_info.format = audio_format_from_int(cast _audio_info.format);
            }

                //with audio the bytes data could be null too, this is also an invalid asset
            if(_audio_info.data == null) {
                load_error(_id, "audio info data was null");
                return null;
            }

            return new AssetAudio( asset, _audio_info );

        } else {
            exists_error(_id);
        }

        return null;

    } //get_audio


    //:todo: these are abstracted to allow for html5 building
    //since these are currently talking to native only


//ogg

    @:noCompletion public function audio_load_ogg( asset:AssetInfo, ?load:Bool=true ) : AudioInfo {
        return lumen_assets_audio_load_info_ogg( _path(asset), load );
    } //audio_load_ogg

    @:noCompletion public function audio_load_portion_ogg( _info:AudioInfo, _start:Int, _len:Int ) : AudioDataBlob {
        return lumen_assets_audio_read_bytes_ogg( _info, _start, _len );
    } //load_audio_portion_ogg

    @:noCompletion public function audio_seek_source_ogg( _info:AudioInfo, _to:Int ) : Bool {
        return lumen_assets_audio_seek_bytes_ogg( _info, _to );
    } //audio_seek_source_ogg

//wav

    @:noCompletion public function audio_load_wav( asset:AssetInfo, ?load:Bool=true ) : AudioInfo {
        return lumen_assets_audio_load_info_wav( _path(asset), load );
    } //audio_load_wav

    @:noCompletion public function audio_load_portion_wav( _info:AudioInfo, _start:Int, _len:Int ) : AudioDataBlob {
        return lumen_assets_audio_read_bytes_wav( _info, _start, _len );
    } //load_audio_portion_wav

    @:noCompletion public function audio_seek_source_wav( _info:AudioInfo, _to:Int ) : Bool {
        return lumen_assets_audio_seek_bytes_wav( _info, _to );
    } //audio_seek_source_ogg

//pcm

    @:noCompletion public function audio_load_pcm( asset:AssetInfo, ?load:Bool=true ) : AudioInfo {
        return lumen_assets_audio_load_info_pcm( _path(asset), load );
    } //audio_load_pcm

    @:noCompletion public function audio_load_portion_pcm( _info:AudioInfo, _start:Int, _len:Int ) : AudioDataBlob {
        return lumen_assets_audio_read_bytes_pcm( _info, _start, _len );
    } //load_audio_portion_pcm

    @:noCompletion public function audio_seek_source_pcm( _info:AudioInfo, _to:Int ) : Bool {
        return lumen_assets_audio_seek_bytes_pcm( _info, _to );
    } //audio_seek_source_pcm


    @:noCompletion public function audio_seek_source( _info:AudioInfo, _to:Int ) : Bool {
        
        switch(_info.format) {
            case AudioFormatType.ogg:
                return audio_seek_source_ogg(_info, _to);
            case AudioFormatType.wav:
                return audio_seek_source_wav(_info, _to);
            case AudioFormatType.pcm:
                return audio_seek_source_pcm(_info, _to);
            default:
                return false;
        }

        return false;

    } //audio_seek_portion

    @:noCompletion public function audio_load_portion( _info:AudioInfo, _start:Int, _len:Int ) : AudioDataBlob {

        switch(_info.format) {
            case AudioFormatType.ogg:
                return audio_load_portion_ogg(_info, _start, _len);
            case AudioFormatType.wav:
                return audio_load_portion_wav(_info, _start, _len);
            case AudioFormatType.pcm:
                return audio_load_portion_pcm(_info, _start, _len);
            default:
                return null;
        }

        return null;

    } //load_audio_portion_ogg


//Internal API

        //a helper to get the full path without overhead,
        //and to centralise this so that the root is always
        //included in the requested path
    function _path( _asset:AssetInfo ) : String {
        return assets_root + _asset.path;
    } //_path

        //this is separate so we can defer the behavior later
    function exists_error( _id:String ) {
        trace('/ lumen / asset / not found "$_id"' );
    } //exists_error

    function load_error( _id:String, ?reason:String = "unknown" ) {
        trace('/ lumen / asset / found "$_id" but it failed to load ($reason)' );
    } //load_error

    function audio_format_from_int( _int:Int ) : AudioFormatType {

        switch(_int) {
            case 1: return AudioFormatType.ogg;
            case 2: return AudioFormatType.wav;
            case 3: return AudioFormatType.pcm;
            default: return AudioFormatType.unknown;
        }

    } //audio_format_from_int

#if lumen_native

    static var lumen_assets_image_load_info       = Libs.load( "lumen", "lumen_assets_image_load_info", 2 );

    static var lumen_assets_audio_load_info_ogg   = Libs.load( "lumen", "lumen_assets_audio_load_info_ogg", 2 );
    static var lumen_assets_audio_read_bytes_ogg  = Libs.load( "lumen", "lumen_assets_audio_read_bytes_ogg", 3 );
    static var lumen_assets_audio_seek_bytes_ogg  = Libs.load( "lumen", "lumen_assets_audio_seek_bytes_ogg", 2 );

    static var lumen_assets_audio_load_info_wav   = Libs.load( "lumen", "lumen_assets_audio_load_info_wav", 2 );
    static var lumen_assets_audio_read_bytes_wav  = Libs.load( "lumen", "lumen_assets_audio_read_bytes_wav", 3 );
    static var lumen_assets_audio_seek_bytes_wav  = Libs.load( "lumen", "lumen_assets_audio_seek_bytes_wav", 2 );

    static var lumen_assets_audio_load_info_pcm   = Libs.load( "lumen", "lumen_assets_audio_load_info_pcm", 2 );
    static var lumen_assets_audio_read_bytes_pcm  = Libs.load( "lumen", "lumen_assets_audio_read_bytes_pcm", 3 );
    static var lumen_assets_audio_seek_bytes_pcm  = Libs.load( "lumen", "lumen_assets_audio_seek_bytes_pcm", 2 );

#end //lumen_native

} //Assets
