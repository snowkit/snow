
[![Logo](../../../../../images/logo.png)](../../../../../api/index.html)

<hr/>
<a href="#" id="search_bar" onclick="return;"><div> search API <em>(or start typing anywhere)</em> </div></a>
<hr/>

<script src="../../../../../js/omnibar.js"> </script>
<link rel="stylesheet" type="text/css" href="../../../../../css/omnibar.css" media="all">

<div id="omnibar"> <a href="#" onclick="return" id="omnibar_close"></a> <input id="omnibar_text" type="text" placeholder="search types..."></input></div>
<script  id="typelist" data-relpath="../../../../../" data-types="snow.App,snow.AppFixedTimestep,snow.Snow,snow._Snow.Core,snow.api.Debug,snow.api.DebugError,snow.api.File,snow.api.FileHandle,snow.api.FileSeek,snow.api.Libs,snow.api.Promise,snow.api.PromiseError,snow.api.PromiseState,snow.api.Promises,snow.api.Timer,snow.api._Debug.LogError,snow.api._File.FileHandle_Impl_,snow.api._File.FileSeek_Impl_,snow.api._Promise.PromiseState_Impl_,snow.api.buffers.ArrayBuffer,snow.api.buffers.ArrayBufferIO,snow.api.buffers.ArrayBufferView,snow.api.buffers.DataView,snow.api.buffers.Float32Array,snow.api.buffers.Float64Array,snow.api.buffers.Int16Array,snow.api.buffers.Int32Array,snow.api.buffers.Int8Array,snow.api.buffers.TAError,snow.api.buffers.TypedArrayType,snow.api.buffers.Uint16Array,snow.api.buffers.Uint32Array,snow.api.buffers.Uint8Array,snow.api.buffers.Uint8ClampedArray,snow.api.buffers._ArrayBuffer.ArrayBuffer_Impl_,snow.api.buffers._Float32Array.Float32Array_Impl_,snow.api.buffers._Float64Array.Float64Array_Impl_,snow.api.buffers._Int16Array.Int16Array_Impl_,snow.api.buffers._Int32Array.Int32Array_Impl_,snow.api.buffers._Int8Array.Int8Array_Impl_,snow.api.buffers._TypedArrayType.TypedArrayType_Impl_,snow.api.buffers._Uint16Array.Uint16Array_Impl_,snow.api.buffers._Uint32Array.Uint32Array_Impl_,snow.api.buffers._Uint8Array.Uint8Array_Impl_,snow.api.buffers._Uint8ClampedArray.Uint8ClampedArray_Impl_,snow.core.native.Core,snow.core.native._Core.StaticSnow,snow.core.native.assets.Assets,snow.core.native.assets._Assets.NativeAudioDataBlob,snow.core.native.assets._Assets.NativeAudioDataInfo,snow.core.native.assets._Assets.NativeAudioInfo,snow.core.native.audio.Audio,snow.core.native.audio.Sound,snow.core.native.input.Input,snow.core.native.io.IO,snow.core.native.window.Windowing,snow.core.web.assets.psd.PSD,snow.core.web.input.DOMKeys,snow.modules.interfaces.Assets,snow.modules.interfaces.Audio,snow.modules.interfaces.IO,snow.modules.interfaces.Input,snow.modules.interfaces.Windowing,snow.modules.openal.AL,snow.modules.openal.ALC,snow.modules.openal.ALHelper,snow.modules.openal.Audio,snow.modules.openal.Context,snow.modules.openal.Device,snow.modules.openal.Sound,snow.modules.openal._AL.Context_Impl_,snow.modules.openal._AL.Device_Impl_,snow.modules.openal.sound.ALSound,snow.modules.openal.sound.ALStream,snow.modules.openal.sound.Sound,snow.modules.opengl.GL,snow.modules.opengl.GLActiveInfo,snow.modules.opengl.GLBuffer,snow.modules.opengl.GLContextAttributes,snow.modules.opengl.GLFramebuffer,snow.modules.opengl.GLProgram,snow.modules.opengl.GLRenderbuffer,snow.modules.opengl.GLShader,snow.modules.opengl.GLTexture,snow.modules.opengl.GLUniformLocation,snow.modules.opengl.native.GL,snow.modules.opengl.native.GLActiveInfo,snow.modules.opengl.native.GLBO,snow.modules.opengl.native.GLBuffer,snow.modules.opengl.native.GLContextAttributes,snow.modules.opengl.native.GLFBO,snow.modules.opengl.native.GLFramebuffer,snow.modules.opengl.native.GLLink,snow.modules.opengl.native.GLObject,snow.modules.opengl.native.GLPO,snow.modules.opengl.native.GLProgram,snow.modules.opengl.native.GLProxy,snow.modules.opengl.native.GLRBO,snow.modules.opengl.native.GLRenderbuffer,snow.modules.opengl.native.GLSO,snow.modules.opengl.native.GLShader,snow.modules.opengl.native.GLShaderPrecisionFormat,snow.modules.opengl.native.GLTO,snow.modules.opengl.native.GLTexture,snow.modules.opengl.native.GLUniformLocation,snow.modules.opengl.native.GL_FFI,snow.modules.opengl.native.GL_Native,snow.modules.opengl.native._GL.GLBuffer_Impl_,snow.modules.opengl.native._GL.GLFramebuffer_Impl_,snow.modules.opengl.native._GL.GLProgram_Impl_,snow.modules.opengl.native._GL.GLRenderbuffer_Impl_,snow.modules.opengl.native._GL.GLShader_Impl_,snow.modules.opengl.native._GL.GLTexture_Impl_,snow.modules.opengl.native._GL.GLUniformLocation_Impl_,snow.modules.sdl.Input,snow.modules.sdl.Windowing,snow.modules.sdl._Input.ControllerEventType,snow.modules.sdl._Input.ControllerEventType_Impl_,snow.modules.sdl._Input.JosytickEventType,snow.modules.sdl._Input.JosytickEventType_Impl_,snow.modules.sdl._Input.KeyEventType,snow.modules.sdl._Input.KeyEventType_Impl_,snow.modules.sdl._Input.ModValue,snow.modules.sdl._Input.ModValue_Impl_,snow.modules.sdl._Input.MouseEventType,snow.modules.sdl._Input.MouseEventType_Impl_,snow.modules.sdl._Input.SDLControllerEvent,snow.modules.sdl._Input.SDLJoystickEvent,snow.modules.sdl._Input.SDLKeyEvent,snow.modules.sdl._Input.SDLMouseEvent,snow.modules.sdl._Input.SDLTouchEvent,snow.modules.sdl._Input.TouchEventType,snow.modules.sdl._Input.TouchEventType_Impl_,snow.system.assets.Asset,snow.system.assets.AssetBytes,snow.system.assets.AssetImage,snow.system.assets.AssetJSON,snow.system.assets.AssetText,snow.system.assets.Assets,snow.system.assets._Assets.AssetsModule,snow.system.audio.Audio,snow.system.audio.AudioModule,snow.system.audio.Sound,snow.system.input.Input,snow.system.input.Keycodes,snow.system.input.MapIntBool,snow.system.input.MapIntFloat,snow.system.input.Scancodes,snow.system.input._Input.InputModule,snow.system.io.IO,snow.system.io._IO.IOModule,snow.system.module.Assets,snow.system.module.Audio,snow.system.module.IO,snow.system.module.Input,snow.system.module.Sound,snow.system.module.Windowing,snow.system.window.Window,snow.system.window.Windowing,snow.system.window._Windowing.WindowHandleMap,snow.system.window._Windowing.WindowingModule,snow.types.AppConfig,snow.types.AppConfigNative,snow.types.AppConfigWeb,snow.types.Asset,snow.types.AssetBytes,snow.types.AssetImage,snow.types.AssetJSON,snow.types.AssetText,snow.types.AssetType,snow.types.AudioDataBlob,snow.types.AudioDataInfo,snow.types.AudioFormatType,snow.types.AudioHandle,snow.types.AudioInfo,snow.types.DisplayMode,snow.types.Error,snow.types.FileEvent,snow.types.FileEventType,snow.types.FileFilter,snow.types.GamepadDeviceEventType,snow.types.IODataOptions,snow.types.ImageInfo,snow.types.InputEvent,snow.types.InputEventType,snow.types.Key,snow.types.ModState,snow.types.OS,snow.types.OpenGLProfile,snow.types.Platform,snow.types.RenderConfig,snow.types.RenderConfigOpenGL,snow.types.Scan,snow.types.SnowConfig,snow.types.SystemEvent,snow.types.SystemEventType,snow.types.TextEventType,snow.types.WindowConfig,snow.types.WindowEvent,snow.types.WindowEventType,snow.types.WindowHandle,snow.types.WindowingConfig,snow.types._Types.AssetType_Impl_,snow.types._Types.AudioFormatType_Impl_,snow.types._Types.FileEventType_Impl_,snow.types._Types.GamepadDeviceEventType_Impl_,snow.types._Types.InputEventType_Impl_,snow.types._Types.OS_Impl_,snow.types._Types.OpenGLProfile_Impl_,snow.types._Types.Platform_Impl_,snow.types._Types.SystemEventType_Impl_,snow.types._Types.TextEventType_Impl_,snow.types._Types.WindowEventType_Impl_"></script>


<h1>IOModule</h1>
<small>`snow.system.io._IO.IOModule`</small>



<hr/>

`typedef`&nbsp;alias of `snow.core.native.io.IO`   

<hr/>


&nbsp;
&nbsp;





<h3>Members</h3> <hr/>


<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="app_path"><a class="lift" href="#app_path">app\_path</a></a><div class="clear"></div>
            <code class="signature apipage">app\_path() : [String](http://api.haxe.org/String.html)</code><br/><span class="small_desc_flat">Return the full path that the application is located</span>


</span>
<span class="method apipage">
            <a name="app_path_prefs"><a class="lift" href="#app_path_prefs">app\_path\_prefs</a></a><div class="clear"></div>
            <code class="signature apipage">app\_path\_prefs() : [String](http://api.haxe.org/String.html)</code><br/><span class="small_desc_flat">On platforms where this makes sense, get the application specific writeable data path.
             Uses the package from `SnowConfig`, passed through from flow projects or boot config.</span>


</span>
<span class="method apipage">
            <a name="data_load"><a class="lift" href="#data_load">data\_load</a></a><div class="clear"></div>
            <code class="signature apipage">data\_load(\_path:[String](http://api.haxe.org/String.html)<span></span>, \_options:[snow.types.IODataOptions](../../../../../api/snow/types/IODataOptions.html)<span></span>) : [snow.api.Promise](../../../../../api/snow/api/Promise.html)</code><br/><span class="small_desc_flat">Load bytes from the file path/url given.
                On web a request is sent for the data</span>


</span>
<span class="method apipage">
            <a name="data_save"><a class="lift" href="#data_save">data\_save</a></a><div class="clear"></div>
            <code class="signature apipage">data\_save(\_path:[String](http://api.haxe.org/String.html)<span></span>, \_data:[snow.api.buffers.Uint8Array](../../../../../api/snow/api/buffers/Uint8Array.html)<span></span>, \_options:[snow.types.IODataOptions](../../../../../api/snow/types/IODataOptions.html)<span></span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat">Save bytes to the file path/url given. Overwrites the file without warning.
                Does not ensure the path (i.e doesn't check or create folders).
                On platforms where this doesn't make sense (web) this will do nothing atm</span>


</span>
<span class="method apipage">
            <a name="dialog_folder"><a class="lift" href="#dialog_folder">dialog\_folder</a></a><div class="clear"></div>
            <code class="signature apipage">dialog\_folder(\_title:[String](http://api.haxe.org/String.html)<span></span>) : [String](http://api.haxe.org/String.html)</code><br/><span class="small_desc_flat">Call this to open a native platform folder select dialog.
                Returns a blank string if they cancel or any error occurs.
                supports:`windows` `mac` `linux`</span>


</span>
<span class="method apipage">
            <a name="dialog_open"><a class="lift" href="#dialog_open">dialog\_open</a></a><div class="clear"></div>
            <code class="signature apipage">dialog\_open(\_title:[String](http://api.haxe.org/String.html)<span></span>, \_filters:[Array](http://api.haxe.org/Array.html)&lt;[snow.types.FileFilter](../../../../../api/snow/types/FileFilter.html)&gt;<span></span>) : [String](http://api.haxe.org/String.html)</code><br/><span class="small_desc_flat">Call this to open a native platform file open dialog.
            Returns a blank string if they cancel or any error occurs.
            supports: `windows` `mac` `linux`</span>


</span>
<span class="method apipage">
            <a name="dialog_save"><a class="lift" href="#dialog_save">dialog\_save</a></a><div class="clear"></div>
            <code class="signature apipage">dialog\_save(\_title:[String](http://api.haxe.org/String.html)<span></span>, \_filter:[snow.types.FileFilter](../../../../../api/snow/types/FileFilter.html)<span></span>) : [String](http://api.haxe.org/String.html)</code><br/><span class="small_desc_flat">Call this to open a native platform file save dialog.
                Returns a blank string if they cancel or any error occurs.
                supports:`windows` `mac` `linux`</span>


</span>
<span class="method apipage">
            <a name="string_save_path"><a class="lift" href="#string_save_path">string\_save\_path</a></a><div class="clear"></div>
            <code class="signature apipage">string\_save\_path(\_slot:[Int](http://api.haxe.org/Int.html)<span></span>) : [String](http://api.haxe.org/String.html)</code><br/><span class="small_desc_flat">Returns the path where string_save operates.
                One targets where this is not a path, the path will be prefaced with `< >/`,
                i.e on web targets the path will be `<localstorage>/` followed by the ID.</span>


</span>
<span class="method apipage">
            <a name="url_open"><a class="lift" href="#url_open">url\_open</a></a><div class="clear"></div>
            <code class="signature apipage">url\_open(\_url:[String](http://api.haxe.org/String.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Opens the specified url in the default browser</span>


</span>
<span class="method apipage">
            <a name="watch_add"><a class="lift" href="#watch_add">watch\_add</a></a><div class="clear"></div>
            <code class="signature apipage">watch\_add(\_path:[String](http://api.haxe.org/String.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Call this to add a directory to watch for file change notifications.
            This is for directories only. Children files + sub folders children files will notify of change.
            supports:`windows` `mac` `linux` only</span>


</span>
<span class="method apipage">
            <a name="watch_remove"><a class="lift" href="#watch_remove">watch\_remove</a></a><div class="clear"></div>
            <code class="signature apipage">watch\_remove(\_path:[String](http://api.haxe.org/String.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Call this to remove a watched directory.
            supports:`windows` `mac` `linux` only</span>


</span>






<hr/>

&nbsp;
&nbsp;
&nbsp;
&nbsp;