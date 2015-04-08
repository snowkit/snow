
[![Logo](../../../../images/logo.png)](../../../../api/index.html)

<hr/>
<a href="#" id="search_bar" onclick="return;"><div> search API <em>(or start typing anywhere)</em> </div></a>
<hr/>

<script src="../../../../js/omnibar.js"> </script>
<link rel="stylesheet" type="text/css" href="../../../../css/omnibar.css" media="all">

<div id="omnibar"> <a href="#" onclick="return" id="omnibar_close"></a> <input id="omnibar_text" type="text" placeholder="search types..."></input></div>
<script  id="typelist" data-relpath="../../../../" data-types="snow.App,snow.AppFixedTimestep,snow.Snow,snow._Snow.Core,snow.api.Debug,snow.api.DebugError,snow.api.File,snow.api.FileHandle,snow.api.FileSeek,snow.api.Libs,snow.api.Promise,snow.api.PromiseError,snow.api.PromiseState,snow.api.Promises,snow.api.Timer,snow.api._Debug.LogError,snow.api._File.FileHandle_Impl_,snow.api._File.FileSeek_Impl_,snow.api._Promise.PromiseState_Impl_,snow.api.buffers.ArrayBuffer,snow.api.buffers.ArrayBufferIO,snow.api.buffers.ArrayBufferView,snow.api.buffers.Float32Array,snow.api.buffers.Float64Array,snow.api.buffers.Int16Array,snow.api.buffers.Int32Array,snow.api.buffers.Int8Array,snow.api.buffers.TAError,snow.api.buffers.TypedArrayType,snow.api.buffers.Uint16Array,snow.api.buffers.Uint32Array,snow.api.buffers.Uint8Array,snow.api.buffers.Uint8ClampedArray,snow.api.buffers._ArrayBuffer.ArrayBuffer_Impl_,snow.api.buffers._Float32Array.Float32Array_Impl_,snow.api.buffers._Float64Array.Float64Array_Impl_,snow.api.buffers._Int16Array.Int16Array_Impl_,snow.api.buffers._Int32Array.Int32Array_Impl_,snow.api.buffers._Int8Array.Int8Array_Impl_,snow.api.buffers._TypedArrayType.TypedArrayType_Impl_,snow.api.buffers._Uint16Array.Uint16Array_Impl_,snow.api.buffers._Uint32Array.Uint32Array_Impl_,snow.api.buffers._Uint8Array.Uint8Array_Impl_,snow.api.buffers._Uint8ClampedArray.Uint8ClampedArray_Impl_,snow.core.native.Core,snow.core.native._Core.StaticSnow,snow.core.native.assets.Assets,snow.core.native.assets._Assets.NativeAudioDataBlob,snow.core.native.assets._Assets.NativeAudioDataInfo,snow.core.native.assets._Assets.NativeAudioInfo,snow.core.native.audio.Audio,snow.core.native.audio.Sound,snow.core.native.input.Input,snow.core.native.io.IO,snow.core.native.window.Windowing,snow.modules.interfaces.Assets,snow.modules.interfaces.Audio,snow.modules.interfaces.IO,snow.modules.interfaces.Input,snow.modules.interfaces.Windowing,snow.modules.openal.AL,snow.modules.openal.ALC,snow.modules.openal.ALHelper,snow.modules.openal.Audio,snow.modules.openal.Context,snow.modules.openal.Device,snow.modules.openal.Sound,snow.modules.openal._AL.Context_Impl_,snow.modules.openal._AL.Device_Impl_,snow.modules.openal.sound.ALSound,snow.modules.openal.sound.ALStream,snow.modules.openal.sound.Sound,snow.modules.opengl.GL,snow.modules.opengl.GLActiveInfo,snow.modules.opengl.GLBuffer,snow.modules.opengl.GLContextAttributes,snow.modules.opengl.GLFramebuffer,snow.modules.opengl.GLProgram,snow.modules.opengl.GLRenderbuffer,snow.modules.opengl.GLShader,snow.modules.opengl.GLTexture,snow.modules.opengl.GLUniformLocation,snow.modules.opengl.native.GL,snow.modules.opengl.native.GLActiveInfo,snow.modules.opengl.native.GLBO,snow.modules.opengl.native.GLBuffer,snow.modules.opengl.native.GLContextAttributes,snow.modules.opengl.native.GLFBO,snow.modules.opengl.native.GLFramebuffer,snow.modules.opengl.native.GLObject,snow.modules.opengl.native.GLPO,snow.modules.opengl.native.GLProgram,snow.modules.opengl.native.GLRBO,snow.modules.opengl.native.GLRenderbuffer,snow.modules.opengl.native.GLSO,snow.modules.opengl.native.GLShader,snow.modules.opengl.native.GLShaderPrecisionFormat,snow.modules.opengl.native.GLTO,snow.modules.opengl.native.GLTexture,snow.modules.opengl.native.GLUniformLocation,snow.modules.opengl.native.GL_FFI,snow.modules.opengl.native._GL.GLBuffer_Impl_,snow.modules.opengl.native._GL.GLFramebuffer_Impl_,snow.modules.opengl.native._GL.GLProgram_Impl_,snow.modules.opengl.native._GL.GLRenderbuffer_Impl_,snow.modules.opengl.native._GL.GLShader_Impl_,snow.modules.opengl.native._GL.GLTexture_Impl_,snow.modules.opengl.native._GL.GLUniformLocation_Impl_,snow.modules.sdl.ControllerEventType,snow.modules.sdl.Input,snow.modules.sdl.KeyEventType,snow.modules.sdl.ModValue,snow.modules.sdl.MouseEventType,snow.modules.sdl.TouchEventType,snow.modules.sdl.Windowing,snow.modules.sdl._Input.ControllerEventType_Impl_,snow.modules.sdl._Input.KeyEventType_Impl_,snow.modules.sdl._Input.ModValue_Impl_,snow.modules.sdl._Input.MouseEventType_Impl_,snow.modules.sdl._Input.TouchEventType_Impl_,snow.system.assets.Asset,snow.system.assets.AssetBytes,snow.system.assets.AssetImage,snow.system.assets.AssetJSON,snow.system.assets.AssetText,snow.system.assets.Assets,snow.system.assets._Assets.AssetsModule,snow.system.audio.Audio,snow.system.audio.AudioModule,snow.system.audio.Sound,snow.system.input.Input,snow.system.input.Keycodes,snow.system.input.MapIntBool,snow.system.input.MapIntFloat,snow.system.input.Scancodes,snow.system.input._Input.InputModule,snow.system.io.IO,snow.system.io._IO.IOModule,snow.system.module.Assets,snow.system.module.Audio,snow.system.module.IO,snow.system.module.Input,snow.system.module.Sound,snow.system.module.Windowing,snow.system.window.Window,snow.system.window.Windowing,snow.system.window._Windowing.WindowHandleMap,snow.system.window._Windowing.WindowingModule,snow.types.AppConfig,snow.types.AppConfigNative,snow.types.AppConfigWeb,snow.types.Asset,snow.types.AssetBytes,snow.types.AssetImage,snow.types.AssetJSON,snow.types.AssetText,snow.types.AssetType,snow.types.AudioDataBlob,snow.types.AudioDataInfo,snow.types.AudioFormatType,snow.types.AudioHandle,snow.types.AudioInfo,snow.types.DisplayMode,snow.types.Error,snow.types.FileEvent,snow.types.FileEventType,snow.types.FileFilter,snow.types.GamepadDeviceEventType,snow.types.IODataOptions,snow.types.ImageInfo,snow.types.InputEvent,snow.types.InputEventType,snow.types.Key,snow.types.ModState,snow.types.OpenGLProfile,snow.types.RenderConfig,snow.types.RenderConfigOpenGL,snow.types.Scan,snow.types.SnowConfig,snow.types.SystemEvent,snow.types.SystemEventType,snow.types.TextEventType,snow.types.WindowConfig,snow.types.WindowEvent,snow.types.WindowEventType,snow.types.WindowHandle,snow.types.WindowingConfig,snow.types._Types.AssetType_Impl_,snow.types._Types.AudioFormatType_Impl_,snow.types._Types.FileEventType_Impl_,snow.types._Types.GamepadDeviceEventType_Impl_,snow.types._Types.InputEventType_Impl_,snow.types._Types.OpenGLProfile_Impl_,snow.types._Types.SystemEventType_Impl_,snow.types._Types.TextEventType_Impl_,snow.types._Types.WindowEventType_Impl_"></script>


<h1>Windowing</h1>
<small>`snow.system.window.Windowing`</small>

The window manager, accessed via `app.window`

<hr/>

`class`<br/><span class="meta">
meta: @:directlyUsed, @:keep, @:allow(snow.Snow), @:allow(snow.system.window.Window)</span>

<hr/>


&nbsp;
&nbsp;




<h3>Members</h3> <hr/><span class="member apipage">
                <a name="window_count"><a class="lift" href="#window_count">window\_count</a></a><div class="clear"></div>
                <code class="signature apipage">window\_count : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat">The number of windows in this manager</span><br/><span class="member apipage">
                <a name="window_handles"><a class="lift" href="#window_handles">window\_handles</a></a><div class="clear"></div>
                <code class="signature apipage">window\_handles : [snow.system.window._Windowing.WindowHandleMap](../../../../api/snow/system/window/_Windowing/WindowHandleMap.html)</code><br/></span>
            <span class="small_desc_flat">The list of window handles, pointing to id's in the `window_list`</span><br/><span class="member apipage">
                <a name="window_list"><a class="lift" href="#window_list">window\_list</a></a><div class="clear"></div>
                <code class="signature apipage">window\_list : [Map](http://api.haxe.org/Map.html)&lt;[Int](http://api.haxe.org/Int.html), [snow.system.window.Window](../../../../api/snow/system/window/Window.html)&gt;</code><br/></span>
            <span class="small_desc_flat">The list of windows in this manager</span><br/>


<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="create"><a class="lift" href="#create">create</a></a><div class="clear"></div>
            <code class="signature apipage">create(\_config:[snow.types.WindowConfig](../../../../api/snow/types/WindowConfig.html)<span></span>) : [snow.system.window.Window](../../../../api/snow/system/window/Window.html)</code><br/><span class="small_desc_flat">Create a window with the given config.</span>


</span>
<span class="method apipage">
            <a name="display_bounds"><a class="lift" href="#display_bounds">display\_bounds</a></a><div class="clear"></div>
            <code class="signature apipage">display\_bounds(display:[Int](http://api.haxe.org/Int.html)<span></span>) : [Dynamic](#)</code><br/><span class="small_desc_flat">Get the bounds of the display by index</span>


</span>
<span class="method apipage">
            <a name="display_count"><a class="lift" href="#display_count">display\_count</a></a><div class="clear"></div>
            <code class="signature apipage">display\_count() : [Int](http://api.haxe.org/Int.html)</code><br/><span class="small_desc_flat">Get the number of displays present</span>


</span>
<span class="method apipage">
            <a name="display_current_mode"><a class="lift" href="#display_current_mode">display\_current\_mode</a></a><div class="clear"></div>
            <code class="signature apipage">display\_current\_mode(display:[Int](http://api.haxe.org/Int.html)<span></span>) : [snow.types.DisplayMode](../../../../api/snow/types/DisplayMode.html)</code><br/><span class="small_desc_flat">Get the current mode information of the display by index</span>


</span>
<span class="method apipage">
            <a name="display_mode"><a class="lift" href="#display_mode">display\_mode</a></a><div class="clear"></div>
            <code class="signature apipage">display\_mode(display:[Int](http://api.haxe.org/Int.html)<span></span>, mode\_index:[Int](http://api.haxe.org/Int.html)<span></span>) : [snow.types.DisplayMode](../../../../api/snow/types/DisplayMode.html)</code><br/><span class="small_desc_flat">Get the information from a specific mode index, the index is obtained by iterating with a `display_mode_count` as the loop value</span>


</span>
<span class="method apipage">
            <a name="display_mode_count"><a class="lift" href="#display_mode_count">display\_mode\_count</a></a><div class="clear"></div>
            <code class="signature apipage">display\_mode\_count(display:[Int](http://api.haxe.org/Int.html)<span></span>) : [Int](http://api.haxe.org/Int.html)</code><br/><span class="small_desc_flat">Get the number of display modes present</span>


</span>
<span class="method apipage">
            <a name="display_name"><a class="lift" href="#display_name">display\_name</a></a><div class="clear"></div>
            <code class="signature apipage">display\_name(display:[Int](http://api.haxe.org/Int.html)<span></span>) : [String](http://api.haxe.org/String.html)</code><br/><span class="small_desc_flat">Get the name of the display by index, where available</span>


</span>
<span class="method apipage">
            <a name="display_native_mode"><a class="lift" href="#display_native_mode">display\_native\_mode</a></a><div class="clear"></div>
            <code class="signature apipage">display\_native\_mode(display:[Int](http://api.haxe.org/Int.html)<span></span>) : [snow.types.DisplayMode](../../../../api/snow/types/DisplayMode.html)</code><br/><span class="small_desc_flat">Get the native mode information of the display by index</span>


</span>
<span class="method apipage">
            <a name="enable_cursor"><a class="lift" href="#enable_cursor">enable\_cursor</a></a><div class="clear"></div>
            <code class="signature apipage">enable\_cursor(\_enable:[Bool](http://api.haxe.org/Bool.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Toggle the OS cursor. This is not window specific but application wide, when inside a window, the OS cursor is hidden.</span>


</span>
<span class="method apipage">
            <a name="enable_cursor_lock"><a class="lift" href="#enable_cursor_lock">enable\_cursor\_lock</a></a><div class="clear"></div>
            <code class="signature apipage">enable\_cursor\_lock(\_enable:[Bool](http://api.haxe.org/Bool.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Lock the OS cursor to the foreground window. This hides the cursor and prevents it from leaving, reporting relative coordinates.</span>


</span>
<span class="method apipage">
            <a name="enable_vsync"><a class="lift" href="#enable_vsync">enable\_vsync</a></a><div class="clear"></div>
            <code class="signature apipage">enable\_vsync(\_enable:[Bool](http://api.haxe.org/Bool.html)<span></span>) : [Int](http://api.haxe.org/Int.html)</code><br/><span class="small_desc_flat">Toggle vertical refresh. This is not window specific but context wide</span>


</span>



<hr/>

&nbsp;
&nbsp;
&nbsp;
&nbsp;