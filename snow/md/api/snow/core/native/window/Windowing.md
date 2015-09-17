
[![Logo](../../../../../images/logo.png)](../../../../../api/index.html)

<hr/>
<a href="#" id="search_bar" onclick="return;"><div> search API <em>(or start typing anywhere)</em> </div></a>
<hr/>

<script src="../../../../../js/omnibar.js"> </script>
<link rel="stylesheet" type="text/css" href="../../../../../css/omnibar.css" media="all">

<div id="omnibar"> <a href="#" onclick="return" id="omnibar_close"></a> <input id="omnibar_text" type="text" placeholder="search types..."></input></div>
<script  id="typelist" data-relpath="../../../../../" data-types="snow.App,snow.AppFixedTimestep,snow.Snow,snow._Snow.Core,snow.api.Debug,snow.api.DebugError,snow.api.File,snow.api.FileHandle,snow.api.FileSeek,snow.api.Libs,snow.api.Promise,snow.api.PromiseError,snow.api.PromiseState,snow.api.Promises,snow.api.Timer,snow.api._Debug.LogError,snow.api._File.FileHandle_Impl_,snow.api._File.FileSeek_Impl_,snow.api._Promise.PromiseState_Impl_,snow.api.buffers.ArrayBuffer,snow.api.buffers.ArrayBufferIO,snow.api.buffers.ArrayBufferView,snow.api.buffers.DataView,snow.api.buffers.Float32Array,snow.api.buffers.Float64Array,snow.api.buffers.Int16Array,snow.api.buffers.Int32Array,snow.api.buffers.Int8Array,snow.api.buffers.TAError,snow.api.buffers.TypedArrayType,snow.api.buffers.Uint16Array,snow.api.buffers.Uint32Array,snow.api.buffers.Uint8Array,snow.api.buffers.Uint8ClampedArray,snow.api.buffers._ArrayBuffer.ArrayBuffer_Impl_,snow.api.buffers._Float32Array.Float32Array_Impl_,snow.api.buffers._Float64Array.Float64Array_Impl_,snow.api.buffers._Int16Array.Int16Array_Impl_,snow.api.buffers._Int32Array.Int32Array_Impl_,snow.api.buffers._Int8Array.Int8Array_Impl_,snow.api.buffers._TypedArrayType.TypedArrayType_Impl_,snow.api.buffers._Uint16Array.Uint16Array_Impl_,snow.api.buffers._Uint32Array.Uint32Array_Impl_,snow.api.buffers._Uint8Array.Uint8Array_Impl_,snow.api.buffers._Uint8ClampedArray.Uint8ClampedArray_Impl_,snow.core.native.Core,snow.core.native._Core.StaticSnow,snow.core.native.assets.Assets,snow.core.native.assets._Assets.NativeAudioDataBlob,snow.core.native.assets._Assets.NativeAudioDataInfo,snow.core.native.assets._Assets.NativeAudioInfo,snow.core.native.audio.Audio,snow.core.native.audio.Sound,snow.core.native.input.Input,snow.core.native.io.IO,snow.core.native.window.Windowing,snow.core.web.assets.psd.PSD,snow.core.web.input.DOMKeys,snow.modules.interfaces.Assets,snow.modules.interfaces.Audio,snow.modules.interfaces.IO,snow.modules.interfaces.Input,snow.modules.interfaces.Windowing,snow.modules.openal.AL,snow.modules.openal.ALC,snow.modules.openal.ALHelper,snow.modules.openal.Audio,snow.modules.openal.Context,snow.modules.openal.Device,snow.modules.openal.Sound,snow.modules.openal._AL.Context_Impl_,snow.modules.openal._AL.Device_Impl_,snow.modules.openal.sound.ALSound,snow.modules.openal.sound.ALStream,snow.modules.openal.sound.Sound,snow.modules.opengl.GL,snow.modules.opengl.GLActiveInfo,snow.modules.opengl.GLBuffer,snow.modules.opengl.GLContextAttributes,snow.modules.opengl.GLFramebuffer,snow.modules.opengl.GLProgram,snow.modules.opengl.GLRenderbuffer,snow.modules.opengl.GLShader,snow.modules.opengl.GLTexture,snow.modules.opengl.GLUniformLocation,snow.modules.opengl.native.GL,snow.modules.opengl.native.GLActiveInfo,snow.modules.opengl.native.GLBO,snow.modules.opengl.native.GLBuffer,snow.modules.opengl.native.GLContextAttributes,snow.modules.opengl.native.GLFBO,snow.modules.opengl.native.GLFramebuffer,snow.modules.opengl.native.GLLink,snow.modules.opengl.native.GLObject,snow.modules.opengl.native.GLPO,snow.modules.opengl.native.GLProgram,snow.modules.opengl.native.GLProxy,snow.modules.opengl.native.GLRBO,snow.modules.opengl.native.GLRenderbuffer,snow.modules.opengl.native.GLSO,snow.modules.opengl.native.GLShader,snow.modules.opengl.native.GLShaderPrecisionFormat,snow.modules.opengl.native.GLTO,snow.modules.opengl.native.GLTexture,snow.modules.opengl.native.GLUniformLocation,snow.modules.opengl.native.GL_FFI,snow.modules.opengl.native.GL_Native,snow.modules.opengl.native._GL.GLBuffer_Impl_,snow.modules.opengl.native._GL.GLFramebuffer_Impl_,snow.modules.opengl.native._GL.GLProgram_Impl_,snow.modules.opengl.native._GL.GLRenderbuffer_Impl_,snow.modules.opengl.native._GL.GLShader_Impl_,snow.modules.opengl.native._GL.GLTexture_Impl_,snow.modules.opengl.native._GL.GLUniformLocation_Impl_,snow.modules.sdl.Input,snow.modules.sdl.Windowing,snow.modules.sdl._Input.ControllerEventType,snow.modules.sdl._Input.ControllerEventType_Impl_,snow.modules.sdl._Input.JosytickEventType,snow.modules.sdl._Input.JosytickEventType_Impl_,snow.modules.sdl._Input.KeyEventType,snow.modules.sdl._Input.KeyEventType_Impl_,snow.modules.sdl._Input.ModValue,snow.modules.sdl._Input.ModValue_Impl_,snow.modules.sdl._Input.MouseEventType,snow.modules.sdl._Input.MouseEventType_Impl_,snow.modules.sdl._Input.SDLControllerEvent,snow.modules.sdl._Input.SDLJoystickEvent,snow.modules.sdl._Input.SDLKeyEvent,snow.modules.sdl._Input.SDLMouseEvent,snow.modules.sdl._Input.SDLTouchEvent,snow.modules.sdl._Input.TouchEventType,snow.modules.sdl._Input.TouchEventType_Impl_,snow.system.assets.Asset,snow.system.assets.AssetBytes,snow.system.assets.AssetImage,snow.system.assets.AssetJSON,snow.system.assets.AssetText,snow.system.assets.Assets,snow.system.assets._Assets.AssetsModule,snow.system.audio.Audio,snow.system.audio.AudioModule,snow.system.audio.Sound,snow.system.input.Input,snow.system.input.Keycodes,snow.system.input.MapIntBool,snow.system.input.MapIntFloat,snow.system.input.Scancodes,snow.system.input._Input.InputModule,snow.system.io.IO,snow.system.io._IO.IOModule,snow.system.module.Assets,snow.system.module.Audio,snow.system.module.IO,snow.system.module.Input,snow.system.module.Sound,snow.system.module.Windowing,snow.system.window.Window,snow.system.window.Windowing,snow.system.window._Windowing.WindowHandleMap,snow.system.window._Windowing.WindowingModule,snow.types.AppConfig,snow.types.AppConfigNative,snow.types.AppConfigWeb,snow.types.Asset,snow.types.AssetBytes,snow.types.AssetImage,snow.types.AssetJSON,snow.types.AssetText,snow.types.AssetType,snow.types.AudioDataBlob,snow.types.AudioDataInfo,snow.types.AudioFormatType,snow.types.AudioHandle,snow.types.AudioInfo,snow.types.DisplayMode,snow.types.Error,snow.types.FileEvent,snow.types.FileEventType,snow.types.FileFilter,snow.types.GamepadDeviceEventType,snow.types.IODataOptions,snow.types.ImageInfo,snow.types.InputEvent,snow.types.InputEventType,snow.types.Key,snow.types.ModState,snow.types.OS,snow.types.OpenGLProfile,snow.types.Platform,snow.types.RenderConfig,snow.types.RenderConfigOpenGL,snow.types.Scan,snow.types.SnowConfig,snow.types.SystemEvent,snow.types.SystemEventType,snow.types.TextEventType,snow.types.WindowConfig,snow.types.WindowEvent,snow.types.WindowEventType,snow.types.WindowHandle,snow.types.WindowingConfig,snow.types._Types.AssetType_Impl_,snow.types._Types.AudioFormatType_Impl_,snow.types._Types.FileEventType_Impl_,snow.types._Types.GamepadDeviceEventType_Impl_,snow.types._Types.InputEventType_Impl_,snow.types._Types.OS_Impl_,snow.types._Types.OpenGLProfile_Impl_,snow.types._Types.Platform_Impl_,snow.types._Types.SystemEventType_Impl_,snow.types._Types.TextEventType_Impl_,snow.types._Types.WindowEventType_Impl_"></script>


<h1>Windowing</h1>
<small>`snow.core.native.window.Windowing`</small>



<hr/>

`class`<br/>implements <code><span>snow.modules.interfaces.Windowing</span></code><br/><span class="meta">
meta: @:directlyUsed, @:allow(snow.system.window.Windowing)</span>

<hr/>


&nbsp;
&nbsp;




<h3>Members</h3> <hr/>


<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="bordered"><a class="lift" href="#bordered">bordered</a></a><div class="clear"></div>
            <code class="signature apipage">bordered(window:[snow.system.window.Window](../../../../../api/snow/system/window/Window.html)<span></span>, bordered:[Bool](http://api.haxe.org/Bool.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="close"><a class="lift" href="#close">close</a></a><div class="clear"></div>
            <code class="signature apipage">close(window:[snow.system.window.Window](../../../../../api/snow/system/window/Window.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="create"><a class="lift" href="#create">create</a></a><div class="clear"></div>
            <code class="signature apipage">create(render\_config:[snow.types.RenderConfig](../../../../../api/snow/types/RenderConfig.html)<span></span>, config:[snow.types.WindowConfig](../../../../../api/snow/types/WindowConfig.html)<span></span>, on\_created:[snow.types.WindowHandle](../../../../../api/snow/types/WindowHandle.html)&nbsp; -&gt; [Int](http://api.haxe.org/Int.html)&nbsp; -&gt; [snow.types.WindowingConfig](../../../../../api/snow/types/WindowingConfig.html)&nbsp;-&gt; [Void](http://api.haxe.org/Void.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="destroy_window"><a class="lift" href="#destroy_window">destroy\_window</a></a><div class="clear"></div>
            <code class="signature apipage">destroy\_window(window:[snow.system.window.Window](../../../../../api/snow/system/window/Window.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="display_bounds"><a class="lift" href="#display_bounds">display\_bounds</a></a><div class="clear"></div>
            <code class="signature apipage">display\_bounds(display:[Int](http://api.haxe.org/Int.html)<span></span>) : [Dynamic](#)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="display_count"><a class="lift" href="#display_count">display\_count</a></a><div class="clear"></div>
            <code class="signature apipage">display\_count() : [Int](http://api.haxe.org/Int.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="display_current_mode"><a class="lift" href="#display_current_mode">display\_current\_mode</a></a><div class="clear"></div>
            <code class="signature apipage">display\_current\_mode(display:[Int](http://api.haxe.org/Int.html)<span></span>) : [snow.types.DisplayMode](../../../../../api/snow/types/DisplayMode.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="display_mode"><a class="lift" href="#display_mode">display\_mode</a></a><div class="clear"></div>
            <code class="signature apipage">display\_mode(display:[Int](http://api.haxe.org/Int.html)<span></span>, mode\_index:[Int](http://api.haxe.org/Int.html)<span></span>) : [snow.types.DisplayMode](../../../../../api/snow/types/DisplayMode.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="display_mode_count"><a class="lift" href="#display_mode_count">display\_mode\_count</a></a><div class="clear"></div>
            <code class="signature apipage">display\_mode\_count(display:[Int](http://api.haxe.org/Int.html)<span></span>) : [Int](http://api.haxe.org/Int.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="display_name"><a class="lift" href="#display_name">display\_name</a></a><div class="clear"></div>
            <code class="signature apipage">display\_name(display:[Int](http://api.haxe.org/Int.html)<span></span>) : [String](http://api.haxe.org/String.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="display_native_mode"><a class="lift" href="#display_native_mode">display\_native\_mode</a></a><div class="clear"></div>
            <code class="signature apipage">display\_native\_mode(display:[Int](http://api.haxe.org/Int.html)<span></span>) : [snow.types.DisplayMode](../../../../../api/snow/types/DisplayMode.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="fullscreen"><a class="lift" href="#fullscreen">fullscreen</a></a><div class="clear"></div>
            <code class="signature apipage">fullscreen(window:[snow.system.window.Window](../../../../../api/snow/system/window/Window.html)<span></span>, fullscreen:[Bool](http://api.haxe.org/Bool.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="grab"><a class="lift" href="#grab">grab</a></a><div class="clear"></div>
            <code class="signature apipage">grab(window:[snow.system.window.Window](../../../../../api/snow/system/window/Window.html)<span></span>, grabbed:[Bool](http://api.haxe.org/Bool.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="render"><a class="lift" href="#render">render</a></a><div class="clear"></div>
            <code class="signature apipage">render(window:[snow.system.window.Window](../../../../../api/snow/system/window/Window.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="set_cursor_position"><a class="lift" href="#set_cursor_position">set\_cursor\_position</a></a><div class="clear"></div>
            <code class="signature apipage">set\_cursor\_position(window:[snow.system.window.Window](../../../../../api/snow/system/window/Window.html)<span></span>, x:[Int](http://api.haxe.org/Int.html)<span></span>, y:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="set_max_size"><a class="lift" href="#set_max_size">set\_max\_size</a></a><div class="clear"></div>
            <code class="signature apipage">set\_max\_size(window:[snow.system.window.Window](../../../../../api/snow/system/window/Window.html)<span></span>, w:[Int](http://api.haxe.org/Int.html)<span></span>, h:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="set_min_size"><a class="lift" href="#set_min_size">set\_min\_size</a></a><div class="clear"></div>
            <code class="signature apipage">set\_min\_size(window:[snow.system.window.Window](../../../../../api/snow/system/window/Window.html)<span></span>, w:[Int](http://api.haxe.org/Int.html)<span></span>, h:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="set_position"><a class="lift" href="#set_position">set\_position</a></a><div class="clear"></div>
            <code class="signature apipage">set\_position(window:[snow.system.window.Window](../../../../../api/snow/system/window/Window.html)<span></span>, x:[Int](http://api.haxe.org/Int.html)<span></span>, y:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="set_size"><a class="lift" href="#set_size">set\_size</a></a><div class="clear"></div>
            <code class="signature apipage">set\_size(window:[snow.system.window.Window](../../../../../api/snow/system/window/Window.html)<span></span>, w:[Int](http://api.haxe.org/Int.html)<span></span>, h:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="set_title"><a class="lift" href="#set_title">set\_title</a></a><div class="clear"></div>
            <code class="signature apipage">set\_title(window:[snow.system.window.Window](../../../../../api/snow/system/window/Window.html)<span></span>, title:[String](http://api.haxe.org/String.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="show"><a class="lift" href="#show">show</a></a><div class="clear"></div>
            <code class="signature apipage">show(window:[snow.system.window.Window](../../../../../api/snow/system/window/Window.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="simple_message"><a class="lift" href="#simple_message">simple\_message</a></a><div class="clear"></div>
            <code class="signature apipage">simple\_message(window:[snow.system.window.Window](../../../../../api/snow/system/window/Window.html)<span></span>, message:[String](http://api.haxe.org/String.html)<span></span>, title:[String](http://api.haxe.org/String.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="swap"><a class="lift" href="#swap">swap</a></a><div class="clear"></div>
            <code class="signature apipage">swap(window:[snow.system.window.Window](../../../../../api/snow/system/window/Window.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="system_enable_cursor"><a class="lift" href="#system_enable_cursor">system\_enable\_cursor</a></a><div class="clear"></div>
            <code class="signature apipage">system\_enable\_cursor(enable:[Bool](http://api.haxe.org/Bool.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Toggle the OS cursor. This is not window specific but system wide</span>


</span>
<span class="method apipage">
            <a name="system_enable_vsync"><a class="lift" href="#system_enable_vsync">system\_enable\_vsync</a></a><div class="clear"></div>
            <code class="signature apipage">system\_enable\_vsync(enable:[Bool](http://api.haxe.org/Bool.html)<span></span>) : [Int](http://api.haxe.org/Int.html)</code><br/><span class="small_desc_flat">Toggle vertical refresh. This is not window specific but context wide</span>


</span>
<span class="method apipage">
            <a name="system_lock_cursor"><a class="lift" href="#system_lock_cursor">system\_lock\_cursor</a></a><div class="clear"></div>
            <code class="signature apipage">system\_lock\_cursor(enable:[Bool](http://api.haxe.org/Bool.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Lock the OS cursor to the foreground window. This hides the cursor and prevents it from leaving, reporting relative coordinates.</span>


</span>
<span class="method apipage">
            <a name="update_window"><a class="lift" href="#update_window">update\_window</a></a><div class="clear"></div>
            <code class="signature apipage">update\_window(window:[snow.system.window.Window](../../../../../api/snow/system/window/Window.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>



<hr/>

&nbsp;
&nbsp;
&nbsp;
&nbsp;