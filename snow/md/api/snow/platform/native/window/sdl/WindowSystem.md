
[![Logo](../../../../../../images/logo.png)](../../../../../../api/index.html)

<hr/>
<a href="#" id="search_bar" onclick="return;"><div> search API <em>(or start typing anywhere)</em> </div></a>
<hr/>

<script src="../../../../../../js/omnibar.js"> </script>
<link rel="stylesheet" type="text/css" href="../../../../../../css/omnibar.css" media="all">

<div id="omnibar"> <a href="#" onclick="return" id="omnibar_close"></a> <input id="omnibar_text" type="text" placeholder="search types..."></input></div>
<script  id="typelist" data-relpath="../../../../../../" data-types="snow.App,snow.AppFixedTimestep,snow.Core,snow.CoreBinding,snow.Log,snow.Snow,snow.assets.Asset,snow.assets.AssetAudio,snow.assets.AssetBytes,snow.assets.AssetImage,snow.assets.AssetSystem,snow.assets.AssetSystemBinding,snow.assets.AssetText,snow.assets.Assets,snow.audio.Audio,snow.audio.AudioSystem,snow.audio.AudioSystemBinding,snow.audio.Sound,snow.audio.SoundBinding,snow.audio.SoundStream,snow.audio._Audio.AudioHandleMap,snow.audio.openal.AL,snow.audio.openal.ALC,snow.audio.openal.Context,snow.audio.openal.Device,snow.input.Input,snow.input.InputSystem,snow.input.InputSystemBinding,snow.input.Keycodes,snow.input.MapIntBool,snow.input.MapIntFloat,snow.input.Scancodes,snow.io.IO,snow.io.IOSystem,snow.io.IOSystemBinding,snow.platform.native.Core,snow.platform.native.StaticSnow,snow.platform.native.assets.AssetSystem,snow.platform.native.audio.AudioSystem,snow.platform.native.audio.Sound,snow.platform.native.audio.SoundStream,snow.platform.native.audio.openal.AL,snow.platform.native.audio.openal.ALC,snow.platform.native.audio.openal.AudioSystem,snow.platform.native.audio.openal.Context,snow.platform.native.audio.openal.Device,snow.platform.native.audio.openal.OpenALHelper,snow.platform.native.audio.openal.Sound,snow.platform.native.audio.openal.SoundStream,snow.platform.native.audio.openal._AL.Context_Impl_,snow.platform.native.audio.openal._AL.Device_Impl_,snow.platform.native.input.InputSystem,snow.platform.native.input.sdl.ControllerEventType,snow.platform.native.input.sdl.InputSystem,snow.platform.native.input.sdl.KeyEventType,snow.platform.native.input.sdl.ModValue,snow.platform.native.input.sdl.MouseEventType,snow.platform.native.input.sdl.TouchEventType,snow.platform.native.io.IOFile,snow.platform.native.io.IOFileHandle,snow.platform.native.io.IOSystem,snow.platform.native.io._IOFile.IOFileHandle_Impl_,snow.platform.native.render.opengl.GL,snow.platform.native.render.opengl.GLActiveInfo,snow.platform.native.render.opengl.GLBuffer,snow.platform.native.render.opengl.GLContextAttributes,snow.platform.native.render.opengl.GLFBO,snow.platform.native.render.opengl.GLFramebuffer,snow.platform.native.render.opengl.GLObject,snow.platform.native.render.opengl.GLProgram,snow.platform.native.render.opengl.GLRBO,snow.platform.native.render.opengl.GLRenderbuffer,snow.platform.native.render.opengl.GLShader,snow.platform.native.render.opengl.GLShaderPrecisionFormat,snow.platform.native.render.opengl.GLTexture,snow.platform.native.render.opengl.GLUniformLocation,snow.platform.native.render.opengl._GL.GLFramebuffer_Impl_,snow.platform.native.render.opengl._GL.GLRenderbuffer_Impl_,snow.platform.native.utils.ArrayBuffer,snow.platform.native.utils.ArrayBufferView,snow.platform.native.utils.ByteArray,snow.platform.native.utils.Compression,snow.platform.native.utils.Float32Array,snow.platform.native.utils.Int16Array,snow.platform.native.utils.Int32Array,snow.platform.native.utils.Int8Array,snow.platform.native.utils.UInt16Array,snow.platform.native.utils.UInt32Array,snow.platform.native.utils.UInt8Array,snow.platform.native.utils.UInt8ClampedArray,snow.platform.native.window.WindowSystem,snow.platform.native.window.sdl.WindowSystem,snow.platform.web.assets.psd.PSD,snow.platform.web.audio.AudioSystem,snow.platform.web.audio.Sound,snow.platform.web.audio.SoundStream,snow.platform.web.audio.howlerjs.AudioParams,snow.platform.web.audio.howlerjs.AudioSystem,snow.platform.web.audio.howlerjs.Howl,snow.platform.web.audio.howlerjs.Howler,snow.platform.web.audio.howlerjs.SoundStream,snow.platform.web.audio.howlerjs.SpriteParams,snow.render.opengl.GL,snow.render.opengl.GLActiveInfo,snow.render.opengl.GLBuffer,snow.render.opengl.GLContextAttributes,snow.render.opengl.GLFramebuffer,snow.render.opengl.GLProgram,snow.render.opengl.GLRenderbuffer,snow.render.opengl.GLShader,snow.render.opengl.GLTexture,snow.render.opengl.GLUniformLocation,snow.types.AppConfig,snow.types.AppConfigNative,snow.types.AppConfigWeb,snow.types.AssetAudioOptions,snow.types.AssetBytesOptions,snow.types.AssetImageOptions,snow.types.AssetInfo,snow.types.AssetTextOptions,snow.types.AssetType,snow.types.AudioDataBlob,snow.types.AudioDataInfo,snow.types.AudioFormatType,snow.types.AudioHandle,snow.types.AudioInfo,snow.types.DisplayMode,snow.types.FileEvent,snow.types.FileEventType,snow.types.FileFilter,snow.types.GamepadDeviceEventType,snow.types.ImageInfo,snow.types.InputEvent,snow.types.InputEventType,snow.types.Key,snow.types.ModState,snow.types.Scan,snow.types.SnowConfig,snow.types.SystemEvent,snow.types.SystemEventType,snow.types.TextEventType,snow.types.WindowConfig,snow.types.WindowEvent,snow.types.WindowEventType,snow.types.WindowHandle,snow.utils.AbstractClass,snow.utils.AbstractClassBuilder,snow.utils.ArrayBuffer,snow.utils.ArrayBufferView,snow.utils.ByteArray,snow.utils.Float32Array,snow.utils.IDataInput,snow.utils.IMemoryRange,snow.utils.Int16Array,snow.utils.Int32Array,snow.utils.Int8Array,snow.utils.Libs,snow.utils.Timer,snow.utils.UInt16Array,snow.utils.UInt32Array,snow.utils.UInt8Array,snow.utils.UInt8ClampedArray,snow.utils._AbstractClass.StringMap,snow.utils.format.png.Chunk,snow.utils.format.png.Color,snow.utils.format.png.Data,snow.utils.format.png.Header,snow.utils.format.png.Reader,snow.utils.format.png.Tools,snow.utils.format.png.Writer,snow.utils.format.tools.Adler32,snow.utils.format.tools.Deflate,snow.utils.format.tools.HuffTools,snow.utils.format.tools.Huffman,snow.utils.format.tools.Inflate,snow.utils.format.tools.InflateImpl,snow.utils.format.tools.MemoryBytes,snow.utils.format.tools._InflateImpl.State,snow.utils.format.tools._InflateImpl.Window,snow.window.Window,snow.window.WindowSystem,snow.window.WindowSystemBinding,snow.window.Windowing,snow.window._Windowing.WindowHandleMap"></script>


<h1>WindowSystem</h1>
<small>`snow.platform.native.window.sdl.WindowSystem`</small>



<hr/>

`class`extends <code><span>snow.platform.native.window.WindowSystem</span></code><br/><span class="meta">
meta: @:keep, @:build(&#x27;???&#x27;), @:autoBuild(&#x27;???&#x27;), @:noCompletion</span>

<hr/>


&nbsp;
&nbsp;




<h3>Members</h3> <hr/>


<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="bordered"><a class="lift" href="#bordered">bordered</a></a><a data-tooltip="inherited from <a href='../../../../../../api/snow/platform/native/window/WindowSystem.html#bordered'>snow.platform.native.window.WindowSystem</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">bordered(window:[snow.window.Window](../../../../../../api/snow/window/Window.html)<span></span>, bordered:[Bool](http://api.haxe.org/Bool.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="close"><a class="lift" href="#close">close</a></a><a data-tooltip="inherited from <a href='../../../../../../api/snow/platform/native/window/WindowSystem.html#close'>snow.platform.native.window.WindowSystem</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">close(window:[snow.window.Window](../../../../../../api/snow/window/Window.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="create"><a class="lift" href="#create">create</a></a><a data-tooltip="inherited from <a href='../../../../../../api/snow/platform/native/window/WindowSystem.html#create'>snow.platform.native.window.WindowSystem</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">create(config:[snow.types.WindowConfig](../../../../../../api/snow/types/WindowConfig.html)<span></span>, on\_created:[snow.types.WindowHandle](../../../../../../api/snow/types/WindowHandle.html)&nbsp; -&gt; [Int](http://api.haxe.org/Int.html)&nbsp; -&gt; [snow.types.WindowConfig](../../../../../../api/snow/types/WindowConfig.html)&nbsp;-&gt; [Void](http://api.haxe.org/Void.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="destroy"><a class="lift" href="#destroy">destroy</a></a><a data-tooltip="inherited from <a href='../../../../../../api/snow/platform/native/window/WindowSystem.html#destroy'>snow.platform.native.window.WindowSystem</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">destroy() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="destroy_window"><a class="lift" href="#destroy_window">destroy\_window</a></a><a data-tooltip="inherited from <a href='../../../../../../api/snow/platform/native/window/WindowSystem.html#destroy\_window'>snow.platform.native.window.WindowSystem</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">destroy\_window(window:[snow.window.Window](../../../../../../api/snow/window/Window.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="display_bounds"><a class="lift" href="#display_bounds">display\_bounds</a></a><a data-tooltip="inherited from <a href='../../../../../../api/snow/platform/native/window/WindowSystem.html#display\_bounds'>snow.platform.native.window.WindowSystem</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">display\_bounds(display:[Int](http://api.haxe.org/Int.html)<span></span>) : [Dynamic](#)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="display_count"><a class="lift" href="#display_count">display\_count</a></a><a data-tooltip="inherited from <a href='../../../../../../api/snow/platform/native/window/WindowSystem.html#display\_count'>snow.platform.native.window.WindowSystem</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">display\_count() : [Int](http://api.haxe.org/Int.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="display_current_mode"><a class="lift" href="#display_current_mode">display\_current\_mode</a></a><a data-tooltip="inherited from <a href='../../../../../../api/snow/platform/native/window/WindowSystem.html#display\_current\_mode'>snow.platform.native.window.WindowSystem</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">display\_current\_mode(display:[Int](http://api.haxe.org/Int.html)<span></span>) : [snow.types.DisplayMode](../../../../../../api/snow/types/DisplayMode.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="display_mode"><a class="lift" href="#display_mode">display\_mode</a></a><a data-tooltip="inherited from <a href='../../../../../../api/snow/platform/native/window/WindowSystem.html#display\_mode'>snow.platform.native.window.WindowSystem</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">display\_mode(display:[Int](http://api.haxe.org/Int.html)<span></span>, mode\_index:[Int](http://api.haxe.org/Int.html)<span></span>) : [snow.types.DisplayMode](../../../../../../api/snow/types/DisplayMode.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="display_mode_count"><a class="lift" href="#display_mode_count">display\_mode\_count</a></a><a data-tooltip="inherited from <a href='../../../../../../api/snow/platform/native/window/WindowSystem.html#display\_mode\_count'>snow.platform.native.window.WindowSystem</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">display\_mode\_count(display:[Int](http://api.haxe.org/Int.html)<span></span>) : [Int](http://api.haxe.org/Int.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="display_name"><a class="lift" href="#display_name">display\_name</a></a><a data-tooltip="inherited from <a href='../../../../../../api/snow/platform/native/window/WindowSystem.html#display\_name'>snow.platform.native.window.WindowSystem</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">display\_name(display:[Int](http://api.haxe.org/Int.html)<span></span>) : [String](http://api.haxe.org/String.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="display_native_mode"><a class="lift" href="#display_native_mode">display\_native\_mode</a></a><a data-tooltip="inherited from <a href='../../../../../../api/snow/platform/native/window/WindowSystem.html#display\_native\_mode'>snow.platform.native.window.WindowSystem</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">display\_native\_mode(display:[Int](http://api.haxe.org/Int.html)<span></span>) : [snow.types.DisplayMode](../../../../../../api/snow/types/DisplayMode.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="fullscreen"><a class="lift" href="#fullscreen">fullscreen</a></a><a data-tooltip="inherited from <a href='../../../../../../api/snow/platform/native/window/WindowSystem.html#fullscreen'>snow.platform.native.window.WindowSystem</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">fullscreen(window:[snow.window.Window](../../../../../../api/snow/window/Window.html)<span></span>, fullscreen:[Bool](http://api.haxe.org/Bool.html)<span></span>, fullscreen\_desktop:[Bool](http://api.haxe.org/Bool.html)<span>=true</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="grab"><a class="lift" href="#grab">grab</a></a><a data-tooltip="inherited from <a href='../../../../../../api/snow/platform/native/window/WindowSystem.html#grab'>snow.platform.native.window.WindowSystem</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">grab(window:[snow.window.Window](../../../../../../api/snow/window/Window.html)<span></span>, grabbed:[Bool](http://api.haxe.org/Bool.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="init"><a class="lift" href="#init">init</a></a><a data-tooltip="inherited from <a href='../../../../../../api/snow/platform/native/window/WindowSystem.html#init'>snow.platform.native.window.WindowSystem</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">init() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a><div class="clear"></div>
            <code class="signature apipage">new(\_manager:[snow.window.Windowing](../../../../../../api/snow/window/Windowing.html)<span></span>, \_lib:[snow.Snow](../../../../../../api/snow/Snow.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="process"><a class="lift" href="#process">process</a></a><a data-tooltip="inherited from <a href='../../../../../../api/snow/platform/native/window/WindowSystem.html#process'>snow.platform.native.window.WindowSystem</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">process() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="render"><a class="lift" href="#render">render</a></a><a data-tooltip="inherited from <a href='../../../../../../api/snow/platform/native/window/WindowSystem.html#render'>snow.platform.native.window.WindowSystem</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">render(window:[snow.window.Window](../../../../../../api/snow/window/Window.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="set_cursor_position"><a class="lift" href="#set_cursor_position">set\_cursor\_position</a></a><a data-tooltip="inherited from <a href='../../../../../../api/snow/platform/native/window/WindowSystem.html#set\_cursor\_position'>snow.platform.native.window.WindowSystem</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">set\_cursor\_position(window:[snow.window.Window](../../../../../../api/snow/window/Window.html)<span></span>, x:[Int](http://api.haxe.org/Int.html)<span></span>, y:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="set_max_size"><a class="lift" href="#set_max_size">set\_max\_size</a></a><a data-tooltip="inherited from <a href='../../../../../../api/snow/platform/native/window/WindowSystem.html#set\_max\_size'>snow.platform.native.window.WindowSystem</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">set\_max\_size(window:[snow.window.Window](../../../../../../api/snow/window/Window.html)<span></span>, w:[Int](http://api.haxe.org/Int.html)<span></span>, h:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="set_min_size"><a class="lift" href="#set_min_size">set\_min\_size</a></a><a data-tooltip="inherited from <a href='../../../../../../api/snow/platform/native/window/WindowSystem.html#set\_min\_size'>snow.platform.native.window.WindowSystem</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">set\_min\_size(window:[snow.window.Window](../../../../../../api/snow/window/Window.html)<span></span>, w:[Int](http://api.haxe.org/Int.html)<span></span>, h:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="set_position"><a class="lift" href="#set_position">set\_position</a></a><a data-tooltip="inherited from <a href='../../../../../../api/snow/platform/native/window/WindowSystem.html#set\_position'>snow.platform.native.window.WindowSystem</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">set\_position(window:[snow.window.Window](../../../../../../api/snow/window/Window.html)<span></span>, x:[Int](http://api.haxe.org/Int.html)<span></span>, y:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="set_size"><a class="lift" href="#set_size">set\_size</a></a><a data-tooltip="inherited from <a href='../../../../../../api/snow/platform/native/window/WindowSystem.html#set\_size'>snow.platform.native.window.WindowSystem</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">set\_size(window:[snow.window.Window](../../../../../../api/snow/window/Window.html)<span></span>, w:[Int](http://api.haxe.org/Int.html)<span></span>, h:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="set_title"><a class="lift" href="#set_title">set\_title</a></a><a data-tooltip="inherited from <a href='../../../../../../api/snow/platform/native/window/WindowSystem.html#set\_title'>snow.platform.native.window.WindowSystem</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">set\_title(window:[snow.window.Window](../../../../../../api/snow/window/Window.html)<span></span>, title:[String](http://api.haxe.org/String.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="show"><a class="lift" href="#show">show</a></a><a data-tooltip="inherited from <a href='../../../../../../api/snow/platform/native/window/WindowSystem.html#show'>snow.platform.native.window.WindowSystem</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">show(window:[snow.window.Window](../../../../../../api/snow/window/Window.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="simple_message"><a class="lift" href="#simple_message">simple\_message</a></a><a data-tooltip="inherited from <a href='../../../../../../api/snow/platform/native/window/WindowSystem.html#simple\_message'>snow.platform.native.window.WindowSystem</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">simple\_message(window:[snow.window.Window](../../../../../../api/snow/window/Window.html)<span></span>, message:[String](http://api.haxe.org/String.html)<span></span>, title:[String](http://api.haxe.org/String.html)<span>=&#x27;&#x27;</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="swap"><a class="lift" href="#swap">swap</a></a><a data-tooltip="inherited from <a href='../../../../../../api/snow/platform/native/window/WindowSystem.html#swap'>snow.platform.native.window.WindowSystem</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">swap(window:[snow.window.Window](../../../../../../api/snow/window/Window.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="system_enable_cursor"><a class="lift" href="#system_enable_cursor">system\_enable\_cursor</a></a><a data-tooltip="inherited from <a href='../../../../../../api/snow/platform/native/window/WindowSystem.html#system\_enable\_cursor'>snow.platform.native.window.WindowSystem</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">system\_enable\_cursor(enable:[Bool](http://api.haxe.org/Bool.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Toggle the OS cursor. This is not window specific but system wide</span>


</span>
<span class="method apipage">
            <a name="system_enable_vsync"><a class="lift" href="#system_enable_vsync">system\_enable\_vsync</a></a><a data-tooltip="inherited from <a href='../../../../../../api/snow/platform/native/window/WindowSystem.html#system\_enable\_vsync'>snow.platform.native.window.WindowSystem</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">system\_enable\_vsync(enable:[Bool](http://api.haxe.org/Bool.html)<span></span>) : [Int](http://api.haxe.org/Int.html)</code><br/><span class="small_desc_flat">Toggle vertical refresh. This is not window specific but context wide</span>


</span>
<span class="method apipage">
            <a name="system_lock_cursor"><a class="lift" href="#system_lock_cursor">system\_lock\_cursor</a></a><a data-tooltip="inherited from <a href='../../../../../../api/snow/platform/native/window/WindowSystem.html#system\_lock\_cursor'>snow.platform.native.window.WindowSystem</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">system\_lock\_cursor(enable:[Bool](http://api.haxe.org/Bool.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Lock the OS cursor to the foreground window. This hides the cursor and prevents it from leaving, reporting relative coordinates.</span>


</span>
<span class="method apipage">
            <a name="update"><a class="lift" href="#update">update</a></a><a data-tooltip="inherited from <a href='../../../../../../api/snow/platform/native/window/WindowSystem.html#update'>snow.platform.native.window.WindowSystem</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">update(window:[snow.window.Window](../../../../../../api/snow/window/Window.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>



<hr/>

&nbsp;
&nbsp;
&nbsp;
&nbsp;