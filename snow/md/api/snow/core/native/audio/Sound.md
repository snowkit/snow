
[![Logo](../../../../../images/logo.png)](../../../../../api/index.html)

<hr/>
<a href="#" id="search_bar" onclick="return;"><div> search API <em>(or start typing anywhere)</em> </div></a>
<hr/>

<script src="../../../../../js/omnibar.js"> </script>
<link rel="stylesheet" type="text/css" href="../../../../../css/omnibar.css" media="all">

<div id="omnibar"> <a href="#" onclick="return" id="omnibar_close"></a> <input id="omnibar_text" type="text" placeholder="search types..."></input></div>
<script  id="typelist" data-relpath="../../../../../" data-types="snow.App,snow.AppFixedTimestep,snow.Snow,snow._Snow.Core,snow.api.Debug,snow.api.DebugError,snow.api.File,snow.api.FileHandle,snow.api.FileSeek,snow.api.Libs,snow.api.Promise,snow.api.PromiseError,snow.api.PromiseState,snow.api.Promises,snow.api.Timer,snow.api._Debug.LogError,snow.api._File.FileHandle_Impl_,snow.api._File.FileSeek_Impl_,snow.api._Promise.PromiseState_Impl_,snow.api.buffers.ArrayBuffer,snow.api.buffers.ArrayBufferIO,snow.api.buffers.ArrayBufferView,snow.api.buffers.DataView,snow.api.buffers.Float32Array,snow.api.buffers.Float64Array,snow.api.buffers.Int16Array,snow.api.buffers.Int32Array,snow.api.buffers.Int8Array,snow.api.buffers.TAError,snow.api.buffers.TypedArrayType,snow.api.buffers.Uint16Array,snow.api.buffers.Uint32Array,snow.api.buffers.Uint8Array,snow.api.buffers.Uint8ClampedArray,snow.api.buffers._ArrayBuffer.ArrayBuffer_Impl_,snow.api.buffers._Float32Array.Float32Array_Impl_,snow.api.buffers._Float64Array.Float64Array_Impl_,snow.api.buffers._Int16Array.Int16Array_Impl_,snow.api.buffers._Int32Array.Int32Array_Impl_,snow.api.buffers._Int8Array.Int8Array_Impl_,snow.api.buffers._TypedArrayType.TypedArrayType_Impl_,snow.api.buffers._Uint16Array.Uint16Array_Impl_,snow.api.buffers._Uint32Array.Uint32Array_Impl_,snow.api.buffers._Uint8Array.Uint8Array_Impl_,snow.api.buffers._Uint8ClampedArray.Uint8ClampedArray_Impl_,snow.core.native.Core,snow.core.native._Core.StaticSnow,snow.core.native.assets.Assets,snow.core.native.assets._Assets.NativeAudioDataBlob,snow.core.native.assets._Assets.NativeAudioDataInfo,snow.core.native.assets._Assets.NativeAudioInfo,snow.core.native.audio.Audio,snow.core.native.audio.Sound,snow.core.native.input.Input,snow.core.native.io.IO,snow.core.native.window.Windowing,snow.core.web.assets.psd.PSD,snow.core.web.input.DOMKeys,snow.modules.interfaces.Assets,snow.modules.interfaces.Audio,snow.modules.interfaces.IO,snow.modules.interfaces.Input,snow.modules.interfaces.Windowing,snow.modules.openal.AL,snow.modules.openal.ALC,snow.modules.openal.ALHelper,snow.modules.openal.Audio,snow.modules.openal.Context,snow.modules.openal.Device,snow.modules.openal.Sound,snow.modules.openal._AL.Context_Impl_,snow.modules.openal._AL.Device_Impl_,snow.modules.openal.sound.ALSound,snow.modules.openal.sound.ALStream,snow.modules.openal.sound.Sound,snow.modules.opengl.GL,snow.modules.opengl.GLActiveInfo,snow.modules.opengl.GLBuffer,snow.modules.opengl.GLContextAttributes,snow.modules.opengl.GLFramebuffer,snow.modules.opengl.GLProgram,snow.modules.opengl.GLRenderbuffer,snow.modules.opengl.GLShader,snow.modules.opengl.GLTexture,snow.modules.opengl.GLUniformLocation,snow.modules.opengl.native.GL,snow.modules.opengl.native.GLActiveInfo,snow.modules.opengl.native.GLBO,snow.modules.opengl.native.GLBuffer,snow.modules.opengl.native.GLContextAttributes,snow.modules.opengl.native.GLFBO,snow.modules.opengl.native.GLFramebuffer,snow.modules.opengl.native.GLLink,snow.modules.opengl.native.GLObject,snow.modules.opengl.native.GLPO,snow.modules.opengl.native.GLProgram,snow.modules.opengl.native.GLProxy,snow.modules.opengl.native.GLRBO,snow.modules.opengl.native.GLRenderbuffer,snow.modules.opengl.native.GLSO,snow.modules.opengl.native.GLShader,snow.modules.opengl.native.GLShaderPrecisionFormat,snow.modules.opengl.native.GLTO,snow.modules.opengl.native.GLTexture,snow.modules.opengl.native.GLUniformLocation,snow.modules.opengl.native.GL_FFI,snow.modules.opengl.native.GL_Native,snow.modules.opengl.native._GL.GLBuffer_Impl_,snow.modules.opengl.native._GL.GLFramebuffer_Impl_,snow.modules.opengl.native._GL.GLProgram_Impl_,snow.modules.opengl.native._GL.GLRenderbuffer_Impl_,snow.modules.opengl.native._GL.GLShader_Impl_,snow.modules.opengl.native._GL.GLTexture_Impl_,snow.modules.opengl.native._GL.GLUniformLocation_Impl_,snow.modules.sdl.ControllerEventType,snow.modules.sdl.Input,snow.modules.sdl.KeyEventType,snow.modules.sdl.ModValue,snow.modules.sdl.MouseEventType,snow.modules.sdl.TouchEventType,snow.modules.sdl.Windowing,snow.modules.sdl._Input.ControllerEventType_Impl_,snow.modules.sdl._Input.KeyEventType_Impl_,snow.modules.sdl._Input.ModValue_Impl_,snow.modules.sdl._Input.MouseEventType_Impl_,snow.modules.sdl._Input.TouchEventType_Impl_,snow.system.assets.Asset,snow.system.assets.AssetBytes,snow.system.assets.AssetImage,snow.system.assets.AssetJSON,snow.system.assets.AssetText,snow.system.assets.Assets,snow.system.assets._Assets.AssetsModule,snow.system.audio.Audio,snow.system.audio.AudioModule,snow.system.audio.Sound,snow.system.input.Input,snow.system.input.Keycodes,snow.system.input.MapIntBool,snow.system.input.MapIntFloat,snow.system.input.Scancodes,snow.system.input._Input.InputModule,snow.system.io.IO,snow.system.io._IO.IOModule,snow.system.module.Assets,snow.system.module.Audio,snow.system.module.IO,snow.system.module.Input,snow.system.module.Sound,snow.system.module.Windowing,snow.system.window.Window,snow.system.window.Windowing,snow.system.window._Windowing.WindowHandleMap,snow.system.window._Windowing.WindowingModule,snow.types.AppConfig,snow.types.AppConfigNative,snow.types.AppConfigWeb,snow.types.Asset,snow.types.AssetBytes,snow.types.AssetImage,snow.types.AssetJSON,snow.types.AssetText,snow.types.AssetType,snow.types.AudioDataBlob,snow.types.AudioDataInfo,snow.types.AudioFormatType,snow.types.AudioHandle,snow.types.AudioInfo,snow.types.DisplayMode,snow.types.Error,snow.types.FileEvent,snow.types.FileEventType,snow.types.FileFilter,snow.types.GamepadDeviceEventType,snow.types.IODataOptions,snow.types.ImageInfo,snow.types.InputEvent,snow.types.InputEventType,snow.types.Key,snow.types.ModState,snow.types.OS,snow.types.OpenGLProfile,snow.types.Platform,snow.types.RenderConfig,snow.types.RenderConfigOpenGL,snow.types.Scan,snow.types.SnowConfig,snow.types.SystemEvent,snow.types.SystemEventType,snow.types.TextEventType,snow.types.WindowConfig,snow.types.WindowEvent,snow.types.WindowEventType,snow.types.WindowHandle,snow.types.WindowingConfig,snow.types._Types.AssetType_Impl_,snow.types._Types.AudioFormatType_Impl_,snow.types._Types.FileEventType_Impl_,snow.types._Types.GamepadDeviceEventType_Impl_,snow.types._Types.InputEventType_Impl_,snow.types._Types.OS_Impl_,snow.types._Types.OpenGLProfile_Impl_,snow.types._Types.Platform_Impl_,snow.types._Types.SystemEventType_Impl_,snow.types._Types.TextEventType_Impl_,snow.types._Types.WindowEventType_Impl_"></script>


<h1>Sound</h1>
<small>`snow.core.native.audio.Sound`</small>



<hr/>

`typedef`&nbsp;alias of `snow.system.audio.Sound`   

<hr/>


&nbsp;
&nbsp;





<h3>Members</h3> <hr/><span class="member apipage">
                <a name="is_stream"><a class="lift" href="#is_stream">is\_stream</a></a><div class="clear"></div>
                <code class="signature apipage">is\_stream : [Bool](http://api.haxe.org/Bool.html)</code><br/></span>
            <span class="small_desc_flat">Stream: If the sound is a streamed source</span><br/><span class="member apipage">
                <a name="name"><a class="lift" href="#name">name</a></a><div class="clear"></div>
                <code class="signature apipage">name : [String](http://api.haxe.org/String.html)</code><br/></span>
            <span class="small_desc_flat">The name of this sound</span><br/><span class="member apipage">
                <a name="stream_buffer_count"><a class="lift" href="#stream_buffer_count">stream\_buffer\_count</a></a><div class="clear"></div>
                <code class="signature apipage">stream\_buffer\_count : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat">`Stream only`: The number of buffers to use in the queue for streaming. default: `4`</span><br/><span class="member apipage">
                <a name="stream_buffer_length"><a class="lift" href="#stream_buffer_length">stream\_buffer\_length</a></a><div class="clear"></div>
                <code class="signature apipage">stream\_buffer\_length : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat">`Stream only`: The length of bytes for a single buffer to queue up to stream. default: `176400`, about 1 second in 16 bit mono.</span><br/><span class="member apipage">
                <a name="system"><a class="lift" href="#system">system</a></a><div class="clear"></div>
                <code class="signature apipage">system : [snow.system.audio.Audio](../../../../../api/snow/system/audio/Audio.html)</code><br/></span>
            <span class="small_desc_flat">The `Audio` system handling this sound</span><br/>

<h3>Properties</h3> <hr/><span class="member apipage">
                <a name="duration"><a class="lift" href="#duration">duration</a></a><div class="clear"></div>
                <code class="signature apipage">duration : [Float](http://api.haxe.org/Float.html)</code><br/></span>
            <span class="small_desc_flat">The duration of this sound, in `seconds`</span><span class="member apipage">
                <a name="info"><a class="lift" href="#info">info</a></a><div class="clear"></div>
                <code class="signature apipage">info : [snow.types.AudioInfo](../../../../../api/snow/types/AudioInfo.html)</code><br/></span>
            <span class="small_desc_flat">The `AudioInfo` this sound is created from. When assigning this it will clean up and set itself to this info instead.</span><span class="member apipage">
                <a name="length_bytes"><a class="lift" href="#length_bytes">length\_bytes</a></a><div class="clear"></div>
                <code class="signature apipage">length\_bytes : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat">The length of this sound in `bytes`</span><span class="member apipage">
                <a name="loaded"><a class="lift" href="#loaded">loaded</a></a><div class="clear"></div>
                <code class="signature apipage">loaded : [Bool](http://api.haxe.org/Bool.html)</code><br/></span>
            <span class="small_desc_flat">If the sound is loaded or ready to use</span><span class="member apipage">
                <a name="looping"><a class="lift" href="#looping">looping</a></a><div class="clear"></div>
                <code class="signature apipage">looping : [Bool](http://api.haxe.org/Bool.html)</code><br/></span>
            <span class="small_desc_flat">If the sound is looping or not. Use `loop()` to change this.</span><span class="member apipage">
                <a name="pan"><a class="lift" href="#pan">pan</a></a><div class="clear"></div>
                <code class="signature apipage">pan : [Float](http://api.haxe.org/Float.html)</code><br/></span>
            <span class="small_desc_flat">The pan of this sound. Pan only logically works on mono sounds, and is by default 2D sounds</span><span class="member apipage">
                <a name="paused"><a class="lift" href="#paused">paused</a></a><div class="clear"></div>
                <code class="signature apipage">paused : [Bool](http://api.haxe.org/Bool.html)</code><br/></span>
            <span class="small_desc_flat">If the sound is paused</span><span class="member apipage">
                <a name="pitch"><a class="lift" href="#pitch">pitch</a></a><div class="clear"></div>
                <code class="signature apipage">pitch : [Float](http://api.haxe.org/Float.html)</code><br/></span>
            <span class="small_desc_flat">The pitch of this sound</span><span class="member apipage">
                <a name="playing"><a class="lift" href="#playing">playing</a></a><div class="clear"></div>
                <code class="signature apipage">playing : [Bool](http://api.haxe.org/Bool.html)</code><br/></span>
            <span class="small_desc_flat">If the sound is playing</span><span class="member apipage">
                <a name="position"><a class="lift" href="#position">position</a></a><div class="clear"></div>
                <code class="signature apipage">position : [Float](http://api.haxe.org/Float.html)</code><br/></span>
            <span class="small_desc_flat">The current playback position of this sound in `seconds`</span><span class="member apipage">
                <a name="position_bytes"><a class="lift" href="#position_bytes">position\_bytes</a></a><div class="clear"></div>
                <code class="signature apipage">position\_bytes : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat">The current playback position of this sound in `bytes`</span><span class="member apipage">
                <a name="volume"><a class="lift" href="#volume">volume</a></a><div class="clear"></div>
                <code class="signature apipage">volume : [Float](http://api.haxe.org/Float.html)</code><br/></span>
            <span class="small_desc_flat">The volume of this sound</span>

<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="destroy"><a class="lift" href="#destroy">destroy</a></a><div class="clear"></div>
            <code class="signature apipage">destroy() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Destroy this sound and it's data.</span>


</span>
<span class="method apipage">
            <a name="loop"><a class="lift" href="#loop">loop</a></a><div class="clear"></div>
            <code class="signature apipage">loop() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Loop this sound</span>


</span>
<span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a><div class="clear"></div>
            <code class="signature apipage">new(\_system:[snow.system.audio.Audio](../../../../../api/snow/system/audio/Audio.html)<span></span>, \_name:[String](http://api.haxe.org/String.html)<span></span>, \_is\_stream:[Bool](http://api.haxe.org/Bool.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Create a new Sound instance. Usually not called directly, handled internally by `audio.create`</span>


</span>
<span class="method apipage">
            <a name="off"><a class="lift" href="#off">off</a></a><div class="clear"></div>
            <code class="signature apipage">off(\_event:[String](http://api.haxe.org/String.html)<span></span>, \_handler:[snow.system.audio.Sound](../../../../../api/snow/system/audio/Sound.html)&nbsp;-&gt; [Void](http://api.haxe.org/Void.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Disconnect a handler from a named event type, previously connected with `on`.</span>


</span>
<span class="method apipage">
            <a name="on"><a class="lift" href="#on">on</a></a><div class="clear"></div>
            <code class="signature apipage">on(\_event:[String](http://api.haxe.org/String.html)<span></span>, \_handler:[snow.system.audio.Sound](../../../../../api/snow/system/audio/Sound.html)&nbsp;-&gt; [Void](http://api.haxe.org/Void.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Connect a handler to a named event.
            Current events include `load` and `end`, and will soon be strict typed.</span>


</span>
<span class="method apipage">
            <a name="pause"><a class="lift" href="#pause">pause</a></a><div class="clear"></div>
            <code class="signature apipage">pause() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Pause this sound</span>


</span>
<span class="method apipage">
            <a name="play"><a class="lift" href="#play">play</a></a><div class="clear"></div>
            <code class="signature apipage">play() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Play this sound</span>


</span>
<span class="method apipage">
            <a name="stop"><a class="lift" href="#stop">stop</a></a><div class="clear"></div>
            <code class="signature apipage">stop() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Stop this sound</span>


</span>
<span class="method apipage">
            <a name="stream_data_get"><a class="lift" href="#stream_data_get">stream\_data\_get</a></a><div class="clear"></div>
            <code class="signature apipage">stream\_data\_get(:[Int](http://api.haxe.org/Int.html)<span></span>, :[Int](http://api.haxe.org/Int.html)<span></span>) : [snow.types.AudioDataBlob](../../../../../api/snow/types/AudioDataBlob.html)</code><br/><span class="small_desc_flat">`Stream only`: The get function, assign a function here only if you want to stream data to the source manually, like generative sound.</span>


</span>
<span class="method apipage">
            <a name="stream_data_seek"><a class="lift" href="#stream_data_seek">stream\_data\_seek</a></a><div class="clear"></div>
            <code class="signature apipage">stream\_data\_seek(:[Int](http://api.haxe.org/Int.html)<span></span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat">`Stream only`: The seek function, assign a function here only if you want to stream data to the source manually, like generative sound.</span>


</span>
<span class="method apipage">
            <a name="toggle"><a class="lift" href="#toggle">toggle</a></a><div class="clear"></div>
            <code class="signature apipage">toggle() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Toggle this sound</span>


</span>






<hr/>

&nbsp;
&nbsp;
&nbsp;
&nbsp;