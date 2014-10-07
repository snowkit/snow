
[![Logo](../../../images/logo.png)](../../../api/index.html)

<hr/>
<a href="#" id="search_bar" onclick="return;"><div> search API <em>(or start typing anywhere)</em> </div></a>
<hr/>

<script src="../../../js/omnibar.js"> </script>
<link rel="stylesheet" type="text/css" href="../../../css/omnibar.css" media="all">

<div id="omnibar"> <a href="#" onclick="return" id="omnibar_close"></a> <input id="omnibar_text" type="text" placeholder="search types..."></input></div>
<script  id="typelist" data-relpath="../../../" data-types="snow.App,snow.AppFixedTimestep,snow.Core,snow.CoreBinding,snow.Log,snow.Snow,snow.assets.Asset,snow.assets.AssetAudio,snow.assets.AssetBytes,snow.assets.AssetImage,snow.assets.AssetSystem,snow.assets.AssetSystemBinding,snow.assets.AssetText,snow.assets.Assets,snow.audio.Audio,snow.audio.AudioSystem,snow.audio.AudioSystemBinding,snow.audio.Sound,snow.audio.SoundBinding,snow.audio.SoundStream,snow.audio._Audio.AudioHandleMap,snow.audio.openal.AL,snow.audio.openal.ALC,snow.audio.openal.Context,snow.audio.openal.Device,snow.input.Input,snow.input.InputSystem,snow.input.InputSystemBinding,snow.input.Keycodes,snow.input.MapIntBool,snow.input.MapIntFloat,snow.input.Scancodes,snow.io.IO,snow.io.IOSystem,snow.io.IOSystemBinding,snow.platform.native.Core,snow.platform.native.StaticSnow,snow.platform.native.assets.AssetSystem,snow.platform.native.audio.AudioSystem,snow.platform.native.audio.Sound,snow.platform.native.audio.SoundStream,snow.platform.native.audio.openal.AL,snow.platform.native.audio.openal.ALC,snow.platform.native.audio.openal.AudioSystem,snow.platform.native.audio.openal.Context,snow.platform.native.audio.openal.Device,snow.platform.native.audio.openal.OpenALHelper,snow.platform.native.audio.openal.Sound,snow.platform.native.audio.openal.SoundStream,snow.platform.native.audio.openal._AL.Context_Impl_,snow.platform.native.audio.openal._AL.Device_Impl_,snow.platform.native.input.InputSystem,snow.platform.native.input.sdl.ControllerEventType,snow.platform.native.input.sdl.InputSystem,snow.platform.native.input.sdl.KeyEventType,snow.platform.native.input.sdl.ModValue,snow.platform.native.input.sdl.MouseEventType,snow.platform.native.input.sdl.TouchEventType,snow.platform.native.io.IOFile,snow.platform.native.io.IOFileHandle,snow.platform.native.io.IOSystem,snow.platform.native.io._IOFile.IOFileHandle_Impl_,snow.platform.native.render.opengl.GL,snow.platform.native.render.opengl.GLActiveInfo,snow.platform.native.render.opengl.GLBuffer,snow.platform.native.render.opengl.GLContextAttributes,snow.platform.native.render.opengl.GLFBO,snow.platform.native.render.opengl.GLFramebuffer,snow.platform.native.render.opengl.GLObject,snow.platform.native.render.opengl.GLProgram,snow.platform.native.render.opengl.GLRBO,snow.platform.native.render.opengl.GLRenderbuffer,snow.platform.native.render.opengl.GLShader,snow.platform.native.render.opengl.GLShaderPrecisionFormat,snow.platform.native.render.opengl.GLTexture,snow.platform.native.render.opengl.GLUniformLocation,snow.platform.native.render.opengl._GL.GLFramebuffer_Impl_,snow.platform.native.render.opengl._GL.GLRenderbuffer_Impl_,snow.platform.native.utils.ArrayBuffer,snow.platform.native.utils.ArrayBufferView,snow.platform.native.utils.ByteArray,snow.platform.native.utils.Compression,snow.platform.native.utils.Float32Array,snow.platform.native.utils.Int16Array,snow.platform.native.utils.Int32Array,snow.platform.native.utils.Int8Array,snow.platform.native.utils.UInt16Array,snow.platform.native.utils.UInt32Array,snow.platform.native.utils.UInt8Array,snow.platform.native.utils.UInt8ClampedArray,snow.platform.native.window.WindowSystem,snow.platform.native.window.sdl.WindowSystem,snow.platform.web.assets.psd.PSD,snow.platform.web.audio.AudioSystem,snow.platform.web.audio.Sound,snow.platform.web.audio.SoundStream,snow.platform.web.audio.howlerjs.AudioParams,snow.platform.web.audio.howlerjs.AudioSystem,snow.platform.web.audio.howlerjs.Howl,snow.platform.web.audio.howlerjs.Howler,snow.platform.web.audio.howlerjs.SoundStream,snow.platform.web.audio.howlerjs.SpriteParams,snow.render.opengl.GL,snow.render.opengl.GLActiveInfo,snow.render.opengl.GLBuffer,snow.render.opengl.GLContextAttributes,snow.render.opengl.GLFramebuffer,snow.render.opengl.GLProgram,snow.render.opengl.GLRenderbuffer,snow.render.opengl.GLShader,snow.render.opengl.GLTexture,snow.render.opengl.GLUniformLocation,snow.types.AppConfig,snow.types.AppConfigNative,snow.types.AppConfigWeb,snow.types.AssetAudioOptions,snow.types.AssetBytesOptions,snow.types.AssetImageOptions,snow.types.AssetInfo,snow.types.AssetTextOptions,snow.types.AssetType,snow.types.AudioDataBlob,snow.types.AudioDataInfo,snow.types.AudioFormatType,snow.types.AudioHandle,snow.types.AudioInfo,snow.types.DisplayMode,snow.types.FileEvent,snow.types.FileEventType,snow.types.FileFilter,snow.types.GamepadDeviceEventType,snow.types.ImageInfo,snow.types.InputEvent,snow.types.InputEventType,snow.types.Key,snow.types.ModState,snow.types.Scan,snow.types.SnowConfig,snow.types.SystemEvent,snow.types.SystemEventType,snow.types.TextEventType,snow.types.WindowConfig,snow.types.WindowEvent,snow.types.WindowEventType,snow.types.WindowHandle,snow.utils.AbstractClass,snow.utils.AbstractClassBuilder,snow.utils.ArrayBuffer,snow.utils.ArrayBufferView,snow.utils.ByteArray,snow.utils.Float32Array,snow.utils.IDataInput,snow.utils.IMemoryRange,snow.utils.Int16Array,snow.utils.Int32Array,snow.utils.Int8Array,snow.utils.Libs,snow.utils.Timer,snow.utils.UInt16Array,snow.utils.UInt32Array,snow.utils.UInt8Array,snow.utils.UInt8ClampedArray,snow.utils._AbstractClass.StringMap,snow.utils.format.png.Chunk,snow.utils.format.png.Color,snow.utils.format.png.Data,snow.utils.format.png.Header,snow.utils.format.png.Reader,snow.utils.format.png.Tools,snow.utils.format.png.Writer,snow.utils.format.tools.Adler32,snow.utils.format.tools.Deflate,snow.utils.format.tools.HuffTools,snow.utils.format.tools.Huffman,snow.utils.format.tools.Inflate,snow.utils.format.tools.InflateImpl,snow.utils.format.tools.MemoryBytes,snow.utils.format.tools._InflateImpl.State,snow.utils.format.tools._InflateImpl.Window,snow.window.Window,snow.window.WindowSystem,snow.window.WindowSystemBinding,snow.window.Windowing,snow.window._Windowing.WindowHandleMap"></script>


<h1>Window</h1>
<small>`snow.window.Window`</small>



<hr/>

`class`<br/><span class="meta">
meta: @:keep</span>

<hr/>


&nbsp;
&nbsp;




<h3>Members</h3> <hr/><span class="member apipage">
                <a name="asked_config"><a class="lift" href="#asked_config">asked\_config</a></a><div class="clear"></div>
                <code class="signature apipage">asked\_config : [snow.types.WindowConfig](../../../api/snow/types/WindowConfig.html)</code><br/></span>
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
                <code class="signature apipage">config : [snow.types.WindowConfig](../../../api/snow/types/WindowConfig.html)</code><br/></span>
            <span class="small_desc_flat">the actual returned window config</span><br/><span class="member apipage">
                <a name="fullscreen_desktop"><a class="lift" href="#fullscreen_desktop">fullscreen\_desktop</a></a><div class="clear"></div>
                <code class="signature apipage">fullscreen\_desktop : [Bool](http://api.haxe.org/Bool.html)</code><br/></span>
            <span class="small_desc_flat">set this for fullscreen desktop mode, i.e created at the full desktop resolution</span><br/><span class="member apipage">
                <a name="handle"><a class="lift" href="#handle">handle</a></a><div class="clear"></div>
                <code class="signature apipage">handle : [snow.types.WindowHandle](../../../api/snow/types/WindowHandle.html)</code><br/></span>
            <span class="small_desc_flat">the native window handle</span><br/><span class="member apipage">
                <a name="id"><a class="lift" href="#id">id</a></a><div class="clear"></div>
                <code class="signature apipage">id : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat">the window id, for tracking events to each window</span><br/><span class="member apipage">
                <a name="manager"><a class="lift" href="#manager">manager</a></a><div class="clear"></div>
                <code class="signature apipage">manager : [snow.window.Windowing](../../../api/snow/window/Windowing.html)</code><br/></span>
            <span class="small_desc_flat">the manager this window belongs to</span><br/><span class="member apipage">
                <a name="onevent"><a class="lift" href="#onevent">onevent</a></a><div class="clear"></div>
                <code class="signature apipage">onevent : [snow.types.WindowEvent](../../../api/snow/types/WindowEvent.html)&nbsp;-&gt; [Void](http://api.haxe.org/Void.html)</code><br/></span>
            <span class="small_desc_flat">the window event handler callback</span><br/><span class="member apipage">
                <a name="onrender"><a class="lift" href="#onrender">onrender</a></a><div class="clear"></div>
                <code class="signature apipage">onrender : [snow.window.Window](../../../api/snow/window/Window.html)&nbsp;-&gt; [Void](http://api.haxe.org/Void.html)</code><br/></span>
            <span class="small_desc_flat">the window render handler callback</span><br/>

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
            <code class="signature apipage">new(\_manager:[snow.window.Windowing](../../../api/snow/window/Windowing.html)<span></span>, \_config:[snow.types.WindowConfig](../../../api/snow/types/WindowConfig.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


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
            <code class="signature apipage">simple\_message(message:[String](http://api.haxe.org/String.html)<span></span>, title:[String](http://api.haxe.org/String.html)<span>=&#x27;&#x27;</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Display a cross platform message on this window</span>


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