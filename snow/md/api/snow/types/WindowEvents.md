
[![Logo](../../../images/logo.png)](../../../api/index.html)

<hr/>
<a href="#" id="search_bar" onclick="return;"><div> search API <em>(or start typing anywhere)</em> </div></a>
<hr/>

<script src="../../../js/omnibar.js"> </script>
<link rel="stylesheet" type="text/css" href="../../../css/omnibar.css" media="all">

<div id="omnibar"> <a href="#" onclick="return" id="omnibar_close"></a> <input id="omnibar_text" type="text" placeholder="search types..."></input></div>
<script  id="typelist" data-relpath="../../../" data-types="snow.App,snow.AppFixedTimestep,snow.Core,snow.CoreBinding,snow.Log,snow.Snow,snow.assets.Asset,snow.assets.AssetAudio,snow.assets.AssetBytes,snow.assets.AssetImage,snow.assets.AssetSystem,snow.assets.AssetSystemBinding,snow.assets.AssetText,snow.assets.Assets,snow.audio.Audio,snow.audio.AudioSystem,snow.audio.AudioSystemBinding,snow.audio.Sound,snow.audio.SoundBinding,snow.audio.SoundStream,snow.audio._Audio.AudioHandleMap,snow.audio.openal.AL,snow.audio.openal.ALC,snow.audio.openal.Context,snow.audio.openal.Device,snow.input.Input,snow.input.InputSystem,snow.input.InputSystemBinding,snow.input.Keycodes,snow.input.MapIntBool,snow.input.MapIntFloat,snow.input.Scancodes,snow.io.IO,snow.io.IOSystem,snow.io.IOSystemBinding,snow.platform.native.Core,snow.platform.native.StaticSnow,snow.platform.native.assets.AssetSystem,snow.platform.native.audio.AudioSystem,snow.platform.native.audio.Sound,snow.platform.native.audio.SoundStream,snow.platform.native.audio.openal.AL,snow.platform.native.audio.openal.ALC,snow.platform.native.audio.openal.AudioSystem,snow.platform.native.audio.openal.Context,snow.platform.native.audio.openal.Device,snow.platform.native.audio.openal.OpenALHelper,snow.platform.native.audio.openal.Sound,snow.platform.native.audio.openal.SoundStream,snow.platform.native.audio.openal._AL.Context_Impl_,snow.platform.native.audio.openal._AL.Device_Impl_,snow.platform.native.input.InputSystem,snow.platform.native.input.sdl.ControllerEventType,snow.platform.native.input.sdl.GamepadEventTypes,snow.platform.native.input.sdl.InputSystem,snow.platform.native.input.sdl.KeyEventType,snow.platform.native.input.sdl.KeyEventTypes,snow.platform.native.input.sdl.ModValue,snow.platform.native.input.sdl.MouseEventType,snow.platform.native.input.sdl.MouseEventTypes,snow.platform.native.input.sdl.TouchEventTypes,snow.platform.native.input.sdl.TouchState,snow.platform.native.io.IOFile,snow.platform.native.io.IOFileHandle,snow.platform.native.io.IOSystem,snow.platform.native.io._IOFile.IOFileHandle_Impl_,snow.platform.native.render.opengl.GL,snow.platform.native.render.opengl.GLActiveInfo,snow.platform.native.render.opengl.GLBuffer,snow.platform.native.render.opengl.GLContextAttributes,snow.platform.native.render.opengl.GLFBO,snow.platform.native.render.opengl.GLFramebuffer,snow.platform.native.render.opengl.GLObject,snow.platform.native.render.opengl.GLProgram,snow.platform.native.render.opengl.GLRBO,snow.platform.native.render.opengl.GLRenderbuffer,snow.platform.native.render.opengl.GLShader,snow.platform.native.render.opengl.GLShaderPrecisionFormat,snow.platform.native.render.opengl.GLTexture,snow.platform.native.render.opengl.GLUniformLocation,snow.platform.native.render.opengl._GL.GLFramebuffer_Impl_,snow.platform.native.render.opengl._GL.GLRenderbuffer_Impl_,snow.platform.native.utils.ArrayBuffer,snow.platform.native.utils.ArrayBufferView,snow.platform.native.utils.ByteArray,snow.platform.native.utils.Compression,snow.platform.native.utils.Float32Array,snow.platform.native.utils.Int16Array,snow.platform.native.utils.Int32Array,snow.platform.native.utils.Int8Array,snow.platform.native.utils.UInt16Array,snow.platform.native.utils.UInt32Array,snow.platform.native.utils.UInt8Array,snow.platform.native.utils.UInt8ClampedArray,snow.platform.native.window.WindowSystem,snow.platform.native.window.sdl.WindowSystem,snow.platform.web.assets.psd.PSD,snow.platform.web.audio.AudioSystem,snow.platform.web.audio.Sound,snow.platform.web.audio.SoundStream,snow.platform.web.audio.howlerjs.AudioParams,snow.platform.web.audio.howlerjs.AudioSystem,snow.platform.web.audio.howlerjs.Howl,snow.platform.web.audio.howlerjs.Howler,snow.platform.web.audio.howlerjs.SoundStream,snow.platform.web.audio.howlerjs.SpriteParams,snow.render.opengl.GL,snow.render.opengl.GLActiveInfo,snow.render.opengl.GLBuffer,snow.render.opengl.GLContextAttributes,snow.render.opengl.GLFramebuffer,snow.render.opengl.GLProgram,snow.render.opengl.GLRenderbuffer,snow.render.opengl.GLShader,snow.render.opengl.GLTexture,snow.render.opengl.GLUniformLocation,snow.types.AppConfig,snow.types.AppConfigNative,snow.types.AppConfigWeb,snow.types.AssetAudioOptions,snow.types.AssetBytesOptions,snow.types.AssetImageOptions,snow.types.AssetInfo,snow.types.AssetTextOptions,snow.types.AssetType,snow.types.AudioDataBlob,snow.types.AudioDataInfo,snow.types.AudioFormatType,snow.types.AudioHandle,snow.types.AudioInfo,snow.types.DisplayMode,snow.types.FileEvent,snow.types.FileEventType,snow.types.FileEvents,snow.types.FileFilter,snow.types.GamepadDeviceEventType,snow.types.ImageInfo,snow.types.InputEvent,snow.types.InputEventType,snow.types.InputEvents,snow.types.Key,snow.types.ModState,snow.types.Scan,snow.types.SnowConfig,snow.types.SystemEvent,snow.types.SystemEventType,snow.types.SystemEvents,snow.types.TextEventType,snow.types.WindowConfig,snow.types.WindowEvent,snow.types.WindowEventType,snow.types.WindowEvents,snow.types.WindowHandle,snow.utils.AbstractClass,snow.utils.AbstractClassBuilder,snow.utils.ArrayBuffer,snow.utils.ArrayBufferView,snow.utils.ByteArray,snow.utils.Float32Array,snow.utils.IDataInput,snow.utils.IMemoryRange,snow.utils.Int16Array,snow.utils.Int32Array,snow.utils.Int8Array,snow.utils.Libs,snow.utils.Timer,snow.utils.UInt16Array,snow.utils.UInt32Array,snow.utils.UInt8Array,snow.utils.UInt8ClampedArray,snow.utils._AbstractClass.StringMap,snow.utils.format.png.Chunk,snow.utils.format.png.Color,snow.utils.format.png.Data,snow.utils.format.png.Header,snow.utils.format.png.Reader,snow.utils.format.png.Tools,snow.utils.format.png.Writer,snow.utils.format.tools.Adler32,snow.utils.format.tools.Deflate,snow.utils.format.tools.HuffTools,snow.utils.format.tools.Huffman,snow.utils.format.tools.Inflate,snow.utils.format.tools.InflateImpl,snow.utils.format.tools.MemoryBytes,snow.utils.format.tools._InflateImpl.State,snow.utils.format.tools._InflateImpl.Window,snow.window.Window,snow.window.WindowSystem,snow.window.WindowSystemBinding,snow.window.Windowing,snow.window._Windowing.WindowHandleMap"></script>


<h1>WindowEvents</h1>
<small>`snow.types.WindowEvents`</small>



<hr/>

`class`<br/><span class="meta">
meta: @:keep, @:noCompletion</span>

<hr/>


&nbsp;
&nbsp;




<h3>Members</h3> <hr/><span class="member apipage">
                <a name="we_close"><a class="lift" href="#we_close">we\_close</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">we\_close : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="we_created"><a class="lift" href="#we_created">we\_created</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">we\_created : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="we_destroy"><a class="lift" href="#we_destroy">we\_destroy</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">we\_destroy : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="we_enter"><a class="lift" href="#we_enter">we\_enter</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">we\_enter : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="we_exposed"><a class="lift" href="#we_exposed">we\_exposed</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">we\_exposed : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="we_focus_gained"><a class="lift" href="#we_focus_gained">we\_focus\_gained</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">we\_focus\_gained : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="we_focus_lost"><a class="lift" href="#we_focus_lost">we\_focus\_lost</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">we\_focus\_lost : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="we_hidden"><a class="lift" href="#we_hidden">we\_hidden</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">we\_hidden : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="we_leave"><a class="lift" href="#we_leave">we\_leave</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">we\_leave : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="we_maximized"><a class="lift" href="#we_maximized">we\_maximized</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">we\_maximized : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="we_minimized"><a class="lift" href="#we_minimized">we\_minimized</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">we\_minimized : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="we_moved"><a class="lift" href="#we_moved">we\_moved</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">we\_moved : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="we_resized"><a class="lift" href="#we_resized">we\_resized</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">we\_resized : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="we_restored"><a class="lift" href="#we_restored">we\_restored</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">we\_restored : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="we_shown"><a class="lift" href="#we_shown">we\_shown</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">we\_shown : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="we_size_changed"><a class="lift" href="#we_size_changed">we\_size\_changed</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">we\_size\_changed : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="we_unknown"><a class="lift" href="#we_unknown">we\_unknown</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">we\_unknown : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/>


<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="typed"><a class="lift" href="#typed">typed</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">typed(type:[Int](http://api.haxe.org/Int.html)<span></span>) : [snow.types.WindowEventType](../../../api/snow/types/WindowEventType.html)</code><br/><span class="small_desc_flat">returns a typed `WindowEventType` from an integer ID, for communication between internal native + haxe code</span>


</span>



<hr/>

&nbsp;
&nbsp;
&nbsp;
&nbsp;