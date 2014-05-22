package lumen.io;

import lumen.utils.ByteArray;
import lumen.utils.Libs;

class IOFile {

    public var handle : Dynamic;

    public function new( _handle:Dynamic ) {

        handle = _handle;

    } //new

    public function read( dest:ByteArray, size:Int, maxnum:Int ) {
        return lumen_iosrc_file_read(handle, dest, size, maxnum);
    } //read

    public function write( src:ByteArray, size:Int, num:Int ) {
        return lumen_iosrc_file_write(handle, src, size, num);
    } //write

    public function seek( offset:Int, whence:Int ) {
        return lumen_iosrc_file_seek(handle, offset, whence);
    } //seek

    public function tell() {
        return lumen_iosrc_file_tell(handle);
    } //tell

    public function close() {
        return lumen_iosrc_file_close(handle);
    } //close


#if lumen_native
    static var lumen_iosrc_file_read    = Libs.load( "lumen", "lumen_iosrc_file_read", 4 );
    static var lumen_iosrc_file_write   = Libs.load( "lumen", "lumen_iosrc_file_write", 4 );
    static var lumen_iosrc_file_seek    = Libs.load( "lumen", "lumen_iosrc_file_seek", 3 );
    static var lumen_iosrc_file_tell    = Libs.load( "lumen", "lumen_iosrc_file_tell", 1 );
    static var lumen_iosrc_file_close   = Libs.load( "lumen", "lumen_iosrc_file_close", 1 );
#end //lumen_native

} //IOFile

class IO {
    
    public static function from_file( _id:String, ?_mode:String="rb" ) : IOFile {
        var handle = lumen_iosrc_from_file(_id, _mode);
        return new IOFile(handle);
    }

#if lumen_native
    static var lumen_iosrc_from_file = Libs.load( "lumen", "lumen_iosrc_from_file", 2 );
#end //lumen_native

} //IO