
[![Logo](../../../../../images/logo.png)](../../../../../api/index.html)

---



#ArrayBuffer



---

`class`extends <code><span>[haxe.io.Bytes]()</span></code><br/>implements <code><span>[lumen.utils.IMemoryRange]()</span></code>, <code><span>[lumen.utils.IDataInput]()</span></code>
<span class="meta">

</span>


---

&nbsp;
&nbsp;

<h3>Members</h3> <hr/><span class="member apipage">
            <a name="bigEndian"><a class="lift" href="#bigEndian">bigEndian</a></a><code class="signature apipage">bigEndian : [Bool](http://api.haxe.org/Bool.html)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="position"><a class="lift" href="#position">position</a></a><code class="signature apipage">position : [Int](http://api.haxe.org/Int.html)</code><br/></span>
        <span class="small_desc_flat"></span>

<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="__get"><a class="lift" href="#__get">\_\_get</a></a><code class="signature apipage">\_\_get(pos:<span>[Int](http://api.haxe.org/Int.html)</span>) : [Int](http://api.haxe.org/Int.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="__set"><a class="lift" href="#__set">\_\_set</a></a><code class="signature apipage">\_\_set(pos:<span>[Int](http://api.haxe.org/Int.html)</span>, v:<span>[Int](http://api.haxe.org/Int.html)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="asString"><a class="lift" href="#asString">asString</a></a><code class="signature apipage">asString() : [String](http://api.haxe.org/String.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="checkData"><a class="lift" href="#checkData">checkData</a></a><code class="signature apipage">checkData(inLength:<span>[Int](http://api.haxe.org/Int.html)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="clear"><a class="lift" href="#clear">clear</a></a><code class="signature apipage">clear() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="compress"><a class="lift" href="#compress">compress</a></a><code class="signature apipage">compress(?algorithm:<span>[lumen.utils.compat.CompressionAlgorithm](#lumen.utils.compat.CompressionAlgorithm)=null</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="deflate"><a class="lift" href="#deflate">deflate</a></a><code class="signature apipage">deflate() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="fromBytes"><a class="lift" href="#fromBytes">fromBytes</a></a><span class="inline-block static">static</span><code class="signature apipage">fromBytes(inBytes:<span>[haxe.io.Bytes](http://api.haxe.org/haxe/io/Bytes.html)</span>) : [lumen.platform.native.utils.ByteArray](#lumen.platform.native.utils.ByteArray)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="getByteBuffer"><a class="lift" href="#getByteBuffer">getByteBuffer</a></a><code class="signature apipage">getByteBuffer() : [lumen.platform.native.utils.ByteArray](#lumen.platform.native.utils.ByteArray)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="getLength"><a class="lift" href="#getLength">getLength</a></a><code class="signature apipage">getLength() : [Int](http://api.haxe.org/Int.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="getStart"><a class="lift" href="#getStart">getStart</a></a><code class="signature apipage">getStart() : [Int](http://api.haxe.org/Int.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="inflate"><a class="lift" href="#inflate">inflate</a></a><code class="signature apipage">inflate() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a><code class="signature apipage">new(?inSize:<span>[Int](http://api.haxe.org/Int.html)=0</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="readBoolean"><a class="lift" href="#readBoolean">readBoolean</a></a><code class="signature apipage">readBoolean() : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="readByte"><a class="lift" href="#readByte">readByte</a></a><code class="signature apipage">readByte() : [Int](http://api.haxe.org/Int.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="readBytes"><a class="lift" href="#readBytes">readBytes</a></a><code class="signature apipage">readBytes(outData:<span>[lumen.platform.native.utils.ByteArray](#lumen.platform.native.utils.ByteArray)</span>, ?inOffset:<span>[Int](http://api.haxe.org/Int.html)=0</span>, ?inLen:<span>[Int](http://api.haxe.org/Int.html)=0</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="readDouble"><a class="lift" href="#readDouble">readDouble</a></a><code class="signature apipage">readDouble() : [Float](http://api.haxe.org/Float.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="readFile"><a class="lift" href="#readFile">readFile</a></a><span class="inline-block static">static</span><code class="signature apipage">readFile(inString:<span>[String](http://api.haxe.org/String.html)</span>) : [lumen.platform.native.utils.ByteArray](#lumen.platform.native.utils.ByteArray)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="readFloat"><a class="lift" href="#readFloat">readFloat</a></a><code class="signature apipage">readFloat() : [Float](http://api.haxe.org/Float.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="readInt"><a class="lift" href="#readInt">readInt</a></a><code class="signature apipage">readInt() : [Int](http://api.haxe.org/Int.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="readMultiByte"><a class="lift" href="#readMultiByte">readMultiByte</a></a><code class="signature apipage">readMultiByte(inLen:<span>[Int](http://api.haxe.org/Int.html)</span>, charSet:<span>[String](http://api.haxe.org/String.html)</span>) : [String](http://api.haxe.org/String.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="readShort"><a class="lift" href="#readShort">readShort</a></a><code class="signature apipage">readShort() : [Int](http://api.haxe.org/Int.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="readUnsignedByte"><a class="lift" href="#readUnsignedByte">readUnsignedByte</a></a><code class="signature apipage">readUnsignedByte() : [Int](http://api.haxe.org/Int.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="readUnsignedInt"><a class="lift" href="#readUnsignedInt">readUnsignedInt</a></a><code class="signature apipage">readUnsignedInt() : [Int](http://api.haxe.org/Int.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="readUnsignedShort"><a class="lift" href="#readUnsignedShort">readUnsignedShort</a></a><code class="signature apipage">readUnsignedShort() : [Int](http://api.haxe.org/Int.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="readUTF"><a class="lift" href="#readUTF">readUTF</a></a><code class="signature apipage">readUTF() : [String](http://api.haxe.org/String.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="readUTFBytes"><a class="lift" href="#readUTFBytes">readUTFBytes</a></a><code class="signature apipage">readUTFBytes(inLen:<span>[Int](http://api.haxe.org/Int.html)</span>) : [String](http://api.haxe.org/String.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="setLength"><a class="lift" href="#setLength">setLength</a></a><code class="signature apipage">setLength(inLength:<span>[Int](http://api.haxe.org/Int.html)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="slice"><a class="lift" href="#slice">slice</a></a><code class="signature apipage">slice(inBegin:<span>[Int](http://api.haxe.org/Int.html)</span>, ?inEnd:<span>[Int](http://api.haxe.org/Int.html)=null</span>) : [lumen.platform.native.utils.ByteArray](#lumen.platform.native.utils.ByteArray)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="uncompress"><a class="lift" href="#uncompress">uncompress</a></a><code class="signature apipage">uncompress(?algorithm:<span>[lumen.utils.compat.CompressionAlgorithm](#lumen.utils.compat.CompressionAlgorithm)=null</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="writeBoolean"><a class="lift" href="#writeBoolean">writeBoolean</a></a><code class="signature apipage">writeBoolean(value:<span>[Bool](http://api.haxe.org/Bool.html)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="writeByte"><a class="lift" href="#writeByte">writeByte</a></a><code class="signature apipage">writeByte(value:<span>[Int](http://api.haxe.org/Int.html)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="writeBytes"><a class="lift" href="#writeBytes">writeBytes</a></a><code class="signature apipage">writeBytes(bytes:<span>[haxe.io.Bytes](http://api.haxe.org/haxe/io/Bytes.html)</span>, ?inOffset:<span>[Int](http://api.haxe.org/Int.html)=0</span>, ?inLength:<span>[Int](http://api.haxe.org/Int.html)=0</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="writeDouble"><a class="lift" href="#writeDouble">writeDouble</a></a><code class="signature apipage">writeDouble(x:<span>[Float](http://api.haxe.org/Float.html)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="writeFile"><a class="lift" href="#writeFile">writeFile</a></a><code class="signature apipage">writeFile(inString:<span>[String](http://api.haxe.org/String.html)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="writeFloat"><a class="lift" href="#writeFloat">writeFloat</a></a><code class="signature apipage">writeFloat(x:<span>[Float](http://api.haxe.org/Float.html)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="writeInt"><a class="lift" href="#writeInt">writeInt</a></a><code class="signature apipage">writeInt(value:<span>[Int](http://api.haxe.org/Int.html)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="writeShort"><a class="lift" href="#writeShort">writeShort</a></a><code class="signature apipage">writeShort(value:<span>[Int](http://api.haxe.org/Int.html)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="writeUnsignedInt"><a class="lift" href="#writeUnsignedInt">writeUnsignedInt</a></a><code class="signature apipage">writeUnsignedInt(value:<span>[Int](http://api.haxe.org/Int.html)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="writeUTF"><a class="lift" href="#writeUTF">writeUTF</a></a><code class="signature apipage">writeUTF(s:<span>[String](http://api.haxe.org/String.html)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="writeUTFBytes"><a class="lift" href="#writeUTFBytes">writeUTFBytes</a></a><code class="signature apipage">writeUTFBytes(s:<span>[String](http://api.haxe.org/String.html)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    

<h3>Properties</h3> <hr/><span class="property apipage">
            <a name="byteLength"><a class="lift" href="#byteLength">byteLength</a></a><code class="signature apipage">byteLength : [Int]()</code><br/><span class="small_desc_flat"></span>
        </span><span class="property apipage">
            <a name="bytesAvailable"><a class="lift" href="#bytesAvailable">bytesAvailable</a></a><code class="signature apipage">bytesAvailable : [Int]()</code><br/><span class="small_desc_flat"></span>
        </span><span class="property apipage">
            <a name="endian"><a class="lift" href="#endian">endian</a></a><code class="signature apipage">endian : [String]()</code><br/><span class="small_desc_flat"></span>
        </span>

&nbsp;
&nbsp;
&nbsp;