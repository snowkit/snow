package snow.api.buffers;

#if js

    @:forward
    @:arrayAccess
    abstract Float32Array(js.html.Float32Array)
        from js.html.Float32Array
        to js.html.Float32Array {

        public inline static var BYTES_PER_ELEMENT : Int = 4;

        inline public function new(_elements:Int) {
            this = new js.html.Float32Array(_elements);
        }

        inline static public function fromArray<T>(_array:Array<T>) : Float32Array {
            return new js.html.Float32Array(untyped _array);
        }

        inline static public function fromView(_view:ArrayBufferView) : Float32Array {
            return new js.html.Float32Array(untyped _view);
        }

        inline static public function fromBuffer(_buffer:ArrayBuffer, _byteOffset:Int, _byteLength:Int) : Float32Array {
            return new js.html.Float32Array(_buffer, _byteOffset, Std.int(_byteLength/BYTES_PER_ELEMENT));
        }


        @:arrayAccess @:extern inline function __set(idx:Int, val:Float) : Void this[idx] = val;
        @:arrayAccess @:extern inline function __get(idx:Int) : Float return this[idx];


            //non spec haxe conversions
        inline public static function fromBytes( bytes:haxe.io.Bytes, ?byteOffset:Int=0, ?len:Int ) : Float32Array {
            if(byteOffset == null) return new js.html.Float32Array(cast bytes.getData());
            if(len == null) return new js.html.Float32Array(cast bytes.getData(), byteOffset);
            return new js.html.Float32Array(cast bytes.getData(), byteOffset, len);
        }

        inline public function toBytes() : haxe.io.Bytes {
            #if (haxe_ver < 3.2)
                return @:privateAccess new haxe.io.Bytes( this.byteLength, cast new js.html.Uint8Array(this.buffer) );
            #else
                return @:privateAccess new haxe.io.Bytes( cast new js.html.Uint8Array(this.buffer) );
            #end
        }

        inline function toString() return 'Float32Array [byteLength:${this.byteLength}, length:${this.length}]';

    }

#else

    import snow.api.buffers.ArrayBufferView;
    import snow.api.buffers.TypedArrayType;

    @:forward
    abstract Float32Array(ArrayBufferView) from ArrayBufferView to ArrayBufferView {

        public inline static var BYTES_PER_ELEMENT : Int = 4;

        public var length (get, never):Int;

        inline public function new(_elements:Int) {
            this = ArrayBufferView.fromElements(Float32, _elements);
        }

        // @:generic //:todo: on use with generic: Type not found : snow.api.buffers._Float32Array.Float32Array_Impl_
        inline static public function fromArray<T>(_array:Array<T>) : Float32Array {
            return ArrayBufferView.fromArray(Float32, cast _array);
        }

        inline static public function fromView(_view:ArrayBufferView) : Float32Array {
            return ArrayBufferView.fromView(Float32, _view);
        }

        inline static public function fromBuffer(_buffer:ArrayBuffer, _byteOffset:Int, _byteLength:Int) : Float32Array {
            return ArrayBufferView.fromBuffer(Float32, _buffer, _byteOffset, _byteLength);
        }

    //Public API

        public inline function subarray( begin:Int, end:Null<Int> = null) : Float32Array return this.subarray(begin, end);


        inline public static function fromBytes(_bytes:haxe.io.Bytes, ?_byteOffset:Int=0, ?_byteLength:Int) : Float32Array {
            if(_byteLength == null) _byteLength = _bytes.length;
            return Float32Array.fromBuffer(_bytes.getData(), _byteOffset, _byteLength);
        }

        inline public function toBytes() : haxe.io.Bytes {
            return haxe.io.Bytes.ofData(this.buffer);
        }

    //Internal

        inline function toString() return this == null ? null : 'Float32Array [byteLength:${this.byteLength}, length:${this.length}]';

        @:extern inline function get_length() return this.length;


        @:noCompletion
        @:arrayAccess @:extern
        public inline function __get(idx:Int) : Float {
            return ArrayBufferIO.getFloat32(this.buffer, this.byteOffset+(idx*BYTES_PER_ELEMENT) );
        }

        @:noCompletion
        @:arrayAccess @:extern
        public inline function __set(idx:Int, val:Float) : Void {
            ArrayBufferIO.setFloat32(this.buffer, this.byteOffset+(idx*BYTES_PER_ELEMENT), val);
        }

    }

#end //!js
