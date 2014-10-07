
[![Logo](../../../images/logo.png)](../../../api/index.html)

<hr/>
<a href="#" id="search_bar" onclick="return;"><div> search API <em>(or start typing anywhere)</em> </div></a>
<hr/>

<script src="../../../js/omnibar.js"> </script>
<link rel="stylesheet" type="text/css" href="../../../css/omnibar.css" media="all">

<div id="omnibar"> <a href="#" onclick="return" id="omnibar_close"></a> <input id="omnibar_text" type="text" placeholder="search types..."></input></div>
<script  id="typelist" data-relpath="../../../" data-types="snow.App,snow.AppFixedTimestep,snow.Core,snow.CoreBinding,snow.Log,snow.Snow,snow.assets.Asset,snow.assets.AssetAudio,snow.assets.AssetBytes,snow.assets.AssetImage,snow.assets.AssetSystem,snow.assets.AssetSystemBinding,snow.assets.AssetText,snow.assets.Assets,snow.audio.Audio,snow.audio.AudioSystem,snow.audio.AudioSystemBinding,snow.audio.Sound,snow.audio.SoundBinding,snow.audio.SoundStream,snow.audio._Audio.AudioHandleMap,snow.audio.openal.AL,snow.audio.openal.ALC,snow.audio.openal.Context,snow.audio.openal.Device,snow.input.Input,snow.input.InputSystem,snow.input.InputSystemBinding,snow.input.Keycodes,snow.input.MapIntBool,snow.input.MapIntFloat,snow.input.Scancodes,snow.io.IO,snow.io.IOSystem,snow.io.IOSystemBinding,snow.platform.native.Core,snow.platform.native.StaticSnow,snow.platform.native.assets.AssetSystem,snow.platform.native.audio.AudioSystem,snow.platform.native.audio.Sound,snow.platform.native.audio.SoundStream,snow.platform.native.audio.openal.AL,snow.platform.native.audio.openal.ALC,snow.platform.native.audio.openal.AudioSystem,snow.platform.native.audio.openal.Context,snow.platform.native.audio.openal.Device,snow.platform.native.audio.openal.OpenALHelper,snow.platform.native.audio.openal.Sound,snow.platform.native.audio.openal.SoundStream,snow.platform.native.audio.openal._AL.Context_Impl_,snow.platform.native.audio.openal._AL.Device_Impl_,snow.platform.native.input.InputSystem,snow.platform.native.input.sdl.ControllerEventType,snow.platform.native.input.sdl.InputSystem,snow.platform.native.input.sdl.KeyEventType,snow.platform.native.input.sdl.ModValue,snow.platform.native.input.sdl.MouseEventType,snow.platform.native.input.sdl.TouchEventType,snow.platform.native.io.IOFile,snow.platform.native.io.IOFileHandle,snow.platform.native.io.IOSystem,snow.platform.native.io._IOFile.IOFileHandle_Impl_,snow.platform.native.render.opengl.GL,snow.platform.native.render.opengl.GLActiveInfo,snow.platform.native.render.opengl.GLBuffer,snow.platform.native.render.opengl.GLContextAttributes,snow.platform.native.render.opengl.GLFBO,snow.platform.native.render.opengl.GLFramebuffer,snow.platform.native.render.opengl.GLObject,snow.platform.native.render.opengl.GLProgram,snow.platform.native.render.opengl.GLRBO,snow.platform.native.render.opengl.GLRenderbuffer,snow.platform.native.render.opengl.GLShader,snow.platform.native.render.opengl.GLShaderPrecisionFormat,snow.platform.native.render.opengl.GLTexture,snow.platform.native.render.opengl.GLUniformLocation,snow.platform.native.render.opengl._GL.GLFramebuffer_Impl_,snow.platform.native.render.opengl._GL.GLRenderbuffer_Impl_,snow.platform.native.utils.ArrayBuffer,snow.platform.native.utils.ArrayBufferView,snow.platform.native.utils.ByteArray,snow.platform.native.utils.Compression,snow.platform.native.utils.Float32Array,snow.platform.native.utils.Int16Array,snow.platform.native.utils.Int32Array,snow.platform.native.utils.Int8Array,snow.platform.native.utils.UInt16Array,snow.platform.native.utils.UInt32Array,snow.platform.native.utils.UInt8Array,snow.platform.native.utils.UInt8ClampedArray,snow.platform.native.window.WindowSystem,snow.platform.native.window.sdl.WindowSystem,snow.platform.web.assets.psd.PSD,snow.platform.web.audio.AudioSystem,snow.platform.web.audio.Sound,snow.platform.web.audio.SoundStream,snow.platform.web.audio.howlerjs.AudioParams,snow.platform.web.audio.howlerjs.AudioSystem,snow.platform.web.audio.howlerjs.Howl,snow.platform.web.audio.howlerjs.Howler,snow.platform.web.audio.howlerjs.SoundStream,snow.platform.web.audio.howlerjs.SpriteParams,snow.render.opengl.GL,snow.render.opengl.GLActiveInfo,snow.render.opengl.GLBuffer,snow.render.opengl.GLContextAttributes,snow.render.opengl.GLFramebuffer,snow.render.opengl.GLProgram,snow.render.opengl.GLRenderbuffer,snow.render.opengl.GLShader,snow.render.opengl.GLTexture,snow.render.opengl.GLUniformLocation,snow.types.AppConfig,snow.types.AppConfigNative,snow.types.AppConfigWeb,snow.types.AssetAudioOptions,snow.types.AssetBytesOptions,snow.types.AssetImageOptions,snow.types.AssetInfo,snow.types.AssetTextOptions,snow.types.AssetType,snow.types.AudioDataBlob,snow.types.AudioDataInfo,snow.types.AudioFormatType,snow.types.AudioHandle,snow.types.AudioInfo,snow.types.DisplayMode,snow.types.FileEvent,snow.types.FileEventType,snow.types.FileFilter,snow.types.GamepadDeviceEventType,snow.types.ImageInfo,snow.types.InputEvent,snow.types.InputEventType,snow.types.Key,snow.types.ModState,snow.types.Scan,snow.types.SnowConfig,snow.types.SystemEvent,snow.types.SystemEventType,snow.types.TextEventType,snow.types.WindowConfig,snow.types.WindowEvent,snow.types.WindowEventType,snow.types.WindowHandle,snow.utils.AbstractClass,snow.utils.AbstractClassBuilder,snow.utils.ArrayBuffer,snow.utils.ArrayBufferView,snow.utils.ByteArray,snow.utils.Float32Array,snow.utils.IDataInput,snow.utils.IMemoryRange,snow.utils.Int16Array,snow.utils.Int32Array,snow.utils.Int8Array,snow.utils.Libs,snow.utils.Timer,snow.utils.UInt16Array,snow.utils.UInt32Array,snow.utils.UInt8Array,snow.utils.UInt8ClampedArray,snow.utils._AbstractClass.StringMap,snow.utils.format.png.Chunk,snow.utils.format.png.Color,snow.utils.format.png.Data,snow.utils.format.png.Header,snow.utils.format.png.Reader,snow.utils.format.png.Tools,snow.utils.format.png.Writer,snow.utils.format.tools.Adler32,snow.utils.format.tools.Deflate,snow.utils.format.tools.HuffTools,snow.utils.format.tools.Huffman,snow.utils.format.tools.Inflate,snow.utils.format.tools.InflateImpl,snow.utils.format.tools.MemoryBytes,snow.utils.format.tools._InflateImpl.State,snow.utils.format.tools._InflateImpl.Window,snow.window.Window,snow.window.WindowSystem,snow.window.WindowSystemBinding,snow.window.Windowing,snow.window._Windowing.WindowHandleMap"></script>


<h1>Scancodes</h1>
<small>`snow.input.Scancodes`</small>

The scancode class. The values below come directly from SDL header include files,
but they aren't specific to SDL so they are used generically

<hr/>

`class`<br/><span class="meta">
meta: @:keep, @:noCompletion</span>

<hr/>


&nbsp;
&nbsp;




<h3>Members</h3> <hr/><span class="member apipage">
                <a name="MASK"><a class="lift" href="#MASK">MASK</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">MASK : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="ac_back"><a class="lift" href="#ac_back">ac\_back</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">ac\_back : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="ac_bookmarks"><a class="lift" href="#ac_bookmarks">ac\_bookmarks</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">ac\_bookmarks : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="ac_forward"><a class="lift" href="#ac_forward">ac\_forward</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">ac\_forward : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="ac_home"><a class="lift" href="#ac_home">ac\_home</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">ac\_home : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="ac_refresh"><a class="lift" href="#ac_refresh">ac\_refresh</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">ac\_refresh : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="ac_search"><a class="lift" href="#ac_search">ac\_search</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">ac\_search : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="ac_stop"><a class="lift" href="#ac_stop">ac\_stop</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">ac\_stop : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="again"><a class="lift" href="#again">again</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">again : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat">redo</span><br/><span class="member apipage">
                <a name="alterase"><a class="lift" href="#alterase">alterase</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">alterase : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat">Erase-Eaze</span><br/><span class="member apipage">
                <a name="apostrophe"><a class="lift" href="#apostrophe">apostrophe</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">apostrophe : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="app1"><a class="lift" href="#app1">app1</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">app1 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="app2"><a class="lift" href="#app2">app2</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">app2 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="application"><a class="lift" href="#application">application</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">application : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat">windows contextual menu, compose</span><br/><span class="member apipage">
                <a name="audiomute"><a class="lift" href="#audiomute">audiomute</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">audiomute : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="audionext"><a class="lift" href="#audionext">audionext</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">audionext : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="audioplay"><a class="lift" href="#audioplay">audioplay</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">audioplay : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="audioprev"><a class="lift" href="#audioprev">audioprev</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">audioprev : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="audiostop"><a class="lift" href="#audiostop">audiostop</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">audiostop : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="backslash"><a class="lift" href="#backslash">backslash</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">backslash : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat">Located at the lower left of the return
    key on ISO keyboards and at the right end
    of the QWERTY row on ANSI keyboards.
    Produces REVERSE SOLIDUS (backslash) and
    VERTICAL LINE in a US layout, REVERSE
    SOLIDUS and VERTICAL LINE in a UK Mac
    layout, NUMBER SIGN and TILDE in a UK
    Windows layout, DOLLAR SIGN and POUND SIGN
    in a Swiss German layout, NUMBER SIGN and
    APOSTROPHE in a German layout, GRAVE
    ACCENT and POUND SIGN in a French Mac
    layout, and ASTERISK and MICRO SIGN in a
    French Windows layout.</span><br/><span class="member apipage">
                <a name="backspace"><a class="lift" href="#backspace">backspace</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">backspace : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="brightnessdown"><a class="lift" href="#brightnessdown">brightnessdown</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">brightnessdown : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="brightnessup"><a class="lift" href="#brightnessup">brightnessup</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">brightnessup : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="calculator"><a class="lift" href="#calculator">calculator</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">calculator : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="cancel"><a class="lift" href="#cancel">cancel</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">cancel : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="capslock"><a class="lift" href="#capslock">capslock</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">capslock : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="clear"><a class="lift" href="#clear">clear</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">clear : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="clearagain"><a class="lift" href="#clearagain">clearagain</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">clearagain : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="comma"><a class="lift" href="#comma">comma</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">comma : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="computer"><a class="lift" href="#computer">computer</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">computer : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="copy"><a class="lift" href="#copy">copy</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">copy : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="crsel"><a class="lift" href="#crsel">crsel</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">crsel : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="currencysubunit"><a class="lift" href="#currencysubunit">currencysubunit</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">currencysubunit : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="currencyunit"><a class="lift" href="#currencyunit">currencyunit</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">currencyunit : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="cut"><a class="lift" href="#cut">cut</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">cut : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="decimalseparator"><a class="lift" href="#decimalseparator">decimalseparator</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">decimalseparator : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="delete"><a class="lift" href="#delete">delete</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">delete : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="displayswitch"><a class="lift" href="#displayswitch">displayswitch</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">displayswitch : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat">display mirroring/dual display switch, video mode switch</span><br/><span class="member apipage">
                <a name="down"><a class="lift" href="#down">down</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">down : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="eject"><a class="lift" href="#eject">eject</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">eject : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="end"><a class="lift" href="#end">end</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">end : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="enter"><a class="lift" href="#enter">enter</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">enter : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="equals"><a class="lift" href="#equals">equals</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">equals : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="escape"><a class="lift" href="#escape">escape</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">escape : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="execute"><a class="lift" href="#execute">execute</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">execute : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="exsel"><a class="lift" href="#exsel">exsel</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">exsel : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="f1"><a class="lift" href="#f1">f1</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">f1 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="f10"><a class="lift" href="#f10">f10</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">f10 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="f11"><a class="lift" href="#f11">f11</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">f11 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="f12"><a class="lift" href="#f12">f12</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">f12 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="f13"><a class="lift" href="#f13">f13</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">f13 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="f14"><a class="lift" href="#f14">f14</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">f14 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="f15"><a class="lift" href="#f15">f15</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">f15 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="f16"><a class="lift" href="#f16">f16</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">f16 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="f17"><a class="lift" href="#f17">f17</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">f17 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="f18"><a class="lift" href="#f18">f18</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">f18 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="f19"><a class="lift" href="#f19">f19</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">f19 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="f2"><a class="lift" href="#f2">f2</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">f2 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="f20"><a class="lift" href="#f20">f20</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">f20 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="f21"><a class="lift" href="#f21">f21</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">f21 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="f22"><a class="lift" href="#f22">f22</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">f22 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="f23"><a class="lift" href="#f23">f23</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">f23 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="f24"><a class="lift" href="#f24">f24</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">f24 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="f3"><a class="lift" href="#f3">f3</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">f3 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="f4"><a class="lift" href="#f4">f4</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">f4 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="f5"><a class="lift" href="#f5">f5</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">f5 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="f6"><a class="lift" href="#f6">f6</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">f6 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="f7"><a class="lift" href="#f7">f7</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">f7 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="f8"><a class="lift" href="#f8">f8</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">f8 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="f9"><a class="lift" href="#f9">f9</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">f9 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="find"><a class="lift" href="#find">find</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">find : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="grave"><a class="lift" href="#grave">grave</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">grave : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat">Located in the top left corner (on both ANSI
    and ISO keyboards). Produces GRAVE ACCENT and
    TILDE in a US Windows layout and in US and UK
    Mac layouts on ANSI keyboards, GRAVE ACCENT
    and NOT SIGN in a UK Windows layout, SECTION
    SIGN and PLUS-MINUS SIGN in US and UK Mac
    layouts on ISO keyboards, SECTION SIGN and
    DEGREE SIGN in a Swiss German layout (Mac:
    only on ISO keyboards); CIRCUMFLEX ACCENT and
    DEGREE SIGN in a German layout (Mac: only on
    ISO keyboards), SUPERSCRIPT TWO and TILDE in a
    French Windows layout, COMMERCIAL AT and
    NUMBER SIGN in a French Mac layout on ISO
    keyboards, and LESS-THAN SIGN and GREATER-THAN
    SIGN in a Swiss German, German, or French Mac
    layout on ANSI keyboards.</span><br/><span class="member apipage">
                <a name="help"><a class="lift" href="#help">help</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">help : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="home"><a class="lift" href="#home">home</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">home : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="insert"><a class="lift" href="#insert">insert</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">insert : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat">insert on PC, help on some Mac keyboards (but does send code 73, not 117)</span><br/><span class="member apipage">
                <a name="international1"><a class="lift" href="#international1">international1</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">international1 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat">used on Asian keyboards; see footnotes in USB doc</span><br/><span class="member apipage">
                <a name="international2"><a class="lift" href="#international2">international2</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">international2 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="international3"><a class="lift" href="#international3">international3</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">international3 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat">Yen</span><br/><span class="member apipage">
                <a name="international4"><a class="lift" href="#international4">international4</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">international4 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="international5"><a class="lift" href="#international5">international5</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">international5 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="international6"><a class="lift" href="#international6">international6</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">international6 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="international7"><a class="lift" href="#international7">international7</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">international7 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="international8"><a class="lift" href="#international8">international8</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">international8 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="international9"><a class="lift" href="#international9">international9</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">international9 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="kbdillumdown"><a class="lift" href="#kbdillumdown">kbdillumdown</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">kbdillumdown : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="kbdillumtoggle"><a class="lift" href="#kbdillumtoggle">kbdillumtoggle</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">kbdillumtoggle : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="kbdillumup"><a class="lift" href="#kbdillumup">kbdillumup</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">kbdillumup : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="key_0"><a class="lift" href="#key_0">key\_0</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">key\_0 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="key_1"><a class="lift" href="#key_1">key\_1</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">key\_1 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="key_2"><a class="lift" href="#key_2">key\_2</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">key\_2 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="key_3"><a class="lift" href="#key_3">key\_3</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">key\_3 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="key_4"><a class="lift" href="#key_4">key\_4</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">key\_4 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="key_5"><a class="lift" href="#key_5">key\_5</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">key\_5 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="key_6"><a class="lift" href="#key_6">key\_6</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">key\_6 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="key_7"><a class="lift" href="#key_7">key\_7</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">key\_7 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="key_8"><a class="lift" href="#key_8">key\_8</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">key\_8 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="key_9"><a class="lift" href="#key_9">key\_9</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">key\_9 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="key_a"><a class="lift" href="#key_a">key\_a</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">key\_a : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="key_b"><a class="lift" href="#key_b">key\_b</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">key\_b : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="key_c"><a class="lift" href="#key_c">key\_c</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">key\_c : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="key_d"><a class="lift" href="#key_d">key\_d</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">key\_d : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="key_e"><a class="lift" href="#key_e">key\_e</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">key\_e : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="key_f"><a class="lift" href="#key_f">key\_f</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">key\_f : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="key_g"><a class="lift" href="#key_g">key\_g</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">key\_g : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="key_h"><a class="lift" href="#key_h">key\_h</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">key\_h : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="key_i"><a class="lift" href="#key_i">key\_i</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">key\_i : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="key_j"><a class="lift" href="#key_j">key\_j</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">key\_j : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="key_k"><a class="lift" href="#key_k">key\_k</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">key\_k : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="key_l"><a class="lift" href="#key_l">key\_l</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">key\_l : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="key_m"><a class="lift" href="#key_m">key\_m</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">key\_m : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="key_n"><a class="lift" href="#key_n">key\_n</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">key\_n : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="key_o"><a class="lift" href="#key_o">key\_o</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">key\_o : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="key_p"><a class="lift" href="#key_p">key\_p</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">key\_p : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="key_q"><a class="lift" href="#key_q">key\_q</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">key\_q : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="key_r"><a class="lift" href="#key_r">key\_r</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">key\_r : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="key_s"><a class="lift" href="#key_s">key\_s</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">key\_s : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="key_t"><a class="lift" href="#key_t">key\_t</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">key\_t : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="key_u"><a class="lift" href="#key_u">key\_u</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">key\_u : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="key_v"><a class="lift" href="#key_v">key\_v</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">key\_v : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="key_w"><a class="lift" href="#key_w">key\_w</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">key\_w : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="key_x"><a class="lift" href="#key_x">key\_x</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">key\_x : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="key_y"><a class="lift" href="#key_y">key\_y</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">key\_y : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="key_z"><a class="lift" href="#key_z">key\_z</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">key\_z : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="kp_0"><a class="lift" href="#kp_0">kp\_0</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">kp\_0 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="kp_00"><a class="lift" href="#kp_00">kp\_00</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">kp\_00 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="kp_000"><a class="lift" href="#kp_000">kp\_000</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">kp\_000 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="kp_1"><a class="lift" href="#kp_1">kp\_1</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">kp\_1 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="kp_2"><a class="lift" href="#kp_2">kp\_2</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">kp\_2 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="kp_3"><a class="lift" href="#kp_3">kp\_3</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">kp\_3 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="kp_4"><a class="lift" href="#kp_4">kp\_4</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">kp\_4 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="kp_5"><a class="lift" href="#kp_5">kp\_5</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">kp\_5 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="kp_6"><a class="lift" href="#kp_6">kp\_6</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">kp\_6 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="kp_7"><a class="lift" href="#kp_7">kp\_7</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">kp\_7 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="kp_8"><a class="lift" href="#kp_8">kp\_8</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">kp\_8 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="kp_9"><a class="lift" href="#kp_9">kp\_9</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">kp\_9 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="kp_a"><a class="lift" href="#kp_a">kp\_a</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">kp\_a : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="kp_ampersand"><a class="lift" href="#kp_ampersand">kp\_ampersand</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">kp\_ampersand : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="kp_at"><a class="lift" href="#kp_at">kp\_at</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">kp\_at : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="kp_b"><a class="lift" href="#kp_b">kp\_b</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">kp\_b : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="kp_backspace"><a class="lift" href="#kp_backspace">kp\_backspace</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">kp\_backspace : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="kp_binary"><a class="lift" href="#kp_binary">kp\_binary</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">kp\_binary : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="kp_c"><a class="lift" href="#kp_c">kp\_c</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">kp\_c : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="kp_clear"><a class="lift" href="#kp_clear">kp\_clear</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">kp\_clear : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="kp_clearentry"><a class="lift" href="#kp_clearentry">kp\_clearentry</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">kp\_clearentry : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="kp_colon"><a class="lift" href="#kp_colon">kp\_colon</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">kp\_colon : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="kp_comma"><a class="lift" href="#kp_comma">kp\_comma</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">kp\_comma : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="kp_d"><a class="lift" href="#kp_d">kp\_d</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">kp\_d : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="kp_dblampersand"><a class="lift" href="#kp_dblampersand">kp\_dblampersand</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">kp\_dblampersand : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="kp_dblverticalbar"><a class="lift" href="#kp_dblverticalbar">kp\_dblverticalbar</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">kp\_dblverticalbar : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="kp_decimal"><a class="lift" href="#kp_decimal">kp\_decimal</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">kp\_decimal : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="kp_divide"><a class="lift" href="#kp_divide">kp\_divide</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">kp\_divide : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="kp_e"><a class="lift" href="#kp_e">kp\_e</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">kp\_e : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="kp_enter"><a class="lift" href="#kp_enter">kp\_enter</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">kp\_enter : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="kp_equals"><a class="lift" href="#kp_equals">kp\_equals</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">kp\_equals : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="kp_equalsas400"><a class="lift" href="#kp_equalsas400">kp\_equalsas400</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">kp\_equalsas400 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="kp_exclam"><a class="lift" href="#kp_exclam">kp\_exclam</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">kp\_exclam : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="kp_f"><a class="lift" href="#kp_f">kp\_f</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">kp\_f : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="kp_greater"><a class="lift" href="#kp_greater">kp\_greater</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">kp\_greater : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="kp_hash"><a class="lift" href="#kp_hash">kp\_hash</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">kp\_hash : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="kp_hexadecimal"><a class="lift" href="#kp_hexadecimal">kp\_hexadecimal</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">kp\_hexadecimal : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="kp_leftbrace"><a class="lift" href="#kp_leftbrace">kp\_leftbrace</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">kp\_leftbrace : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="kp_leftparen"><a class="lift" href="#kp_leftparen">kp\_leftparen</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">kp\_leftparen : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="kp_less"><a class="lift" href="#kp_less">kp\_less</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">kp\_less : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="kp_memadd"><a class="lift" href="#kp_memadd">kp\_memadd</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">kp\_memadd : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="kp_memclear"><a class="lift" href="#kp_memclear">kp\_memclear</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">kp\_memclear : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="kp_memdivide"><a class="lift" href="#kp_memdivide">kp\_memdivide</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">kp\_memdivide : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="kp_memmultiply"><a class="lift" href="#kp_memmultiply">kp\_memmultiply</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">kp\_memmultiply : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="kp_memrecall"><a class="lift" href="#kp_memrecall">kp\_memrecall</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">kp\_memrecall : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="kp_memstore"><a class="lift" href="#kp_memstore">kp\_memstore</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">kp\_memstore : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="kp_memsubtract"><a class="lift" href="#kp_memsubtract">kp\_memsubtract</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">kp\_memsubtract : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="kp_minus"><a class="lift" href="#kp_minus">kp\_minus</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">kp\_minus : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="kp_multiply"><a class="lift" href="#kp_multiply">kp\_multiply</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">kp\_multiply : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="kp_octal"><a class="lift" href="#kp_octal">kp\_octal</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">kp\_octal : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="kp_percent"><a class="lift" href="#kp_percent">kp\_percent</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">kp\_percent : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="kp_period"><a class="lift" href="#kp_period">kp\_period</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">kp\_period : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="kp_plus"><a class="lift" href="#kp_plus">kp\_plus</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">kp\_plus : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="kp_plusminus"><a class="lift" href="#kp_plusminus">kp\_plusminus</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">kp\_plusminus : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="kp_power"><a class="lift" href="#kp_power">kp\_power</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">kp\_power : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="kp_rightbrace"><a class="lift" href="#kp_rightbrace">kp\_rightbrace</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">kp\_rightbrace : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="kp_rightparen"><a class="lift" href="#kp_rightparen">kp\_rightparen</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">kp\_rightparen : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="kp_space"><a class="lift" href="#kp_space">kp\_space</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">kp\_space : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="kp_tab"><a class="lift" href="#kp_tab">kp\_tab</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">kp\_tab : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="kp_verticalbar"><a class="lift" href="#kp_verticalbar">kp\_verticalbar</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">kp\_verticalbar : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="kp_xor"><a class="lift" href="#kp_xor">kp\_xor</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">kp\_xor : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="lalt"><a class="lift" href="#lalt">lalt</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">lalt : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat">alt, option</span><br/><span class="member apipage">
                <a name="lang1"><a class="lift" href="#lang1">lang1</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">lang1 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat">Hangul/English toggle</span><br/><span class="member apipage">
                <a name="lang2"><a class="lift" href="#lang2">lang2</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">lang2 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat">Hanja conversion</span><br/><span class="member apipage">
                <a name="lang3"><a class="lift" href="#lang3">lang3</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">lang3 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat">Katakana</span><br/><span class="member apipage">
                <a name="lang4"><a class="lift" href="#lang4">lang4</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">lang4 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat">Hiragana</span><br/><span class="member apipage">
                <a name="lang5"><a class="lift" href="#lang5">lang5</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">lang5 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat">Zenkaku/Hankaku</span><br/><span class="member apipage">
                <a name="lang6"><a class="lift" href="#lang6">lang6</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">lang6 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat">reserved</span><br/><span class="member apipage">
                <a name="lang7"><a class="lift" href="#lang7">lang7</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">lang7 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat">reserved</span><br/><span class="member apipage">
                <a name="lang8"><a class="lift" href="#lang8">lang8</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">lang8 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat">reserved</span><br/><span class="member apipage">
                <a name="lang9"><a class="lift" href="#lang9">lang9</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">lang9 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat">reserved</span><br/><span class="member apipage">
                <a name="lctrl"><a class="lift" href="#lctrl">lctrl</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">lctrl : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="left"><a class="lift" href="#left">left</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">left : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="leftbracket"><a class="lift" href="#leftbracket">leftbracket</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">leftbracket : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="lmeta"><a class="lift" href="#lmeta">lmeta</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">lmeta : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat">windows, command (apple), meta</span><br/><span class="member apipage">
                <a name="lshift"><a class="lift" href="#lshift">lshift</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">lshift : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="mail"><a class="lift" href="#mail">mail</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">mail : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="mediaselect"><a class="lift" href="#mediaselect">mediaselect</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">mediaselect : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="menu"><a class="lift" href="#menu">menu</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">menu : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="minus"><a class="lift" href="#minus">minus</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">minus : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="mode"><a class="lift" href="#mode">mode</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">mode : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat">Not sure if this is really not covered
    by any of the above, but since there's a
    special KMOD_MODE for it I'm adding it here</span><br/><span class="member apipage">
                <a name="mute"><a class="lift" href="#mute">mute</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">mute : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="nonusbackslash"><a class="lift" href="#nonusbackslash">nonusbackslash</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">nonusbackslash : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat">This is the additional key that ISO
    keyboards have over ANSI ones,
    located between left shift and Y.
    Produces GRAVE ACCENT and TILDE in a
    US or UK Mac layout, REVERSE SOLIDUS
    (backslash) and VERTICAL LINE in a
    US or UK Windows layout, and
    LESS-THAN SIGN and GREATER-THAN SIGN
    in a Swiss German, German, or French
    layout.</span><br/><span class="member apipage">
                <a name="nonushash"><a class="lift" href="#nonushash">nonushash</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">nonushash : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat">ISO USB keyboards actually use this code
    instead of 49 for the same key, but all
    OSes I've seen treat the two codes
    identically. So, as an implementor, unless
    your keyboard generates both of those
    codes and your OS treats them differently,
    you should generate public static var BACKSLASH
    instead of this code. As a user, you
    should not rely on this code because SDL
    will never generate it with most (all?)
    keyboards.</span><br/><span class="member apipage">
                <a name="numlockclear"><a class="lift" href="#numlockclear">numlockclear</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">numlockclear : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat">num lock on PC, clear on Mac keyboards</span><br/><span class="member apipage">
                <a name="oper"><a class="lift" href="#oper">oper</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">oper : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="out"><a class="lift" href="#out">out</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">out : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="pagedown"><a class="lift" href="#pagedown">pagedown</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">pagedown : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="pageup"><a class="lift" href="#pageup">pageup</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">pageup : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="paste"><a class="lift" href="#paste">paste</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">paste : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="pause"><a class="lift" href="#pause">pause</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">pause : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="period"><a class="lift" href="#period">period</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">period : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="power"><a class="lift" href="#power">power</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">power : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat">The USB document says this is a status flag,
    not a physical key - but some Mac keyboards
    do have a power key.</span><br/><span class="member apipage">
                <a name="printscreen"><a class="lift" href="#printscreen">printscreen</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">printscreen : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="prior"><a class="lift" href="#prior">prior</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">prior : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="ralt"><a class="lift" href="#ralt">ralt</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">ralt : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat">alt gr, option</span><br/><span class="member apipage">
                <a name="rctrl"><a class="lift" href="#rctrl">rctrl</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">rctrl : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="return2"><a class="lift" href="#return2">return2</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">return2 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="right"><a class="lift" href="#right">right</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">right : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="rightbracket"><a class="lift" href="#rightbracket">rightbracket</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">rightbracket : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="rmeta"><a class="lift" href="#rmeta">rmeta</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">rmeta : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat">windows, command (apple), meta</span><br/><span class="member apipage">
                <a name="rshift"><a class="lift" href="#rshift">rshift</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">rshift : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="scrolllock"><a class="lift" href="#scrolllock">scrolllock</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">scrolllock : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="select"><a class="lift" href="#select">select</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">select : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="semicolon"><a class="lift" href="#semicolon">semicolon</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">semicolon : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="separator"><a class="lift" href="#separator">separator</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">separator : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="slash"><a class="lift" href="#slash">slash</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">slash : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="sleep"><a class="lift" href="#sleep">sleep</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">sleep : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="space"><a class="lift" href="#space">space</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">space : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="stop"><a class="lift" href="#stop">stop</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">stop : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="sysreq"><a class="lift" href="#sysreq">sysreq</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">sysreq : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="tab"><a class="lift" href="#tab">tab</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">tab : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="thousandsseparator"><a class="lift" href="#thousandsseparator">thousandsseparator</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">thousandsseparator : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="undo"><a class="lift" href="#undo">undo</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">undo : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="unknown"><a class="lift" href="#unknown">unknown</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">unknown : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="up"><a class="lift" href="#up">up</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">up : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="volumedown"><a class="lift" href="#volumedown">volumedown</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">volumedown : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="volumeup"><a class="lift" href="#volumeup">volumeup</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">volumeup : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="www"><a class="lift" href="#www">www</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">www : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/>


<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="name"><a class="lift" href="#name">name</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">name(scancode:[Int](http://api.haxe.org/Int.html)<span></span>) : [String](http://api.haxe.org/String.html)</code><br/><span class="small_desc_flat">Convert a scancode to a name</span>


</span>



<hr/>

&nbsp;
&nbsp;
&nbsp;
&nbsp;