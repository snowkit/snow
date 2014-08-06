package snow.platform.native.utils;

    /** Note that this class is included for completeness and perhaps doesn't yield
        the performance benefits one might assume by the smaller size. The difference between UInt8Array and
        Uint8Clamped array is simply that a clamp is applied to any value added into the array,
        such that the values never go below 0 and above 255.
     */
class UInt8ClampedArray extends ArrayBufferView implements ArrayAccess<Int> {


    public var BYTES_PER_ELEMENT (default, null) : Int;
    public var length (default, null) : Int;


    public function new( bufferOrArray:Dynamic, start:Int = 0, length:Null<Int> = null ) {

        BYTES_PER_ELEMENT = 1;

        if (Std.is(bufferOrArray, Int)) {

            super(Std.int(bufferOrArray));
            this.length = bufferOrArray;

        } else if (Std.is(bufferOrArray, Array)) {

            var ints:Array<Int> = bufferOrArray;
            this.length = (length != null) ? length : ints.length - start;
            super(this.length);

            #if !cpp
            buffer.position = 0;
            #end

            for (i in 0...this.length) {

                var _clamped : Int = _clamp(ints[i + start]);

                #if cpp
                untyped __global__.__hxcpp_memory_set_byte(bytes, i, _clamped);
                #else
                buffer.writeByte(ints[i + start]);
                #end

            }

        } else if (Std.is(bufferOrArray, UInt8ClampedArray)) {

            var ints:UInt8ClampedArray = bufferOrArray;
            this.length = (length != null) ? length : ints.length - start;
            super(this.length);

            #if !cpp
            buffer.position = 0;
            #end

            for (i in 0...this.length) {

                #if cpp
                untyped __global__.__hxcpp_memory_set_byte(bytes, i, ints[i + start]);
                #else
                buffer.writeByte(ints[i + start]);
                #end

            }

        } else {

            super(bufferOrArray, start, length);
            this.length = byteLength;

        }

    } //new

    inline function _clamp(_in:Int) : Int {

        _in = _in > 255 ? 255 : _in;
        return _in < 0 ? 0 : _in;

    } //_clamp

    public function set( bufferOrArray:Dynamic, offset:Int = 0 ) {

        if (Std.is(bufferOrArray, Array)) {

            var ints:Array<Int> = bufferOrArray;

            for (i in 0...ints.length) {
                setUInt8(i + offset, _clamp(ints[i]));
            }

        } else if (Std.is(bufferOrArray, UInt8ClampedArray)) {

            var ints:UInt8ClampedArray = bufferOrArray;

            for (i in 0...ints.length) {
                setUInt8(i + offset, _clamp(ints[i]));
            }

        } else {

            throw "Invalid input buffer";

        }

    } //set

    public function subarray( start:Int, end:Null<Int> = null ) : UInt8ClampedArray {

        end = (end == null) ? length : end;
        return new UInt8ClampedArray(buffer, start, end - start);

    } //subarray

    @:noCompletion @:keep inline public function __get( index:Int ):Int { return getUInt8(index); }
    @:noCompletion @:keep inline public function __set( index:Int, value:Int ) { setUInt8(index, _clamp(value)); }

} //UInt8Array
