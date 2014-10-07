
[![Logo](../../../images/logo.png)](../../../api/index.html)

<hr/>
<a href="#" id="search_bar" onclick="return;"><div> search API <em>(or start typing anywhere)</em> </div></a>
<hr/>

<script src="../../../js/omnibar.js"> </script>
<link rel="stylesheet" type="text/css" href="../../../css/omnibar.css" media="all">

<div id="omnibar"> <a href="#" onclick="return" id="omnibar_close"></a> <input id="omnibar_text" type="text" placeholder="search types..."></input></div>
<script  id="typelist" data-relpath="../../../" data-types="snow.App,snow.AppFixedTimestep,snow.Core,snow.CoreBinding,snow.Log,snow.Snow,snow.assets.Asset,snow.assets.AssetAudio,snow.assets.AssetBytes,snow.assets.AssetImage,snow.assets.AssetSystem,snow.assets.AssetSystemBinding,snow.assets.AssetText,snow.assets.Assets,snow.audio.Audio,snow.audio.AudioSystem,snow.audio.AudioSystemBinding,snow.audio.Sound,snow.audio.SoundBinding,snow.audio.SoundStream,snow.audio._Audio.AudioHandleMap,snow.audio.openal.AL,snow.audio.openal.ALC,snow.audio.openal.Context,snow.audio.openal.Device,snow.input.Input,snow.input.InputSystem,snow.input.InputSystemBinding,snow.input.Keycodes,snow.input.MapIntBool,snow.input.MapIntFloat,snow.input.Scancodes,snow.io.IO,snow.io.IOSystem,snow.io.IOSystemBinding,snow.platform.native.Core,snow.platform.native.StaticSnow,snow.platform.native.assets.AssetSystem,snow.platform.native.audio.AudioSystem,snow.platform.native.audio.Sound,snow.platform.native.audio.SoundStream,snow.platform.native.audio.openal.AL,snow.platform.native.audio.openal.ALC,snow.platform.native.audio.openal.AudioSystem,snow.platform.native.audio.openal.Context,snow.platform.native.audio.openal.Device,snow.platform.native.audio.openal.OpenALHelper,snow.platform.native.audio.openal.Sound,snow.platform.native.audio.openal.SoundStream,snow.platform.native.audio.openal._AL.Context_Impl_,snow.platform.native.audio.openal._AL.Device_Impl_,snow.platform.native.input.InputSystem,snow.platform.native.input.sdl.ControllerEventType,snow.platform.native.input.sdl.InputSystem,snow.platform.native.input.sdl.KeyEventType,snow.platform.native.input.sdl.ModValue,snow.platform.native.input.sdl.MouseEventType,snow.platform.native.input.sdl.TouchEventType,snow.platform.native.io.IOFile,snow.platform.native.io.IOFileHandle,snow.platform.native.io.IOSystem,snow.platform.native.io._IOFile.IOFileHandle_Impl_,snow.platform.native.render.opengl.GL,snow.platform.native.render.opengl.GLActiveInfo,snow.platform.native.render.opengl.GLBuffer,snow.platform.native.render.opengl.GLContextAttributes,snow.platform.native.render.opengl.GLFBO,snow.platform.native.render.opengl.GLFramebuffer,snow.platform.native.render.opengl.GLObject,snow.platform.native.render.opengl.GLProgram,snow.platform.native.render.opengl.GLRBO,snow.platform.native.render.opengl.GLRenderbuffer,snow.platform.native.render.opengl.GLShader,snow.platform.native.render.opengl.GLShaderPrecisionFormat,snow.platform.native.render.opengl.GLTexture,snow.platform.native.render.opengl.GLUniformLocation,snow.platform.native.render.opengl._GL.GLFramebuffer_Impl_,snow.platform.native.render.opengl._GL.GLRenderbuffer_Impl_,snow.platform.native.utils.ArrayBuffer,snow.platform.native.utils.ArrayBufferView,snow.platform.native.utils.ByteArray,snow.platform.native.utils.Compression,snow.platform.native.utils.Float32Array,snow.platform.native.utils.Int16Array,snow.platform.native.utils.Int32Array,snow.platform.native.utils.Int8Array,snow.platform.native.utils.UInt16Array,snow.platform.native.utils.UInt32Array,snow.platform.native.utils.UInt8Array,snow.platform.native.utils.UInt8ClampedArray,snow.platform.native.window.WindowSystem,snow.platform.native.window.sdl.WindowSystem,snow.platform.web.assets.psd.PSD,snow.platform.web.audio.AudioSystem,snow.platform.web.audio.Sound,snow.platform.web.audio.SoundStream,snow.platform.web.audio.howlerjs.AudioParams,snow.platform.web.audio.howlerjs.AudioSystem,snow.platform.web.audio.howlerjs.Howl,snow.platform.web.audio.howlerjs.Howler,snow.platform.web.audio.howlerjs.SoundStream,snow.platform.web.audio.howlerjs.SpriteParams,snow.render.opengl.GL,snow.render.opengl.GLActiveInfo,snow.render.opengl.GLBuffer,snow.render.opengl.GLContextAttributes,snow.render.opengl.GLFramebuffer,snow.render.opengl.GLProgram,snow.render.opengl.GLRenderbuffer,snow.render.opengl.GLShader,snow.render.opengl.GLTexture,snow.render.opengl.GLUniformLocation,snow.types.AppConfig,snow.types.AppConfigNative,snow.types.AppConfigWeb,snow.types.AssetAudioOptions,snow.types.AssetBytesOptions,snow.types.AssetImageOptions,snow.types.AssetInfo,snow.types.AssetTextOptions,snow.types.AssetType,snow.types.AudioDataBlob,snow.types.AudioDataInfo,snow.types.AudioFormatType,snow.types.AudioHandle,snow.types.AudioInfo,snow.types.DisplayMode,snow.types.FileEvent,snow.types.FileEventType,snow.types.FileFilter,snow.types.GamepadDeviceEventType,snow.types.ImageInfo,snow.types.InputEvent,snow.types.InputEventType,snow.types.Key,snow.types.ModState,snow.types.Scan,snow.types.SnowConfig,snow.types.SystemEvent,snow.types.SystemEventType,snow.types.TextEventType,snow.types.WindowConfig,snow.types.WindowEvent,snow.types.WindowEventType,snow.types.WindowHandle,snow.utils.AbstractClass,snow.utils.AbstractClassBuilder,snow.utils.ArrayBuffer,snow.utils.ArrayBufferView,snow.utils.ByteArray,snow.utils.Float32Array,snow.utils.IDataInput,snow.utils.IMemoryRange,snow.utils.Int16Array,snow.utils.Int32Array,snow.utils.Int8Array,snow.utils.Libs,snow.utils.Timer,snow.utils.UInt16Array,snow.utils.UInt32Array,snow.utils.UInt8Array,snow.utils.UInt8ClampedArray,snow.utils._AbstractClass.StringMap,snow.utils.format.png.Chunk,snow.utils.format.png.Color,snow.utils.format.png.Data,snow.utils.format.png.Header,snow.utils.format.png.Reader,snow.utils.format.png.Tools,snow.utils.format.png.Writer,snow.utils.format.tools.Adler32,snow.utils.format.tools.Deflate,snow.utils.format.tools.HuffTools,snow.utils.format.tools.Huffman,snow.utils.format.tools.Inflate,snow.utils.format.tools.InflateImpl,snow.utils.format.tools.MemoryBytes,snow.utils.format.tools._InflateImpl.State,snow.utils.format.tools._InflateImpl.Window,snow.window.Window,snow.window.WindowSystem,snow.window.WindowSystemBinding,snow.window.Windowing,snow.window._Windowing.WindowHandleMap"></script>


<h1>AssetSystemBinding</h1>
<small>`snow.assets.AssetSystemBinding`</small>



<hr/>

`class`<br/>implements <code><span>snow.utils.AbstractClass</span></code><br/><span class="meta">
meta: @:keep, @:build(&#x27;???&#x27;), @:autoBuild(&#x27;???&#x27;), @:noCompletion</span>

<hr/>


&nbsp;
&nbsp;




<h3>Members</h3> <hr/><span class="member apipage">
                <a name="manager"><a class="lift" href="#manager">manager</a></a><div class="clear"></div>
                <code class="signature apipage">manager : [snow.assets.Assets](../../../api/snow/assets/Assets.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/>


<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="audio_load_info"><a class="lift" href="#audio_load_info">audio\_load\_info</a></a><div class="clear"></div>
            <code class="signature apipage">audio\_load\_info(\_path:[String](http://api.haxe.org/String.html)<span></span>, \_format:[snow.types.AudioFormatType](../../../api/snow/types/AudioFormatType.html)<span>=null</span>, \_load:[Bool](http://api.haxe.org/Bool.html)<span>=true</span>, \_onload:[snow.types.AudioInfo](../../../api/snow/types/AudioInfo.html)&nbsp;-&gt; [Void](http://api.haxe.org/Void.html)<span>=null</span>) : [snow.types.AudioInfo](../../../api/snow/types/AudioInfo.html)</code><br/><span class="small_desc_flat">Audio info loader, use `app.assets`</span>


</span>
<span class="method apipage">
            <a name="audio_load_portion"><a class="lift" href="#audio_load_portion">audio\_load\_portion</a></a><div class="clear"></div>
            <code class="signature apipage">audio\_load\_portion(\_info:[snow.types.AudioInfo](../../../api/snow/types/AudioInfo.html)<span></span>, \_start:[Int](http://api.haxe.org/Int.html)<span></span>, \_len:[Int](http://api.haxe.org/Int.html)<span></span>) : [snow.types.AudioDataBlob](../../../api/snow/types/AudioDataBlob.html)</code><br/><span class="small_desc_flat">Audio portion loading (used for streaming or splitting source files into multiple blobs). sizes are in bytes. `native` only</span>


</span>
<span class="method apipage">
            <a name="audio_seek_source"><a class="lift" href="#audio_seek_source">audio\_seek\_source</a></a><div class="clear"></div>
            <code class="signature apipage">audio\_seek\_source(\_info:[snow.types.AudioInfo](../../../api/snow/types/AudioInfo.html)<span></span>, \_to:[Int](http://api.haxe.org/Int.html)<span></span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat">Audio seek the specified audio info to the given position in bytes. `native` only</span>


</span>
<span class="method apipage">
            <a name="exists"><a class="lift" href="#exists">exists</a></a><div class="clear"></div>
            <code class="signature apipage">exists(\_id:[String](http://api.haxe.org/String.html)<span></span>, \_strict:[Bool](http://api.haxe.org/Bool.html)<span>=true</span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat">Return true if the asset exists or false if not.
            If strict is enabled, it will only check the stored asset list.
            If strict is false, will allow unlisted paths and use platform specific exists checks.
            On web targets, this will return false for unlisted files as http requests for 404's is silly.</span>


</span>
<span class="method apipage">
            <a name="image_info_from_bytes"><a class="lift" href="#image_info_from_bytes">image\_info\_from\_bytes</a></a><div class="clear"></div>
            <code class="signature apipage">image\_info\_from\_bytes(\_path:[String](http://api.haxe.org/String.html)<span></span>, \_bytes:[snow.utils.ByteArray](../../../api/snow/utils/ByteArray.html)<span></span>, \_components:[Int](http://api.haxe.org/Int.html)<span>=4</span>) : [snow.types.ImageInfo](../../../api/snow/types/ImageInfo.html)</code><br/><span class="small_desc_flat">Image info load from `ByteArray`. Use `app.assets`</span>


</span>
<span class="method apipage">
            <a name="image_load_info"><a class="lift" href="#image_load_info">image\_load\_info</a></a><div class="clear"></div>
            <code class="signature apipage">image\_load\_info(\_path:[String](http://api.haxe.org/String.html)<span></span>, \_components:[Int](http://api.haxe.org/Int.html)<span>=4</span>, \_onload:[snow.types.ImageInfo](../../../api/snow/types/ImageInfo.html)&nbsp;-&gt; [Void](http://api.haxe.org/Void.html)<span>=null</span>) : [snow.types.ImageInfo](../../../api/snow/types/ImageInfo.html)</code><br/><span class="small_desc_flat">Image info load from file path. Use `app.assets`</span>


</span>



<hr/>

&nbsp;
&nbsp;
&nbsp;
&nbsp;