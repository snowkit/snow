package snow.api.buffers;

#if js

    typedef ArrayBuffer = js.html.ArrayBuffer;

#else

    import haxe.io.BytesData;

    @:forward
    abstract ArrayBuffer(BytesData) from BytesData to BytesData {

        public var byteLength (get, never) : Int;

        public inline function new( byteLength:Int ) {
            this = new BytesData();
            if(byteLength>0) this[byteLength-1] = untyped 0;
        }

        inline function get_byteLength() {
            return this.length;
        }
    }

#end //!js
