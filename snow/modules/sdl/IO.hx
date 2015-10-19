package snow.modules.sdl;

import sdl.SDL;

import snow.api.buffers.Uint8Array;
import snow.api.buffers.ArrayBufferView;
import snow.core.native.io.IO.FileSeek;

class IO extends snow.core.native.io.IO {

    override public function app_path() : String {

        return SDL.getBasePath();

    } //app_path

    override public function app_path_prefs() {

        var _parts = snow.Set.app_ident.split('.');
        var _appname = _parts.pop();
        var _org = _parts.join('.');

        return SDL.getPrefPath(_org, _appname);
    
    } //app_path_prefs

//File
    
    var files:Map<Int,FileHandle> = new Map();
    var files_seq:Int = 0;

    override public function file_handle(_path:String, ?_mode:String="rb") : Int {

        var _index = files_seq;
        var _handle = SDL.RWFromFile(_path, _mode);

            //false is used because 0/NULL equates to it
        if(_handle == untyped false) {
            return -1;
        }

        var _fh = new FileHandle();
            _fh.handle = _handle;

        files.set(_index, _fh);
        files_seq++;

        return _index;

    } //file_handle

    override public function file_read(handle:Int, dest:ArrayBufferView, size:Int, maxnum:Int) : Int {

        if(!files.exists(handle)) return -1;

        return SDL.RWread(files.get(handle).handle, dest.buffer.getData(), size, maxnum);

    } //file_read

    override public function file_write(handle:Int, src:ArrayBufferView, size:Int, num:Int) : Int {

        if(!files.exists(handle)) return -1;

        return SDL.RWwrite(files.get(handle).handle, src.buffer.getData(), size, num);

    } //file_write

    override public function file_seek(handle:Int, offset:Int, whence:Int) : Int {

        if(!files.exists(handle)) return -1;

        return SDL.RWseek(files.get(handle).handle, offset, whence);

    } //file_seek

    override public function file_tell(handle:Int) : Int {

        if(!files.exists(handle)) return -1;

        return SDL.RWtell(files.get(handle).handle);

    } //file_tell

    override public function file_close(handle:Int) : Int {

        if(!files.exists(handle)) return -1;

        var _file = files.get(handle);
        var _res = SDL.RWclose(_file.handle);

        files.remove(handle);
        _file = null;

        return _res;

    } //file_close


} //IO

@:unreflective
private class FileHandle {
    public var handle:sdl.RWops;
    public function new(){}
}

