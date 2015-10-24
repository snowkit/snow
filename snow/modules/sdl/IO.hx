package snow.modules.sdl;

import sdl.SDL;

import snow.api.Debug.*;
import snow.api.buffers.Uint8Array;
import snow.api.buffers.ArrayBufferView;
import snow.core.native.io.IO.FileSeek;
import snow.core.native.io.IO.FileHandle;

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
        
    var file_seq = 0;
    var files:Map<Int, sdl.RWops> = new Map();

    override public function file_handle(_path:String, ?_mode:String="rb") : FileHandle {

        var _handle = SDL.RWFromFile(_path, _mode);
        if(_handle == null) return null;

        var _id = file_seq;
        files.set(_id, _handle);
        file_seq++;

        return _id;

    } //file_handle

    override public function file_read(file:FileHandle , dest:ArrayBufferView, size:Int, maxnum:Int) : Int {

        assertnull(file);

        return SDL.RWread(files.get(file), dest.buffer.getData(), size, maxnum);

    } //file_read

    override public function file_write(file:FileHandle, src:ArrayBufferView, size:Int, num:Int) : Int {

        assertnull(file);

        return SDL.RWwrite(files.get(file), src.buffer.getData(), size, num);

    } //file_write

    override public function file_seek(file:FileHandle, offset:Int, whence:Int) : Int {
        
        assertnull(file);

        return SDL.RWseek(files.get(file), offset, whence);

    } //file_seek

    override public function file_tell(file:FileHandle) : Int {

        assertnull(file);

        return SDL.RWtell(files.get(file));

    } //file_tell

    override public function file_close(file:FileHandle) : Int {

        assertnull(file);

        var handle = files.get(file);
        var res = SDL.RWclose(handle);
        files.remove(file);
        handle = null;

        return res;

    } //file_close


} //IO
