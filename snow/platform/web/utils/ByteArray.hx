package snow.platform.web.utils;

import snow.types.Types;

#if snow_web

    import haxe.io.Bytes;
    import haxe.io.BytesBuffer;
    import haxe.io.BytesData;
    import haxe.io.Input;
    import js.html.DataView;
    import js.html.Uint8Array;

    #if format
        import format.tools.Inflate;
    #end

    class ByteArray implements ArrayAccess<Int> {

        public var bytesAvailable(get_bytesAvailable, null):Int;
        public var endian(get_endian, set_endian):String;
        public var length(default, set_length):Int = 0;
        public var objectEncoding:Int;
        public var position:Int = 0;

        private var allocated:Int = 0;
        public var byteView:Uint8Array;
        private var data:DataView;
        // NOTE: default ByteArray endian is BIG_ENDIAN
        private var littleEndian:Bool = false;


        public function new():Void {

            _snowResizeBuffer(allocated);
            //this.byteView = untyped __new__("Uint8Array", allocated);
            //this.data = untyped __new__("DataView", this.byteView.buffer);

        }


        public function __get(pos:Int):Int { return data.getUint8(pos); }
        public function __set(pos:Int, v:Int):Void { data.setUint8(pos, v); }


        private function _getUTFBytesCount(value:String):Int {

            var count:Int = 0;
            // utf8-decode

            for (i in 0...value.length) {

                var c = StringTools.fastCodeAt(value, i);

                if (c <= 0x7F) {

                    count += 1;

                } else if (c <= 0x7FF) {

                    count += 2;

                } else if (c <= 0xFFFF) {

                    count += 3;

                } else {

                    count += 4;

                }

            }

            return count;

        }


        private function _snowResizeBuffer(len:Int):Void {

            var oldByteView:Uint8Array = this.byteView;
            var newByteView:Uint8Array = untyped __new__("Uint8Array", len);

            if (oldByteView != null)
            {
                if (oldByteView.length <= len) newByteView.set(oldByteView);
                else newByteView.set(oldByteView.subarray(0, len));
            }

            this.byteView = newByteView;
            this.data = untyped __new__("DataView", newByteView.buffer);

        }


        public function clear() {

            length = 0;

        }


        @:extern private inline function ensureWrite(lengthToEnsure:Int):Void {

            if (this.length < lengthToEnsure) this.length = lengthToEnsure;
        }

        static public function toBytes(ba:ByteArray):Bytes {

            if (ba == null) return null;
            var bytes:Bytes = Bytes.alloc(ba.length);

                ba.position = 0;

                    for(_i in 0 ... bytes.length) {
                        bytes.set(_i, ba.readUnsignedByte());
                    }

                ba.position = 0;

            return bytes;

        } //toBytes

        static public function fromBytes(inBytes:Bytes) {
          var result = new ByteArray();
          result.snowFromBytes(inBytes);
          return result;
       }

        public function getData() {
            return data.buffer;
        }

       private inline function snowFromBytes(inBytes:Bytes):Void
       {
          byteView = untyped __new__("Uint8Array", inBytes.getData());
          length = byteView.length;
          allocated = length;
       }


        public inline function snowGet(pos:Int):Int {

            var data:Dynamic = data;
            return data.getUint8(pos);

        }


        public inline function snowGetBuffer() {

            return data.buffer;

        }


        public static function snowOfBuffer(buffer:ArrayBuffer):ByteArray {

            var bytes = new ByteArray();
                bytes.length = buffer.byteLength;
                bytes.data = untyped __new__("DataView", buffer);
                bytes.byteView = untyped __new__("Uint8Array", buffer);

            return bytes;

        } //snowOfBuffer

        public inline function snowSet(pos:Int, v:Int):Void {

            var data:Dynamic = data;
            data.setUint8(pos, v);

        }

        static public function readFile( _path:String, ?_options:ByteArrayReadOptions, ?onload:ByteArray->Void ) : ByteArray {

                //defaults
            var _async = false;
            var _binary = true;

            if(_options != null) {
                if(_options.async != null) _async = _options.async;
                if(_options.binary != null) _binary = _options.binary;
            }

            var request = new js.html.XMLHttpRequest();
                request.open("GET", _path, _async);

                if(_binary) {
                    request.overrideMimeType('text/plain; charset=x-user-defined');
                } else {
                    request.overrideMimeType('text/plain; charset=UTF-8');
                }

                //only _async can set the type it seems
            if(_async) {
                request.responseType = 'arraybuffer';
            }

                //the final resulting bytearray
            var result : ByteArray = null;
                //this is in case onload is called in sync mode
                //avoiding running finalize twice as it's brute forcey
            var finalized = false;
                //finalize the data to the bytearray
            var finalize = function() {

                if(!finalized) {

                    if(!_async) {

                        result = new ByteArray();
                        result.writeUTFBytes(request.response);
                        result.position = 0;

                    } else {

                        result = ByteArray.snowOfBuffer(request.response);

                    } //_async

                } //!finalized

                return result;

            } //finalize

            request.onload = function(data) {

                if(onload != null) {
                    if(request.status == 200) {
                        onload( finalize() );
                    } else {
                        onload( null );
                    }
                }

            } //onload

            request.send();

                //when doing sync return the result
            if(!_async) {
                if(request.status == 200) {
                    return finalize();
                } else {
                    return null;
                }
            }

            return null;

        } //readFile

        public inline function readBoolean():Bool {

            return (this.readByte() != 0);

        }


        public inline function readByte():Int {

            var data:Dynamic = data;
            return data.getUint8(this.position++);

        }


        public function readBytes(bytes:ByteArray, ?offset:Int, ?length:Int):Void {

            if (offset < 0 || length < 0) {
                throw ("Read error - Out of bounds");
            }

            if (offset == null) offset = 0;
            if (length == null) length = this.length;

            bytes.ensureWrite(offset + length);

            bytes.byteView.set(byteView.subarray(this.position, this.position + length), offset);
            bytes.position = offset;

            this.position += length;
            if (bytes.position + length > bytes.length) bytes.length = bytes.position + length;

        }


        public function readDouble():Float {

            var double = data.getFloat64(this.position, littleEndian);
            this.position += 8;
            return double;

        }


        public function readFloat():Float {

            var float = data.getFloat32(this.position, littleEndian);
            this.position += 4;
            return float;

        }


        private function readFullBytes(bytes:Bytes, pos:Int, len:Int):Void {

            // NOTE: It is used somewhere?

            ensureWrite(len);

            for (i in pos...(pos + len)) {

                var data:Dynamic = data;
                data.setInt8(this.position++, bytes.get(i));

            }

        }


        public function readInt():Int {

            var int = data.getInt32(this.position, littleEndian);
            this.position += 4;
            return int;

        }


        public function readShort():Int {

            var short = data.getInt16(this.position, littleEndian);
            this.position += 2;
            return short;

        }


        public inline function readUnsignedByte():Int {

            var data:Dynamic = data;
            return data.getUint8(this.position++);

        }


        public function readUnsignedInt():Int {

            var uInt = data.getUint32(this.position, littleEndian);
            this.position += 4;
            return uInt;

        }


        public function readUnsignedShort():Int {

            var uShort = data.getUint16(this.position, littleEndian);
            this.position += 2;
            return uShort;

        }


        public function readUTF():String {

            var bytesCount = readUnsignedShort();
            return readUTFBytes(bytesCount);

        }


        public function readUTFBytes(len:Int):String {

            var value = "";
            var max = this.position + len;

            // utf8-encode
            while (this.position < max) {

                var data:Dynamic = data;
                var c = data.getUint8(this.position++);

                if (c < 0x80) {

                    if (c == 0) break;
                    value += String.fromCharCode(c);

                } else if (c < 0xE0) {

                    value += String.fromCharCode(((c & 0x3F) << 6) |(data.getUint8(this.position++) & 0x7F));

                } else if (c < 0xF0) {

                    var c2 = data.getUint8(this.position++);
                    value += String.fromCharCode(((c & 0x1F) << 12) |((c2 & 0x7F) << 6) |(data.getUint8(this.position++) & 0x7F));

                } else {

                    var c2 = data.getUint8(this.position++);
                    var c3 = data.getUint8(this.position++);
                    value += String.fromCharCode(((c & 0x0F) << 18) |((c2 & 0x7F) << 12) |((c3 << 6) & 0x7F) |(data.getUint8(this.position++) & 0x7F));

                }

            }

            return value;

        }


        public function toString ():String {

            var cachePosition = position;
            position = 0;
            var value = readUTFBytes (length);
            position = cachePosition;
            return value;

        }


        #if format
            public function uncompress():Void {

                var bytes = Bytes.ofData(cast byteView);
                var buf = Inflate.run(bytes).getData();
                this.byteView = untyped __new__("Uint8Array", buf);
                this.data = untyped __new__("DataView", byteView.buffer);
                this.length = this.allocated = byteView.buffer.byteLength;

            }
        #end //format


        public inline function writeBoolean(value:Bool):Void {

            this.writeByte(value ? 1 : 0);

        }


        public function writeByte(value:Int):Void {

            ensureWrite(this.position + 1);
            var data:Dynamic = data;
            data.setInt8(this.position, value);
            this.position += 1;

        }


        public function writeBytes(bytes:ByteArray, ?offset:Int, ?length:Int):Void {

            if (offset < 0 || length < 0) throw ("Write error - Out of bounds");

            ensureWrite(this.position + length);
            byteView.set(bytes.byteView.subarray(offset, offset + length), this.position);
            this.position += length;

        }


        public function writeDouble(x:Float):Void {

            ensureWrite(this.position + 8);
            data.setFloat64(this.position, x, littleEndian);
            this.position += 8;

        }


        public function writeFloat(x:Float):Void {

            ensureWrite(this.position + 4);
            data.setFloat32(this.position, x, littleEndian);
            this.position += 4;

        }


        public function writeInt(value:Int):Void {

            ensureWrite(this.position + 4);
            data.setInt32(this.position, value, littleEndian);
            this.position += 4;

        }


        public function writeShort(value:Int):Void {

            ensureWrite(this.position + 2);
            data.setInt16(this.position, value, littleEndian);
            this.position += 2;

        }


        public function writeUnsignedInt(value:Int):Void {

            ensureWrite(this.position + 4);
            data.setUint32(this.position, value, littleEndian);
            this.position += 4;

        }


        public function writeUnsignedShort(value:Int):Void {

            ensureWrite(this.position + 2);
            data.setUint16(this.position, value, littleEndian);
            this.position += 2;

        }


        public function writeUTF(value:String):Void {

            writeUnsignedShort(_getUTFBytesCount(value));
            writeUTFBytes(value);

        }


        public function writeUTFBytes(value:String):Void {

            // utf8-decode
            for (i in 0...value.length) {

                var c = StringTools.fastCodeAt(value, i);

                if (c <= 0x7F) {

                    writeByte(c);

                } else if (c <= 0x7FF) {

                    writeByte(0xC0 |(c >> 6));
                    writeByte(0x80 |(c & 63));

                } else if (c <= 0xFFFF) {

                    writeByte(0xE0 |(c >> 12));
                    writeByte(0x80 |((c >> 6) & 63));
                    writeByte(0x80 |(c & 63));

                } else {

                    writeByte(0xF0 |(c >> 18));
                    writeByte(0x80 |((c >> 12) & 63));
                    writeByte(0x80 |((c >> 6) & 63));
                    writeByte(0x80 |(c & 63));

                }

            }

        }



        public static inline var BIG_ENDIAN : String = "bigEndian";
        public static inline var LITTLE_ENDIAN : String = "littleEndian";

        // Getters & Setters


        inline private function get_bytesAvailable():Int { return length - position; }

        inline function get_endian():String {

            return (littleEndian) ? LITTLE_ENDIAN : BIG_ENDIAN;

        }

        inline function set_endian(endian:String):String {

            littleEndian = (endian == LITTLE_ENDIAN);
            return endian;

        }


        private inline function set_length(value:Int):Int {

            if (allocated < value)
                _snowResizeBuffer(allocated = Std.int(Math.max(value, allocated * 2)));
            else if (allocated > value * 2)
                _snowResizeBuffer(allocated = value);
            length = value;
            return value;
        }


    } //ByteArray

#end //snow_web
