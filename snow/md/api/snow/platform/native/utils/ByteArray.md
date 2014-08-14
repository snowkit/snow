
[![Logo](../../../../../images/logo.png)](../../../../../api/index.html)

---



<h1>ByteArray</h1>
<small>`snow.platform.native.utils.ByteArray`</small>



---

`class`extends <code><span>haxe.io.Bytes</span></code><br/>implements <code><span>snow.utils.IMemoryRange</span></code>, <code><span>snow.utils.IDataInput</span></code>

---

&nbsp;
&nbsp;



<h3>Members</h3> <hr/><span class="member apipage">
                <a name="bigEndian"><a class="lift" href="#bigEndian">bigEndian</a></a><div class="clear"></div><code class="signature apipage">bigEndian : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="position"><a class="lift" href="#position">position</a></a><div class="clear"></div><code class="signature apipage">position : [Int](#)</code><br/></span>
            <span class="small_desc_flat"></span>



<h3>Properties</h3> <hr/><span class="member apipage">
                <a name="bytesAvailable"><a class="lift" href="#bytesAvailable">bytesAvailable</a></a> <div class="clear"></div><code class="signature apipage">bytesAvailable : [Int](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="endian"><a class="lift" href="#endian">endian</a></a> <div class="clear"></div><code class="signature apipage">endian : [String](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="byteLength"><a class="lift" href="#byteLength">byteLength</a></a> <div class="clear"></div><code class="signature apipage">byteLength : [Int](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="__get"><a class="lift" href="#__get">\_\_get</a></a> <div class="clear"></div><code class="signature apipage">\_\_get : [Int](#)&nbsp;-&gt; [Int](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="__set"><a class="lift" href="#__set">\_\_set</a></a> <div class="clear"></div><code class="signature apipage">\_\_set : [Int](#)&nbsp; -&gt; [Int](#)&nbsp;-&gt; [Void](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="readBoolean"><a class="lift" href="#readBoolean">readBoolean</a></a> <div class="clear"></div><code class="signature apipage">readBoolean : [Dynamic](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="readByte"><a class="lift" href="#readByte">readByte</a></a> <div class="clear"></div><code class="signature apipage">readByte : [Dynamic](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="readMultiByte"><a class="lift" href="#readMultiByte">readMultiByte</a></a> <div class="clear"></div><code class="signature apipage">readMultiByte : [Int](#)&nbsp; -&gt; [String](#)&nbsp;-&gt; [String](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="readUnsignedByte"><a class="lift" href="#readUnsignedByte">readUnsignedByte</a></a> <div class="clear"></div><code class="signature apipage">readUnsignedByte : [Dynamic](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="writeByte"><a class="lift" href="#writeByte">writeByte</a></a> <div class="clear"></div><code class="signature apipage">writeByte : [Int](#)&nbsp;-&gt; [Void](#)</code><br/></span>
            <span class="small_desc_flat"></span>



<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="asString"><a class="lift" href="#asString">asString</a></a> <div class="clear"></div><code class="signature apipage">asString() : [String](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="checkData"><a class="lift" href="#checkData">checkData</a></a> <div class="clear"></div><code class="signature apipage">checkData(inLength:[Int](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="clear"><a class="lift" href="#clear">clear</a></a> <div class="clear"></div><code class="signature apipage">clear() : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="compress"><a class="lift" href="#compress">compress</a></a> <div class="clear"></div><code class="signature apipage">compress(algorithm:[snow.platform.native.utils.Compression](#)<span>=null</span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="uncompress"><a class="lift" href="#uncompress">uncompress</a></a> <div class="clear"></div><code class="signature apipage">uncompress(algorithm:[snow.platform.native.utils.Compression](#)<span>=null</span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="deflate"><a class="lift" href="#deflate">deflate</a></a> <div class="clear"></div><code class="signature apipage">deflate() : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="inflate"><a class="lift" href="#inflate">inflate</a></a> <div class="clear"></div><code class="signature apipage">inflate() : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="getLength"><a class="lift" href="#getLength">getLength</a></a> <div class="clear"></div><code class="signature apipage">getLength() : [Int](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="getByteBuffer"><a class="lift" href="#getByteBuffer">getByteBuffer</a></a> <div class="clear"></div><code class="signature apipage">getByteBuffer() : [snow.platform.native.utils.ByteArray](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="getStart"><a class="lift" href="#getStart">getStart</a></a> <div class="clear"></div><code class="signature apipage">getStart() : [Int](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="setLength"><a class="lift" href="#setLength">setLength</a></a> <div class="clear"></div><code class="signature apipage">setLength(inLength:[Int](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="slice"><a class="lift" href="#slice">slice</a></a> <div class="clear"></div><code class="signature apipage">slice(inBegin:[Int](#)<span></span>, inEnd:[Int](#)<span>=null</span>) : [snow.platform.native.utils.ByteArray](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="readBytes"><a class="lift" href="#readBytes">readBytes</a></a> <div class="clear"></div><code class="signature apipage">readBytes(outData:[snow.platform.native.utils.ByteArray](#)<span></span>, inOffset:[Int](#)<span>=0</span>, inLen:[Int](#)<span>=0</span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="readDouble"><a class="lift" href="#readDouble">readDouble</a></a> <div class="clear"></div><code class="signature apipage">readDouble() : [Float](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="readFloat"><a class="lift" href="#readFloat">readFloat</a></a> <div class="clear"></div><code class="signature apipage">readFloat() : [Float](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="readInt"><a class="lift" href="#readInt">readInt</a></a> <div class="clear"></div><code class="signature apipage">readInt() : [Int](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="readShort"><a class="lift" href="#readShort">readShort</a></a> <div class="clear"></div><code class="signature apipage">readShort() : [Int](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="readUnsignedInt"><a class="lift" href="#readUnsignedInt">readUnsignedInt</a></a> <div class="clear"></div><code class="signature apipage">readUnsignedInt() : [Int](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="readUnsignedShort"><a class="lift" href="#readUnsignedShort">readUnsignedShort</a></a> <div class="clear"></div><code class="signature apipage">readUnsignedShort() : [Int](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="readUTF"><a class="lift" href="#readUTF">readUTF</a></a> <div class="clear"></div><code class="signature apipage">readUTF() : [String](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="readUTFBytes"><a class="lift" href="#readUTFBytes">readUTFBytes</a></a> <div class="clear"></div><code class="signature apipage">readUTFBytes(inLen:[Int](#)<span></span>) : [String](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="writeBoolean"><a class="lift" href="#writeBoolean">writeBoolean</a></a> <div class="clear"></div><code class="signature apipage">writeBoolean(value:[Bool](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="writeBytes"><a class="lift" href="#writeBytes">writeBytes</a></a> <div class="clear"></div><code class="signature apipage">writeBytes(bytes:[haxe.io.Bytes](#)<span></span>, inOffset:[Int](#)<span>=0</span>, inLength:[Int](#)<span>=0</span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="writeDouble"><a class="lift" href="#writeDouble">writeDouble</a></a> <div class="clear"></div><code class="signature apipage">writeDouble(x:[Float](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="writeFloat"><a class="lift" href="#writeFloat">writeFloat</a></a> <div class="clear"></div><code class="signature apipage">writeFloat(x:[Float](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="writeInt"><a class="lift" href="#writeInt">writeInt</a></a> <div class="clear"></div><code class="signature apipage">writeInt(value:[Int](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="writeShort"><a class="lift" href="#writeShort">writeShort</a></a> <div class="clear"></div><code class="signature apipage">writeShort(value:[Int](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="writeUnsignedInt"><a class="lift" href="#writeUnsignedInt">writeUnsignedInt</a></a> <div class="clear"></div><code class="signature apipage">writeUnsignedInt(value:[Int](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="writeUTF"><a class="lift" href="#writeUTF">writeUTF</a></a> <div class="clear"></div><code class="signature apipage">writeUTF(s:[String](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="writeUTFBytes"><a class="lift" href="#writeUTFBytes">writeUTFBytes</a></a> <div class="clear"></div><code class="signature apipage">writeUTFBytes(s:[String](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="writeFile"><a class="lift" href="#writeFile">writeFile</a></a> <div class="clear"></div><code class="signature apipage">writeFile(inString:[String](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a> <div class="clear"></div><code class="signature apipage">new(inSize:[Int](#)<span>=0</span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="fromBytes"><a class="lift" href="#fromBytes">fromBytes</a></a> <span class="inline-block static">static</span><div class="clear"></div><code class="signature apipage">fromBytes(inBytes:[haxe.io.Bytes](#)<span></span>) : [snow.platform.native.utils.ByteArray](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="readFile"><a class="lift" href="#readFile">readFile</a></a> <span class="inline-block static">static</span><div class="clear"></div><code class="signature apipage">readFile(inString:[String](#)<span></span>, async:[Bool](#)<span>=false</span>, onload:[snow.platform.native.utils.ByteArray](#)&nbsp;-&gt; [Void](#)<span>=null</span>) : [snow.platform.native.utils.ByteArray](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    





---

&nbsp;
&nbsp;
&nbsp;
&nbsp;
