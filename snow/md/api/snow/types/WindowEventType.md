
[![Logo](../../../images/logo.png)](../../../api/index.html)

<hr/>
<a href="#" id="search_bar" onclick="return;"><div> search API <em>(or start typing anywhere)</em> </div></a>
<hr/>

<script src="../../../js/omnibar.js"> </script>
<link rel="stylesheet" type="text/css" href="../../../css/omnibar.css" media="all">

<div id="omnibar"> <a href="#" onclick="return" id="omnibar_close"></a> <input id="omnibar_text" type="text" placeholder="search types..."></input></div>
<script  id="typelist" data-relpath="../../../" data-types="snow.App,snow.AppFixedTimestep,snow.Core,snow.CoreBinding,snow.Log,snow.Snow,snow.assets.Asset,snow.assets.AssetAudio,snow.assets.AssetBytes,snow.assets.AssetImage,snow.assets.AssetSystem,snow.assets.AssetSystemBinding,snow.assets.AssetText,snow.assets.Assets,snow.audio.Audio,snow.audio.AudioSystem,snow.audio.AudioSystemBinding,snow.audio.Sound,snow.audio.SoundBinding,snow.audio.SoundStream,snow.audio.openal.AL,snow.audio.openal.ALC,snow.audio.openal.Context,snow.audio.openal.Device,snow.input.Input,snow.input.InputSystem,snow.input.InputSystemBinding,snow.input.Keycodes,snow.input.MapIntBool,snow.input.MapIntFloat,snow.input.Scancodes,snow.io.IO,snow.io.IOSystem,snow.io.IOSystemBinding,snow.platform.native.Core,snow.platform.native.StaticSnow,snow.platform.native.assets.AssetSystem,snow.platform.native.audio.AudioSystem,snow.platform.native.audio.Sound,snow.platform.native.audio.SoundStream,snow.platform.native.audio.openal.AL,snow.platform.native.audio.openal.ALC,snow.platform.native.audio.openal.AudioSystem,snow.platform.native.audio.openal.Context,snow.platform.native.audio.openal.Device,snow.platform.native.audio.openal.OpenALHelper,snow.platform.native.audio.openal.Sound,snow.platform.native.audio.openal.SoundStream,snow.platform.native.audio.openal._AL.Context_Impl_,snow.platform.native.audio.openal._AL.Device_Impl_,snow.platform.native.input.InputSystem,snow.platform.native.input.sdl.ControllerEventType,snow.platform.native.input.sdl.GamepadEventTypes,snow.platform.native.input.sdl.InputSystem,snow.platform.native.input.sdl.KeyEventType,snow.platform.native.input.sdl.KeyEventTypes,snow.platform.native.input.sdl.ModValue,snow.platform.native.input.sdl.MouseEventType,snow.platform.native.input.sdl.MouseEventTypes,snow.platform.native.input.sdl.TouchEventTypes,snow.platform.native.input.sdl.TouchState,snow.platform.native.io.IOFile,snow.platform.native.io.IOSystem,snow.platform.native.render.opengl.GL,snow.platform.native.render.opengl.GLActiveInfo,snow.platform.native.render.opengl.GLBuffer,snow.platform.native.render.opengl.GLContextAttributes,snow.platform.native.render.opengl.GLFBO,snow.platform.native.render.opengl.GLFramebuffer,snow.platform.native.render.opengl.GLObject,snow.platform.native.render.opengl.GLProgram,snow.platform.native.render.opengl.GLRBO,snow.platform.native.render.opengl.GLRenderbuffer,snow.platform.native.render.opengl.GLShader,snow.platform.native.render.opengl.GLShaderPrecisionFormat,snow.platform.native.render.opengl.GLTexture,snow.platform.native.render.opengl.GLUniformLocation,snow.platform.native.render.opengl._GL.GLFramebuffer_Impl_,snow.platform.native.render.opengl._GL.GLRenderbuffer_Impl_,snow.platform.native.utils.ArrayBuffer,snow.platform.native.utils.ArrayBufferView,snow.platform.native.utils.ByteArray,snow.platform.native.utils.Compression,snow.platform.native.utils.Float32Array,snow.platform.native.utils.Int16Array,snow.platform.native.utils.Int32Array,snow.platform.native.utils.Int8Array,snow.platform.native.utils.UInt16Array,snow.platform.native.utils.UInt32Array,snow.platform.native.utils.UInt8Array,snow.platform.native.utils.UInt8ClampedArray,snow.platform.native.window.WindowSystem,snow.platform.native.window.sdl.WindowSystem,snow.platform.web.assets.psd.PSD,snow.platform.web.audio.AudioSystem,snow.platform.web.audio.Sound,snow.platform.web.audio.SoundStream,snow.platform.web.audio.howlerjs.AudioParams,snow.platform.web.audio.howlerjs.AudioSystem,snow.platform.web.audio.howlerjs.Howl,snow.platform.web.audio.howlerjs.Howler,snow.platform.web.audio.howlerjs.SoundStream,snow.platform.web.audio.howlerjs.SpriteParams,snow.render.opengl.GL,snow.render.opengl.GLActiveInfo,snow.render.opengl.GLBuffer,snow.render.opengl.GLContextAttributes,snow.render.opengl.GLFramebuffer,snow.render.opengl.GLProgram,snow.render.opengl.GLRenderbuffer,snow.render.opengl.GLShader,snow.render.opengl.GLTexture,snow.render.opengl.GLUniformLocation,snow.types.AppConfig,snow.types.AppConfigNative,snow.types.AppConfigWeb,snow.types.AssetAudioOptions,snow.types.AssetBytesOptions,snow.types.AssetImageOptions,snow.types.AssetInfo,snow.types.AssetTextOptions,snow.types.AssetType,snow.types.AudioDataBlob,snow.types.AudioDataInfo,snow.types.AudioFormatType,snow.types.AudioHandle,snow.types.AudioInfo,snow.types.DisplayMode,snow.types.FileEvent,snow.types.FileEventType,snow.types.FileEvents,snow.types.FileFilter,snow.types.GamepadDeviceEventType,snow.types.ImageInfo,snow.types.InputEvent,snow.types.InputEventType,snow.types.InputEvents,snow.types.Key,snow.types.ModState,snow.types.Scan,snow.types.SnowConfig,snow.types.SystemEvent,snow.types.SystemEventType,snow.types.SystemEvents,snow.types.TextEventType,snow.types.WindowConfig,snow.types.WindowEvent,snow.types.WindowEventType,snow.types.WindowEvents,snow.types.WindowHandle,snow.utils.AbstractClass,snow.utils.AbstractClassBuilder,snow.utils.ArrayBuffer,snow.utils.ArrayBufferView,snow.utils.ByteArray,snow.utils.Float32Array,snow.utils.IDataInput,snow.utils.IMemoryRange,snow.utils.Int16Array,snow.utils.Int32Array,snow.utils.Int8Array,snow.utils.Libs,snow.utils.Timer,snow.utils.UInt16Array,snow.utils.UInt32Array,snow.utils.UInt8Array,snow.utils.UIntClamped8Array,snow.utils._AbstractClass.StringMap,snow.utils.format.png.Chunk,snow.utils.format.png.Color,snow.utils.format.png.Data,snow.utils.format.png.Header,snow.utils.format.png.Reader,snow.utils.format.png.Tools,snow.utils.format.png.Writer,snow.utils.format.tools.Adler32,snow.utils.format.tools.Deflate,snow.utils.format.tools.HuffTools,snow.utils.format.tools.Huffman,snow.utils.format.tools.Inflate,snow.utils.format.tools.InflateImpl,snow.utils.format.tools.MemoryBytes,snow.utils.format.tools._InflateImpl.State,snow.utils.format.tools._InflateImpl.Window,snow.window.Window,snow.window.WindowSystem,snow.window.WindowSystemBinding,snow.window.Windowing"></script>


<h1>WindowEventType</h1>
<small>`snow.types.WindowEventType`</small>

A typed window event

<hr/>

`enum`<br/><span class="meta">
meta: @:flatEnum</span>

<hr/>


&nbsp;
&nbsp;



<h3>Values</h3> <hr/><span class="member signature apipage">
            <a name="unknown"><a class="lift" href="#unknown">unknown</a></a>
        </span>
        <span class="small_desc_flat"> An unknown window event </span><span class="member signature apipage">
            <a name="window_created"><a class="lift" href="#window_created">window\_created</a></a>
        </span>
        <span class="small_desc_flat"> A window is created </span><span class="member signature apipage">
            <a name="window_shown"><a class="lift" href="#window_shown">window\_shown</a></a>
        </span>
        <span class="small_desc_flat"> A window is shown </span><span class="member signature apipage">
            <a name="window_hidden"><a class="lift" href="#window_hidden">window\_hidden</a></a>
        </span>
        <span class="small_desc_flat"> A window is hidden </span><span class="member signature apipage">
            <a name="window_exposed"><a class="lift" href="#window_exposed">window\_exposed</a></a>
        </span>
        <span class="small_desc_flat"> A window is exposed </span><span class="member signature apipage">
            <a name="window_moved"><a class="lift" href="#window_moved">window\_moved</a></a>
        </span>
        <span class="small_desc_flat"> A window is moved </span><span class="member signature apipage">
            <a name="window_resized"><a class="lift" href="#window_resized">window\_resized</a></a>
        </span>
        <span class="small_desc_flat"> A window is resized, by the user or code. </span><span class="member signature apipage">
            <a name="window_size_changed"><a class="lift" href="#window_size_changed">window\_size\_changed</a></a>
        </span>
        <span class="small_desc_flat"> A window is resized, by the OS or internals. </span><span class="member signature apipage">
            <a name="window_minimized"><a class="lift" href="#window_minimized">window\_minimized</a></a>
        </span>
        <span class="small_desc_flat"> A window is minimized </span><span class="member signature apipage">
            <a name="window_maximized"><a class="lift" href="#window_maximized">window\_maximized</a></a>
        </span>
        <span class="small_desc_flat"> A window is maximized </span><span class="member signature apipage">
            <a name="window_restored"><a class="lift" href="#window_restored">window\_restored</a></a>
        </span>
        <span class="small_desc_flat"> A window is restored </span><span class="member signature apipage">
            <a name="window_enter"><a class="lift" href="#window_enter">window\_enter</a></a>
        </span>
        <span class="small_desc_flat"> A window is entered by a mouse </span><span class="member signature apipage">
            <a name="window_leave"><a class="lift" href="#window_leave">window\_leave</a></a>
        </span>
        <span class="small_desc_flat"> A window is left by a mouse </span><span class="member signature apipage">
            <a name="window_focus_gained"><a class="lift" href="#window_focus_gained">window\_focus\_gained</a></a>
        </span>
        <span class="small_desc_flat"> A window has gained focus </span><span class="member signature apipage">
            <a name="window_focus_lost"><a class="lift" href="#window_focus_lost">window\_focus\_lost</a></a>
        </span>
        <span class="small_desc_flat"> A window has lost focus </span><span class="member signature apipage">
            <a name="window_close"><a class="lift" href="#window_close">window\_close</a></a>
        </span>
        <span class="small_desc_flat"> A window is being closed/hidden </span><span class="member signature apipage">
            <a name="window_destroy"><a class="lift" href="#window_destroy">window\_destroy</a></a>
        </span>
        <span class="small_desc_flat"> A window is being destroyed </span>



<hr/>

&nbsp;
&nbsp;
&nbsp;
&nbsp;