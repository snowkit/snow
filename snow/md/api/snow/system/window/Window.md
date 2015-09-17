
[![Logo](../../../../images/logo.png)](../../../../api/index.html)

<hr/>
<a href="#" id="search_bar" onclick="return;"><div> search API <em>(or start typing anywhere)</em> </div></a>
<hr/>

<script src="../../../../js/omnibar.js"> </script>
<link rel="stylesheet" type="text/css" href="../../../../css/omnibar.css" media="all">

<div id="omnibar"> <a href="#" onclick="return" id="omnibar_close"></a> <input id="omnibar_text" type="text" placeholder="search types..."></input></div>
<script  id="typelist" data-relpath="../../../../" data-types="snow.App,snow.AppFixedTimestep,snow.Snow,snow._Snow.Core,snow.api.Debug,snow.api.DebugError,snow.api.File,snow.api.FileHandle,snow.api.FileSeek,snow.api.Libs,snow.api.Promise,snow.api.PromiseError,snow.api.PromiseState,snow.api.Promises,snow.api.Timer,snow.api._Debug.LogError,snow.api._File.FileHandle_Impl_,snow.api._File.FileSeek_Impl_,snow.api._Promise.PromiseState_Impl_,snow.api.buffers.ArrayBuffer,snow.api.buffers.ArrayBufferIO,snow.api.buffers.ArrayBufferView,snow.api.buffers.DataView,snow.api.buffers.Float32Array,snow.api.buffers.Float64Array,snow.api.buffers.Int16Array,snow.api.buffers.Int32Array,snow.api.buffers.Int8Array,snow.api.buffers.TAError,snow.api.buffers.TypedArrayType,snow.api.buffers.Uint16Array,snow.api.buffers.Uint32Array,snow.api.buffers.Uint8Array,snow.api.buffers.Uint8ClampedArray,snow.api.buffers._ArrayBuffer.ArrayBuffer_Impl_,snow.api.buffers._Float32Array.Float32Array_Impl_,snow.api.buffers._Float64Array.Float64Array_Impl_,snow.api.buffers._Int16Array.Int16Array_Impl_,snow.api.buffers._Int32Array.Int32Array_Impl_,snow.api.buffers._Int8Array.Int8Array_Impl_,snow.api.buffers._TypedArrayType.TypedArrayType_Impl_,snow.api.buffers._Uint16Array.Uint16Array_Impl_,snow.api.buffers._Uint32Array.Uint32Array_Impl_,snow.api.buffers._Uint8Array.Uint8Array_Impl_,snow.api.buffers._Uint8ClampedArray.Uint8ClampedArray_Impl_,snow.core.native.Core,snow.core.native._Core.StaticSnow,snow.core.native.assets.Assets,snow.core.native.assets._Assets.NativeAudioDataBlob,snow.core.native.assets._Assets.NativeAudioDataInfo,snow.core.native.assets._Assets.NativeAudioInfo,snow.core.native.audio.Audio,snow.core.native.audio.Sound,snow.core.native.input.Input,snow.core.native.io.IO,snow.core.native.window.Windowing,snow.core.web.assets.psd.PSD,snow.core.web.input.DOMKeys,snow.modules.interfaces.Assets,snow.modules.interfaces.Audio,snow.modules.interfaces.IO,snow.modules.interfaces.Input,snow.modules.interfaces.Windowing,snow.modules.openal.AL,snow.modules.openal.ALC,snow.modules.openal.ALHelper,snow.modules.openal.Audio,snow.modules.openal.Context,snow.modules.openal.Device,snow.modules.openal.Sound,snow.modules.openal._AL.Context_Impl_,snow.modules.openal._AL.Device_Impl_,snow.modules.openal.sound.ALSound,snow.modules.openal.sound.ALStream,snow.modules.openal.sound.Sound,snow.modules.opengl.GL,snow.modules.opengl.GLActiveInfo,snow.modules.opengl.GLBuffer,snow.modules.opengl.GLContextAttributes,snow.modules.opengl.GLFramebuffer,snow.modules.opengl.GLProgram,snow.modules.opengl.GLRenderbuffer,snow.modules.opengl.GLShader,snow.modules.opengl.GLTexture,snow.modules.opengl.GLUniformLocation,snow.modules.opengl.native.GL,snow.modules.opengl.native.GLActiveInfo,snow.modules.opengl.native.GLBO,snow.modules.opengl.native.GLBuffer,snow.modules.opengl.native.GLContextAttributes,snow.modules.opengl.native.GLFBO,snow.modules.opengl.native.GLFramebuffer,snow.modules.opengl.native.GLLink,snow.modules.opengl.native.GLObject,snow.modules.opengl.native.GLPO,snow.modules.opengl.native.GLProgram,snow.modules.opengl.native.GLProxy,snow.modules.opengl.native.GLRBO,snow.modules.opengl.native.GLRenderbuffer,snow.modules.opengl.native.GLSO,snow.modules.opengl.native.GLShader,snow.modules.opengl.native.GLShaderPrecisionFormat,snow.modules.opengl.native.GLTO,snow.modules.opengl.native.GLTexture,snow.modules.opengl.native.GLUniformLocation,snow.modules.opengl.native.GL_FFI,snow.modules.opengl.native.GL_Native,snow.modules.opengl.native._GL.GLBuffer_Impl_,snow.modules.opengl.native._GL.GLFramebuffer_Impl_,snow.modules.opengl.native._GL.GLProgram_Impl_,snow.modules.opengl.native._GL.GLRenderbuffer_Impl_,snow.modules.opengl.native._GL.GLShader_Impl_,snow.modules.opengl.native._GL.GLTexture_Impl_,snow.modules.opengl.native._GL.GLUniformLocation_Impl_,snow.modules.sdl.Input,snow.modules.sdl.Windowing,snow.modules.sdl._Input.ControllerEventType,snow.modules.sdl._Input.ControllerEventType_Impl_,snow.modules.sdl._Input.JosytickEventType,snow.modules.sdl._Input.JosytickEventType_Impl_,snow.modules.sdl._Input.KeyEventType,snow.modules.sdl._Input.KeyEventType_Impl_,snow.modules.sdl._Input.ModValue,snow.modules.sdl._Input.ModValue_Impl_,snow.modules.sdl._Input.MouseEventType,snow.modules.sdl._Input.MouseEventType_Impl_,snow.modules.sdl._Input.SDLControllerEvent,snow.modules.sdl._Input.SDLJoystickEvent,snow.modules.sdl._Input.SDLKeyEvent,snow.modules.sdl._Input.SDLMouseEvent,snow.modules.sdl._Input.SDLTouchEvent,snow.modules.sdl._Input.TouchEventType,snow.modules.sdl._Input.TouchEventType_Impl_,snow.system.assets.Asset,snow.system.assets.AssetBytes,snow.system.assets.AssetImage,snow.system.assets.AssetJSON,snow.system.assets.AssetText,snow.system.assets.Assets,snow.system.assets._Assets.AssetsModule,snow.system.audio.Audio,snow.system.audio.AudioModule,snow.system.audio.Sound,snow.system.input.Input,snow.system.input.Keycodes,snow.system.input.MapIntBool,snow.system.input.MapIntFloat,snow.system.input.Scancodes,snow.system.input._Input.InputModule,snow.system.io.IO,snow.system.io._IO.IOModule,snow.system.module.Assets,snow.system.module.Audio,snow.system.module.IO,snow.system.module.Input,snow.system.module.Sound,snow.system.module.Windowing,snow.system.window.Window,snow.system.window.Windowing,snow.system.window._Windowing.WindowHandleMap,snow.system.window._Windowing.WindowingModule,snow.types.AppConfig,snow.types.AppConfigNative,snow.types.AppConfigWeb,snow.types.Asset,snow.types.AssetBytes,snow.types.AssetImage,snow.types.AssetJSON,snow.types.AssetText,snow.types.AssetType,snow.types.AudioDataBlob,snow.types.AudioDataInfo,snow.types.AudioFormatType,snow.types.AudioHandle,snow.types.AudioInfo,snow.types.DisplayMode,snow.types.Error,snow.types.FileEvent,snow.types.FileEventType,snow.types.FileFilter,snow.types.GamepadDeviceEventType,snow.types.IODataOptions,snow.types.ImageInfo,snow.types.InputEvent,snow.types.InputEventType,snow.types.Key,snow.types.ModState,snow.types.OS,snow.types.OpenGLProfile,snow.types.Platform,snow.types.RenderConfig,snow.types.RenderConfigOpenGL,snow.types.Scan,snow.types.SnowConfig,snow.types.SystemEvent,snow.types.SystemEventType,snow.types.TextEventType,snow.types.WindowConfig,snow.types.WindowEvent,snow.types.WindowEventType,snow.types.WindowHandle,snow.types.WindowingConfig,snow.types._Types.AssetType_Impl_,snow.types._Types.AudioFormatType_Impl_,snow.types._Types.FileEventType_Impl_,snow.types._Types.GamepadDeviceEventType_Impl_,snow.types._Types.InputEventType_Impl_,snow.types._Types.OS_Impl_,snow.types._Types.OpenGLProfile_Impl_,snow.types._Types.Platform_Impl_,snow.types._Types.SystemEventType_Impl_,snow.types._Types.TextEventType_Impl_,snow.types._Types.WindowEventType_Impl_"></script>


<h1>Window</h1>
<small>`snow.system.window.Window`</small>



<hr/>

`class`<br/><span class="meta">
meta: @:directlyUsed, @:allow(snow.system.window.Windowing)</span>

<hr/>


&nbsp;
&nbsp;




<h3>Members</h3> <hr/><span class="member apipage">
                <a name="asked_config"><a class="lift" href="#asked_config">asked\_config</a></a><div class="clear"></div>
                <code class="signature apipage">asked\_config : [snow.types.WindowConfig](../../../../api/snow/types/WindowConfig.html)</code><br/></span>
            <span class="small_desc_flat">the requested window config</span><br/><span class="member apipage">
                <a name="auto_render"><a class="lift" href="#auto_render">auto\_render</a></a><div class="clear"></div>
                <code class="signature apipage">auto\_render : [Bool](http://api.haxe.org/Bool.html)</code><br/></span>
            <span class="small_desc_flat">set this if you want to control when a window calls render()</span><br/><span class="member apipage">
                <a name="auto_swap"><a class="lift" href="#auto_swap">auto\_swap</a></a><div class="clear"></div>
                <code class="signature apipage">auto\_swap : [Bool](http://api.haxe.org/Bool.html)</code><br/></span>
            <span class="small_desc_flat">set this if you want to control when a window calls swap()</span><br/><span class="member apipage">
                <a name="closed"><a class="lift" href="#closed">closed</a></a><div class="clear"></div>
                <code class="signature apipage">closed : [Bool](http://api.haxe.org/Bool.html)</code><br/></span>
            <span class="small_desc_flat">A flag for whether this window is open or closed</span><br/><span class="member apipage">
                <a name="config"><a class="lift" href="#config">config</a></a><div class="clear"></div>
                <code class="signature apipage">config : [snow.types.WindowConfig](../../../../api/snow/types/WindowConfig.html)</code><br/></span>
            <span class="small_desc_flat">the actual returned window config</span><br/><span class="member apipage">
                <a name="handle"><a class="lift" href="#handle">handle</a></a><div class="clear"></div>
                <code class="signature apipage">handle : [snow.types.WindowHandle](../../../../api/snow/types/WindowHandle.html)</code><br/></span>
            <span class="small_desc_flat">the native window handle</span><br/><span class="member apipage">
                <a name="id"><a class="lift" href="#id">id</a></a><div class="clear"></div>
                <code class="signature apipage">id : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat">the window id, for tracking events to each window</span><br/><span class="member apipage">
                <a name="system"><a class="lift" href="#system">system</a></a><div class="clear"></div>
                <code class="signature apipage">system : [snow.system.window.Windowing](../../../../api/snow/system/window/Windowing.html)</code><br/></span>
            <span class="small_desc_flat">the system this window belongs to</span><br/>

<h3>Properties</h3> <hr/><span class="member apipage">
                <a name="bordered"><a class="lift" href="#bordered">bordered</a></a><div class="clear"></div>
                <code class="signature apipage">bordered : [Bool](http://api.haxe.org/Bool.html)</code><br/></span>
            <span class="small_desc_flat">The window bordered state `(read/write)`</span><span class="member apipage">
                <a name="fullscreen"><a class="lift" href="#fullscreen">fullscreen</a></a><div class="clear"></div>
                <code class="signature apipage">fullscreen : [Bool](http://api.haxe.org/Bool.html)</code><br/></span>
            <span class="small_desc_flat">The window fullscreen state `(read/write)`</span><span class="member apipage">
                <a name="grab"><a class="lift" href="#grab">grab</a></a><div class="clear"></div>
                <code class="signature apipage">grab : [Bool](http://api.haxe.org/Bool.html)</code><br/></span>
            <span class="small_desc_flat">The window grab state `(read/write)`</span><span class="member apipage">
                <a name="height"><a class="lift" href="#height">height</a></a><div class="clear"></div>
                <code class="signature apipage">height : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="max_size"><a class="lift" href="#max_size">max\_size</a></a><div class="clear"></div>
                <code class="signature apipage">max\_size : { y : [Int](#), x : [Int](#) }</code><br/></span>
            <span class="small_desc_flat">The window maximum size `(read/write)`</span><span class="member apipage">
                <a name="min_size"><a class="lift" href="#min_size">min\_size</a></a><div class="clear"></div>
                <code class="signature apipage">min\_size : { y : [Int](#), x : [Int](#) }</code><br/></span>
            <span class="small_desc_flat">The window minimum size `(read/write)`</span><span class="member apipage">
                <a name="title"><a class="lift" href="#title">title</a></a><div class="clear"></div>
                <code class="signature apipage">title : [String](http://api.haxe.org/String.html)</code><br/></span>
            <span class="small_desc_flat">The window title `(read/write)`</span><span class="member apipage">
                <a name="width"><a class="lift" href="#width">width</a></a><div class="clear"></div>
                <code class="signature apipage">width : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="x"><a class="lift" href="#x">x</a></a><div class="clear"></div>
                <code class="signature apipage">x : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat">The window position `(read/write)`</span><span class="member apipage">
                <a name="y"><a class="lift" href="#y">y</a></a><div class="clear"></div>
                <code class="signature apipage">y : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span>

<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="close"><a class="lift" href="#close">close</a></a><div class="clear"></div>
            <code class="signature apipage">close() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Close the window, hiding it (not destroying it). Calling show() will unhide it.</span>


</span>
<span class="method apipage">
            <a name="destroy"><a class="lift" href="#destroy">destroy</a></a><div class="clear"></div>
            <code class="signature apipage">destroy() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Destroy the window. To recreate it create must be used, show will not work.</span>


</span>
<span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a><div class="clear"></div>
            <code class="signature apipage">new(\_system:[snow.system.window.Windowing](../../../../api/snow/system/window/Windowing.html)<span></span>, \_config:[snow.types.WindowConfig](../../../../api/snow/types/WindowConfig.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="onevent"><a class="lift" href="#onevent">onevent</a></a><div class="clear"></div>
            <code class="signature apipage">onevent(:[snow.types.WindowEvent](../../../../api/snow/types/WindowEvent.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">the window event handler callback</span>


</span>
<span class="method apipage">
            <a name="onrender"><a class="lift" href="#onrender">onrender</a></a><div class="clear"></div>
            <code class="signature apipage">onrender(:[snow.system.window.Window](../../../../api/snow/system/window/Window.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">the window render handler callback</span>


</span>
<span class="method apipage">
            <a name="render"><a class="lift" href="#render">render</a></a><div class="clear"></div>
            <code class="signature apipage">render() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Called for you automatically, unless auto_render is disabled.</span>


</span>
<span class="method apipage">
            <a name="set_cursor_position"><a class="lift" href="#set_cursor_position">set\_cursor\_position</a></a><div class="clear"></div>
            <code class="signature apipage">set\_cursor\_position(\_x:[Int](http://api.haxe.org/Int.html)<span></span>, \_y:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="set_position"><a class="lift" href="#set_position">set\_position</a></a><div class="clear"></div>
            <code class="signature apipage">set\_position(\_x:[Int](http://api.haxe.org/Int.html)<span></span>, \_y:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="set_size"><a class="lift" href="#set_size">set\_size</a></a><div class="clear"></div>
            <code class="signature apipage">set\_size(\_width:[Int](http://api.haxe.org/Int.html)<span></span>, \_height:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="show"><a class="lift" href="#show">show</a></a><div class="clear"></div>
            <code class="signature apipage">show() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Show the window, unhiding it. If destroyed, nothing happens.</span>


</span>
<span class="method apipage">
            <a name="simple_message"><a class="lift" href="#simple_message">simple\_message</a></a><div class="clear"></div>
            <code class="signature apipage">simple\_message(message:[String](http://api.haxe.org/String.html)<span></span>, title:[String](http://api.haxe.org/String.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Display a cross platform message on this window</span>


</span>
<span class="method apipage">
            <a name="swap"><a class="lift" href="#swap">swap</a></a><div class="clear"></div>
            <code class="signature apipage">swap() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Swap the back buffer of the window, call after rendering to update the window view</span>


</span>



<hr/>

&nbsp;
&nbsp;
&nbsp;
&nbsp;