
[![Logo](../../../../images/logo.png)](../../../../api/index.html)

<hr/>
<a href="#" id="search_bar" onclick="return;"><div> search API <em>(or start typing anywhere)</em> </div></a>
<hr/>

<script src="../../../../js/omnibar.js"> </script>
<link rel="stylesheet" type="text/css" href="../../../../css/omnibar.css" media="all">

<div id="omnibar"> <a href="#" onclick="return" id="omnibar_close"></a> <input id="omnibar_text" type="text" placeholder="search types..."></input></div>
<script  id="typelist" data-relpath="../../../../" data-types="snow.App,snow.AppFixedTimestep,snow.Snow,snow._Snow.Core,snow.api.Debug,snow.api.DebugError,snow.api.File,snow.api.FileHandle,snow.api.FileSeek,snow.api.Libs,snow.api.Promise,snow.api.PromiseError,snow.api.PromiseState,snow.api.Promises,snow.api.Timer,snow.api._Debug.LogError,snow.api._File.FileHandle_Impl_,snow.api._File.FileSeek_Impl_,snow.api._Promise.PromiseState_Impl_,snow.api.buffers.ArrayBuffer,snow.api.buffers.ArrayBufferIO,snow.api.buffers.ArrayBufferView,snow.api.buffers.Float32Array,snow.api.buffers.Float64Array,snow.api.buffers.Int16Array,snow.api.buffers.Int32Array,snow.api.buffers.Int8Array,snow.api.buffers.TAError,snow.api.buffers.TypedArrayType,snow.api.buffers.Uint16Array,snow.api.buffers.Uint32Array,snow.api.buffers.Uint8Array,snow.api.buffers.Uint8ClampedArray,snow.api.buffers._ArrayBuffer.ArrayBuffer_Impl_,snow.api.buffers._Float32Array.Float32Array_Impl_,snow.api.buffers._Float64Array.Float64Array_Impl_,snow.api.buffers._Int16Array.Int16Array_Impl_,snow.api.buffers._Int32Array.Int32Array_Impl_,snow.api.buffers._Int8Array.Int8Array_Impl_,snow.api.buffers._TypedArrayType.TypedArrayType_Impl_,snow.api.buffers._Uint16Array.Uint16Array_Impl_,snow.api.buffers._Uint32Array.Uint32Array_Impl_,snow.api.buffers._Uint8Array.Uint8Array_Impl_,snow.api.buffers._Uint8ClampedArray.Uint8ClampedArray_Impl_,snow.core.native.Core,snow.core.native._Core.StaticSnow,snow.core.native.assets.Assets,snow.core.native.assets._Assets.NativeAudioDataBlob,snow.core.native.assets._Assets.NativeAudioDataInfo,snow.core.native.assets._Assets.NativeAudioInfo,snow.core.native.audio.Audio,snow.core.native.audio.Sound,snow.core.native.input.Input,snow.core.native.io.IO,snow.core.native.window.Windowing,snow.modules.interfaces.Assets,snow.modules.interfaces.Audio,snow.modules.interfaces.IO,snow.modules.interfaces.Input,snow.modules.interfaces.Windowing,snow.modules.openal.AL,snow.modules.openal.ALC,snow.modules.openal.ALHelper,snow.modules.openal.Audio,snow.modules.openal.Context,snow.modules.openal.Device,snow.modules.openal.Sound,snow.modules.openal._AL.Context_Impl_,snow.modules.openal._AL.Device_Impl_,snow.modules.openal.sound.ALSound,snow.modules.openal.sound.ALStream,snow.modules.openal.sound.Sound,snow.modules.opengl.GL,snow.modules.opengl.GLActiveInfo,snow.modules.opengl.GLBuffer,snow.modules.opengl.GLContextAttributes,snow.modules.opengl.GLFramebuffer,snow.modules.opengl.GLProgram,snow.modules.opengl.GLRenderbuffer,snow.modules.opengl.GLShader,snow.modules.opengl.GLTexture,snow.modules.opengl.GLUniformLocation,snow.modules.opengl.native.GL,snow.modules.opengl.native.GLActiveInfo,snow.modules.opengl.native.GLBO,snow.modules.opengl.native.GLBuffer,snow.modules.opengl.native.GLContextAttributes,snow.modules.opengl.native.GLFBO,snow.modules.opengl.native.GLFramebuffer,snow.modules.opengl.native.GLObject,snow.modules.opengl.native.GLPO,snow.modules.opengl.native.GLProgram,snow.modules.opengl.native.GLRBO,snow.modules.opengl.native.GLRenderbuffer,snow.modules.opengl.native.GLSO,snow.modules.opengl.native.GLShader,snow.modules.opengl.native.GLShaderPrecisionFormat,snow.modules.opengl.native.GLTO,snow.modules.opengl.native.GLTexture,snow.modules.opengl.native.GLUniformLocation,snow.modules.opengl.native.GL_FFI,snow.modules.opengl.native._GL.GLBuffer_Impl_,snow.modules.opengl.native._GL.GLFramebuffer_Impl_,snow.modules.opengl.native._GL.GLProgram_Impl_,snow.modules.opengl.native._GL.GLRenderbuffer_Impl_,snow.modules.opengl.native._GL.GLShader_Impl_,snow.modules.opengl.native._GL.GLTexture_Impl_,snow.modules.opengl.native._GL.GLUniformLocation_Impl_,snow.modules.sdl.ControllerEventType,snow.modules.sdl.Input,snow.modules.sdl.KeyEventType,snow.modules.sdl.ModValue,snow.modules.sdl.MouseEventType,snow.modules.sdl.TouchEventType,snow.modules.sdl.Windowing,snow.modules.sdl._Input.ControllerEventType_Impl_,snow.modules.sdl._Input.KeyEventType_Impl_,snow.modules.sdl._Input.ModValue_Impl_,snow.modules.sdl._Input.MouseEventType_Impl_,snow.modules.sdl._Input.TouchEventType_Impl_,snow.system.assets.Asset,snow.system.assets.AssetBytes,snow.system.assets.AssetImage,snow.system.assets.AssetJSON,snow.system.assets.AssetText,snow.system.assets.Assets,snow.system.assets._Assets.AssetsModule,snow.system.audio.Audio,snow.system.audio.AudioModule,snow.system.audio.Sound,snow.system.input.Input,snow.system.input.Keycodes,snow.system.input.MapIntBool,snow.system.input.MapIntFloat,snow.system.input.Scancodes,snow.system.input._Input.InputModule,snow.system.io.IO,snow.system.io._IO.IOModule,snow.system.module.Assets,snow.system.module.Audio,snow.system.module.IO,snow.system.module.Input,snow.system.module.Sound,snow.system.module.Windowing,snow.system.window.Window,snow.system.window.Windowing,snow.system.window._Windowing.WindowHandleMap,snow.system.window._Windowing.WindowingModule,snow.types.AppConfig,snow.types.AppConfigNative,snow.types.AppConfigWeb,snow.types.Asset,snow.types.AssetBytes,snow.types.AssetImage,snow.types.AssetJSON,snow.types.AssetText,snow.types.AssetType,snow.types.AudioDataBlob,snow.types.AudioDataInfo,snow.types.AudioFormatType,snow.types.AudioHandle,snow.types.AudioInfo,snow.types.DisplayMode,snow.types.Error,snow.types.FileEvent,snow.types.FileEventType,snow.types.FileFilter,snow.types.GamepadDeviceEventType,snow.types.IODataOptions,snow.types.ImageInfo,snow.types.InputEvent,snow.types.InputEventType,snow.types.Key,snow.types.ModState,snow.types.OpenGLProfile,snow.types.RenderConfig,snow.types.RenderConfigOpenGL,snow.types.Scan,snow.types.SnowConfig,snow.types.SystemEvent,snow.types.SystemEventType,snow.types.TextEventType,snow.types.WindowConfig,snow.types.WindowEvent,snow.types.WindowEventType,snow.types.WindowHandle,snow.types.WindowingConfig,snow.types._Types.AssetType_Impl_,snow.types._Types.AudioFormatType_Impl_,snow.types._Types.FileEventType_Impl_,snow.types._Types.GamepadDeviceEventType_Impl_,snow.types._Types.InputEventType_Impl_,snow.types._Types.OpenGLProfile_Impl_,snow.types._Types.SystemEventType_Impl_,snow.types._Types.TextEventType_Impl_,snow.types._Types.WindowEventType_Impl_"></script>


<h1>ALC</h1>
<small>`snow.modules.openal.ALC`</small>



<hr/>

`class`<br/><span class="meta">
meta: @:directlyUsed, @:keep</span>

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
            <code class="signature apipage">closeDevice(device:[snow.modules.openal.Device](../../../../api/snow/modules/openal/Device.html)<span></span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="createContext"><a class="lift" href="#createContext">createContext</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">createContext(device:[snow.modules.openal.Device](../../../../api/snow/modules/openal/Device.html)<span></span>, attrlist:[Array](http://api.haxe.org/Array.html)&lt;[Int](http://api.haxe.org/Int.html)&gt;<span></span>) : [snow.modules.openal.Context](../../../../api/snow/modules/openal/Context.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="destroyContext"><a class="lift" href="#destroyContext">destroyContext</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">destroyContext(context:[snow.modules.openal.Context](../../../../api/snow/modules/openal/Context.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="getContextsDevice"><a class="lift" href="#getContextsDevice">getContextsDevice</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">getContextsDevice(context:[snow.modules.openal.Context](../../../../api/snow/modules/openal/Context.html)<span></span>) : [snow.modules.openal.Device](../../../../api/snow/modules/openal/Device.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="getCurrentContext"><a class="lift" href="#getCurrentContext">getCurrentContext</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">getCurrentContext() : [snow.modules.openal.Context](../../../../api/snow/modules/openal/Context.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="getError"><a class="lift" href="#getError">getError</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">getError(device:[snow.modules.openal.Device](../../../../api/snow/modules/openal/Device.html)<span></span>) : [Int](http://api.haxe.org/Int.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="getErrorMeaning"><a class="lift" href="#getErrorMeaning">getErrorMeaning</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">getErrorMeaning(error:[Int](http://api.haxe.org/Int.html)<span></span>) : [String](http://api.haxe.org/String.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="getIntegerv"><a class="lift" href="#getIntegerv">getIntegerv</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">getIntegerv(device:[snow.modules.openal.Device](../../../../api/snow/modules/openal/Device.html)<span></span>, param:[Int](http://api.haxe.org/Int.html)<span></span>, size:[Int](http://api.haxe.org/Int.html)<span></span>) : [Array](http://api.haxe.org/Array.html)&lt;[Int](http://api.haxe.org/Int.html)&gt;</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="getString"><a class="lift" href="#getString">getString</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">getString(device:[snow.modules.openal.Device](../../../../api/snow/modules/openal/Device.html)<span></span>, param:[Int](http://api.haxe.org/Int.html)<span></span>) : [String](http://api.haxe.org/String.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="makeContextCurrent"><a class="lift" href="#makeContextCurrent">makeContextCurrent</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">makeContextCurrent(context:[snow.modules.openal.Context](../../../../api/snow/modules/openal/Context.html)<span></span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="openDevice"><a class="lift" href="#openDevice">openDevice</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">openDevice(devicename:[String](http://api.haxe.org/String.html)<span></span>) : [snow.modules.openal.Device](../../../../api/snow/modules/openal/Device.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="processContext"><a class="lift" href="#processContext">processContext</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">processContext(context:[snow.modules.openal.Context](../../../../api/snow/modules/openal/Context.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="suspendContext"><a class="lift" href="#suspendContext">suspendContext</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">suspendContext(context:[snow.modules.openal.Context](../../../../api/snow/modules/openal/Context.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>



<hr/>

&nbsp;
&nbsp;
&nbsp;
&nbsp;