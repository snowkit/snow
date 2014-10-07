
[![Logo](../../../images/logo.png)](../../../api/index.html)

<hr/>
<a href="#" id="search_bar" onclick="return;"><div> search API <em>(or start typing anywhere)</em> </div></a>
<hr/>

<script src="../../../js/omnibar.js"> </script>
<link rel="stylesheet" type="text/css" href="../../../css/omnibar.css" media="all">

<div id="omnibar"> <a href="#" onclick="return" id="omnibar_close"></a> <input id="omnibar_text" type="text" placeholder="search types..."></input></div>
<script  id="typelist" data-relpath="../../../" data-types="snow.App,snow.AppFixedTimestep,snow.Core,snow.CoreBinding,snow.Log,snow.Snow,snow.assets.Asset,snow.assets.AssetAudio,snow.assets.AssetBytes,snow.assets.AssetImage,snow.assets.AssetSystem,snow.assets.AssetSystemBinding,snow.assets.AssetText,snow.assets.Assets,snow.audio.Audio,snow.audio.AudioSystem,snow.audio.AudioSystemBinding,snow.audio.Sound,snow.audio.SoundBinding,snow.audio.SoundStream,snow.audio._Audio.AudioHandleMap,snow.audio.openal.AL,snow.audio.openal.ALC,snow.audio.openal.Context,snow.audio.openal.Device,snow.input.Input,snow.input.InputSystem,snow.input.InputSystemBinding,snow.input.Keycodes,snow.input.MapIntBool,snow.input.MapIntFloat,snow.input.Scancodes,snow.io.IO,snow.io.IOSystem,snow.io.IOSystemBinding,snow.platform.native.Core,snow.platform.native.StaticSnow,snow.platform.native.assets.AssetSystem,snow.platform.native.audio.AudioSystem,snow.platform.native.audio.Sound,snow.platform.native.audio.SoundStream,snow.platform.native.audio.openal.AL,snow.platform.native.audio.openal.ALC,snow.platform.native.audio.openal.AudioSystem,snow.platform.native.audio.openal.Context,snow.platform.native.audio.openal.Device,snow.platform.native.audio.openal.OpenALHelper,snow.platform.native.audio.openal.Sound,snow.platform.native.audio.openal.SoundStream,snow.platform.native.audio.openal._AL.Context_Impl_,snow.platform.native.audio.openal._AL.Device_Impl_,snow.platform.native.input.InputSystem,snow.platform.native.input.sdl.ControllerEventType,snow.platform.native.input.sdl.InputSystem,snow.platform.native.input.sdl.KeyEventType,snow.platform.native.input.sdl.ModValue,snow.platform.native.input.sdl.MouseEventType,snow.platform.native.input.sdl.TouchEventType,snow.platform.native.io.IOFile,snow.platform.native.io.IOFileHandle,snow.platform.native.io.IOSystem,snow.platform.native.io._IOFile.IOFileHandle_Impl_,snow.platform.native.render.opengl.GL,snow.platform.native.render.opengl.GLActiveInfo,snow.platform.native.render.opengl.GLBuffer,snow.platform.native.render.opengl.GLContextAttributes,snow.platform.native.render.opengl.GLFBO,snow.platform.native.render.opengl.GLFramebuffer,snow.platform.native.render.opengl.GLObject,snow.platform.native.render.opengl.GLProgram,snow.platform.native.render.opengl.GLRBO,snow.platform.native.render.opengl.GLRenderbuffer,snow.platform.native.render.opengl.GLShader,snow.platform.native.render.opengl.GLShaderPrecisionFormat,snow.platform.native.render.opengl.GLTexture,snow.platform.native.render.opengl.GLUniformLocation,snow.platform.native.render.opengl._GL.GLFramebuffer_Impl_,snow.platform.native.render.opengl._GL.GLRenderbuffer_Impl_,snow.platform.native.utils.ArrayBuffer,snow.platform.native.utils.ArrayBufferView,snow.platform.native.utils.ByteArray,snow.platform.native.utils.Compression,snow.platform.native.utils.Float32Array,snow.platform.native.utils.Int16Array,snow.platform.native.utils.Int32Array,snow.platform.native.utils.Int8Array,snow.platform.native.utils.UInt16Array,snow.platform.native.utils.UInt32Array,snow.platform.native.utils.UInt8Array,snow.platform.native.utils.UInt8ClampedArray,snow.platform.native.window.WindowSystem,snow.platform.native.window.sdl.WindowSystem,snow.platform.web.assets.psd.PSD,snow.platform.web.audio.AudioSystem,snow.platform.web.audio.Sound,snow.platform.web.audio.SoundStream,snow.platform.web.audio.howlerjs.AudioParams,snow.platform.web.audio.howlerjs.AudioSystem,snow.platform.web.audio.howlerjs.Howl,snow.platform.web.audio.howlerjs.Howler,snow.platform.web.audio.howlerjs.SoundStream,snow.platform.web.audio.howlerjs.SpriteParams,snow.render.opengl.GL,snow.render.opengl.GLActiveInfo,snow.render.opengl.GLBuffer,snow.render.opengl.GLContextAttributes,snow.render.opengl.GLFramebuffer,snow.render.opengl.GLProgram,snow.render.opengl.GLRenderbuffer,snow.render.opengl.GLShader,snow.render.opengl.GLTexture,snow.render.opengl.GLUniformLocation,snow.types.AppConfig,snow.types.AppConfigNative,snow.types.AppConfigWeb,snow.types.AssetAudioOptions,snow.types.AssetBytesOptions,snow.types.AssetImageOptions,snow.types.AssetInfo,snow.types.AssetTextOptions,snow.types.AssetType,snow.types.AudioDataBlob,snow.types.AudioDataInfo,snow.types.AudioFormatType,snow.types.AudioHandle,snow.types.AudioInfo,snow.types.DisplayMode,snow.types.FileEvent,snow.types.FileEventType,snow.types.FileFilter,snow.types.GamepadDeviceEventType,snow.types.ImageInfo,snow.types.InputEvent,snow.types.InputEventType,snow.types.Key,snow.types.ModState,snow.types.Scan,snow.types.SnowConfig,snow.types.SystemEvent,snow.types.SystemEventType,snow.types.TextEventType,snow.types.WindowConfig,snow.types.WindowEvent,snow.types.WindowEventType,snow.types.WindowHandle,snow.utils.AbstractClass,snow.utils.AbstractClassBuilder,snow.utils.ArrayBuffer,snow.utils.ArrayBufferView,snow.utils.ByteArray,snow.utils.Float32Array,snow.utils.IDataInput,snow.utils.IMemoryRange,snow.utils.Int16Array,snow.utils.Int32Array,snow.utils.Int8Array,snow.utils.Libs,snow.utils.Timer,snow.utils.UInt16Array,snow.utils.UInt32Array,snow.utils.UInt8Array,snow.utils.UInt8ClampedArray,snow.utils._AbstractClass.StringMap,snow.utils.format.png.Chunk,snow.utils.format.png.Color,snow.utils.format.png.Data,snow.utils.format.png.Header,snow.utils.format.png.Reader,snow.utils.format.png.Tools,snow.utils.format.png.Writer,snow.utils.format.tools.Adler32,snow.utils.format.tools.Deflate,snow.utils.format.tools.HuffTools,snow.utils.format.tools.Huffman,snow.utils.format.tools.Inflate,snow.utils.format.tools.InflateImpl,snow.utils.format.tools.MemoryBytes,snow.utils.format.tools._InflateImpl.State,snow.utils.format.tools._InflateImpl.Window,snow.window.Window,snow.window.WindowSystem,snow.window.WindowSystemBinding,snow.window.Windowing,snow.window._Windowing.WindowHandleMap"></script>


<h1>ArrayBufferView</h1>
<small>`snow.utils.ArrayBufferView`</small>



<hr/>

`typedef`&nbsp;alias of `snow.platform.native.utils.ArrayBufferView`   

<hr/>


&nbsp;
&nbsp;





<h3>Members</h3> <hr/>

<h3>Properties</h3> <hr/><span class="member apipage">
                <a name="buffer"><a class="lift" href="#buffer">buffer</a></a><div class="clear"></div>
                <code class="signature apipage">buffer : [snow.platform.native.utils.ByteArray](../../../api/snow/platform/native/utils/ByteArray.html)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="byteLength"><a class="lift" href="#byteLength">byteLength</a></a><div class="clear"></div>
                <code class="signature apipage">byteLength : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="byteOffset"><a class="lift" href="#byteOffset">byteOffset</a></a><div class="clear"></div>
                <code class="signature apipage">byteOffset : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="getFloat32"><a class="lift" href="#getFloat32">getFloat32</a></a><div class="clear"></div>
                <code class="signature apipage">getFloat32 : [Int](http://api.haxe.org/Int.html)&nbsp;-&gt; [Float](http://api.haxe.org/Float.html)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="getInt16"><a class="lift" href="#getInt16">getInt16</a></a><div class="clear"></div>
                <code class="signature apipage">getInt16 : [Int](http://api.haxe.org/Int.html)&nbsp;-&gt; [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="getInt32"><a class="lift" href="#getInt32">getInt32</a></a><div class="clear"></div>
                <code class="signature apipage">getInt32 : [Int](http://api.haxe.org/Int.html)&nbsp;-&gt; [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="getInt8"><a class="lift" href="#getInt8">getInt8</a></a><div class="clear"></div>
                <code class="signature apipage">getInt8 : [Int](http://api.haxe.org/Int.html)&nbsp;-&gt; [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="getUInt16"><a class="lift" href="#getUInt16">getUInt16</a></a><div class="clear"></div>
                <code class="signature apipage">getUInt16 : [Int](http://api.haxe.org/Int.html)&nbsp;-&gt; [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="getUInt32"><a class="lift" href="#getUInt32">getUInt32</a></a><div class="clear"></div>
                <code class="signature apipage">getUInt32 : [Int](http://api.haxe.org/Int.html)&nbsp;-&gt; [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="getUInt8"><a class="lift" href="#getUInt8">getUInt8</a></a><div class="clear"></div>
                <code class="signature apipage">getUInt8 : [Int](http://api.haxe.org/Int.html)&nbsp;-&gt; [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="setFloat32"><a class="lift" href="#setFloat32">setFloat32</a></a><div class="clear"></div>
                <code class="signature apipage">setFloat32 : [Int](http://api.haxe.org/Int.html)&nbsp; -&gt; [Float](http://api.haxe.org/Float.html)&nbsp;-&gt; [Void](http://api.haxe.org/Void.html)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="setInt16"><a class="lift" href="#setInt16">setInt16</a></a><div class="clear"></div>
                <code class="signature apipage">setInt16 : [Int](http://api.haxe.org/Int.html)&nbsp; -&gt; [Int](http://api.haxe.org/Int.html)&nbsp;-&gt; [Void](http://api.haxe.org/Void.html)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="setInt32"><a class="lift" href="#setInt32">setInt32</a></a><div class="clear"></div>
                <code class="signature apipage">setInt32 : [Int](http://api.haxe.org/Int.html)&nbsp; -&gt; [Int](http://api.haxe.org/Int.html)&nbsp;-&gt; [Void](http://api.haxe.org/Void.html)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="setInt8"><a class="lift" href="#setInt8">setInt8</a></a><div class="clear"></div>
                <code class="signature apipage">setInt8 : [Int](http://api.haxe.org/Int.html)&nbsp; -&gt; [Int](http://api.haxe.org/Int.html)&nbsp;-&gt; [Void](http://api.haxe.org/Void.html)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="setUInt16"><a class="lift" href="#setUInt16">setUInt16</a></a><div class="clear"></div>
                <code class="signature apipage">setUInt16 : [Int](http://api.haxe.org/Int.html)&nbsp; -&gt; [Int](http://api.haxe.org/Int.html)&nbsp;-&gt; [Void](http://api.haxe.org/Void.html)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="setUInt32"><a class="lift" href="#setUInt32">setUInt32</a></a><div class="clear"></div>
                <code class="signature apipage">setUInt32 : [Int](http://api.haxe.org/Int.html)&nbsp; -&gt; [Int](http://api.haxe.org/Int.html)&nbsp;-&gt; [Void](http://api.haxe.org/Void.html)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="setUInt8"><a class="lift" href="#setUInt8">setUInt8</a></a><div class="clear"></div>
                <code class="signature apipage">setUInt8 : [Int](http://api.haxe.org/Int.html)&nbsp; -&gt; [Int](http://api.haxe.org/Int.html)&nbsp;-&gt; [Void](http://api.haxe.org/Void.html)</code><br/></span>
            <span class="small_desc_flat"></span>

<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="getByteBuffer"><a class="lift" href="#getByteBuffer">getByteBuffer</a></a><div class="clear"></div>
            <code class="signature apipage">getByteBuffer() : [snow.platform.native.utils.ByteArray](../../../api/snow/platform/native/utils/ByteArray.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="getLength"><a class="lift" href="#getLength">getLength</a></a><div class="clear"></div>
            <code class="signature apipage">getLength() : [Int](http://api.haxe.org/Int.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="getStart"><a class="lift" href="#getStart">getStart</a></a><div class="clear"></div>
            <code class="signature apipage">getStart() : [Int](http://api.haxe.org/Int.html)</code><br/><span class="small_desc_flat"></span>


</span>






<hr/>

&nbsp;
&nbsp;
&nbsp;
&nbsp;