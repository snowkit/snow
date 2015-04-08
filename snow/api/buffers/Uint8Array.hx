package snow.api.buffers;

#if js

    @:forward
    @:arrayAccess
    abstract Uint8Array(js.html.Uint8Array)
        from js.html.Uint8Array
        to js.html.Uint8Array {

        @:generic
        public inline function new<T>(
            ?elements:Int,
            ?array:Array<T>,
            ?view:ArrayBufferView,
            ?buffer:ArrayBuffer, ?byteoffset:Int = 0, ?len:Null<Int>
        ) {
            if(elements != null) {
                this = new js.html.Uint8Array( elements );
            } else if(array != null) {
                this = new js.html.Uint8Array( untyped array );
            } else if(view != null) {
                this = new js.html.Uint8Array( untyped view );
            } else if(buffer != null) {
                len = (len == null) ? untyped __js__('undefined') : len;
                this = new js.html.Uint8Array( buffer, byteoffset, len );
            } else {
                this = null;
            }
        }

        @:arrayAccess inline function __set(idx:Int, val:UInt) return this[idx] = val;
        @:arrayAccess inline function __get(idx:Int) : UInt return this[idx];


            //non spec haxe conversions
        public static function fromBytes( bytes:haxe.io.Bytes, ?byteOffset:Int, ?len:Int ) : Uint8Array {
            if(byteOffset == null) return new js.html.Uint8Array(cast bytes.getData());
            if(len == null) return new js.html.Uint8Array(cast bytes.getData(), byteOffset);
            return new js.html.Uint8Array(cast bytes.getData(), byteOffset, len);
        }

        public function toBytes() : haxe.io.Bytes {
            #if (haxe_ver < 3.2)
                return @:privateAccess new haxe.io.Bytes( this.byteLength, cast new js.html.Uint8Array(this.buffer) );
            #else
                return @:privateAccess new haxe.io.Bytes( cast new js.html.Uint8Array(this.buffer) );
            #end
        }

        function toString() return 'Uint8Array [byteLength:${this.byteLength}, length:${this.length}]';

    }

#else

    import snow.api.buffers.ArrayBufferView;
    import snow.api.buffers.TypedArrayType;

    @:forward()
    @:arrayAccess
    abstract Uint8Array(ArrayBufferView) from ArrayBufferView to ArrayBufferView {

        public inline static var BYTES_PER_ELEMENT : Int = 1;

        public var length (get, never):Int;

        @:generic
        public inline function new<T>(
            ?elements:Int,
            ?array:Array<T>,
            ?view:ArrayBufferView,
            ?buffer:ArrayBuffer, ?byteoffset:Int = 0, ?len:Null<Int>
        ) {

            if(elements != null) {
                this = new ArrayBufferView( elements, Uint8 );
            } else if(array != null) {
                this = new ArrayBufferView(0, Uint8).initArray(array);
            } else if(view != null) {
                this = new ArrayBufferView(0, Uint8).initTypedArray(view);
            } else if(buffer != null) {
                this = new ArrayBufferView(0, Uint8).initBuffer(buffer, byteoffset, len);
            } else {
                throw "Invalid constructor arguments for Uint8Array";
            }
        }

    //Public API

        public inline function subarray( begin:Int, end:Null<Int> = null) : Uint8Array return this.subarray(begin, end);


            //non spec haxe conversions
        public static function fromBytes( bytes:haxe.io.Bytes, ?byteOffset:Int=0, ?len:Int ) : Uint8Array {
            return new Uint8Array(bytes, byteOffset, len);
        }

        public function toBytes() : haxe.io.Bytes {
            return this.buffer;
        }

    //Internal

        function toString() return 'Uint8Array [byteLength:${this.byteLength}, length:${this.length}]';

        inline function get_length() return this.length;


        @:noCompletion
        @:arrayAccess
        public inline function __get(idx:Int) {
            return ArrayBufferIO.getUint8(this.buffer, this.byteOffset+idx);
        }

        @:noCompletion
        @:arrayAccess
        public inline function __set(idx:Int, val:UInt) {
            return ArrayBufferIO.setUint8(this.buffer, this.byteOffset+idx, val);
        }

    }

#end //!js
