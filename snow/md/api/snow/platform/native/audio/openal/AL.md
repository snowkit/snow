
[![Logo](../../../../../../images/logo.png)](../../../../../../api/index.html)

<hr/>
<a href="#" id="search_bar" onclick="return;"><div> search API <em>(or start typing anywhere)</em> </div></a>
<hr/>

<script src="../../../../../../js/omnibar.js"> </script>
<link rel="stylesheet" type="text/css" href="../../../../../../css/omnibar.css" media="all">

<div id="omnibar"> <a href="#" onclick="return" id="omnibar_close"></a> <input id="omnibar_text" type="text" placeholder="search types..."></input></div>
<script  id="typelist" data-relpath="../../../../../../" data-types="snow.App,snow.AppFixedTimestep,snow.Core,snow.CoreBinding,snow.Log,snow.Snow,snow.assets.Asset,snow.assets.AssetAudio,snow.assets.AssetBytes,snow.assets.AssetImage,snow.assets.AssetSystem,snow.assets.AssetSystemBinding,snow.assets.AssetText,snow.assets.Assets,snow.audio.Audio,snow.audio.AudioSystem,snow.audio.AudioSystemBinding,snow.audio.Sound,snow.audio.SoundBinding,snow.audio.SoundStream,snow.audio._Audio.AudioHandleMap,snow.audio.openal.AL,snow.audio.openal.ALC,snow.audio.openal.Context,snow.audio.openal.Device,snow.input.Input,snow.input.InputSystem,snow.input.InputSystemBinding,snow.input.Keycodes,snow.input.MapIntBool,snow.input.MapIntFloat,snow.input.Scancodes,snow.io.IO,snow.io.IOSystem,snow.io.IOSystemBinding,snow.platform.native.Core,snow.platform.native.StaticSnow,snow.platform.native.assets.AssetSystem,snow.platform.native.audio.AudioSystem,snow.platform.native.audio.Sound,snow.platform.native.audio.SoundStream,snow.platform.native.audio.openal.AL,snow.platform.native.audio.openal.ALC,snow.platform.native.audio.openal.AudioSystem,snow.platform.native.audio.openal.Context,snow.platform.native.audio.openal.Device,snow.platform.native.audio.openal.OpenALHelper,snow.platform.native.audio.openal.Sound,snow.platform.native.audio.openal.SoundStream,snow.platform.native.audio.openal._AL.Context_Impl_,snow.platform.native.audio.openal._AL.Device_Impl_,snow.platform.native.input.InputSystem,snow.platform.native.input.sdl.ControllerEventType,snow.platform.native.input.sdl.InputSystem,snow.platform.native.input.sdl.KeyEventType,snow.platform.native.input.sdl.ModValue,snow.platform.native.input.sdl.MouseEventType,snow.platform.native.input.sdl.TouchEventType,snow.platform.native.io.IOFile,snow.platform.native.io.IOFileHandle,snow.platform.native.io.IOSystem,snow.platform.native.io._IOFile.IOFileHandle_Impl_,snow.platform.native.render.opengl.GL,snow.platform.native.render.opengl.GLActiveInfo,snow.platform.native.render.opengl.GLBuffer,snow.platform.native.render.opengl.GLContextAttributes,snow.platform.native.render.opengl.GLFBO,snow.platform.native.render.opengl.GLFramebuffer,snow.platform.native.render.opengl.GLObject,snow.platform.native.render.opengl.GLProgram,snow.platform.native.render.opengl.GLRBO,snow.platform.native.render.opengl.GLRenderbuffer,snow.platform.native.render.opengl.GLShader,snow.platform.native.render.opengl.GLShaderPrecisionFormat,snow.platform.native.render.opengl.GLTexture,snow.platform.native.render.opengl.GLUniformLocation,snow.platform.native.render.opengl._GL.GLFramebuffer_Impl_,snow.platform.native.render.opengl._GL.GLRenderbuffer_Impl_,snow.platform.native.utils.ArrayBuffer,snow.platform.native.utils.ArrayBufferView,snow.platform.native.utils.ByteArray,snow.platform.native.utils.Compression,snow.platform.native.utils.Float32Array,snow.platform.native.utils.Int16Array,snow.platform.native.utils.Int32Array,snow.platform.native.utils.Int8Array,snow.platform.native.utils.UInt16Array,snow.platform.native.utils.UInt32Array,snow.platform.native.utils.UInt8Array,snow.platform.native.utils.UInt8ClampedArray,snow.platform.native.window.WindowSystem,snow.platform.native.window.sdl.WindowSystem,snow.platform.web.assets.psd.PSD,snow.platform.web.audio.AudioSystem,snow.platform.web.audio.Sound,snow.platform.web.audio.SoundStream,snow.platform.web.audio.howlerjs.AudioParams,snow.platform.web.audio.howlerjs.AudioSystem,snow.platform.web.audio.howlerjs.Howl,snow.platform.web.audio.howlerjs.Howler,snow.platform.web.audio.howlerjs.SoundStream,snow.platform.web.audio.howlerjs.SpriteParams,snow.render.opengl.GL,snow.render.opengl.GLActiveInfo,snow.render.opengl.GLBuffer,snow.render.opengl.GLContextAttributes,snow.render.opengl.GLFramebuffer,snow.render.opengl.GLProgram,snow.render.opengl.GLRenderbuffer,snow.render.opengl.GLShader,snow.render.opengl.GLTexture,snow.render.opengl.GLUniformLocation,snow.types.AppConfig,snow.types.AppConfigNative,snow.types.AppConfigWeb,snow.types.AssetAudioOptions,snow.types.AssetBytesOptions,snow.types.AssetImageOptions,snow.types.AssetInfo,snow.types.AssetTextOptions,snow.types.AssetType,snow.types.AudioDataBlob,snow.types.AudioDataInfo,snow.types.AudioFormatType,snow.types.AudioHandle,snow.types.AudioInfo,snow.types.DisplayMode,snow.types.FileEvent,snow.types.FileEventType,snow.types.FileFilter,snow.types.GamepadDeviceEventType,snow.types.ImageInfo,snow.types.InputEvent,snow.types.InputEventType,snow.types.Key,snow.types.ModState,snow.types.Scan,snow.types.SnowConfig,snow.types.SystemEvent,snow.types.SystemEventType,snow.types.TextEventType,snow.types.WindowConfig,snow.types.WindowEvent,snow.types.WindowEventType,snow.types.WindowHandle,snow.utils.AbstractClass,snow.utils.AbstractClassBuilder,snow.utils.ArrayBuffer,snow.utils.ArrayBufferView,snow.utils.ByteArray,snow.utils.Float32Array,snow.utils.IDataInput,snow.utils.IMemoryRange,snow.utils.Int16Array,snow.utils.Int32Array,snow.utils.Int8Array,snow.utils.Libs,snow.utils.Timer,snow.utils.UInt16Array,snow.utils.UInt32Array,snow.utils.UInt8Array,snow.utils.UInt8ClampedArray,snow.utils._AbstractClass.StringMap,snow.utils.format.png.Chunk,snow.utils.format.png.Color,snow.utils.format.png.Data,snow.utils.format.png.Header,snow.utils.format.png.Reader,snow.utils.format.png.Tools,snow.utils.format.png.Writer,snow.utils.format.tools.Adler32,snow.utils.format.tools.Deflate,snow.utils.format.tools.HuffTools,snow.utils.format.tools.Huffman,snow.utils.format.tools.Inflate,snow.utils.format.tools.InflateImpl,snow.utils.format.tools.MemoryBytes,snow.utils.format.tools._InflateImpl.State,snow.utils.format.tools._InflateImpl.Window,snow.window.Window,snow.window.WindowSystem,snow.window.WindowSystemBinding,snow.window.Windowing,snow.window._Windowing.WindowHandleMap"></script>


<h1>AL</h1>
<small>`snow.platform.native.audio.openal.AL`</small>



<hr/>

`class`<br/><span class="meta">
meta: @:keep</span>

<hr/>


&nbsp;
&nbsp;




<h3>Members</h3> <hr/><span class="member apipage">
                <a name="BITS"><a class="lift" href="#BITS">BITS</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">BITS : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="BUFFER"><a class="lift" href="#BUFFER">BUFFER</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">BUFFER : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="BUFFERS_PROCESSED"><a class="lift" href="#BUFFERS_PROCESSED">BUFFERS\_PROCESSED</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">BUFFERS\_PROCESSED : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="BUFFERS_QUEUED"><a class="lift" href="#BUFFERS_QUEUED">BUFFERS\_QUEUED</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">BUFFERS\_QUEUED : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="BYTE_OFFSET"><a class="lift" href="#BYTE_OFFSET">BYTE\_OFFSET</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">BYTE\_OFFSET : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="CHANNELS"><a class="lift" href="#CHANNELS">CHANNELS</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">CHANNELS : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="CONE_INNER_ANGLE"><a class="lift" href="#CONE_INNER_ANGLE">CONE\_INNER\_ANGLE</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">CONE\_INNER\_ANGLE : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="CONE_OUTER_ANGLE"><a class="lift" href="#CONE_OUTER_ANGLE">CONE\_OUTER\_ANGLE</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">CONE\_OUTER\_ANGLE : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="CONE_OUTER_GAIN"><a class="lift" href="#CONE_OUTER_GAIN">CONE\_OUTER\_GAIN</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">CONE\_OUTER\_GAIN : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="DIRECTION"><a class="lift" href="#DIRECTION">DIRECTION</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">DIRECTION : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="DISTANCE_MODEL"><a class="lift" href="#DISTANCE_MODEL">DISTANCE\_MODEL</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">DISTANCE\_MODEL : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="DOPPLER_FACTOR"><a class="lift" href="#DOPPLER_FACTOR">DOPPLER\_FACTOR</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">DOPPLER\_FACTOR : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="DOPPLER_VELOCITY"><a class="lift" href="#DOPPLER_VELOCITY">DOPPLER\_VELOCITY</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">DOPPLER\_VELOCITY : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="EXPONENT_DISTANCE"><a class="lift" href="#EXPONENT_DISTANCE">EXPONENT\_DISTANCE</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">EXPONENT\_DISTANCE : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="EXPONENT_DISTANCE_CLAMPED"><a class="lift" href="#EXPONENT_DISTANCE_CLAMPED">EXPONENT\_DISTANCE\_CLAMPED</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">EXPONENT\_DISTANCE\_CLAMPED : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="EXTENSIONS"><a class="lift" href="#EXTENSIONS">EXTENSIONS</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">EXTENSIONS : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="FALSE"><a class="lift" href="#FALSE">FALSE</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">FALSE : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="FORMAT_MONO16"><a class="lift" href="#FORMAT_MONO16">FORMAT\_MONO16</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">FORMAT\_MONO16 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="FORMAT_MONO8"><a class="lift" href="#FORMAT_MONO8">FORMAT\_MONO8</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">FORMAT\_MONO8 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="FORMAT_STEREO16"><a class="lift" href="#FORMAT_STEREO16">FORMAT\_STEREO16</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">FORMAT\_STEREO16 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="FORMAT_STEREO8"><a class="lift" href="#FORMAT_STEREO8">FORMAT\_STEREO8</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">FORMAT\_STEREO8 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="FREQUENCY"><a class="lift" href="#FREQUENCY">FREQUENCY</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">FREQUENCY : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="GAIN"><a class="lift" href="#GAIN">GAIN</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">GAIN : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="INITIAL"><a class="lift" href="#INITIAL">INITIAL</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">INITIAL : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="INVALID_ENUM"><a class="lift" href="#INVALID_ENUM">INVALID\_ENUM</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">INVALID\_ENUM : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="INVALID_ENUM_MEANING"><a class="lift" href="#INVALID_ENUM_MEANING">INVALID\_ENUM\_MEANING</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">INVALID\_ENUM\_MEANING : [String](http://api.haxe.org/String.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="INVALID_NAME"><a class="lift" href="#INVALID_NAME">INVALID\_NAME</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">INVALID\_NAME : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="INVALID_NAME_MEANING"><a class="lift" href="#INVALID_NAME_MEANING">INVALID\_NAME\_MEANING</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">INVALID\_NAME\_MEANING : [String](http://api.haxe.org/String.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="INVALID_OPERATION"><a class="lift" href="#INVALID_OPERATION">INVALID\_OPERATION</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">INVALID\_OPERATION : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="INVALID_OPERATION_MEANING"><a class="lift" href="#INVALID_OPERATION_MEANING">INVALID\_OPERATION\_MEANING</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">INVALID\_OPERATION\_MEANING : [String](http://api.haxe.org/String.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="INVALID_VALUE"><a class="lift" href="#INVALID_VALUE">INVALID\_VALUE</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">INVALID\_VALUE : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="INVALID_VALUE_MEANING"><a class="lift" href="#INVALID_VALUE_MEANING">INVALID\_VALUE\_MEANING</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">INVALID\_VALUE\_MEANING : [String](http://api.haxe.org/String.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="INVERSE_DISTANCE"><a class="lift" href="#INVERSE_DISTANCE">INVERSE\_DISTANCE</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">INVERSE\_DISTANCE : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="INVERSE_DISTANCE_CLAMPED"><a class="lift" href="#INVERSE_DISTANCE_CLAMPED">INVERSE\_DISTANCE\_CLAMPED</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">INVERSE\_DISTANCE\_CLAMPED : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="LINEAR_DISTANCE"><a class="lift" href="#LINEAR_DISTANCE">LINEAR\_DISTANCE</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">LINEAR\_DISTANCE : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="LINEAR_DISTANCE_CLAMPED"><a class="lift" href="#LINEAR_DISTANCE_CLAMPED">LINEAR\_DISTANCE\_CLAMPED</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">LINEAR\_DISTANCE\_CLAMPED : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="LOOPING"><a class="lift" href="#LOOPING">LOOPING</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">LOOPING : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="MAX_DISTANCE"><a class="lift" href="#MAX_DISTANCE">MAX\_DISTANCE</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">MAX\_DISTANCE : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="MAX_GAIN"><a class="lift" href="#MAX_GAIN">MAX\_GAIN</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">MAX\_GAIN : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="MIN_GAIN"><a class="lift" href="#MIN_GAIN">MIN\_GAIN</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">MIN\_GAIN : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="NONE"><a class="lift" href="#NONE">NONE</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">NONE : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="NO_ERROR"><a class="lift" href="#NO_ERROR">NO\_ERROR</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">NO\_ERROR : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="ORIENTATION"><a class="lift" href="#ORIENTATION">ORIENTATION</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">ORIENTATION : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="OUT_OF_MEMORY"><a class="lift" href="#OUT_OF_MEMORY">OUT\_OF\_MEMORY</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">OUT\_OF\_MEMORY : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="OUT_OF_MEMORY_MEANING"><a class="lift" href="#OUT_OF_MEMORY_MEANING">OUT\_OF\_MEMORY\_MEANING</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">OUT\_OF\_MEMORY\_MEANING : [String](http://api.haxe.org/String.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="PAUSED"><a class="lift" href="#PAUSED">PAUSED</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">PAUSED : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="PITCH"><a class="lift" href="#PITCH">PITCH</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">PITCH : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="PLAYING"><a class="lift" href="#PLAYING">PLAYING</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">PLAYING : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="POSITION"><a class="lift" href="#POSITION">POSITION</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">POSITION : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="REFERENCE_DISTANCE"><a class="lift" href="#REFERENCE_DISTANCE">REFERENCE\_DISTANCE</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">REFERENCE\_DISTANCE : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="RENDERER"><a class="lift" href="#RENDERER">RENDERER</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">RENDERER : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="ROLLOFF_FACTOR"><a class="lift" href="#ROLLOFF_FACTOR">ROLLOFF\_FACTOR</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">ROLLOFF\_FACTOR : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="SAMPLE_OFFSET"><a class="lift" href="#SAMPLE_OFFSET">SAMPLE\_OFFSET</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">SAMPLE\_OFFSET : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="SEC_OFFSET"><a class="lift" href="#SEC_OFFSET">SEC\_OFFSET</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">SEC\_OFFSET : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="SIZE"><a class="lift" href="#SIZE">SIZE</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">SIZE : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="SOURCE_RELATIVE"><a class="lift" href="#SOURCE_RELATIVE">SOURCE\_RELATIVE</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">SOURCE\_RELATIVE : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="SOURCE_STATE"><a class="lift" href="#SOURCE_STATE">SOURCE\_STATE</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">SOURCE\_STATE : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="SOURCE_TYPE"><a class="lift" href="#SOURCE_TYPE">SOURCE\_TYPE</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">SOURCE\_TYPE : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="SPEED_OF_SOUND"><a class="lift" href="#SPEED_OF_SOUND">SPEED\_OF\_SOUND</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">SPEED\_OF\_SOUND : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="STATIC"><a class="lift" href="#STATIC">STATIC</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">STATIC : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="STOPPED"><a class="lift" href="#STOPPED">STOPPED</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">STOPPED : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="STREAMING"><a class="lift" href="#STREAMING">STREAMING</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">STREAMING : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="TRUE"><a class="lift" href="#TRUE">TRUE</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">TRUE : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="UNDETERMINED"><a class="lift" href="#UNDETERMINED">UNDETERMINED</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">UNDETERMINED : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="VELOCITY"><a class="lift" href="#VELOCITY">VELOCITY</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">VELOCITY : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="VENDOR"><a class="lift" href="#VENDOR">VENDOR</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">VENDOR : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="VERSION"><a class="lift" href="#VERSION">VERSION</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">VERSION : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/>


<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="buffer3f"><a class="lift" href="#buffer3f">buffer3f</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">buffer3f(buffer:[Int](http://api.haxe.org/Int.html)<span></span>, param:[Int](http://api.haxe.org/Int.html)<span></span>, value1:[Float](http://api.haxe.org/Float.html)<span></span>, value2:[Float](http://api.haxe.org/Float.html)<span></span>, value3:[Float](http://api.haxe.org/Float.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="buffer3i"><a class="lift" href="#buffer3i">buffer3i</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">buffer3i(buffer:[Int](http://api.haxe.org/Int.html)<span></span>, param:[Int](http://api.haxe.org/Int.html)<span></span>, value1:[Int](http://api.haxe.org/Int.html)<span></span>, value2:[Int](http://api.haxe.org/Int.html)<span></span>, value3:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="bufferData"><a class="lift" href="#bufferData">bufferData</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">bufferData(buffer:[Int](http://api.haxe.org/Int.html)<span></span>, format:[Int](http://api.haxe.org/Int.html)<span></span>, data:[snow.utils.Float32Array](../../../../../../api/snow/utils/Float32Array.html)<span></span>, size:[Int](http://api.haxe.org/Int.html)<span></span>, freq:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="bufferf"><a class="lift" href="#bufferf">bufferf</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">bufferf(buffer:[Int](http://api.haxe.org/Int.html)<span></span>, param:[Int](http://api.haxe.org/Int.html)<span></span>, value:[Float](http://api.haxe.org/Float.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="bufferfv"><a class="lift" href="#bufferfv">bufferfv</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">bufferfv(buffer:[Int](http://api.haxe.org/Int.html)<span></span>, param:[Int](http://api.haxe.org/Int.html)<span></span>, values:[Array](http://api.haxe.org/Array.html)&lt;[Float](http://api.haxe.org/Float.html)&gt;<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="bufferi"><a class="lift" href="#bufferi">bufferi</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">bufferi(buffer:[Int](http://api.haxe.org/Int.html)<span></span>, param:[Int](http://api.haxe.org/Int.html)<span></span>, value:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="bufferiv"><a class="lift" href="#bufferiv">bufferiv</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">bufferiv(buffer:[Int](http://api.haxe.org/Int.html)<span></span>, param:[Int](http://api.haxe.org/Int.html)<span></span>, values:[Array](http://api.haxe.org/Array.html)&lt;[Int](http://api.haxe.org/Int.html)&gt;<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="deleteBuffer"><a class="lift" href="#deleteBuffer">deleteBuffer</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">deleteBuffer(buffer:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="deleteBuffers"><a class="lift" href="#deleteBuffers">deleteBuffers</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">deleteBuffers(buffers:[Array](http://api.haxe.org/Array.html)&lt;[Int](http://api.haxe.org/Int.html)&gt;<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="deleteSource"><a class="lift" href="#deleteSource">deleteSource</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">deleteSource(source:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="deleteSources"><a class="lift" href="#deleteSources">deleteSources</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">deleteSources(sources:[Array](http://api.haxe.org/Array.html)&lt;[Int](http://api.haxe.org/Int.html)&gt;<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="disable"><a class="lift" href="#disable">disable</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">disable(capability:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="distanceModel"><a class="lift" href="#distanceModel">distanceModel</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">distanceModel(distanceModel:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="dopplerFactor"><a class="lift" href="#dopplerFactor">dopplerFactor</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">dopplerFactor(value:[Float](http://api.haxe.org/Float.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="dopplerVelocity"><a class="lift" href="#dopplerVelocity">dopplerVelocity</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">dopplerVelocity(value:[Float](http://api.haxe.org/Float.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="enable"><a class="lift" href="#enable">enable</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">enable(capability:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="genBuffer"><a class="lift" href="#genBuffer">genBuffer</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">genBuffer() : [Int](http://api.haxe.org/Int.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="genBuffers"><a class="lift" href="#genBuffers">genBuffers</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">genBuffers(n:[Int](http://api.haxe.org/Int.html)<span></span>) : [Array](http://api.haxe.org/Array.html)&lt;[Int](http://api.haxe.org/Int.html)&gt;</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="genSource"><a class="lift" href="#genSource">genSource</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">genSource() : [Int](http://api.haxe.org/Int.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="genSources"><a class="lift" href="#genSources">genSources</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">genSources(n:[Int](http://api.haxe.org/Int.html)<span></span>) : [Array](http://api.haxe.org/Array.html)&lt;[Int](http://api.haxe.org/Int.html)&gt;</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="getBoolean"><a class="lift" href="#getBoolean">getBoolean</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">getBoolean(param:[Int](http://api.haxe.org/Int.html)<span></span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="getBooleanv"><a class="lift" href="#getBooleanv">getBooleanv</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">getBooleanv(param:[Int](http://api.haxe.org/Int.html)<span></span>, count:[Int](http://api.haxe.org/Int.html)<span>=1</span>) : [Array](http://api.haxe.org/Array.html)&lt;[Bool](http://api.haxe.org/Bool.html)&gt;</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="getBuffer3f"><a class="lift" href="#getBuffer3f">getBuffer3f</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">getBuffer3f(buffer:[Int](http://api.haxe.org/Int.html)<span></span>, param:[Int](http://api.haxe.org/Int.html)<span></span>) : [Array](http://api.haxe.org/Array.html)&lt;[Float](http://api.haxe.org/Float.html)&gt;</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="getBuffer3i"><a class="lift" href="#getBuffer3i">getBuffer3i</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">getBuffer3i(buffer:[Int](http://api.haxe.org/Int.html)<span></span>, param:[Int](http://api.haxe.org/Int.html)<span></span>) : [Array](http://api.haxe.org/Array.html)&lt;[Int](http://api.haxe.org/Int.html)&gt;</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="getBufferf"><a class="lift" href="#getBufferf">getBufferf</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">getBufferf(buffer:[Int](http://api.haxe.org/Int.html)<span></span>, param:[Int](http://api.haxe.org/Int.html)<span></span>) : [Float](http://api.haxe.org/Float.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="getBufferfv"><a class="lift" href="#getBufferfv">getBufferfv</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">getBufferfv(buffer:[Int](http://api.haxe.org/Int.html)<span></span>, param:[Int](http://api.haxe.org/Int.html)<span></span>, count:[Int](http://api.haxe.org/Int.html)<span>=1</span>) : [Array](http://api.haxe.org/Array.html)&lt;[Float](http://api.haxe.org/Float.html)&gt;</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="getBufferi"><a class="lift" href="#getBufferi">getBufferi</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">getBufferi(buffer:[Int](http://api.haxe.org/Int.html)<span></span>, param:[Int](http://api.haxe.org/Int.html)<span></span>) : [Int](http://api.haxe.org/Int.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="getBufferiv"><a class="lift" href="#getBufferiv">getBufferiv</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">getBufferiv(buffer:[Int](http://api.haxe.org/Int.html)<span></span>, param:[Int](http://api.haxe.org/Int.html)<span></span>, count:[Int](http://api.haxe.org/Int.html)<span>=1</span>) : [Array](http://api.haxe.org/Array.html)&lt;[Int](http://api.haxe.org/Int.html)&gt;</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="getDouble"><a class="lift" href="#getDouble">getDouble</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">getDouble(param:[Int](http://api.haxe.org/Int.html)<span></span>) : [Float](http://api.haxe.org/Float.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="getDoublev"><a class="lift" href="#getDoublev">getDoublev</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">getDoublev(param:[Int](http://api.haxe.org/Int.html)<span></span>, count:[Int](http://api.haxe.org/Int.html)<span>=1</span>) : [Array](http://api.haxe.org/Array.html)&lt;[Float](http://api.haxe.org/Float.html)&gt;</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="getEnumValue"><a class="lift" href="#getEnumValue">getEnumValue</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">getEnumValue(ename:[String](http://api.haxe.org/String.html)<span></span>) : [Int](http://api.haxe.org/Int.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="getError"><a class="lift" href="#getError">getError</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">getError() : [Int](http://api.haxe.org/Int.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="getErrorMeaning"><a class="lift" href="#getErrorMeaning">getErrorMeaning</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">getErrorMeaning(error:[Int](http://api.haxe.org/Int.html)<span></span>) : [String](http://api.haxe.org/String.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="getFloat"><a class="lift" href="#getFloat">getFloat</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">getFloat(param:[Int](http://api.haxe.org/Int.html)<span></span>) : [Float](http://api.haxe.org/Float.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="getFloatv"><a class="lift" href="#getFloatv">getFloatv</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">getFloatv(param:[Int](http://api.haxe.org/Int.html)<span></span>, count:[Int](http://api.haxe.org/Int.html)<span>=1</span>) : [Array](http://api.haxe.org/Array.html)&lt;[Float](http://api.haxe.org/Float.html)&gt;</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="getInteger"><a class="lift" href="#getInteger">getInteger</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">getInteger(param:[Int](http://api.haxe.org/Int.html)<span></span>) : [Int](http://api.haxe.org/Int.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="getIntegerv"><a class="lift" href="#getIntegerv">getIntegerv</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">getIntegerv(param:[Int](http://api.haxe.org/Int.html)<span></span>, count:[Int](http://api.haxe.org/Int.html)<span>=1</span>) : [Array](http://api.haxe.org/Array.html)&lt;[Int](http://api.haxe.org/Int.html)&gt;</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="getListener3f"><a class="lift" href="#getListener3f">getListener3f</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">getListener3f(param:[Int](http://api.haxe.org/Int.html)<span></span>) : [Array](http://api.haxe.org/Array.html)&lt;[Float](http://api.haxe.org/Float.html)&gt;</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="getListener3i"><a class="lift" href="#getListener3i">getListener3i</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">getListener3i(param:[Int](http://api.haxe.org/Int.html)<span></span>) : [Array](http://api.haxe.org/Array.html)&lt;[Int](http://api.haxe.org/Int.html)&gt;</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="getListenerf"><a class="lift" href="#getListenerf">getListenerf</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">getListenerf(param:[Int](http://api.haxe.org/Int.html)<span></span>) : [Float](http://api.haxe.org/Float.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="getListenerfv"><a class="lift" href="#getListenerfv">getListenerfv</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">getListenerfv(param:[Int](http://api.haxe.org/Int.html)<span></span>, count:[Int](http://api.haxe.org/Int.html)<span>=1</span>) : [Array](http://api.haxe.org/Array.html)&lt;[Float](http://api.haxe.org/Float.html)&gt;</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="getListeneri"><a class="lift" href="#getListeneri">getListeneri</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">getListeneri(param:[Int](http://api.haxe.org/Int.html)<span></span>) : [Int](http://api.haxe.org/Int.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="getListeneriv"><a class="lift" href="#getListeneriv">getListeneriv</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">getListeneriv(param:[Int](http://api.haxe.org/Int.html)<span></span>, count:[Int](http://api.haxe.org/Int.html)<span>=1</span>) : [Array](http://api.haxe.org/Array.html)&lt;[Int](http://api.haxe.org/Int.html)&gt;</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="getProcAddress"><a class="lift" href="#getProcAddress">getProcAddress</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">getProcAddress(fname:[String](http://api.haxe.org/String.html)<span></span>) : [Dynamic](#)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="getSource3f"><a class="lift" href="#getSource3f">getSource3f</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">getSource3f(source:[Int](http://api.haxe.org/Int.html)<span></span>, param:[Int](http://api.haxe.org/Int.html)<span></span>) : [Array](http://api.haxe.org/Array.html)&lt;[Float](http://api.haxe.org/Float.html)&gt;</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="getSource3i"><a class="lift" href="#getSource3i">getSource3i</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">getSource3i(source:[Int](http://api.haxe.org/Int.html)<span></span>, param:[Int](http://api.haxe.org/Int.html)<span></span>) : [Array](http://api.haxe.org/Array.html)&lt;[Int](http://api.haxe.org/Int.html)&gt;</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="getSourcef"><a class="lift" href="#getSourcef">getSourcef</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">getSourcef(source:[Int](http://api.haxe.org/Int.html)<span></span>, param:[Int](http://api.haxe.org/Int.html)<span></span>) : [Float](http://api.haxe.org/Float.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="getSourcefv"><a class="lift" href="#getSourcefv">getSourcefv</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">getSourcefv(source:[Int](http://api.haxe.org/Int.html)<span></span>, param:[Int](http://api.haxe.org/Int.html)<span></span>) : [Array](http://api.haxe.org/Array.html)&lt;[Float](http://api.haxe.org/Float.html)&gt;</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="getSourcei"><a class="lift" href="#getSourcei">getSourcei</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">getSourcei(source:[Int](http://api.haxe.org/Int.html)<span></span>, param:[Int](http://api.haxe.org/Int.html)<span></span>) : [Int](http://api.haxe.org/Int.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="getSourceiv"><a class="lift" href="#getSourceiv">getSourceiv</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">getSourceiv(source:[Int](http://api.haxe.org/Int.html)<span></span>, param:[Int](http://api.haxe.org/Int.html)<span></span>, count:[Int](http://api.haxe.org/Int.html)<span>=1</span>) : [Array](http://api.haxe.org/Array.html)&lt;[Int](http://api.haxe.org/Int.html)&gt;</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="getString"><a class="lift" href="#getString">getString</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">getString(param:[Int](http://api.haxe.org/Int.html)<span></span>) : [String](http://api.haxe.org/String.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="isBuffer"><a class="lift" href="#isBuffer">isBuffer</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">isBuffer(buffer:[Int](http://api.haxe.org/Int.html)<span></span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="isEnabled"><a class="lift" href="#isEnabled">isEnabled</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">isEnabled(capability:[Int](http://api.haxe.org/Int.html)<span></span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="isExtensionPresent"><a class="lift" href="#isExtensionPresent">isExtensionPresent</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">isExtensionPresent(extname:[String](http://api.haxe.org/String.html)<span></span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="isSource"><a class="lift" href="#isSource">isSource</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">isSource(source:[Int](http://api.haxe.org/Int.html)<span></span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="listener3f"><a class="lift" href="#listener3f">listener3f</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">listener3f(param:[Int](http://api.haxe.org/Int.html)<span></span>, value1:[Float](http://api.haxe.org/Float.html)<span></span>, value2:[Float](http://api.haxe.org/Float.html)<span></span>, value3:[Float](http://api.haxe.org/Float.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="listener3i"><a class="lift" href="#listener3i">listener3i</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">listener3i(param:[Int](http://api.haxe.org/Int.html)<span></span>, value1:[Int](http://api.haxe.org/Int.html)<span></span>, value2:[Int](http://api.haxe.org/Int.html)<span></span>, value3:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="listenerf"><a class="lift" href="#listenerf">listenerf</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">listenerf(param:[Int](http://api.haxe.org/Int.html)<span></span>, value:[Float](http://api.haxe.org/Float.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="listenerfv"><a class="lift" href="#listenerfv">listenerfv</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">listenerfv(param:[Int](http://api.haxe.org/Int.html)<span></span>, values:[Array](http://api.haxe.org/Array.html)&lt;[Float](http://api.haxe.org/Float.html)&gt;<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="listeneri"><a class="lift" href="#listeneri">listeneri</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">listeneri(param:[Int](http://api.haxe.org/Int.html)<span></span>, value:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="listeneriv"><a class="lift" href="#listeneriv">listeneriv</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">listeneriv(param:[Int](http://api.haxe.org/Int.html)<span></span>, values:[Array](http://api.haxe.org/Array.html)&lt;[Int](http://api.haxe.org/Int.html)&gt;<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="source3f"><a class="lift" href="#source3f">source3f</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">source3f(source:[Int](http://api.haxe.org/Int.html)<span></span>, param:[Int](http://api.haxe.org/Int.html)<span></span>, value1:[Float](http://api.haxe.org/Float.html)<span></span>, value2:[Float](http://api.haxe.org/Float.html)<span></span>, value3:[Float](http://api.haxe.org/Float.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="source3i"><a class="lift" href="#source3i">source3i</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">source3i(source:[Int](http://api.haxe.org/Int.html)<span></span>, param:[Int](http://api.haxe.org/Int.html)<span></span>, value1:[Int](http://api.haxe.org/Int.html)<span></span>, value2:[Int](http://api.haxe.org/Int.html)<span></span>, value3:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="sourcePause"><a class="lift" href="#sourcePause">sourcePause</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">sourcePause(source:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="sourcePausev"><a class="lift" href="#sourcePausev">sourcePausev</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">sourcePausev(sources:[Array](http://api.haxe.org/Array.html)&lt;[Int](http://api.haxe.org/Int.html)&gt;<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="sourcePlay"><a class="lift" href="#sourcePlay">sourcePlay</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">sourcePlay(source:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="sourcePlayv"><a class="lift" href="#sourcePlayv">sourcePlayv</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">sourcePlayv(sources:[Array](http://api.haxe.org/Array.html)&lt;[Int](http://api.haxe.org/Int.html)&gt;<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="sourceQueueBuffer"><a class="lift" href="#sourceQueueBuffer">sourceQueueBuffer</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">sourceQueueBuffer(source:[Int](http://api.haxe.org/Int.html)<span></span>, buffer:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="sourceQueueBuffers"><a class="lift" href="#sourceQueueBuffers">sourceQueueBuffers</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">sourceQueueBuffers(source:[Int](http://api.haxe.org/Int.html)<span></span>, nb:[Int](http://api.haxe.org/Int.html)<span></span>, buffers:[Array](http://api.haxe.org/Array.html)&lt;[Int](http://api.haxe.org/Int.html)&gt;<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="sourceRewind"><a class="lift" href="#sourceRewind">sourceRewind</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">sourceRewind(source:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="sourceRewindv"><a class="lift" href="#sourceRewindv">sourceRewindv</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">sourceRewindv(sources:[Array](http://api.haxe.org/Array.html)&lt;[Int](http://api.haxe.org/Int.html)&gt;<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="sourceStop"><a class="lift" href="#sourceStop">sourceStop</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">sourceStop(source:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="sourceStopv"><a class="lift" href="#sourceStopv">sourceStopv</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">sourceStopv(sources:[Array](http://api.haxe.org/Array.html)&lt;[Int](http://api.haxe.org/Int.html)&gt;<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="sourceUnqueueBuffer"><a class="lift" href="#sourceUnqueueBuffer">sourceUnqueueBuffer</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">sourceUnqueueBuffer(source:[Int](http://api.haxe.org/Int.html)<span></span>) : [Int](http://api.haxe.org/Int.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="sourceUnqueueBuffers"><a class="lift" href="#sourceUnqueueBuffers">sourceUnqueueBuffers</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">sourceUnqueueBuffers(source:[Int](http://api.haxe.org/Int.html)<span></span>, nb:[Int](http://api.haxe.org/Int.html)<span></span>) : [Array](http://api.haxe.org/Array.html)&lt;[Int](http://api.haxe.org/Int.html)&gt;</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="sourcef"><a class="lift" href="#sourcef">sourcef</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">sourcef(source:[Int](http://api.haxe.org/Int.html)<span></span>, param:[Int](http://api.haxe.org/Int.html)<span></span>, value:[Float](http://api.haxe.org/Float.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="sourcefv"><a class="lift" href="#sourcefv">sourcefv</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">sourcefv(source:[Int](http://api.haxe.org/Int.html)<span></span>, param:[Int](http://api.haxe.org/Int.html)<span></span>, values:[Array](http://api.haxe.org/Array.html)&lt;[Float](http://api.haxe.org/Float.html)&gt;<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="sourcei"><a class="lift" href="#sourcei">sourcei</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">sourcei(source:[Int](http://api.haxe.org/Int.html)<span></span>, param:[Int](http://api.haxe.org/Int.html)<span></span>, value:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="sourceiv"><a class="lift" href="#sourceiv">sourceiv</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">sourceiv(source:[Int](http://api.haxe.org/Int.html)<span></span>, param:[Int](http://api.haxe.org/Int.html)<span></span>, values:[Array](http://api.haxe.org/Array.html)&lt;[Int](http://api.haxe.org/Int.html)&gt;<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="speedOfSound"><a class="lift" href="#speedOfSound">speedOfSound</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">speedOfSound(value:[Float](http://api.haxe.org/Float.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>



<hr/>

&nbsp;
&nbsp;
&nbsp;
&nbsp;