
[![Logo](../../../../../images/logo.png)](../../../../../api/index.html)

<hr/>
<a href="#" id="search_bar" onclick="return;"><div> search API <em>(or start typing anywhere)</em> </div></a>
<hr/>

<script src="../../../../../js/omnibar.js"> </script>
<link rel="stylesheet" type="text/css" href="../../../../../css/omnibar.css" media="all">

<div id="omnibar"> <a href="#" onclick="return" id="omnibar_close"></a> <input id="omnibar_text" type="text" placeholder="search types..."></input></div>
<script  id="typelist" data-relpath="../../../../../" data-types="snow.App,snow.AppFixedTimestep,snow.Core,snow.CoreBinding,snow.Log,snow.Snow,snow.assets.Asset,snow.assets.AssetAudio,snow.assets.AssetBytes,snow.assets.AssetImage,snow.assets.AssetSystem,snow.assets.AssetSystemBinding,snow.assets.AssetText,snow.assets.Assets,snow.audio.Audio,snow.audio.AudioSystem,snow.audio.AudioSystemBinding,snow.audio.Sound,snow.audio.SoundBinding,snow.audio.SoundStream,snow.audio._Audio.AudioHandleMap,snow.audio.openal.AL,snow.audio.openal.ALC,snow.audio.openal.Context,snow.audio.openal.Device,snow.input.Input,snow.input.InputSystem,snow.input.InputSystemBinding,snow.input.Keycodes,snow.input.MapIntBool,snow.input.MapIntFloat,snow.input.Scancodes,snow.io.IO,snow.io.IOSystem,snow.io.IOSystemBinding,snow.platform.native.Core,snow.platform.native.StaticSnow,snow.platform.native.assets.AssetSystem,snow.platform.native.audio.AudioSystem,snow.platform.native.audio.Sound,snow.platform.native.audio.SoundStream,snow.platform.native.audio.openal.AL,snow.platform.native.audio.openal.ALC,snow.platform.native.audio.openal.AudioSystem,snow.platform.native.audio.openal.Context,snow.platform.native.audio.openal.Device,snow.platform.native.audio.openal.OpenALHelper,snow.platform.native.audio.openal.Sound,snow.platform.native.audio.openal.SoundStream,snow.platform.native.audio.openal._AL.Context_Impl_,snow.platform.native.audio.openal._AL.Device_Impl_,snow.platform.native.input.InputSystem,snow.platform.native.input.sdl.ControllerEventType,snow.platform.native.input.sdl.InputSystem,snow.platform.native.input.sdl.KeyEventType,snow.platform.native.input.sdl.ModValue,snow.platform.native.input.sdl.MouseEventType,snow.platform.native.input.sdl.TouchEventType,snow.platform.native.io.IOFile,snow.platform.native.io.IOFileHandle,snow.platform.native.io.IOSystem,snow.platform.native.io._IOFile.IOFileHandle_Impl_,snow.platform.native.render.opengl.GL,snow.platform.native.render.opengl.GLActiveInfo,snow.platform.native.render.opengl.GLBuffer,snow.platform.native.render.opengl.GLContextAttributes,snow.platform.native.render.opengl.GLFBO,snow.platform.native.render.opengl.GLFramebuffer,snow.platform.native.render.opengl.GLObject,snow.platform.native.render.opengl.GLProgram,snow.platform.native.render.opengl.GLRBO,snow.platform.native.render.opengl.GLRenderbuffer,snow.platform.native.render.opengl.GLShader,snow.platform.native.render.opengl.GLShaderPrecisionFormat,snow.platform.native.render.opengl.GLTexture,snow.platform.native.render.opengl.GLUniformLocation,snow.platform.native.render.opengl._GL.GLFramebuffer_Impl_,snow.platform.native.render.opengl._GL.GLRenderbuffer_Impl_,snow.platform.native.utils.ArrayBuffer,snow.platform.native.utils.ArrayBufferView,snow.platform.native.utils.ByteArray,snow.platform.native.utils.Compression,snow.platform.native.utils.Float32Array,snow.platform.native.utils.Int16Array,snow.platform.native.utils.Int32Array,snow.platform.native.utils.Int8Array,snow.platform.native.utils.UInt16Array,snow.platform.native.utils.UInt32Array,snow.platform.native.utils.UInt8Array,snow.platform.native.utils.UInt8ClampedArray,snow.platform.native.window.WindowSystem,snow.platform.native.window.sdl.WindowSystem,snow.platform.web.assets.psd.PSD,snow.platform.web.audio.AudioSystem,snow.platform.web.audio.Sound,snow.platform.web.audio.SoundStream,snow.platform.web.audio.howlerjs.AudioParams,snow.platform.web.audio.howlerjs.AudioSystem,snow.platform.web.audio.howlerjs.Howl,snow.platform.web.audio.howlerjs.Howler,snow.platform.web.audio.howlerjs.SoundStream,snow.platform.web.audio.howlerjs.SpriteParams,snow.render.opengl.GL,snow.render.opengl.GLActiveInfo,snow.render.opengl.GLBuffer,snow.render.opengl.GLContextAttributes,snow.render.opengl.GLFramebuffer,snow.render.opengl.GLProgram,snow.render.opengl.GLRenderbuffer,snow.render.opengl.GLShader,snow.render.opengl.GLTexture,snow.render.opengl.GLUniformLocation,snow.types.AppConfig,snow.types.AppConfigNative,snow.types.AppConfigWeb,snow.types.AssetAudioOptions,snow.types.AssetBytesOptions,snow.types.AssetImageOptions,snow.types.AssetInfo,snow.types.AssetTextOptions,snow.types.AssetType,snow.types.AudioDataBlob,snow.types.AudioDataInfo,snow.types.AudioFormatType,snow.types.AudioHandle,snow.types.AudioInfo,snow.types.DisplayMode,snow.types.FileEvent,snow.types.FileEventType,snow.types.FileFilter,snow.types.GamepadDeviceEventType,snow.types.ImageInfo,snow.types.InputEvent,snow.types.InputEventType,snow.types.Key,snow.types.ModState,snow.types.Scan,snow.types.SnowConfig,snow.types.SystemEvent,snow.types.SystemEventType,snow.types.TextEventType,snow.types.WindowConfig,snow.types.WindowEvent,snow.types.WindowEventType,snow.types.WindowHandle,snow.utils.AbstractClass,snow.utils.AbstractClassBuilder,snow.utils.ArrayBuffer,snow.utils.ArrayBufferView,snow.utils.ByteArray,snow.utils.Float32Array,snow.utils.IDataInput,snow.utils.IMemoryRange,snow.utils.Int16Array,snow.utils.Int32Array,snow.utils.Int8Array,snow.utils.Libs,snow.utils.Timer,snow.utils.UInt16Array,snow.utils.UInt32Array,snow.utils.UInt8Array,snow.utils.UInt8ClampedArray,snow.utils._AbstractClass.StringMap,snow.utils.format.png.Chunk,snow.utils.format.png.Color,snow.utils.format.png.Data,snow.utils.format.png.Header,snow.utils.format.png.Reader,snow.utils.format.png.Tools,snow.utils.format.png.Writer,snow.utils.format.tools.Adler32,snow.utils.format.tools.Deflate,snow.utils.format.tools.HuffTools,snow.utils.format.tools.Huffman,snow.utils.format.tools.Inflate,snow.utils.format.tools.InflateImpl,snow.utils.format.tools.MemoryBytes,snow.utils.format.tools._InflateImpl.State,snow.utils.format.tools._InflateImpl.Window,snow.window.Window,snow.window.WindowSystem,snow.window.WindowSystemBinding,snow.window.Windowing,snow.window._Windowing.WindowHandleMap"></script>


<h1>ByteArray</h1>
<small>`snow.platform.native.utils.ByteArray`</small>



<hr/>

`class`extends <code><span>haxe.io.Bytes</span></code><br/>implements <code><span>snow.utils.IMemoryRange</span></code>, <code><span>snow.utils.IDataInput</span></code><br/><span class="meta">
meta: @:keep</span>

<hr/>


&nbsp;
&nbsp;




<h3>Members</h3> <hr/><span class="member apipage">
                <a name="bigEndian"><a class="lift" href="#bigEndian">bigEndian</a></a><div class="clear"></div>
                <code class="signature apipage">bigEndian : [Bool](http://api.haxe.org/Bool.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="position"><a class="lift" href="#position">position</a></a><div class="clear"></div>
                <code class="signature apipage">position : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/>

<h3>Properties</h3> <hr/><span class="member apipage">
                <a name="__get"><a class="lift" href="#__get">\_\_get</a></a><div class="clear"></div>
                <code class="signature apipage">\_\_get : [Int](http://api.haxe.org/Int.html)&nbsp;-&gt; [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="__set"><a class="lift" href="#__set">\_\_set</a></a><div class="clear"></div>
                <code class="signature apipage">\_\_set : [Int](http://api.haxe.org/Int.html)&nbsp; -&gt; [Int](http://api.haxe.org/Int.html)&nbsp;-&gt; [Void](http://api.haxe.org/Void.html)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="byteLength"><a class="lift" href="#byteLength">byteLength</a></a><div class="clear"></div>
                <code class="signature apipage">byteLength : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="bytesAvailable"><a class="lift" href="#bytesAvailable">bytesAvailable</a></a><div class="clear"></div>
                <code class="signature apipage">bytesAvailable : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="endian"><a class="lift" href="#endian">endian</a></a><div class="clear"></div>
                <code class="signature apipage">endian : [String](http://api.haxe.org/String.html)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="readBoolean"><a class="lift" href="#readBoolean">readBoolean</a></a><div class="clear"></div>
                <code class="signature apipage">readBoolean : [Dynamic](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="readByte"><a class="lift" href="#readByte">readByte</a></a><div class="clear"></div>
                <code class="signature apipage">readByte : [Dynamic](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="readMultiByte"><a class="lift" href="#readMultiByte">readMultiByte</a></a><div class="clear"></div>
                <code class="signature apipage">readMultiByte : [Int](http://api.haxe.org/Int.html)&nbsp; -&gt; [String](http://api.haxe.org/String.html)&nbsp;-&gt; [String](http://api.haxe.org/String.html)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="readUnsignedByte"><a class="lift" href="#readUnsignedByte">readUnsignedByte</a></a><div class="clear"></div>
                <code class="signature apipage">readUnsignedByte : [Dynamic](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="writeByte"><a class="lift" href="#writeByte">writeByte</a></a><div class="clear"></div>
                <code class="signature apipage">writeByte : [Int](http://api.haxe.org/Int.html)&nbsp;-&gt; [Void](http://api.haxe.org/Void.html)</code><br/></span>
            <span class="small_desc_flat"></span>

<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="asString"><a class="lift" href="#asString">asString</a></a><div class="clear"></div>
            <code class="signature apipage">asString() : [String](http://api.haxe.org/String.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="checkData"><a class="lift" href="#checkData">checkData</a></a><div class="clear"></div>
            <code class="signature apipage">checkData(inLength:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="clear"><a class="lift" href="#clear">clear</a></a><div class="clear"></div>
            <code class="signature apipage">clear() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="compress"><a class="lift" href="#compress">compress</a></a><div class="clear"></div>
            <code class="signature apipage">compress(algorithm:[snow.platform.native.utils.Compression](../../../../../api/snow/platform/native/utils/Compression.html)<span>=null</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="deflate"><a class="lift" href="#deflate">deflate</a></a><div class="clear"></div>
            <code class="signature apipage">deflate() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="fromBytes"><a class="lift" href="#fromBytes">fromBytes</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">fromBytes(inBytes:[haxe.io.Bytes](http://api.haxe.org/haxe/io/Bytes.html)<span></span>) : [snow.platform.native.utils.ByteArray](../../../../../api/snow/platform/native/utils/ByteArray.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="getByteBuffer"><a class="lift" href="#getByteBuffer">getByteBuffer</a></a><div class="clear"></div>
            <code class="signature apipage">getByteBuffer() : [snow.platform.native.utils.ByteArray](../../../../../api/snow/platform/native/utils/ByteArray.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="getLength"><a class="lift" href="#getLength">getLength</a></a><div class="clear"></div>
            <code class="signature apipage">getLength() : [Int](http://api.haxe.org/Int.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="getStart"><a class="lift" href="#getStart">getStart</a></a><div class="clear"></div>
            <code class="signature apipage">getStart() : [Int](http://api.haxe.org/Int.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="inflate"><a class="lift" href="#inflate">inflate</a></a><div class="clear"></div>
            <code class="signature apipage">inflate() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a><div class="clear"></div>
            <code class="signature apipage">new(inSize:[Int](http://api.haxe.org/Int.html)<span>=0</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="readBytes"><a class="lift" href="#readBytes">readBytes</a></a><div class="clear"></div>
            <code class="signature apipage">readBytes(outData:[snow.platform.native.utils.ByteArray](../../../../../api/snow/platform/native/utils/ByteArray.html)<span></span>, inOffset:[Int](http://api.haxe.org/Int.html)<span>=0</span>, inLen:[Int](http://api.haxe.org/Int.html)<span>=0</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="readDouble"><a class="lift" href="#readDouble">readDouble</a></a><div class="clear"></div>
            <code class="signature apipage">readDouble() : [Float](http://api.haxe.org/Float.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="readFile"><a class="lift" href="#readFile">readFile</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">readFile(inString:[String](http://api.haxe.org/String.html)<span></span>, async:[Bool](http://api.haxe.org/Bool.html)<span>=false</span>, onload:[snow.platform.native.utils.ByteArray](../../../../../api/snow/platform/native/utils/ByteArray.html)&nbsp;-&gt; [Void](http://api.haxe.org/Void.html)<span>=null</span>) : [snow.platform.native.utils.ByteArray](../../../../../api/snow/platform/native/utils/ByteArray.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="readFloat"><a class="lift" href="#readFloat">readFloat</a></a><div class="clear"></div>
            <code class="signature apipage">readFloat() : [Float](http://api.haxe.org/Float.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="readInt"><a class="lift" href="#readInt">readInt</a></a><div class="clear"></div>
            <code class="signature apipage">readInt() : [Int](http://api.haxe.org/Int.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="readShort"><a class="lift" href="#readShort">readShort</a></a><div class="clear"></div>
            <code class="signature apipage">readShort() : [Int](http://api.haxe.org/Int.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="readUTF"><a class="lift" href="#readUTF">readUTF</a></a><div class="clear"></div>
            <code class="signature apipage">readUTF() : [String](http://api.haxe.org/String.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="readUTFBytes"><a class="lift" href="#readUTFBytes">readUTFBytes</a></a><div class="clear"></div>
            <code class="signature apipage">readUTFBytes(inLen:[Int](http://api.haxe.org/Int.html)<span></span>) : [String](http://api.haxe.org/String.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="readUnsignedInt"><a class="lift" href="#readUnsignedInt">readUnsignedInt</a></a><div class="clear"></div>
            <code class="signature apipage">readUnsignedInt() : [Int](http://api.haxe.org/Int.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="readUnsignedShort"><a class="lift" href="#readUnsignedShort">readUnsignedShort</a></a><div class="clear"></div>
            <code class="signature apipage">readUnsignedShort() : [Int](http://api.haxe.org/Int.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="setLength"><a class="lift" href="#setLength">setLength</a></a><div class="clear"></div>
            <code class="signature apipage">setLength(inLength:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="slice"><a class="lift" href="#slice">slice</a></a><div class="clear"></div>
            <code class="signature apipage">slice(inBegin:[Int](http://api.haxe.org/Int.html)<span></span>, inEnd:[Int](http://api.haxe.org/Int.html)<span>=null</span>) : [snow.platform.native.utils.ByteArray](../../../../../api/snow/platform/native/utils/ByteArray.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="uncompress"><a class="lift" href="#uncompress">uncompress</a></a><div class="clear"></div>
            <code class="signature apipage">uncompress(algorithm:[snow.platform.native.utils.Compression](../../../../../api/snow/platform/native/utils/Compression.html)<span>=null</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="writeBoolean"><a class="lift" href="#writeBoolean">writeBoolean</a></a><div class="clear"></div>
            <code class="signature apipage">writeBoolean(value:[Bool](http://api.haxe.org/Bool.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="writeBytes"><a class="lift" href="#writeBytes">writeBytes</a></a><div class="clear"></div>
            <code class="signature apipage">writeBytes(bytes:[haxe.io.Bytes](http://api.haxe.org/haxe/io/Bytes.html)<span></span>, inOffset:[Int](http://api.haxe.org/Int.html)<span>=0</span>, inLength:[Int](http://api.haxe.org/Int.html)<span>=0</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="writeDouble"><a class="lift" href="#writeDouble">writeDouble</a></a><div class="clear"></div>
            <code class="signature apipage">writeDouble(x:[Float](http://api.haxe.org/Float.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="writeFile"><a class="lift" href="#writeFile">writeFile</a></a><div class="clear"></div>
            <code class="signature apipage">writeFile(inString:[String](http://api.haxe.org/String.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="writeFloat"><a class="lift" href="#writeFloat">writeFloat</a></a><div class="clear"></div>
            <code class="signature apipage">writeFloat(x:[Float](http://api.haxe.org/Float.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="writeInt"><a class="lift" href="#writeInt">writeInt</a></a><div class="clear"></div>
            <code class="signature apipage">writeInt(value:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="writeShort"><a class="lift" href="#writeShort">writeShort</a></a><div class="clear"></div>
            <code class="signature apipage">writeShort(value:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="writeUTF"><a class="lift" href="#writeUTF">writeUTF</a></a><div class="clear"></div>
            <code class="signature apipage">writeUTF(s:[String](http://api.haxe.org/String.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="writeUTFBytes"><a class="lift" href="#writeUTFBytes">writeUTFBytes</a></a><div class="clear"></div>
            <code class="signature apipage">writeUTFBytes(s:[String](http://api.haxe.org/String.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="writeUnsignedInt"><a class="lift" href="#writeUnsignedInt">writeUnsignedInt</a></a><div class="clear"></div>
            <code class="signature apipage">writeUnsignedInt(value:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>



<hr/>

&nbsp;
&nbsp;
&nbsp;
&nbsp;