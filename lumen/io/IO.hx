package lumen.io;

import lumen.utils.ByteArray;
import lumen.utils.Libs;

/** This class is a low level cross platform file access helper, that handles in bundle assets etc.
    If you want a file, use `Assets` instead, unless really required. */
class IOFile {

#if lumen_native

        /** The internal native file handle */
    public var handle : Dynamic;

    @:noCompletion public function new( _handle:Dynamic ) {
        handle = _handle;
    } //new

        /** Read a `maxnum` of items of `size` in bytes, into `dest`. Same signature/returns as `fread` */
    public function read( dest:ByteArray, size:Int, maxnum:Int ) {
        return lumen_iosrc_file_read(handle, dest, size, maxnum);
    } //read

        /** Write `num` of items of `size` in bytes, from `src` into this file. Same signature/returns as `fwrite` */
    public function write( src:ByteArray, size:Int, num:Int ) {
        return lumen_iosrc_file_write(handle, src, size, num);
    } //write

        /** Seek `offset` from `whence`, where whence is an int matching `set=0`, `cur=1`, `end=2`. Same signature/returns as `fseek` */
    public function seek( offset:Int, whence:Int ) {
        return lumen_iosrc_file_seek(handle, offset, whence);
    } //seek

        /** Tell the current position in the file, in bytes */
    public function tell() {
        return lumen_iosrc_file_tell(handle);
    } //tell

        /** Close the file */
    public function close() {
        return lumen_iosrc_file_close(handle);
    } //close

    static var lumen_iosrc_file_read    = Libs.load( "lumen", "lumen_iosrc_file_read", 4 );
    static var lumen_iosrc_file_write   = Libs.load( "lumen", "lumen_iosrc_file_write", 4 );
    static var lumen_iosrc_file_seek    = Libs.load( "lumen", "lumen_iosrc_file_seek", 3 );
    static var lumen_iosrc_file_tell    = Libs.load( "lumen", "lumen_iosrc_file_tell", 1 );
    static var lumen_iosrc_file_close   = Libs.load( "lumen", "lumen_iosrc_file_close", 1 );

#end //lumen_native

} //IOFile


/** This class is a low level cross platform IO helper.
    If you want file access, use `Assets` instead, unless really required. */
class IO {

#if lumen_native

    static var lumen_iosrc_from_file = Libs.load( "lumen", "lumen_iosrc_from_file", 2 );

        /** Create an `IOFile` from a file path `_id`, this bypasses the `Asset` system path helpers. */
    public static function from_file( _id:String, ?_mode:String="rb" ) : IOFile {
        var handle = lumen_iosrc_from_file(_id, _mode);
        return new IOFile(handle);
    }

#end //lumen_native

} //IO
