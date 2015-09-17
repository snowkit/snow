
[![Logo](../../../../images/logo.png)](../../../../api/index.html)

<hr/>
<a href="#" id="search_bar" onclick="return;"><div> search API <em>(or start typing anywhere)</em> </div></a>
<hr/>

<script src="../../../../js/omnibar.js"> </script>
<link rel="stylesheet" type="text/css" href="../../../../css/omnibar.css" media="all">

<div id="omnibar"> <a href="#" onclick="return" id="omnibar_close"></a> <input id="omnibar_text" type="text" placeholder="search types..."></input></div>
<script  id="typelist" data-relpath="../../../../" data-types="snow.App,snow.AppFixedTimestep,snow.Snow,snow._Snow.Core,snow.api.Debug,snow.api.DebugError,snow.api.File,snow.api.FileHandle,snow.api.FileSeek,snow.api.Libs,snow.api.Promise,snow.api.PromiseError,snow.api.PromiseState,snow.api.Promises,snow.api.Timer,snow.api._Debug.LogError,snow.api._File.FileHandle_Impl_,snow.api._File.FileSeek_Impl_,snow.api._Promise.PromiseState_Impl_,snow.api.buffers.ArrayBuffer,snow.api.buffers.ArrayBufferIO,snow.api.buffers.ArrayBufferView,snow.api.buffers.DataView,snow.api.buffers.Float32Array,snow.api.buffers.Float64Array,snow.api.buffers.Int16Array,snow.api.buffers.Int32Array,snow.api.buffers.Int8Array,snow.api.buffers.TAError,snow.api.buffers.TypedArrayType,snow.api.buffers.Uint16Array,snow.api.buffers.Uint32Array,snow.api.buffers.Uint8Array,snow.api.buffers.Uint8ClampedArray,snow.api.buffers._ArrayBuffer.ArrayBuffer_Impl_,snow.api.buffers._Float32Array.Float32Array_Impl_,snow.api.buffers._Float64Array.Float64Array_Impl_,snow.api.buffers._Int16Array.Int16Array_Impl_,snow.api.buffers._Int32Array.Int32Array_Impl_,snow.api.buffers._Int8Array.Int8Array_Impl_,snow.api.buffers._TypedArrayType.TypedArrayType_Impl_,snow.api.buffers._Uint16Array.Uint16Array_Impl_,snow.api.buffers._Uint32Array.Uint32Array_Impl_,snow.api.buffers._Uint8Array.Uint8Array_Impl_,snow.api.buffers._Uint8ClampedArray.Uint8ClampedArray_Impl_,snow.core.native.Core,snow.core.native._Core.StaticSnow,snow.core.native.assets.Assets,snow.core.native.assets._Assets.NativeAudioDataBlob,snow.core.native.assets._Assets.NativeAudioDataInfo,snow.core.native.assets._Assets.NativeAudioInfo,snow.core.native.audio.Audio,snow.core.native.audio.Sound,snow.core.native.input.Input,snow.core.native.io.IO,snow.core.native.window.Windowing,snow.core.web.assets.psd.PSD,snow.core.web.input.DOMKeys,snow.modules.interfaces.Assets,snow.modules.interfaces.Audio,snow.modules.interfaces.IO,snow.modules.interfaces.Input,snow.modules.interfaces.Windowing,snow.modules.openal.AL,snow.modules.openal.ALC,snow.modules.openal.ALHelper,snow.modules.openal.Audio,snow.modules.openal.Context,snow.modules.openal.Device,snow.modules.openal.Sound,snow.modules.openal._AL.Context_Impl_,snow.modules.openal._AL.Device_Impl_,snow.modules.openal.sound.ALSound,snow.modules.openal.sound.ALStream,snow.modules.openal.sound.Sound,snow.modules.opengl.GL,snow.modules.opengl.GLActiveInfo,snow.modules.opengl.GLBuffer,snow.modules.opengl.GLContextAttributes,snow.modules.opengl.GLFramebuffer,snow.modules.opengl.GLProgram,snow.modules.opengl.GLRenderbuffer,snow.modules.opengl.GLShader,snow.modules.opengl.GLTexture,snow.modules.opengl.GLUniformLocation,snow.modules.opengl.native.GL,snow.modules.opengl.native.GLActiveInfo,snow.modules.opengl.native.GLBO,snow.modules.opengl.native.GLBuffer,snow.modules.opengl.native.GLContextAttributes,snow.modules.opengl.native.GLFBO,snow.modules.opengl.native.GLFramebuffer,snow.modules.opengl.native.GLLink,snow.modules.opengl.native.GLObject,snow.modules.opengl.native.GLPO,snow.modules.opengl.native.GLProgram,snow.modules.opengl.native.GLProxy,snow.modules.opengl.native.GLRBO,snow.modules.opengl.native.GLRenderbuffer,snow.modules.opengl.native.GLSO,snow.modules.opengl.native.GLShader,snow.modules.opengl.native.GLShaderPrecisionFormat,snow.modules.opengl.native.GLTO,snow.modules.opengl.native.GLTexture,snow.modules.opengl.native.GLUniformLocation,snow.modules.opengl.native.GL_FFI,snow.modules.opengl.native.GL_Native,snow.modules.opengl.native._GL.GLBuffer_Impl_,snow.modules.opengl.native._GL.GLFramebuffer_Impl_,snow.modules.opengl.native._GL.GLProgram_Impl_,snow.modules.opengl.native._GL.GLRenderbuffer_Impl_,snow.modules.opengl.native._GL.GLShader_Impl_,snow.modules.opengl.native._GL.GLTexture_Impl_,snow.modules.opengl.native._GL.GLUniformLocation_Impl_,snow.modules.sdl.Input,snow.modules.sdl.Windowing,snow.modules.sdl._Input.ControllerEventType,snow.modules.sdl._Input.ControllerEventType_Impl_,snow.modules.sdl._Input.JosytickEventType,snow.modules.sdl._Input.JosytickEventType_Impl_,snow.modules.sdl._Input.KeyEventType,snow.modules.sdl._Input.KeyEventType_Impl_,snow.modules.sdl._Input.ModValue,snow.modules.sdl._Input.ModValue_Impl_,snow.modules.sdl._Input.MouseEventType,snow.modules.sdl._Input.MouseEventType_Impl_,snow.modules.sdl._Input.SDLControllerEvent,snow.modules.sdl._Input.SDLJoystickEvent,snow.modules.sdl._Input.SDLKeyEvent,snow.modules.sdl._Input.SDLMouseEvent,snow.modules.sdl._Input.SDLTouchEvent,snow.modules.sdl._Input.TouchEventType,snow.modules.sdl._Input.TouchEventType_Impl_,snow.system.assets.Asset,snow.system.assets.AssetBytes,snow.system.assets.AssetImage,snow.system.assets.AssetJSON,snow.system.assets.AssetText,snow.system.assets.Assets,snow.system.assets._Assets.AssetsModule,snow.system.audio.Audio,snow.system.audio.AudioModule,snow.system.audio.Sound,snow.system.input.Input,snow.system.input.Keycodes,snow.system.input.MapIntBool,snow.system.input.MapIntFloat,snow.system.input.Scancodes,snow.system.input._Input.InputModule,snow.system.io.IO,snow.system.io._IO.IOModule,snow.system.module.Assets,snow.system.module.Audio,snow.system.module.IO,snow.system.module.Input,snow.system.module.Sound,snow.system.module.Windowing,snow.system.window.Window,snow.system.window.Windowing,snow.system.window._Windowing.WindowHandleMap,snow.system.window._Windowing.WindowingModule,snow.types.AppConfig,snow.types.AppConfigNative,snow.types.AppConfigWeb,snow.types.Asset,snow.types.AssetBytes,snow.types.AssetImage,snow.types.AssetJSON,snow.types.AssetText,snow.types.AssetType,snow.types.AudioDataBlob,snow.types.AudioDataInfo,snow.types.AudioFormatType,snow.types.AudioHandle,snow.types.AudioInfo,snow.types.DisplayMode,snow.types.Error,snow.types.FileEvent,snow.types.FileEventType,snow.types.FileFilter,snow.types.GamepadDeviceEventType,snow.types.IODataOptions,snow.types.ImageInfo,snow.types.InputEvent,snow.types.InputEventType,snow.types.Key,snow.types.ModState,snow.types.OS,snow.types.OpenGLProfile,snow.types.Platform,snow.types.RenderConfig,snow.types.RenderConfigOpenGL,snow.types.Scan,snow.types.SnowConfig,snow.types.SystemEvent,snow.types.SystemEventType,snow.types.TextEventType,snow.types.WindowConfig,snow.types.WindowEvent,snow.types.WindowEventType,snow.types.WindowHandle,snow.types.WindowingConfig,snow.types._Types.AssetType_Impl_,snow.types._Types.AudioFormatType_Impl_,snow.types._Types.FileEventType_Impl_,snow.types._Types.GamepadDeviceEventType_Impl_,snow.types._Types.InputEventType_Impl_,snow.types._Types.OS_Impl_,snow.types._Types.OpenGLProfile_Impl_,snow.types._Types.Platform_Impl_,snow.types._Types.SystemEventType_Impl_,snow.types._Types.TextEventType_Impl_,snow.types._Types.WindowEventType_Impl_"></script>


<h1>AssetImage</h1>
<small>`snow.system.assets.AssetImage`</small>



<hr/>

`class`extends <code><span>snow.system.assets.Asset</span></code><br/><span class="meta">
meta: @:directlyUsed</span>

<hr/>


&nbsp;
&nbsp;





<h3>Properties</h3> <hr/><span class="member apipage">
                <a name="image"><a class="lift" href="#image">image</a></a><div class="clear"></div>
                <code class="signature apipage">image : [snow.types.ImageInfo](../../../../api/snow/types/ImageInfo.html)</code><br/></span>
            <span class="small_desc_flat"></span>

<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="destroy"><a class="lift" href="#destroy">destroy</a></a><div class="clear"></div>
            <code class="signature apipage">destroy() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="load"><a class="lift" href="#load">load</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">load(\_system:[snow.system.assets.Assets](../../../../api/snow/system/assets/Assets.html)<span></span>, \_id:[String](http://api.haxe.org/String.html)<span></span>) : [snow.api.Promise](../../../../api/snow/api/Promise.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="load_from_bytes"><a class="lift" href="#load_from_bytes">load\_from\_bytes</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">load\_from\_bytes(\_system:[snow.system.assets.Assets](../../../../api/snow/system/assets/Assets.html)<span></span>, \_id:[String](http://api.haxe.org/String.html)<span></span>, \_bytes:[snow.api.buffers.Uint8Array](../../../../api/snow/api/buffers/Uint8Array.html)<span></span>) : [snow.api.Promise](../../../../api/snow/api/Promise.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="load_from_pixels"><a class="lift" href="#load_from_pixels">load\_from\_pixels</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">load\_from\_pixels(\_system:[snow.system.assets.Assets](../../../../api/snow/system/assets/Assets.html)<span></span>, \_id:[String](http://api.haxe.org/String.html)<span></span>, \_width:[Int](http://api.haxe.org/Int.html)<span></span>, \_height:[Int](http://api.haxe.org/Int.html)<span></span>, \_pixels:[snow.api.buffers.Uint8Array](../../../../api/snow/api/buffers/Uint8Array.html)<span></span>) : [snow.system.assets.AssetImage](../../../../api/snow/system/assets/AssetImage.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a><div class="clear"></div>
            <code class="signature apipage">new(\_system:[snow.system.assets.Assets](../../../../api/snow/system/assets/Assets.html)<span></span>, \_id:[String](http://api.haxe.org/String.html)<span></span>, \_image:[snow.types.ImageInfo](../../../../api/snow/types/ImageInfo.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="processor"><a class="lift" href="#processor">processor</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">processor(\_app:[snow.Snow](../../../../api/snow/Snow.html)<span></span>, \_id:[String](http://api.haxe.org/String.html)<span></span>, \_data:[snow.api.buffers.Uint8Array](../../../../api/snow/api/buffers/Uint8Array.html)<span></span>) : [snow.api.Promise](../../../../api/snow/api/Promise.html)</code><br/><span class="small_desc_flat">A convenience io processor, using image_info_from_bytes, from the asset module. Promises ImageInfo</span>


</span>
<span class="method apipage">
            <a name="provider"><a class="lift" href="#provider">provider</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">provider(\_app:[snow.Snow](../../../../api/snow/Snow.html)<span></span>, \_path:[String](http://api.haxe.org/String.html)<span></span>) : [snow.api.Promise](../../../../api/snow/api/Promise.html)</code><br/><span class="small_desc_flat">A default io provider, using image_load_info from the asset module.
                    Promises ImageInfo. Takes an asset path, not an asset id (uses assets.path(id))</span>


</span>
<span class="method apipage">
            <a name="reload"><a class="lift" href="#reload">reload</a></a><div class="clear"></div>
            <code class="signature apipage">reload() : [snow.api.Promise](../../../../api/snow/api/Promise.html)</code><br/><span class="small_desc_flat">Reloads the bytes from the stored id, using the default processor, returning a promise for the asset.</span>


</span>
<span class="method apipage">
            <a name="reload_from_bytes"><a class="lift" href="#reload_from_bytes">reload\_from\_bytes</a></a><div class="clear"></div>
            <code class="signature apipage">reload\_from\_bytes(\_bytes:[snow.api.buffers.Uint8Array](../../../../api/snow/api/buffers/Uint8Array.html)<span></span>) : [snow.api.Promise](../../../../api/snow/api/Promise.html)</code><br/><span class="small_desc_flat">Reload the asset with from bytes</span>


</span>
<span class="method apipage">
            <a name="reload_from_pixels"><a class="lift" href="#reload_from_pixels">reload\_from\_pixels</a></a><div class="clear"></div>
            <code class="signature apipage">reload\_from\_pixels(\_width:[Int](http://api.haxe.org/Int.html)<span></span>, \_height:[Int](http://api.haxe.org/Int.html)<span></span>, \_pixels:[snow.api.buffers.Uint8Array](../../../../api/snow/api/buffers/Uint8Array.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Reload the asset from already decoded pixels</span>


</span>



<hr/>

&nbsp;
&nbsp;
&nbsp;
&nbsp;