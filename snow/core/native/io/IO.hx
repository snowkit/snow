package snow.core.native.io;

import haxe.io.Bytes;
import snow.types.Types;
import snow.api.Promise;
import snow.api.buffers.Uint8Array;
import snow.api.buffers.ArrayBufferView;
import snow.api.Debug.*;

@:enum abstract FileSeek(Int) from Int to Int {
    var set = 0;
    var cur = 1;
    var end = 2;
}


@:allow(snow.systems.io.IO)
class IO implements snow.modules.interfaces.IO {

    var app: snow.Snow;
    function new(_app:snow.Snow) app = _app;
    function shutdown() {}
    function onevent( _event:SystemEvent ) : Void {}

    public function app_path() : String {

        return './';

    } //app_path

    public function app_path_prefs() : String {

        return './';

    } //app_path_prefs

    public function url_open( _url:String ) {

        //:todo: native io url open
        log('native url_open / $_url');

    } //url_open

    public function data_load( _path:String, ?_options:IODataOptions ) : Promise {

        if(_path == null || _path == '') {
            return Promise.reject(Error.error('data_load invalid file path: `$_path`'));
        }

        return new Promise(function(resolve, reject) {

            var _dest = _data_load(_path, _options);

            if(_dest == null) {
                reject(Error.error('data_load file cannot be opened `$_path`'));
                return;
            }

            resolve(_dest);

        });

    } //data_load

    public function data_save( _path:String, _data:Uint8Array, ?_options:IODataOptions ) : Bool {

        var _binary = (_options != null && _options.binary);
        var _file = file_handle(_path, _binary ? 'wb' : 'w');

        if(_file != null) {

            var count = file_write(_file, _data, _data.length, 1);

            file_close(_file);

            return count == 1;

        } //!null

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

//File handling

    public function file_handle(_path:String, ?_mode:String="rb") : FileHandle {

        log('file_handle in code module does nothing.');
        return null;

    } //file_handle

    public function file_handle_from_mem(mem:ArrayBufferView, size:Int) : FileHandle {

        log('file_handle_from_mem in code module does nothing.');
        return null;

    } //file_handle_from_mem

    public function file_read(handle:FileHandle, dest:ArrayBufferView, size:Int, maxnum:Int) : Int {

        log('file_read in code module does nothing.');
        return -1;

    } //file_read

    public function file_write(handle:FileHandle, src:ArrayBufferView, size:Int, num:Int) : Int {

        log('file_write in code module does nothing.');
        return -1;

    } //file_write

    public function file_seek(handle:FileHandle, offset:Int, whence:Int) : Int {

        log('file_seek in code module does nothing.');
        return -1;

    } //file_seek

    public function file_tell(handle:FileHandle) : Int {

        log('file_tell in code module does nothing.');
        return -1;

    } //file_tell

    public function file_close(handle:FileHandle) : Int {

        log('file_close in code module does nothing.');
        return -1;

    } //file_close

    public function file_size(handle:FileHandle) : UInt {

        var _cur = file_tell(handle);
        file_seek(handle, 0, FileSeek.end);
        var _size = file_tell(handle);
        file_seek(handle, _cur, FileSeek.set);
        return _size;

    } //file_size

//Internal

    function _data_load(_path:String, ?_options:IODataOptions) : Uint8Array {

        var _binary = (_options != null && _options.binary);
        var _file = file_handle(_path, _binary ? 'rb' : 'r');

        if(_file == null) return null;
        var _size = file_size(_file);
        var _dest = new Uint8Array(_size);

        if(_size != 0) {
            file_read(_file, _dest, _dest.length, 1);
        }

            //close+release the file handle
        file_close(_file);

        return _dest;

    } //_data_load

} //IO

