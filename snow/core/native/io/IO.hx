package snow.core.native.io;

import haxe.io.Bytes;
import snow.api.File;
import snow.api.Libs;
import snow.types.Types;
import snow.api.Promise;
import snow.api.buffers.Uint8Array;
import snow.api.Debug.*;

@:allow(snow.system.io.IO)
class IO implements snow.modules.interfaces.IO {

    var app: snow.Snow;
    function new(_app:snow.Snow) app = _app;
    function shutdown() {}
    function on_event( _event:SystemEvent ) : Void {}

    public function app_path() : String {

        return './';

    } //app_path

    public function app_path_prefs() : String {

        return './';

    } //app_path_prefs

    public function url_open( _url:String ) {

        log('native url_open / $_url');

    } //url_open

    public function data_load( _path:String, ?_options:IODataOptions ) : Promise {

        return new Promise(function(resolve, reject) {

            var _dest = _data_load(_path, _options);

            if(_dest == null) {
                reject(Error.error('data_load file cannot be opened $_path'));
                return;
            }

            resolve(_dest);

        });

    } //data_load

    public function data_save( _path:String, _data:Uint8Array, ?_options:IODataOptions ) : Bool {

        var _binary = (_options != null && _options.binary);
        var _file = File.from_file(_path, _binary ? 'wb' : 'w' );

        if(_file != null) {
            var count : Int = _file.write( _data, _data.length, 1 );

                _file.close();

            return count == 1;
        }

        return false;

    } //data_save

    public function string_save_path( ?_slot:Int = 0 ) : String {

        var _pref_path = app_path_prefs();
        var _path = haxe.io.Path.join([_pref_path, '${app.io.string_save_prefix}.$_slot']);

        return haxe.io.Path.normalize(_path);

    } //string_save_path

//Internal IO module

    inline function string_slot_destroy(?_slot:Int=0) : Bool {

        var _path = string_save_path(_slot);
        var _result = true;

        _debug('remove string slot $_slot from path $_path');

        try {
            sys.FileSystem.deleteFile(_path);
        } catch(e:Dynamic) {
            _result = false;
        }

        return _result;

    } //string_slot_destroy

    inline function string_slot_save(?_slot:Int=0, _contents:String) : Bool {

        var _path = string_save_path(_slot);
        var _data = Uint8Array.fromBytes( Bytes.ofString(_contents) );

        return data_save(_path, _data);

    } //string_slot_save

    inline function string_slot_load(?_slot:Int=0) : String {

        var _data = _data_load(string_save_path(_slot));

        if(_data == null) {
            return null;
        }

        return _data.toBytes().toString();

    } //string_slot_load

    inline function string_slot_encode(_string:String) : String {

        assertnull(_string);

        var _bytes = haxe.io.Bytes.ofString(_string);

        return haxe.crypto.Base64.encode(_bytes);

    } //string_slot_encode

    inline function string_slot_decode(_string:String) : String {

        assertnull(_string);

        var _bytes = haxe.crypto.Base64.decode(_string);

        return _bytes.toString();

    } //string_slot_decode

//Internal

    function _data_load(_path:String, ?_options:IODataOptions) : Uint8Array {

        var _binary = (_options != null && _options.binary);
        var _file = File.from_file(_path, _binary ? 'rb' : 'r' );

        if(_file == null) return null;

            //jump to the end, measure size
        _file.seek(0, FileSeek.end);

        var size = _file.tell();

            //reset to beginning
        _file.seek(0, FileSeek.set);

            //create a buffer to read to
        var _dest = new Uint8Array(size);
        var _read = _file.read(_dest, _dest.length, 1);

            //close+release the file handle
        _file.close();

        return _dest;

    } //_data_load

} //IO

