package lumen.assets;

import lumen.LumenTypes;
import lumen.utils.ByteArray;

class Asset {
    public var id : String;
    public var info : AssetInfo;
    public function new( _info:AssetInfo ) {
        info = _info;
        id = info.id;
    }
} //Asset


class AssetBytes extends Asset {

    public var bytes : ByteArray;
    public function new( _info:AssetInfo, _data:ByteArray ) {
        super( _info );
        bytes = _data;
    }

} //AssetBytes

class AssetText extends Asset {

    public var text : String;
    public function new( _info:AssetInfo, _data:String ) {
        super( _info );
        text = _data;
    }

} //AssetText


class Assets {

    public var list : Map<String, AssetInfo>;
    public var asset_path : String = '';
    public var manifest_path : String = 'manifest';

    var lib : Lumen;

    public function new( _lib:Lumen ) {

        #if ios
                //This is because of how the files are put into the xcode project
                //for the iOS builds, it stores them inside of /assets to avoid
                //including the root in the project in the Resources/ folder
            asset_path = 'assets/';
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

            var ext = haxe.io.Path.extension( _asset.id );

            if( Lambda.has(images, ext) ) {
                _asset.type = 'image';
            } else if(Lambda.has(sounds, ext)) {
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
            return asset_path + get(_id).path;
        }

        return "";

    } //path

        //this is separate so we can defer the behavior later
    function exists_error( _id:String ) {

        trace('/ lumen / asset / not found "$_id"' );

    } //exists_error

    public function get_bytes( _id:String ) : AssetBytes {

        if(exists(_id)) {

            var asset = get(_id);
            var bytes_data = ByteArray.readFile( asset_path + asset.path );

            return new AssetBytes( asset, bytes_data );

        } else {
            exists_error(_id);
        }

        return null;

    } //get_bytes

    public function get_text( _id:String ) : AssetText {

        //bytes will complain if it's missing
        var bytedata = get_bytes( _id );

        if(bytedata != null) {
            var bytes = bytedata.bytes;
            return new AssetText( bytedata.info, bytes == null ? "" : bytes.toString() );
        }

        return null;

    } //get_text

} //Assets
