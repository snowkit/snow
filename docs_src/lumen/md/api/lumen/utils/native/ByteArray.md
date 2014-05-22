
[![Logo](../../../../images/logo.png)](../../../../index.html)

---

#ByteArray


##[API Index](../../../../api/index.html#lumen.utils)   
&emsp;&emsp;&emsp;parent    
[lumen.utils](../)     
&emsp;&emsp;&emsp;current    
[lumen.utils.native](./) / ByteArray

<br/>

---


[Extends](#Extends)   
[Implements](#Implements)   
[Members](#Members)   
[Properties](#Properties)   
[StaticMethods](#StaticMethods)   
[Methods](#Methods)   


---

&nbsp;   

<a class="lift" name="Extends" ></a>
###Extends   
---
<a class="lift" name="haxe.io.Bytes" href="{{{rel_path}}}api/haxe/io.Bytes.html">haxe.io.Bytes</a>

&nbsp;   

<a class="lift" name="Implements" ></a>
###Implements   
---
<a class="lift" name="lumen.utils.IDataInput" href="#lumen.utils.IDataInput">lumen.utils.IDataInput</a>



`undefined`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="lumen.utils.IMemoryRange" href="#lumen.utils.IMemoryRange">lumen.utils.IMemoryRange</a>



`undefined`

<span class="small_desc_flat"> no description </span>   

&nbsp;   

<a class="lift" name="Members" ></a>
###Members   
---
<a class="lift" name="bigEndian" href="#bigEndian">bigEndian</a>



`bigEndian : Bool`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="position" href="#position">position</a>



`position : Int`

<span class="small_desc_flat"> no description </span>   

&nbsp;   

<a class="lift" name="Properties" ></a>
###Properties   
---
<a class="lift" name="byteLength" href="#byteLength">byteLength</a>



`byteLength : Int`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="bytesAvailable" href="#bytesAvailable">bytesAvailable</a>



`bytesAvailable : Int`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="endian" href="#endian">endian</a>



`endian : String`

<span class="small_desc_flat"> no description </span>   

&nbsp;   

<a class="lift" name="StaticMethods" ></a>
###StaticMethods   
---
<a class="lift" name="fromBytes" href="#fromBytes">fromBytes</a>



`fromBytes(inBytes:haxe.io.Bytes) : lumen.utils.native.ByteArray`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="readFile" href="#readFile">readFile</a>



`readFile(inString:String) : lumen.utils.native.ByteArray`

<span class="small_desc_flat"> no description </span>   

&nbsp;   

<a class="lift" name="Methods" ></a>
###Methods   
---
<a class="lift" name="asString" href="#asString">asString</a>



`asString() : String`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="checkData" href="#checkData">checkData</a>



`checkData(inLength:Int) : Void`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="clear" href="#clear">clear</a>



`clear() : Void`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="compress" href="#compress">compress</a>



`compress(?algorithm:lumen.utils.compat.CompressionAlgorithm) : Void`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="deflate" href="#deflate">deflate</a>



`deflate() : Void`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="getByteBuffer" href="#getByteBuffer">getByteBuffer</a>



`getByteBuffer() : lumen.utils.native.ByteArray`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="getLength" href="#getLength">getLength</a>



`getLength() : Int`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="getStart" href="#getStart">getStart</a>



`getStart() : Int`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="inflate" href="#inflate">inflate</a>



`inflate() : Void`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="new" href="#new">new</a>



`new(?inSize:Int=0) `

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="readBytes" href="#readBytes">readBytes</a>



`readBytes(outData:lumen.utils.native.ByteArray, ?inOffset:Int=0, ?inLen:Int=0) : Void`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="readDouble" href="#readDouble">readDouble</a>



`readDouble() : Float`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="readFloat" href="#readFloat">readFloat</a>



`readFloat() : Float`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="readInt" href="#readInt">readInt</a>



`readInt() : Int`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="readShort" href="#readShort">readShort</a>



`readShort() : Int`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="readUTF" href="#readUTF">readUTF</a>



`readUTF() : String`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="readUTFBytes" href="#readUTFBytes">readUTFBytes</a>



`readUTFBytes(inLen:Int) : String`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="readUnsignedInt" href="#readUnsignedInt">readUnsignedInt</a>



`readUnsignedInt() : Int`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="readUnsignedShort" href="#readUnsignedShort">readUnsignedShort</a>



`readUnsignedShort() : Int`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="setLength" href="#setLength">setLength</a>



`setLength(inLength:Int) : Void`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="slice" href="#slice">slice</a>



`slice(inBegin:Int, ?inEnd:Int) : lumen.utils.native.ByteArray`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="uncompress" href="#uncompress">uncompress</a>



`uncompress(?algorithm:lumen.utils.compat.CompressionAlgorithm) : Void`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="writeBoolean" href="#writeBoolean">writeBoolean</a>



`writeBoolean(value:Bool) : Void`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="writeBytes" href="#writeBytes">writeBytes</a>



`writeBytes(bytes:haxe.io.Bytes, ?inOffset:Int=0, ?inLength:Int=0) : Void`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="writeDouble" href="#writeDouble">writeDouble</a>



`writeDouble(x:Float) : Void`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="writeFile" href="#writeFile">writeFile</a>



`writeFile(inString:String) : Void`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="writeFloat" href="#writeFloat">writeFloat</a>



`writeFloat(x:Float) : Void`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="writeInt" href="#writeInt">writeInt</a>



`writeInt(value:Int) : Void`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="writeShort" href="#writeShort">writeShort</a>



`writeShort(value:Int) : Void`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="writeUTF" href="#writeUTF">writeUTF</a>



`writeUTF(s:String) : Void`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="writeUTFBytes" href="#writeUTFBytes">writeUTFBytes</a>



`writeUTFBytes(s:String) : Void`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="writeUnsignedInt" href="#writeUnsignedInt">writeUnsignedInt</a>



`writeUnsignedInt(value:Int) : Void`

<span class="small_desc_flat"> no description </span>   



&nbsp;
&nbsp;
&nbsp;

---  


&nbsp;   
&nbsp;   