
[![Logo](../../images/logo.png)](../../api/index.html)

<hr/>
<a href="#" id="search_bar" onclick="return;"><div> search API <em>(or start typing anywhere)</em> </div></a>
<hr/>

<script src="../../js/omnibar.js"> </script>
<link rel="stylesheet" type="text/css" href="../../css/omnibar.css" media="all">

<div id="omnibar"> <a href="#" onclick="return" id="omnibar_close"></a> <input id="omnibar_text" type="text" placeholder="search types..."></input></div>
<script  id="typelist" data-relpath="../../" data-types="snow.App,snow.AppFixedTimestep,snow.Snow,snow._Snow.Core,snow.api.Debug,snow.api.DebugError,snow.api.File,snow.api.FileHandle,snow.api.FileSeek,snow.api.Libs,snow.api.Promise,snow.api.PromiseError,snow.api.PromiseState,snow.api.Promises,snow.api.Timer,snow.api._Debug.LogError,snow.api._File.FileHandle_Impl_,snow.api._File.FileSeek_Impl_,snow.api._Promise.PromiseState_Impl_,snow.api.buffers.ArrayBuffer,snow.api.buffers.ArrayBufferIO,snow.api.buffers.ArrayBufferView,snow.api.buffers.Float32Array,snow.api.buffers.Float64Array,snow.api.buffers.Int16Array,snow.api.buffers.Int32Array,snow.api.buffers.Int8Array,snow.api.buffers.TAError,snow.api.buffers.TypedArrayType,snow.api.buffers.Uint16Array,snow.api.buffers.Uint32Array,snow.api.buffers.Uint8Array,snow.api.buffers.Uint8ClampedArray,snow.api.buffers._ArrayBuffer.ArrayBuffer_Impl_,snow.api.buffers._Float32Array.Float32Array_Impl_,snow.api.buffers._Float64Array.Float64Array_Impl_,snow.api.buffers._Int16Array.Int16Array_Impl_,snow.api.buffers._Int32Array.Int32Array_Impl_,snow.api.buffers._Int8Array.Int8Array_Impl_,snow.api.buffers._TypedArrayType.TypedArrayType_Impl_,snow.api.buffers._Uint16Array.Uint16Array_Impl_,snow.api.buffers._Uint32Array.Uint32Array_Impl_,snow.api.buffers._Uint8Array.Uint8Array_Impl_,snow.api.buffers._Uint8ClampedArray.Uint8ClampedArray_Impl_,snow.core.native.Core,snow.core.native._Core.StaticSnow,snow.core.native.assets.Assets,snow.core.native.assets._Assets.NativeAudioDataBlob,snow.core.native.assets._Assets.NativeAudioDataInfo,snow.core.native.assets._Assets.NativeAudioInfo,snow.core.native.audio.Audio,snow.core.native.audio.Sound,snow.core.native.input.Input,snow.core.native.io.IO,snow.core.native.window.Windowing,snow.modules.interfaces.Assets,snow.modules.interfaces.Audio,snow.modules.interfaces.IO,snow.modules.interfaces.Input,snow.modules.interfaces.Windowing,snow.modules.openal.AL,snow.modules.openal.ALC,snow.modules.openal.ALHelper,snow.modules.openal.Audio,snow.modules.openal.Context,snow.modules.openal.Device,snow.modules.openal.Sound,snow.modules.openal._AL.Context_Impl_,snow.modules.openal._AL.Device_Impl_,snow.modules.openal.sound.ALSound,snow.modules.openal.sound.ALStream,snow.modules.openal.sound.Sound,snow.modules.opengl.GL,snow.modules.opengl.GLActiveInfo,snow.modules.opengl.GLBuffer,snow.modules.opengl.GLContextAttributes,snow.modules.opengl.GLFramebuffer,snow.modules.opengl.GLProgram,snow.modules.opengl.GLRenderbuffer,snow.modules.opengl.GLShader,snow.modules.opengl.GLTexture,snow.modules.opengl.GLUniformLocation,snow.modules.opengl.native.GL,snow.modules.opengl.native.GLActiveInfo,snow.modules.opengl.native.GLBO,snow.modules.opengl.native.GLBuffer,snow.modules.opengl.native.GLContextAttributes,snow.modules.opengl.native.GLFBO,snow.modules.opengl.native.GLFramebuffer,snow.modules.opengl.native.GLObject,snow.modules.opengl.native.GLPO,snow.modules.opengl.native.GLProgram,snow.modules.opengl.native.GLRBO,snow.modules.opengl.native.GLRenderbuffer,snow.modules.opengl.native.GLSO,snow.modules.opengl.native.GLShader,snow.modules.opengl.native.GLShaderPrecisionFormat,snow.modules.opengl.native.GLTO,snow.modules.opengl.native.GLTexture,snow.modules.opengl.native.GLUniformLocation,snow.modules.opengl.native.GL_FFI,snow.modules.opengl.native._GL.GLBuffer_Impl_,snow.modules.opengl.native._GL.GLFramebuffer_Impl_,snow.modules.opengl.native._GL.GLProgram_Impl_,snow.modules.opengl.native._GL.GLRenderbuffer_Impl_,snow.modules.opengl.native._GL.GLShader_Impl_,snow.modules.opengl.native._GL.GLTexture_Impl_,snow.modules.opengl.native._GL.GLUniformLocation_Impl_,snow.modules.sdl.ControllerEventType,snow.modules.sdl.Input,snow.modules.sdl.KeyEventType,snow.modules.sdl.ModValue,snow.modules.sdl.MouseEventType,snow.modules.sdl.TouchEventType,snow.modules.sdl.Windowing,snow.modules.sdl._Input.ControllerEventType_Impl_,snow.modules.sdl._Input.KeyEventType_Impl_,snow.modules.sdl._Input.ModValue_Impl_,snow.modules.sdl._Input.MouseEventType_Impl_,snow.modules.sdl._Input.TouchEventType_Impl_,snow.system.assets.Asset,snow.system.assets.AssetBytes,snow.system.assets.AssetImage,snow.system.assets.AssetJSON,snow.system.assets.AssetText,snow.system.assets.Assets,snow.system.assets._Assets.AssetsModule,snow.system.audio.Audio,snow.system.audio.AudioModule,snow.system.audio.Sound,snow.system.input.Input,snow.system.input.Keycodes,snow.system.input.MapIntBool,snow.system.input.MapIntFloat,snow.system.input.Scancodes,snow.system.input._Input.InputModule,snow.system.io.IO,snow.system.io._IO.IOModule,snow.system.module.Assets,snow.system.module.Audio,snow.system.module.IO,snow.system.module.Input,snow.system.module.Sound,snow.system.module.Windowing,snow.system.window.Window,snow.system.window.Windowing,snow.system.window._Windowing.WindowHandleMap,snow.system.window._Windowing.WindowingModule,snow.types.AppConfig,snow.types.AppConfigNative,snow.types.AppConfigWeb,snow.types.Asset,snow.types.AssetBytes,snow.types.AssetImage,snow.types.AssetJSON,snow.types.AssetText,snow.types.AssetType,snow.types.AudioDataBlob,snow.types.AudioDataInfo,snow.types.AudioFormatType,snow.types.AudioHandle,snow.types.AudioInfo,snow.types.DisplayMode,snow.types.Error,snow.types.FileEvent,snow.types.FileEventType,snow.types.FileFilter,snow.types.GamepadDeviceEventType,snow.types.IODataOptions,snow.types.ImageInfo,snow.types.InputEvent,snow.types.InputEventType,snow.types.Key,snow.types.ModState,snow.types.OpenGLProfile,snow.types.Platform,snow.types.RenderConfig,snow.types.RenderConfigOpenGL,snow.types.Scan,snow.types.SnowConfig,snow.types.SystemEvent,snow.types.SystemEventType,snow.types.TextEventType,snow.types.WindowConfig,snow.types.WindowEvent,snow.types.WindowEventType,snow.types.WindowHandle,snow.types.WindowingConfig,snow.types._Types.AssetType_Impl_,snow.types._Types.AudioFormatType_Impl_,snow.types._Types.FileEventType_Impl_,snow.types._Types.GamepadDeviceEventType_Impl_,snow.types._Types.InputEventType_Impl_,snow.types._Types.OpenGLProfile_Impl_,snow.types._Types.Platform_Impl_,snow.types._Types.SystemEventType_Impl_,snow.types._Types.TextEventType_Impl_,snow.types._Types.WindowEventType_Impl_"></script>


<h1>Snow</h1>
<small>`snow.Snow`</small>



<hr/>

`class`<br/><span class="meta">
meta: @:directlyUsed, @:keep</span>

<hr/>


&nbsp;
&nbsp;




<h3>Members</h3> <hr/><span class="member apipage">
                <a name="assets"><a class="lift" href="#assets">assets</a></a><div class="clear"></div>
                <code class="signature apipage">assets : [snow.system.assets.Assets](../../api/snow/system/assets/Assets.html)</code><br/></span>
            <span class="small_desc_flat">The asset system</span><br/><span class="member apipage">
                <a name="audio"><a class="lift" href="#audio">audio</a></a><div class="clear"></div>
                <code class="signature apipage">audio : [snow.system.audio.Audio](../../api/snow/system/audio/Audio.html)</code><br/></span>
            <span class="small_desc_flat">The audio system</span><br/><span class="member apipage">
                <a name="config"><a class="lift" href="#config">config</a></a><div class="clear"></div>
                <code class="signature apipage">config : [snow.types.AppConfig](../../api/snow/types/AppConfig.html)</code><br/></span>
            <span class="small_desc_flat">The application configuration specifics (like window, runtime, and asset lists)</span><br/><span class="member apipage">
                <a name="has_shutdown"><a class="lift" href="#has_shutdown">has\_shutdown</a></a><div class="clear"></div>
                <code class="signature apipage">has\_shutdown : [Bool](http://api.haxe.org/Bool.html)</code><br/></span>
            <span class="small_desc_flat">Set if shut dow has completed</span><br/><span class="member apipage">
                <a name="host"><a class="lift" href="#host">host</a></a><div class="clear"></div>
                <code class="signature apipage">host : [snow.App](../../api/snow/App.html)</code><br/></span>
            <span class="small_desc_flat">The host application</span><br/><span class="member apipage">
                <a name="input"><a class="lift" href="#input">input</a></a><div class="clear"></div>
                <code class="signature apipage">input : [snow.system.input.Input](../../api/snow/system/input/Input.html)</code><br/></span>
            <span class="small_desc_flat">The input system</span><br/><span class="member apipage">
                <a name="io"><a class="lift" href="#io">io</a></a><div class="clear"></div>
                <code class="signature apipage">io : [snow.system.io.IO](../../api/snow/system/io/IO.html)</code><br/></span>
            <span class="small_desc_flat">The io system</span><br/><span class="member apipage">
                <a name="platform"><a class="lift" href="#platform">platform</a></a><div class="clear"></div>
                <code class="signature apipage">platform : [String](http://api.haxe.org/String.html)</code><br/></span>
            <span class="small_desc_flat">The platform identifier, a string,
            but uses `snow.types.Types.Platform` abstract enum internally</span><br/><span class="member apipage">
                <a name="shutting_down"><a class="lift" href="#shutting_down">shutting\_down</a></a><div class="clear"></div>
                <code class="signature apipage">shutting\_down : [Bool](http://api.haxe.org/Bool.html)</code><br/></span>
            <span class="small_desc_flat">Set if shut down has commenced</span><br/><span class="member apipage">
                <a name="snow_config"><a class="lift" href="#snow_config">snow\_config</a></a><div class="clear"></div>
                <code class="signature apipage">snow\_config : [snow.types.SnowConfig](../../api/snow/types/SnowConfig.html)</code><br/></span>
            <span class="small_desc_flat">The configuration for snow itself, set via build project flags</span><br/><span class="member apipage">
                <a name="window"><a class="lift" href="#window">window</a></a><div class="clear"></div>
                <code class="signature apipage">window : [snow.system.window.Window](../../api/snow/system/window/Window.html)</code><br/></span>
            <span class="small_desc_flat">If the config specifies a default window, this is it</span><br/><span class="member apipage">
                <a name="windowing"><a class="lift" href="#windowing">windowing</a></a><div class="clear"></div>
                <code class="signature apipage">windowing : [snow.system.window.Windowing](../../api/snow/system/window/Windowing.html)</code><br/></span>
            <span class="small_desc_flat">The window manager</span><br/>

<h3>Properties</h3> <hr/><span class="member apipage">
                <a name="freeze"><a class="lift" href="#freeze">freeze</a></a><div class="clear"></div>
                <code class="signature apipage">freeze : [Bool](http://api.haxe.org/Bool.html)</code><br/></span>
            <span class="small_desc_flat">Whether or not we are frozen, ignoring events i.e backgrounded/paused</span><span class="member apipage">
                <a name="time"><a class="lift" href="#time">time</a></a><div class="clear"></div>
                <code class="signature apipage">time : [Float](http://api.haxe.org/Float.html)</code><br/></span>
            <span class="small_desc_flat">The current timestamp</span><span class="member apipage">
                <a name="uniqueid"><a class="lift" href="#uniqueid">uniqueid</a></a><div class="clear"></div>
                <code class="signature apipage">uniqueid : [String](http://api.haxe.org/String.html)</code><br/></span>
            <span class="small_desc_flat">Generate a unique ID to use</span>

<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="dispatch_system_event"><a class="lift" href="#dispatch_system_event">dispatch\_system\_event</a></a><div class="clear"></div>
            <code class="signature apipage">dispatch\_system\_event(\_event:[snow.types.SystemEvent](../../api/snow/types/SystemEvent.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="next"><a class="lift" href="#next">next</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">next(func:[Dynamic](#)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Call a function at the start of the next frame,
            useful for async calls in a sync context, allowing the sync function to return safely before the onload is fired.</span>


</span>
<span class="method apipage">
            <a name="render"><a class="lift" href="#render">render</a></a><div class="clear"></div>
            <code class="signature apipage">render() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Called for you by snow, unless configured otherwise.
            Only call this manually if your render_rate is 0!</span>


</span>
<span class="method apipage">
            <a name="shutdown"><a class="lift" href="#shutdown">shutdown</a></a><div class="clear"></div>
            <code class="signature apipage">shutdown() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Shutdown the engine and quit</span>


</span>



<hr/>

&nbsp;
&nbsp;
&nbsp;
&nbsp;