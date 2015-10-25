package snow.modules.interfaces;

import haxe.io.BytesData;
import snow.types.Types;
import snow.api.Promise;
import snow.api.buffers.Uint8Array;
import snow.api.buffers.ArrayBufferView;

@:noCompletion
@:allow(snow.system.io.IO)
interface IO {

    private var app: snow.Snow;
    private function onevent(event:SystemEvent):Void;
    private function shutdown():Void;

    function url_open(_url:String):Void;
    function data_load(_path:String, ?_options:IODataOptions) : Promise;
    function data_save(_path:String, _data:Uint8Array, ?_options:IODataOptions) : Bool;
    function app_path() : String;
    function app_path_prefs() : String;

    private function string_save_path(?_slot:Int=0) : String;
    private function string_slot_load(?_slot:Int=0) : String;
    private function string_slot_encode(_string:String) : String;
    private function string_slot_decode(_string:String) : String;
    private function string_slot_save(?_slot:Int=0, _contents:String) : Bool;
    private function string_slot_destroy(?_slot:Int=0) : Bool;

    //:todo:
    #if snow_native
        function file_handle(_path:String, ?_mode:String="rb") : FileHandle;
        function file_handle_from_mem(mem:ArrayBufferView, size:Int) : FileHandle;
        function file_read(handle:FileHandle, dest:ArrayBufferView, size:Int, maxnum:Int) : Int;
        function file_write(handle:FileHandle, src:ArrayBufferView, size:Int, num:Int) : Int;
        function file_seek(handle:FileHandle, offset:Int, whence:Int) : Int;
        function file_tell(handle:FileHandle) : Int;
        function file_close(handle:FileHandle) : Int;
        function file_size(handle:FileHandle) : UInt;
    #end

} //IO