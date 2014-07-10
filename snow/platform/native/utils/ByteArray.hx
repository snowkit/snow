package snow.platform.native.utils;


import snow.utils.IMemoryRange;
import snow.utils.Libs;

import haxe.io.Bytes;
import haxe.io.BytesData;
import snow.utils.IDataInput;


#if neko
    import neko.Lib;
    import neko.zip.Compress;
    import neko.zip.Uncompress;
    import neko.zip.Flush;
#else
    import cpp.Lib;
    import cpp.zip.Compress;
    import cpp.zip.Uncompress;
    import cpp.zip.Flush;
#end


class ByteArray extends Bytes implements ArrayAccess<Int> implements IDataInput implements IMemoryRange {

    public var bigEndian:Bool;
    public var bytesAvailable(get_bytesAvailable, null):Int;
    public var endian(get_endian, set_endian):String;
    public var position:Int;
    public var byteLength(get_byteLength,null):Int;

    #if neko
        private var alloced:Int;
    #end

    public function new(inSize = 0) {

        bigEndian = true;
        position = 0;

        if (inSize >= 0) {

            #if neko

                alloced = inSize < 16 ? 16 : inSize;
                var bytes = untyped __dollar__smake(alloced);

                super(inSize, bytes);

            #else

                var data = new BytesData();
                if (inSize > 0) {
                    untyped data[inSize - 1] = 0;
                }

                super(inSize, data);

            #end

        } //insize >=0

    } //new

        // No bounds checking is done
    @:keep inline public function __get(pos:Int) : Int {

        #if neko
            return get(pos);
        #else
            return untyped b[pos];
        #end

    } //__get array access = arr[n]

        // No bounds checking is done
    @:keep inline public function __set(pos:Int, v:Int) : Void {

        #if neko
            set(pos, v);
        #else
            untyped b[pos] = v;
        #end

    } //__set array access arr[n] =

    public function asString() : String {

        return readUTFBytes(length);

    } //asString

    public function checkData(inLength:Int) : Void {

        if (inLength + position > length) {
            ThrowEOFi();
        }

    } //checkData

    public function clear() : Void {

        position = 0;
        length = 0;

    } //clear


    public function compress(algorithm:Compression = null) : Void {

        #if neko
            var src = alloced == length ? this : sub(0, length);
        #else
            var src = this;
        #end

        var result : Bytes;

        if (algorithm == Compression.LZMA) {

            result = Bytes.ofData(snow_lzma_encode( cast src.getData()) );

        } else {

            var windowBits = switch(algorithm) {
                case DEFLATE: -15;
                case GZIP: 31;
                default: 15;
            }

            #if enable_deflate
                result = Compress.run(src, 8, windowBits);
            #else
                result = Compress.run(src, 8);
            #end

        } //!lzma

        b = result.b;
        length = result.length;
        position = length;

        #if neko
            alloced = length;
        #end

    } //compress

    public function uncompress( algorithm:Compression = null ) : Void {

        if (algorithm == null) {
            algorithm = Compression.GZIP;
        }

        #if neko
            var src = alloced == length ? this : sub(0, length);
        #else
            var src = this;
        #end

        var result:Bytes;

        if (algorithm == Compression.LZMA) {

            result = Bytes.ofData( snow_lzma_decode(src.getData()) );

        } else {

            var windowBits = switch(algorithm) {
                case DEFLATE: -15;
                case GZIP: 31;
                default: 15;
            }

            #if enable_deflate
                result = Uncompress.run(src, null, windowBits);
            #else
                result = Uncompress.run(src, null);
            #end

        } //!lzma

        b = result.b;
        length = result.length;
        position = 0;

        #if neko
            alloced = length;
        #end

    } //uncompress

    public function deflate() : Void {

        compress(Compression.DEFLATE);

    } //deflate

    public function inflate() {

        uncompress(Compression.DEFLATE);

    } //inflate

    static public function fromBytes(inBytes:Bytes) : ByteArray {

        var result = new ByteArray( -1 );

            result.internal_from_bytes(inBytes);

        return result;

    } //fromBytes

    public function getLength() : Int {

        return length;

    } //getLength

        // IMemoryRange
    public function getByteBuffer() : ByteArray {

        return this;

    } //getByteBuffer

    public function getStart() : Int {

        return 0;

    } //getStart


    public function setLength(inLength:Int):Void {

        if (inLength > 0) {
            ensureElem(inLength - 1, false);
        }

        length = inLength;

    } //setLength

        // ArrayBuffer interface
    public function slice(inBegin:Int, ?inEnd:Int):ByteArray {

        var begin = inBegin;

        if (begin < 0) {

            begin += length;

            if (begin < 0) {
                begin = 0;
            }

        } //begin < 0

        var end:Int = (inEnd == null) ? length : inEnd;

        if (end < 0) {

            end += length;

            if (end < 0) {
                end = 0;
            }

        } //end < 0

        if (begin >= end) {
            return new ByteArray();
        }

        var result = new ByteArray( end - begin );

        var opos = position;

            result.blit(0, this, begin, end - begin);

        return result;

    } //slice


//Read


    public inline function readBoolean() : Bool {

        return(position < length) ? __get(position++) != 0 : ThrowEOFi() != 0;

    } //readBoolean

    public inline function readByte():Int {

        var val:Int = readUnsignedByte();

        return((val & 0x80) != 0) ?(val - 0x100) : val;

    } //readByte

    public function readBytes( outData:ByteArray, inOffset:Int = 0, inLen:Int = 0 ) : Void {

        if (inLen == 0) {
            inLen = length - position;
        }

        if (position + inLen > length) {
            ThrowEOFi();
        }

        if (outData.length < inOffset + inLen) {
            outData.ensureElem( inOffset + inLen - 1, true );
        }

        #if neko

            outData.blit(inOffset, this, position, inLen);

        #else

            var b1 = b;
            var b2 = outData.b;
            var p = position;

            for(i in 0...inLen) {
                b2[inOffset + i] = b1[p + i];
            }
        #end

        position += inLen;

    } //readBytes

    public function readDouble() : Float {

        if (position + 8 > length) {
            ThrowEOFi();
        }

        #if neko
            var bytes = new Bytes(8, untyped __dollar__ssub(b, position, 8));
        #else
            var bytes = new Bytes(8, b.slice(position, position + 8));
        #end

        position += 8;

        return std_double_of_bytes(bytes.b, bigEndian);

    } //readDouble

    public function readFloat() : Float {

        if (position + 4 > length) {
            ThrowEOFi();
        }

        #if neko
            var bytes = new Bytes(4, untyped __dollar__ssub(b, position, 4));
        #else
            var bytes = new Bytes(4, b.slice(position, position + 4));
        #end

        position += 4;

        return std_float_of_bytes(bytes.b, bigEndian);

    } //readFloat

    public function readInt() : Int {

        var ch1 = readUnsignedByte();
        var ch2 = readUnsignedByte();
        var ch3 = readUnsignedByte();
        var ch4 = readUnsignedByte();

        return
            bigEndian ?
                (ch1 << 24) |(ch2 << 16) |(ch3 << 8) | ch4  //bigEndian
              : (ch4 << 24) |(ch3 << 16) |(ch2 << 8) | ch1; //littleEndian

    } //readInt

    public inline function readMultiByte(inLen:Int, charSet:String) : String {

            // :todo: - use code page (not sure what this means, but maybe haxe.Utf8 can be used now)
        return readUTFBytes(inLen);

    } //readMultiByte

    public function readShort() : Int {

        var ch1 = readUnsignedByte();
        var ch2 = readUnsignedByte();

        var val =
            bigEndian ?
                ((ch1 << 8) | ch2)  //bigEndian
              : ((ch2 << 8) | ch1); //littleEndian

        return
            ((val & 0x8000) != 0) ?
                ( val - 0x10000 ) : ( val );

    } //readShort

    inline public function readUnsignedByte() : Int {

        return (position < length) ? __get( position++ ) : ThrowEOFi();

    } //readUnsignedByte

    public function readUnsignedInt() : Int {

        var ch1 = readUnsignedByte();
        var ch2 = readUnsignedByte();
        var ch3 = readUnsignedByte();
        var ch4 = readUnsignedByte();

        return
            bigEndian ?
                (ch1 << 24) |(ch2 << 16) |(ch3 << 8) | ch4  //bigEndian
              : (ch4 << 24) |(ch3 << 16) |(ch2 << 8) | ch1; //littleEndian

    } //readUnsignedInt

    public function readUnsignedShort() : Int {

        var ch1 = readUnsignedByte();
        var ch2 = readUnsignedByte();

        return
            bigEndian ?
                (ch1 << 8) | ch2  //bigEndian
              : (ch2 << 8) + ch1; //littleEndian

    } //readUnsignedShort

    public function readUTF() : String {

        var len = readUnsignedShort();

        return readUTFBytes(len);

    } //readUTF

    public function readUTFBytes(inLen:Int) : String {

        if (position + inLen > length) {
            ThrowEOFi();
        }

        var p = position;
        position += inLen;

        #if neko

            return new String(untyped __dollar__ssub(b, p, inLen));

        #else

            var result : String = "";
            untyped __global__.__hxcpp_string_of_bytes(b, result, p, inLen);

            return result;

        #end

    } //readUTFBytes


//Write


    inline function write_uncheck( inByte:Int ) : Void {

        #if neko
            untyped __dollar__sset(b, position++, inByte & 0xff);
        #else
            untyped b.__unsafe_set(position++, inByte);
        #end

    } //write_uncheck

    public function writeBoolean( value:Bool ) : Void {

        writeByte( value ? 1 : 0 );

    } //writeBoolean

    inline public function writeByte( value:Int ) : Void {

        ensureElem(position, true);

        #if neko
            untyped __dollar__sset(b, position++, value & 0xff);
        #else
            b[position++] = untyped value;
        #end

    } //writeByte

    public function writeBytes( bytes:Bytes, inOffset:Int = 0, inLength:Int = 0 ) : Void {

        if (inLength == 0) {
            inLength = bytes.length - inOffset;
        }

        ensureElem(position + inLength - 1, true);

        var opos = position;
        position += inLength;

        blit(opos, bytes, inOffset, inLength);

    } //writeBytes

    public function writeDouble( x:Float ) : Void {

        #if neko
            var bytes = new Bytes(8, std_double_bytes(x, bigEndian));
        #else
            var bytes = Bytes.ofData( std_double_bytes(x, bigEndian) );
        #end

        writeBytes( bytes );

    } //writeDouble

    public function writeFloat(x:Float) : Void {

        #if neko
            var bytes = new Bytes(4, std_float_bytes(x, bigEndian));
        #else
            var bytes = Bytes.ofData( std_float_bytes(x, bigEndian) );
        #end

        writeBytes(bytes);

    } //writeFloat

    public function writeInt( value:Int ) : Void {

        ensureElem(position + 3, true);

        if (bigEndian) {
            write_uncheck(value >> 24);
            write_uncheck(value >> 16);
            write_uncheck(value >> 8);
            write_uncheck(value);
        } else {
            write_uncheck(value);
            write_uncheck(value >> 8);
            write_uncheck(value >> 16);
            write_uncheck(value >> 24);
        }

    } //writeInt

        //:todo:
    // public function writeMultiByte(value:String, charSet:String) {

        //not possible?
    // public function writeObject(object:*)

    public function writeShort( value:Int ) : Void {

        ensureElem(position + 1, true);

        if (bigEndian) {
            write_uncheck(value >> 8);
            write_uncheck(value);
        } else {
            write_uncheck(value);
            write_uncheck(value >> 8);
        }

    } //writeShort

    public function writeUnsignedInt(value:Int) : Void {

        writeInt( value );

    } //writeUnsignedInt

    public function writeUTF( s:String ) : Void {

        #if neko
            var bytes = new Bytes(s.length, untyped s.__s);
        #else
            var bytes = Bytes.ofString(s);
        #end

        writeShort(bytes.length);
        writeBytes(bytes);

    } //writeUTF

    public function writeUTFBytes( s:String ) : Void {

        #if neko
            var bytes = new Bytes(s.length, untyped s.__s);
        #else
            var bytes = Bytes.ofString(s);
        #end

        writeBytes( bytes );

    } //writeUTFBytes


// File IO

    #if !snow_no_bytearray_io

        static public function readFile(inString:String) : ByteArray {

            return snow_byte_array_read_file(inString);

        } //readFile

        public function writeFile(inString:String):Void {

            snow_byte_array_overwrite_file( inString, this );

        } //writeFile

// Init

        static function __init__() : Void {

            var factory = function(inLen:Int) {
                return new ByteArray(inLen);
            };

            var resize = function(inArray:ByteArray, inLen:Int) {

                if (inLen > 0) {
                    inArray.ensureElem(inLen - 1, true);
                }

                inArray.length = inLen;

            };

            var bytes = function(inArray:ByteArray) {
                return inArray==null ? null :  inArray.b;
            }

            var slen = function(inArray:ByteArray) {
                return inArray == null ? 0 : inArray.length;
            }

            var init = Libs.load("snow", "snow_byte_array_init", 4);

            if(init == null) {
                throw "ByteArray cannot initialize because the function cannot be loaded from snow.";
            }

                init( factory, slen, resize, bytes );

        } //__init__

    #end //snow_no_bytearray_io

//Internal

    function ensureElem(inSize:Int, inUpdateLength:Bool) : Void {

        var len = inSize + 1;

        #if neko

            if (alloced < len) {
                alloced = ((len+1) * 3) >> 1;
                var new_b = untyped __dollar__smake(alloced);
                untyped __dollar__sblit(new_b, 0, b, 0, length);
                b = new_b;
            }

        #else

            if (b.length < len) {
                untyped b.__SetSize(len);
            }

        #end

        if (inUpdateLength && length < len) {
            length = len;
        }

    } //ensureElem

    inline function internal_from_bytes(inBytes:Bytes) : Void {

        b = inBytes.b;
        length = inBytes.length;

        #if neko
            alloced = length;
        #end

    } //internal_from_bytes


    function ThrowEOFi() : Int {

        throw "/ ByteArray / EOFError";

    } //ThrowEOFi


        //values
    public static inline var BIG_ENDIAN : String = "bigEndian";
    public static inline var LITTLE_ENDIAN : String = "littleEndian";

    // Getters & Setters
    function get_bytesAvailable():Int {
        return length - position;
    }

    function get_byteLength():Int {
        return length;
    }

    function get_endian() : String {
        return (bigEndian) ? BIG_ENDIAN : LITTLE_ENDIAN;
    } //get_endian

    function set_endian(s:String):String {

        bigEndian = (s == BIG_ENDIAN);

        return s;

    } //set_endian

        // Native Methods
    static var std_double_bytes     = Libs.load("std", "double_bytes", 2);
    static var std_double_of_bytes  = Libs.load("std", "double_of_bytes", 2);
    static var std_float_bytes      = Libs.load("std", "float_bytes", 2);
    static var std_float_of_bytes   = Libs.load("std", "float_of_bytes", 2);

    static var snow_lzma_encode    = Libs.load("snow", "snow_lzma_encode", 1);
    static var snow_lzma_decode    = Libs.load("snow", "snow_lzma_decode", 1);

    #if !snow_no_bytearray_io

        static var snow_byte_array_overwrite_file =    Libs.load("snow","snow_byte_array_overwrite_file", 2);
        static var snow_byte_array_read_file =         Libs.load("snow", "snow_byte_array_read_file", 1);

    #end //snow_no_bytearray_io


}

enum Compression {
    DEFLATE;
    ZLIB;
    LZMA;
    GZIP;
}
