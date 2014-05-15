package lumen.assets;

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

        //a helper to get the full path without overhead,
        //and to centralise this so that the root is always
        //included in the requested path
    function _path( _asset:AssetInfo ) : String {
        return assets_root + _asset.path;
    }

        //this is separate so we can defer the behavior later
    function exists_error( _id:String ) {

        trace('/ lumen / asset / not found "$_id"' );

    } //exists_error

    function load_error( _id:String, ?reason:String = "unknown" ) {

        trace('/ lumen / asset / found "$_id" but it failed to load ($reason)' );

    } //load_error

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
            var _image_info = lumen_assets_load_imageinfo( _path(asset), options.components );

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

    function audio_format( _int:Int ) : AudioFormatType {

        switch(_int) {
            case 1: return AudioFormatType.ogg;
            case 2: return AudioFormatType.wav;
            case 3: return AudioFormatType.pcm;
            default: return AudioFormatType.unknown;
        }

    } //audio_format

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
                    _audio_info = load_audio_wav( asset, options.load );
                }

                case 'ogg' : {
                    _audio_info = load_audio_ogg( asset, options.load );
                }

                case 'pcm' : {
                    _audio_info = load_audio_pcm( asset, options.load );
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
            _audio_info.format = audio_format(cast _audio_info.format);

                //with images the bytes data could be null too, this is also an invalid asset
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
    @:noCompletion public function load_audio_ogg( asset:AssetInfo, ?load:Bool=true ) : AudioInfo {
        return lumen_assets_load_audioinfo_ogg( _path(asset), load );
    } //load_audio_ogg

    @:noCompletion public function load_audio_wav( asset:AssetInfo, ?load:Bool=true ) : AudioInfo {
        return lumen_assets_load_audioinfo_wav( _path(asset) );
    } //load_audio_wav

    @:noCompletion public function load_audio_portion_ogg( _info:AudioInfo, _start:Int, _len:Int, ?_looping:Bool=false ) : ByteArray {
        return lumen_assets_audio_ogg_read_bytes( _info, _start, _len, _looping );
    } //load_audio_portion_ogg

    @:noCompletion public function load_audio_portion( _info:AudioInfo, _start:Int, _len:Int, ?_looping:Bool=false ) : ByteArray {

        switch(_info.format) {
            case AudioFormatType.ogg:
                return load_audio_portion_ogg(_info, _start, _len, _looping);
            case AudioFormatType.wav:
                return null; //:todo:
            case AudioFormatType.pcm:
                return null; //:todo:
            default:
                return null;
        }

        return null;

    } //load_audio_portion_ogg

    @:noCompletion public function load_audio_pcm( asset:AssetInfo, ?load:Bool=true ) : AudioInfo {

        var data = ByteArray.readFile( _path(asset) );

        if(data == null) {
            return null;
        }

            //hmm, need to :investigate: these flags here,
            //but basically this is the format requested to be played
            //at so we can play at this format for PCM without problems
        return {

            id : asset.id,                  //source asset id
            format : AudioFormatType.pcm,   //format
            channels : 1,                   //number of channels
            rate : 44100,                   //hz rate
            bitrate : 88200,                //sound bitrate
            bits_per_sample : 16,           //bits per sample, 8 / 16
            data : data,                    //sound raw data
            length : data.byteLength,       //length of the data
            length_pcm : data.byteLength,   //length is the same, uncompressed
            handle : null                   //this isn't used

        } //new AudioInfo

    } //load_audio_pcm

#if lumen_native

    static var lumen_assets_load_imageinfo       = Libs.load( "lumen", "lumen_assets_load_imageinfo", 2 );
    static var lumen_assets_load_audioinfo_ogg   = Libs.load( "lumen", "lumen_assets_load_audioinfo_ogg", 2 );
    static var lumen_assets_audio_ogg_read_bytes = Libs.load( "lumen", "lumen_assets_audio_ogg_read_bytes", 4 );
    static var lumen_assets_load_audioinfo_wav   = Libs.load( "lumen", "lumen_assets_load_audioinfo_wav", 1 );

#end //lumen_native

} //Assets
