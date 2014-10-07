
[![Logo](../../../../images/logo.png)](../../../../api/index.html)

<hr/>
<a href="#" id="search_bar" onclick="return;"><div> search API <em>(or start typing anywhere)</em> </div></a>
<hr/>

<script src="../../../../js/omnibar.js"> </script>
<link rel="stylesheet" type="text/css" href="../../../../css/omnibar.css" media="all">

<div id="omnibar"> <a href="#" onclick="return" id="omnibar_close"></a> <input id="omnibar_text" type="text" placeholder="search types..."></input></div>
<script  id="typelist" data-relpath="../../../../" data-types="snow.App,snow.AppFixedTimestep,snow.Core,snow.CoreBinding,snow.Log,snow.Snow,snow.assets.Asset,snow.assets.AssetAudio,snow.assets.AssetBytes,snow.assets.AssetImage,snow.assets.AssetSystem,snow.assets.AssetSystemBinding,snow.assets.AssetText,snow.assets.Assets,snow.audio.Audio,snow.audio.AudioSystem,snow.audio.AudioSystemBinding,snow.audio.Sound,snow.audio.SoundBinding,snow.audio.SoundStream,snow.audio._Audio.AudioHandleMap,snow.audio.openal.AL,snow.audio.openal.ALC,snow.audio.openal.Context,snow.audio.openal.Device,snow.input.Input,snow.input.InputSystem,snow.input.InputSystemBinding,snow.input.Keycodes,snow.input.MapIntBool,snow.input.MapIntFloat,snow.input.Scancodes,snow.io.IO,snow.io.IOSystem,snow.io.IOSystemBinding,snow.platform.native.Core,snow.platform.native.StaticSnow,snow.platform.native.assets.AssetSystem,snow.platform.native.audio.AudioSystem,snow.platform.native.audio.Sound,snow.platform.native.audio.SoundStream,snow.platform.native.audio.openal.AL,snow.platform.native.audio.openal.ALC,snow.platform.native.audio.openal.AudioSystem,snow.platform.native.audio.openal.Context,snow.platform.native.audio.openal.Device,snow.platform.native.audio.openal.OpenALHelper,snow.platform.native.audio.openal.Sound,snow.platform.native.audio.openal.SoundStream,snow.platform.native.audio.openal._AL.Context_Impl_,snow.platform.native.audio.openal._AL.Device_Impl_,snow.platform.native.input.InputSystem,snow.platform.native.input.sdl.ControllerEventType,snow.platform.native.input.sdl.InputSystem,snow.platform.native.input.sdl.KeyEventType,snow.platform.native.input.sdl.ModValue,snow.platform.native.input.sdl.MouseEventType,snow.platform.native.input.sdl.TouchEventType,snow.platform.native.io.IOFile,snow.platform.native.io.IOFileHandle,snow.platform.native.io.IOSystem,snow.platform.native.io._IOFile.IOFileHandle_Impl_,snow.platform.native.render.opengl.GL,snow.platform.native.render.opengl.GLActiveInfo,snow.platform.native.render.opengl.GLBuffer,snow.platform.native.render.opengl.GLContextAttributes,snow.platform.native.render.opengl.GLFBO,snow.platform.native.render.opengl.GLFramebuffer,snow.platform.native.render.opengl.GLObject,snow.platform.native.render.opengl.GLProgram,snow.platform.native.render.opengl.GLRBO,snow.platform.native.render.opengl.GLRenderbuffer,snow.platform.native.render.opengl.GLShader,snow.platform.native.render.opengl.GLShaderPrecisionFormat,snow.platform.native.render.opengl.GLTexture,snow.platform.native.render.opengl.GLUniformLocation,snow.platform.native.render.opengl._GL.GLFramebuffer_Impl_,snow.platform.native.render.opengl._GL.GLRenderbuffer_Impl_,snow.platform.native.utils.ArrayBuffer,snow.platform.native.utils.ArrayBufferView,snow.platform.native.utils.ByteArray,snow.platform.native.utils.Compression,snow.platform.native.utils.Float32Array,snow.platform.native.utils.Int16Array,snow.platform.native.utils.Int32Array,snow.platform.native.utils.Int8Array,snow.platform.native.utils.UInt16Array,snow.platform.native.utils.UInt32Array,snow.platform.native.utils.UInt8Array,snow.platform.native.utils.UInt8ClampedArray,snow.platform.native.window.WindowSystem,snow.platform.native.window.sdl.WindowSystem,snow.platform.web.assets.psd.PSD,snow.platform.web.audio.AudioSystem,snow.platform.web.audio.Sound,snow.platform.web.audio.SoundStream,snow.platform.web.audio.howlerjs.AudioParams,snow.platform.web.audio.howlerjs.AudioSystem,snow.platform.web.audio.howlerjs.Howl,snow.platform.web.audio.howlerjs.Howler,snow.platform.web.audio.howlerjs.SoundStream,snow.platform.web.audio.howlerjs.SpriteParams,snow.render.opengl.GL,snow.render.opengl.GLActiveInfo,snow.render.opengl.GLBuffer,snow.render.opengl.GLContextAttributes,snow.render.opengl.GLFramebuffer,snow.render.opengl.GLProgram,snow.render.opengl.GLRenderbuffer,snow.render.opengl.GLShader,snow.render.opengl.GLTexture,snow.render.opengl.GLUniformLocation,snow.types.AppConfig,snow.types.AppConfigNative,snow.types.AppConfigWeb,snow.types.AssetAudioOptions,snow.types.AssetBytesOptions,snow.types.AssetImageOptions,snow.types.AssetInfo,snow.types.AssetTextOptions,snow.types.AssetType,snow.types.AudioDataBlob,snow.types.AudioDataInfo,snow.types.AudioFormatType,snow.types.AudioHandle,snow.types.AudioInfo,snow.types.DisplayMode,snow.types.FileEvent,snow.types.FileEventType,snow.types.FileFilter,snow.types.GamepadDeviceEventType,snow.types.ImageInfo,snow.types.InputEvent,snow.types.InputEventType,snow.types.Key,snow.types.ModState,snow.types.Scan,snow.types.SnowConfig,snow.types.SystemEvent,snow.types.SystemEventType,snow.types.TextEventType,snow.types.WindowConfig,snow.types.WindowEvent,snow.types.WindowEventType,snow.types.WindowHandle,snow.utils.AbstractClass,snow.utils.AbstractClassBuilder,snow.utils.ArrayBuffer,snow.utils.ArrayBufferView,snow.utils.ByteArray,snow.utils.Float32Array,snow.utils.IDataInput,snow.utils.IMemoryRange,snow.utils.Int16Array,snow.utils.Int32Array,snow.utils.Int8Array,snow.utils.Libs,snow.utils.Timer,snow.utils.UInt16Array,snow.utils.UInt32Array,snow.utils.UInt8Array,snow.utils.UInt8ClampedArray,snow.utils._AbstractClass.StringMap,snow.utils.format.png.Chunk,snow.utils.format.png.Color,snow.utils.format.png.Data,snow.utils.format.png.Header,snow.utils.format.png.Reader,snow.utils.format.png.Tools,snow.utils.format.png.Writer,snow.utils.format.tools.Adler32,snow.utils.format.tools.Deflate,snow.utils.format.tools.HuffTools,snow.utils.format.tools.Huffman,snow.utils.format.tools.Inflate,snow.utils.format.tools.InflateImpl,snow.utils.format.tools.MemoryBytes,snow.utils.format.tools._InflateImpl.State,snow.utils.format.tools._InflateImpl.Window,snow.window.Window,snow.window.WindowSystem,snow.window.WindowSystemBinding,snow.window.Windowing,snow.window._Windowing.WindowHandleMap"></script>


<h1>ALC</h1>
<small>`snow.audio.openal.ALC`</small>



<hr/>

`typedef`&nbsp;alias of `snow.platform.native.audio.openal.ALC`   

<hr/>


&nbsp;
&nbsp;





<h3>Members</h3> <hr/><span class="member apipage">
                <a name="ALL_ATTRIBUTES"><a class="lift" href="#ALL_ATTRIBUTES">ALL\_ATTRIBUTES</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">ALL\_ATTRIBUTES : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="ALL_DEVICES_SPECIFIER"><a class="lift" href="#ALL_DEVICES_SPECIFIER">ALL\_DEVICES\_SPECIFIER</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">ALL\_DEVICES\_SPECIFIER : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="ATTRIBUTES_SIZE"><a class="lift" href="#ATTRIBUTES_SIZE">ATTRIBUTES\_SIZE</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">ATTRIBUTES\_SIZE : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="DEFAULT_ALL_DEVICES_SPECIFIER"><a class="lift" href="#DEFAULT_ALL_DEVICES_SPECIFIER">DEFAULT\_ALL\_DEVICES\_SPECIFIER</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">DEFAULT\_ALL\_DEVICES\_SPECIFIER : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="DEFAULT_DEVICE_SPECIFIER"><a class="lift" href="#DEFAULT_DEVICE_SPECIFIER">DEFAULT\_DEVICE\_SPECIFIER</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">DEFAULT\_DEVICE\_SPECIFIER : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="DEVICE_SPECIFIER"><a class="lift" href="#DEVICE_SPECIFIER">DEVICE\_SPECIFIER</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">DEVICE\_SPECIFIER : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="ENUMERATE_ALL_EXT"><a class="lift" href="#ENUMERATE_ALL_EXT">ENUMERATE\_ALL\_EXT</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">ENUMERATE\_ALL\_EXT : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="EXTENSIONS"><a class="lift" href="#EXTENSIONS">EXTENSIONS</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">EXTENSIONS : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="FALSE"><a class="lift" href="#FALSE">FALSE</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">FALSE : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="FREQUENCY"><a class="lift" href="#FREQUENCY">FREQUENCY</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">FREQUENCY : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="INVALID_CONTEXT"><a class="lift" href="#INVALID_CONTEXT">INVALID\_CONTEXT</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">INVALID\_CONTEXT : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="INVALID_CONTEXT_MEANING"><a class="lift" href="#INVALID_CONTEXT_MEANING">INVALID\_CONTEXT\_MEANING</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">INVALID\_CONTEXT\_MEANING : [String](http://api.haxe.org/String.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="INVALID_DEVICE"><a class="lift" href="#INVALID_DEVICE">INVALID\_DEVICE</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">INVALID\_DEVICE : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="INVALID_DEVICE_MEANING"><a class="lift" href="#INVALID_DEVICE_MEANING">INVALID\_DEVICE\_MEANING</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">INVALID\_DEVICE\_MEANING : [String](http://api.haxe.org/String.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="INVALID_ENUM"><a class="lift" href="#INVALID_ENUM">INVALID\_ENUM</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">INVALID\_ENUM : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="INVALID_ENUM_MEANING"><a class="lift" href="#INVALID_ENUM_MEANING">INVALID\_ENUM\_MEANING</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">INVALID\_ENUM\_MEANING : [String](http://api.haxe.org/String.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="INVALID_VALUE"><a class="lift" href="#INVALID_VALUE">INVALID\_VALUE</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">INVALID\_VALUE : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="INVALID_VALUE_MEANING"><a class="lift" href="#INVALID_VALUE_MEANING">INVALID\_VALUE\_MEANING</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">INVALID\_VALUE\_MEANING : [String](http://api.haxe.org/String.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="MONO_SOURCES"><a class="lift" href="#MONO_SOURCES">MONO\_SOURCES</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">MONO\_SOURCES : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="NO_ERROR"><a class="lift" href="#NO_ERROR">NO\_ERROR</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">NO\_ERROR : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="OUT_OF_MEMORY"><a class="lift" href="#OUT_OF_MEMORY">OUT\_OF\_MEMORY</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">OUT\_OF\_MEMORY : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="OUT_OF_MEMORY_MEANING"><a class="lift" href="#OUT_OF_MEMORY_MEANING">OUT\_OF\_MEMORY\_MEANING</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">OUT\_OF\_MEMORY\_MEANING : [String](http://api.haxe.org/String.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="REFRESH"><a class="lift" href="#REFRESH">REFRESH</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">REFRESH : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="STEREO_SOURCES"><a class="lift" href="#STEREO_SOURCES">STEREO\_SOURCES</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">STEREO\_SOURCES : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="SYNC"><a class="lift" href="#SYNC">SYNC</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">SYNC : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="TRUE"><a class="lift" href="#TRUE">TRUE</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">TRUE : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/>


<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="closeDevice"><a class="lift" href="#closeDevice">closeDevice</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">closeDevice(device:[snow.platform.native.audio.openal.Device](../../../../api/snow/platform/native/audio/openal/Device.html)<span></span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="createContext"><a class="lift" href="#createContext">createContext</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">createContext(device:[snow.platform.native.audio.openal.Device](../../../../api/snow/platform/native/audio/openal/Device.html)<span></span>, attrlist:[Array](http://api.haxe.org/Array.html)&lt;[Int](http://api.haxe.org/Int.html)&gt;<span>=null</span>) : [snow.platform.native.audio.openal.Context](../../../../api/snow/platform/native/audio/openal/Context.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="destroyContext"><a class="lift" href="#destroyContext">destroyContext</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">destroyContext(context:[snow.platform.native.audio.openal.Context](../../../../api/snow/platform/native/audio/openal/Context.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="getContextsDevice"><a class="lift" href="#getContextsDevice">getContextsDevice</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">getContextsDevice(context:[snow.platform.native.audio.openal.Context](../../../../api/snow/platform/native/audio/openal/Context.html)<span></span>) : [snow.platform.native.audio.openal.Device](../../../../api/snow/platform/native/audio/openal/Device.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="getCurrentContext"><a class="lift" href="#getCurrentContext">getCurrentContext</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">getCurrentContext() : [snow.platform.native.audio.openal.Context](../../../../api/snow/platform/native/audio/openal/Context.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="getError"><a class="lift" href="#getError">getError</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">getError(device:[snow.platform.native.audio.openal.Device](../../../../api/snow/platform/native/audio/openal/Device.html)<span></span>) : [Int](http://api.haxe.org/Int.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="getErrorMeaning"><a class="lift" href="#getErrorMeaning">getErrorMeaning</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">getErrorMeaning(error:[Int](http://api.haxe.org/Int.html)<span></span>) : [String](http://api.haxe.org/String.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="getIntegerv"><a class="lift" href="#getIntegerv">getIntegerv</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">getIntegerv(device:[snow.platform.native.audio.openal.Device](../../../../api/snow/platform/native/audio/openal/Device.html)<span></span>, param:[Int](http://api.haxe.org/Int.html)<span></span>, size:[Int](http://api.haxe.org/Int.html)<span></span>) : [Array](http://api.haxe.org/Array.html)&lt;[Int](http://api.haxe.org/Int.html)&gt;</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="getString"><a class="lift" href="#getString">getString</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">getString(device:[snow.platform.native.audio.openal.Device](../../../../api/snow/platform/native/audio/openal/Device.html)<span></span>, param:[Int](http://api.haxe.org/Int.html)<span></span>) : [String](http://api.haxe.org/String.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="makeContextCurrent"><a class="lift" href="#makeContextCurrent">makeContextCurrent</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">makeContextCurrent(context:[snow.platform.native.audio.openal.Context](../../../../api/snow/platform/native/audio/openal/Context.html)<span></span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="openDevice"><a class="lift" href="#openDevice">openDevice</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">openDevice(devicename:[String](http://api.haxe.org/String.html)<span>=null</span>) : [snow.platform.native.audio.openal.Device](../../../../api/snow/platform/native/audio/openal/Device.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="processContext"><a class="lift" href="#processContext">processContext</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">processContext(context:[snow.platform.native.audio.openal.Context](../../../../api/snow/platform/native/audio/openal/Context.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="suspendContext"><a class="lift" href="#suspendContext">suspendContext</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">suspendContext(context:[snow.platform.native.audio.openal.Context](../../../../api/snow/platform/native/audio/openal/Context.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>






<hr/>

&nbsp;
&nbsp;
&nbsp;
&nbsp;