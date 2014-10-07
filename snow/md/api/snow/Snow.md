
[![Logo](../../images/logo.png)](../../api/index.html)

<hr/>
<a href="#" id="search_bar" onclick="return;"><div> search API <em>(or start typing anywhere)</em> </div></a>
<hr/>

<script src="../../js/omnibar.js"> </script>
<link rel="stylesheet" type="text/css" href="../../css/omnibar.css" media="all">

<div id="omnibar"> <a href="#" onclick="return" id="omnibar_close"></a> <input id="omnibar_text" type="text" placeholder="search types..."></input></div>
<script  id="typelist" data-relpath="../../" data-types="snow.App,snow.AppFixedTimestep,snow.Core,snow.CoreBinding,snow.Log,snow.Snow,snow.assets.Asset,snow.assets.AssetAudio,snow.assets.AssetBytes,snow.assets.AssetImage,snow.assets.AssetSystem,snow.assets.AssetSystemBinding,snow.assets.AssetText,snow.assets.Assets,snow.audio.Audio,snow.audio.AudioSystem,snow.audio.AudioSystemBinding,snow.audio.Sound,snow.audio.SoundBinding,snow.audio.SoundStream,snow.audio._Audio.AudioHandleMap,snow.audio.openal.AL,snow.audio.openal.ALC,snow.audio.openal.Context,snow.audio.openal.Device,snow.input.Input,snow.input.InputSystem,snow.input.InputSystemBinding,snow.input.Keycodes,snow.input.MapIntBool,snow.input.MapIntFloat,snow.input.Scancodes,snow.io.IO,snow.io.IOSystem,snow.io.IOSystemBinding,snow.platform.native.Core,snow.platform.native.StaticSnow,snow.platform.native.assets.AssetSystem,snow.platform.native.audio.AudioSystem,snow.platform.native.audio.Sound,snow.platform.native.audio.SoundStream,snow.platform.native.audio.openal.AL,snow.platform.native.audio.openal.ALC,snow.platform.native.audio.openal.AudioSystem,snow.platform.native.audio.openal.Context,snow.platform.native.audio.openal.Device,snow.platform.native.audio.openal.OpenALHelper,snow.platform.native.audio.openal.Sound,snow.platform.native.audio.openal.SoundStream,snow.platform.native.audio.openal._AL.Context_Impl_,snow.platform.native.audio.openal._AL.Device_Impl_,snow.platform.native.input.InputSystem,snow.platform.native.input.sdl.ControllerEventType,snow.platform.native.input.sdl.InputSystem,snow.platform.native.input.sdl.KeyEventType,snow.platform.native.input.sdl.ModValue,snow.platform.native.input.sdl.MouseEventType,snow.platform.native.input.sdl.TouchEventType,snow.platform.native.io.IOFile,snow.platform.native.io.IOFileHandle,snow.platform.native.io.IOSystem,snow.platform.native.io._IOFile.IOFileHandle_Impl_,snow.platform.native.render.opengl.GL,snow.platform.native.render.opengl.GLActiveInfo,snow.platform.native.render.opengl.GLBuffer,snow.platform.native.render.opengl.GLContextAttributes,snow.platform.native.render.opengl.GLFBO,snow.platform.native.render.opengl.GLFramebuffer,snow.platform.native.render.opengl.GLObject,snow.platform.native.render.opengl.GLProgram,snow.platform.native.render.opengl.GLRBO,snow.platform.native.render.opengl.GLRenderbuffer,snow.platform.native.render.opengl.GLShader,snow.platform.native.render.opengl.GLShaderPrecisionFormat,snow.platform.native.render.opengl.GLTexture,snow.platform.native.render.opengl.GLUniformLocation,snow.platform.native.render.opengl._GL.GLFramebuffer_Impl_,snow.platform.native.render.opengl._GL.GLRenderbuffer_Impl_,snow.platform.native.utils.ArrayBuffer,snow.platform.native.utils.ArrayBufferView,snow.platform.native.utils.ByteArray,snow.platform.native.utils.Compression,snow.platform.native.utils.Float32Array,snow.platform.native.utils.Int16Array,snow.platform.native.utils.Int32Array,snow.platform.native.utils.Int8Array,snow.platform.native.utils.UInt16Array,snow.platform.native.utils.UInt32Array,snow.platform.native.utils.UInt8Array,snow.platform.native.utils.UInt8ClampedArray,snow.platform.native.window.WindowSystem,snow.platform.native.window.sdl.WindowSystem,snow.platform.web.assets.psd.PSD,snow.platform.web.audio.AudioSystem,snow.platform.web.audio.Sound,snow.platform.web.audio.SoundStream,snow.platform.web.audio.howlerjs.AudioParams,snow.platform.web.audio.howlerjs.AudioSystem,snow.platform.web.audio.howlerjs.Howl,snow.platform.web.audio.howlerjs.Howler,snow.platform.web.audio.howlerjs.SoundStream,snow.platform.web.audio.howlerjs.SpriteParams,snow.render.opengl.GL,snow.render.opengl.GLActiveInfo,snow.render.opengl.GLBuffer,snow.render.opengl.GLContextAttributes,snow.render.opengl.GLFramebuffer,snow.render.opengl.GLProgram,snow.render.opengl.GLRenderbuffer,snow.render.opengl.GLShader,snow.render.opengl.GLTexture,snow.render.opengl.GLUniformLocation,snow.types.AppConfig,snow.types.AppConfigNative,snow.types.AppConfigWeb,snow.types.AssetAudioOptions,snow.types.AssetBytesOptions,snow.types.AssetImageOptions,snow.types.AssetInfo,snow.types.AssetTextOptions,snow.types.AssetType,snow.types.AudioDataBlob,snow.types.AudioDataInfo,snow.types.AudioFormatType,snow.types.AudioHandle,snow.types.AudioInfo,snow.types.DisplayMode,snow.types.FileEvent,snow.types.FileEventType,snow.types.FileFilter,snow.types.GamepadDeviceEventType,snow.types.ImageInfo,snow.types.InputEvent,snow.types.InputEventType,snow.types.Key,snow.types.ModState,snow.types.Scan,snow.types.SnowConfig,snow.types.SystemEvent,snow.types.SystemEventType,snow.types.TextEventType,snow.types.WindowConfig,snow.types.WindowEvent,snow.types.WindowEventType,snow.types.WindowHandle,snow.utils.AbstractClass,snow.utils.AbstractClassBuilder,snow.utils.ArrayBuffer,snow.utils.ArrayBufferView,snow.utils.ByteArray,snow.utils.Float32Array,snow.utils.IDataInput,snow.utils.IMemoryRange,snow.utils.Int16Array,snow.utils.Int32Array,snow.utils.Int8Array,snow.utils.Libs,snow.utils.Timer,snow.utils.UInt16Array,snow.utils.UInt32Array,snow.utils.UInt8Array,snow.utils.UInt8ClampedArray,snow.utils._AbstractClass.StringMap,snow.utils.format.png.Chunk,snow.utils.format.png.Color,snow.utils.format.png.Data,snow.utils.format.png.Header,snow.utils.format.png.Reader,snow.utils.format.png.Tools,snow.utils.format.png.Writer,snow.utils.format.tools.Adler32,snow.utils.format.tools.Deflate,snow.utils.format.tools.HuffTools,snow.utils.format.tools.Huffman,snow.utils.format.tools.Inflate,snow.utils.format.tools.InflateImpl,snow.utils.format.tools.MemoryBytes,snow.utils.format.tools._InflateImpl.State,snow.utils.format.tools._InflateImpl.Window,snow.window.Window,snow.window.WindowSystem,snow.window.WindowSystemBinding,snow.window.Windowing,snow.window._Windowing.WindowHandleMap"></script>


<h1>Snow</h1>
<small>`snow.Snow`</small>



<hr/>

`class`<br/><span class="meta">
meta: @:keep</span>

<hr/>


&nbsp;
&nbsp;




<h3>Members</h3> <hr/><span class="member apipage">
                <a name="assets"><a class="lift" href="#assets">assets</a></a><div class="clear"></div>
                <code class="signature apipage">assets : [snow.assets.Assets](../../api/snow/assets/Assets.html)</code><br/></span>
            <span class="small_desc_flat">The asset system</span><br/><span class="member apipage">
                <a name="audio"><a class="lift" href="#audio">audio</a></a><div class="clear"></div>
                <code class="signature apipage">audio : [snow.audio.Audio](../../api/snow/audio/Audio.html)</code><br/></span>
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
                <code class="signature apipage">input : [snow.input.Input](../../api/snow/input/Input.html)</code><br/></span>
            <span class="small_desc_flat">The input system</span><br/><span class="member apipage">
                <a name="io"><a class="lift" href="#io">io</a></a><div class="clear"></div>
                <code class="signature apipage">io : [snow.io.IO](../../api/snow/io/IO.html)</code><br/></span>
            <span class="small_desc_flat">The io system</span><br/><span class="member apipage">
                <a name="shutting_down"><a class="lift" href="#shutting_down">shutting\_down</a></a><div class="clear"></div>
                <code class="signature apipage">shutting\_down : [Bool](http://api.haxe.org/Bool.html)</code><br/></span>
            <span class="small_desc_flat">Set if shut down has commenced</span><br/><span class="member apipage">
                <a name="snow_config"><a class="lift" href="#snow_config">snow\_config</a></a><div class="clear"></div>
                <code class="signature apipage">snow\_config : [snow.types.SnowConfig](../../api/snow/types/SnowConfig.html)</code><br/></span>
            <span class="small_desc_flat">The configuration for snow itself, set via build project flags</span><br/><span class="member apipage">
                <a name="window"><a class="lift" href="#window">window</a></a><div class="clear"></div>
                <code class="signature apipage">window : [snow.window.Window](../../api/snow/window/Window.html)</code><br/></span>
            <span class="small_desc_flat">If the config specifies a default window, this is it</span><br/><span class="member apipage">
                <a name="windowing"><a class="lift" href="#windowing">windowing</a></a><div class="clear"></div>
                <code class="signature apipage">windowing : [snow.window.Windowing](../../api/snow/window/Windowing.html)</code><br/></span>
            <span class="small_desc_flat">The window manager</span><br/>

<h3>Properties</h3> <hr/><span class="member apipage">
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
            <a name="load"><a class="lift" href="#load">load</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">load(library:[String](http://api.haxe.org/String.html)<span></span>, method:[String](http://api.haxe.org/String.html)<span></span>, args:[Int](http://api.haxe.org/Int.html)<span>=0</span>) : [Dynamic](#)</code><br/><span class="small_desc_flat">Loads a function out of a library</span>


</span>
<span class="method apipage">
            <a name="next"><a class="lift" href="#next">next</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">next(func:[Dynamic](#)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Call a function at the start of the next frame,
            useful for async calls in a sync context, allowing the sync function to return safely before the onload is fired.</span>


</span>
<span class="method apipage">
            <a name="render"><a class="lift" href="#render">render</a></a><div class="clear"></div>
            <code class="signature apipage">render() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Called for you by snow, unless configured otherwise. Only call this manually if your render_rate is 0!</span>


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