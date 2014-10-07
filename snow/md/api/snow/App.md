
[![Logo](../../images/logo.png)](../../api/index.html)

<hr/>
<a href="#" id="search_bar" onclick="return;"><div> search API <em>(or start typing anywhere)</em> </div></a>
<hr/>

<script src="../../js/omnibar.js"> </script>
<link rel="stylesheet" type="text/css" href="../../css/omnibar.css" media="all">

<div id="omnibar"> <a href="#" onclick="return" id="omnibar_close"></a> <input id="omnibar_text" type="text" placeholder="search types..."></input></div>
<script  id="typelist" data-relpath="../../" data-types="snow.App,snow.AppFixedTimestep,snow.Core,snow.CoreBinding,snow.Log,snow.Snow,snow.assets.Asset,snow.assets.AssetAudio,snow.assets.AssetBytes,snow.assets.AssetImage,snow.assets.AssetSystem,snow.assets.AssetSystemBinding,snow.assets.AssetText,snow.assets.Assets,snow.audio.Audio,snow.audio.AudioSystem,snow.audio.AudioSystemBinding,snow.audio.Sound,snow.audio.SoundBinding,snow.audio.SoundStream,snow.audio._Audio.AudioHandleMap,snow.audio.openal.AL,snow.audio.openal.ALC,snow.audio.openal.Context,snow.audio.openal.Device,snow.input.Input,snow.input.InputSystem,snow.input.InputSystemBinding,snow.input.Keycodes,snow.input.MapIntBool,snow.input.MapIntFloat,snow.input.Scancodes,snow.io.IO,snow.io.IOSystem,snow.io.IOSystemBinding,snow.platform.native.Core,snow.platform.native.StaticSnow,snow.platform.native.assets.AssetSystem,snow.platform.native.audio.AudioSystem,snow.platform.native.audio.Sound,snow.platform.native.audio.SoundStream,snow.platform.native.audio.openal.AL,snow.platform.native.audio.openal.ALC,snow.platform.native.audio.openal.AudioSystem,snow.platform.native.audio.openal.Context,snow.platform.native.audio.openal.Device,snow.platform.native.audio.openal.OpenALHelper,snow.platform.native.audio.openal.Sound,snow.platform.native.audio.openal.SoundStream,snow.platform.native.audio.openal._AL.Context_Impl_,snow.platform.native.audio.openal._AL.Device_Impl_,snow.platform.native.input.InputSystem,snow.platform.native.input.sdl.ControllerEventType,snow.platform.native.input.sdl.InputSystem,snow.platform.native.input.sdl.KeyEventType,snow.platform.native.input.sdl.ModValue,snow.platform.native.input.sdl.MouseEventType,snow.platform.native.input.sdl.TouchEventType,snow.platform.native.io.IOFile,snow.platform.native.io.IOFileHandle,snow.platform.native.io.IOSystem,snow.platform.native.io._IOFile.IOFileHandle_Impl_,snow.platform.native.render.opengl.GL,snow.platform.native.render.opengl.GLActiveInfo,snow.platform.native.render.opengl.GLBuffer,snow.platform.native.render.opengl.GLContextAttributes,snow.platform.native.render.opengl.GLFBO,snow.platform.native.render.opengl.GLFramebuffer,snow.platform.native.render.opengl.GLObject,snow.platform.native.render.opengl.GLProgram,snow.platform.native.render.opengl.GLRBO,snow.platform.native.render.opengl.GLRenderbuffer,snow.platform.native.render.opengl.GLShader,snow.platform.native.render.opengl.GLShaderPrecisionFormat,snow.platform.native.render.opengl.GLTexture,snow.platform.native.render.opengl.GLUniformLocation,snow.platform.native.render.opengl._GL.GLFramebuffer_Impl_,snow.platform.native.render.opengl._GL.GLRenderbuffer_Impl_,snow.platform.native.utils.ArrayBuffer,snow.platform.native.utils.ArrayBufferView,snow.platform.native.utils.ByteArray,snow.platform.native.utils.Compression,snow.platform.native.utils.Float32Array,snow.platform.native.utils.Int16Array,snow.platform.native.utils.Int32Array,snow.platform.native.utils.Int8Array,snow.platform.native.utils.UInt16Array,snow.platform.native.utils.UInt32Array,snow.platform.native.utils.UInt8Array,snow.platform.native.utils.UInt8ClampedArray,snow.platform.native.window.WindowSystem,snow.platform.native.window.sdl.WindowSystem,snow.platform.web.assets.psd.PSD,snow.platform.web.audio.AudioSystem,snow.platform.web.audio.Sound,snow.platform.web.audio.SoundStream,snow.platform.web.audio.howlerjs.AudioParams,snow.platform.web.audio.howlerjs.AudioSystem,snow.platform.web.audio.howlerjs.Howl,snow.platform.web.audio.howlerjs.Howler,snow.platform.web.audio.howlerjs.SoundStream,snow.platform.web.audio.howlerjs.SpriteParams,snow.render.opengl.GL,snow.render.opengl.GLActiveInfo,snow.render.opengl.GLBuffer,snow.render.opengl.GLContextAttributes,snow.render.opengl.GLFramebuffer,snow.render.opengl.GLProgram,snow.render.opengl.GLRenderbuffer,snow.render.opengl.GLShader,snow.render.opengl.GLTexture,snow.render.opengl.GLUniformLocation,snow.types.AppConfig,snow.types.AppConfigNative,snow.types.AppConfigWeb,snow.types.AssetAudioOptions,snow.types.AssetBytesOptions,snow.types.AssetImageOptions,snow.types.AssetInfo,snow.types.AssetTextOptions,snow.types.AssetType,snow.types.AudioDataBlob,snow.types.AudioDataInfo,snow.types.AudioFormatType,snow.types.AudioHandle,snow.types.AudioInfo,snow.types.DisplayMode,snow.types.FileEvent,snow.types.FileEventType,snow.types.FileFilter,snow.types.GamepadDeviceEventType,snow.types.ImageInfo,snow.types.InputEvent,snow.types.InputEventType,snow.types.Key,snow.types.ModState,snow.types.Scan,snow.types.SnowConfig,snow.types.SystemEvent,snow.types.SystemEventType,snow.types.TextEventType,snow.types.WindowConfig,snow.types.WindowEvent,snow.types.WindowEventType,snow.types.WindowHandle,snow.utils.AbstractClass,snow.utils.AbstractClassBuilder,snow.utils.ArrayBuffer,snow.utils.ArrayBufferView,snow.utils.ByteArray,snow.utils.Float32Array,snow.utils.IDataInput,snow.utils.IMemoryRange,snow.utils.Int16Array,snow.utils.Int32Array,snow.utils.Int8Array,snow.utils.Libs,snow.utils.Timer,snow.utils.UInt16Array,snow.utils.UInt32Array,snow.utils.UInt8Array,snow.utils.UInt8ClampedArray,snow.utils._AbstractClass.StringMap,snow.utils.format.png.Chunk,snow.utils.format.png.Color,snow.utils.format.png.Data,snow.utils.format.png.Header,snow.utils.format.png.Reader,snow.utils.format.png.Tools,snow.utils.format.png.Writer,snow.utils.format.tools.Adler32,snow.utils.format.tools.Deflate,snow.utils.format.tools.HuffTools,snow.utils.format.tools.Huffman,snow.utils.format.tools.Inflate,snow.utils.format.tools.InflateImpl,snow.utils.format.tools.MemoryBytes,snow.utils.format.tools._InflateImpl.State,snow.utils.format.tools._InflateImpl.Window,snow.window.Window,snow.window.WindowSystem,snow.window.WindowSystemBinding,snow.window.Windowing,snow.window._Windowing.WindowHandleMap"></script>


<h1>App</h1>
<small>`snow.App`</small>

The default type of snow application, with variable delta, update limit, render limit, timescale and more. 
    See the {App Guide} for complete details.

<hr/>

`class`<br/><span class="meta">
meta: @:keep</span>

<hr/>


&nbsp;
&nbsp;




<h3>Members</h3> <hr/><span class="member apipage">
                <a name="alpha"><a class="lift" href="#alpha">alpha</a></a><div class="clear"></div>
                <code class="signature apipage">alpha : [Float](http://api.haxe.org/Float.html)</code><br/></span>
            <span class="small_desc_flat">the alpha time for a render between frame updates</span><br/><span class="member apipage">
                <a name="app"><a class="lift" href="#app">app</a></a><div class="clear"></div>
                <code class="signature apipage">app : [snow.Snow](../../api/snow/Snow.html)</code><br/></span>
            <span class="small_desc_flat">use this to access the api features. *i.e* `app.assets.text(_id)`</span><br/><span class="member apipage">
                <a name="cur_frame_start"><a class="lift" href="#cur_frame_start">cur\_frame\_start</a></a><div class="clear"></div>
                <code class="signature apipage">cur\_frame\_start : [Float](http://api.haxe.org/Float.html)</code><br/></span>
            <span class="small_desc_flat">the start time of this frame</span><br/><span class="member apipage">
                <a name="current_time"><a class="lift" href="#current_time">current\_time</a></a><div class="clear"></div>
                <code class="signature apipage">current\_time : [Float](http://api.haxe.org/Float.html)</code><br/></span>
            <span class="small_desc_flat">the current simulation time</span><br/><span class="member apipage">
                <a name="delta_sim"><a class="lift" href="#delta_sim">delta\_sim</a></a><div class="clear"></div>
                <code class="signature apipage">delta\_sim : [Float](http://api.haxe.org/Float.html)</code><br/></span>
            <span class="small_desc_flat">the simulated time the last frame took to run, relative to scale etc</span><br/><span class="member apipage">
                <a name="delta_time"><a class="lift" href="#delta_time">delta\_time</a></a><div class="clear"></div>
                <code class="signature apipage">delta\_time : [Float](http://api.haxe.org/Float.html)</code><br/></span>
            <span class="small_desc_flat">the time the last frame took to run</span><br/><span class="member apipage">
                <a name="fixed_delta"><a class="lift" href="#fixed_delta">fixed\_delta</a></a><div class="clear"></div>
                <code class="signature apipage">fixed\_delta : [Float](http://api.haxe.org/Float.html)</code><br/></span>
            <span class="small_desc_flat">if this is non zero this will be passed in</span><br/><span class="member apipage">
                <a name="last_frame_start"><a class="lift" href="#last_frame_start">last\_frame\_start</a></a><div class="clear"></div>
                <code class="signature apipage">last\_frame\_start : [Float](http://api.haxe.org/Float.html)</code><br/></span>
            <span class="small_desc_flat">the start time of the last frame</span><br/><span class="member apipage">
                <a name="max_frame_time"><a class="lift" href="#max_frame_time">max\_frame\_time</a></a><div class="clear"></div>
                <code class="signature apipage">max\_frame\_time : [Float](http://api.haxe.org/Float.html)</code><br/></span>
            <span class="small_desc_flat">the maximum frame time</span><br/><span class="member apipage">
                <a name="render_rate"><a class="lift" href="#render_rate">render\_rate</a></a><div class="clear"></div>
                <code class="signature apipage">render\_rate : [Float](http://api.haxe.org/Float.html)</code><br/></span>
            <span class="small_desc_flat">if this is non zero, rendering will be forced to this rate</span><br/><span class="member apipage">
                <a name="timescale"><a class="lift" href="#timescale">timescale</a></a><div class="clear"></div>
                <code class="signature apipage">timescale : [Float](http://api.haxe.org/Float.html)</code><br/></span>
            <span class="small_desc_flat">the scale of time</span><br/><span class="member apipage">
                <a name="update_rate"><a class="lift" href="#update_rate">update\_rate</a></a><div class="clear"></div>
                <code class="signature apipage">update\_rate : [Float](http://api.haxe.org/Float.html)</code><br/></span>
            <span class="small_desc_flat">if this is non zero, updates will be forced to this rate</span><br/>


<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="config"><a class="lift" href="#config">config</a></a><div class="clear"></div>
            <code class="signature apipage">config(config:[snow.types.AppConfig](../../api/snow/types/AppConfig.html)<span></span>) : [snow.types.AppConfig](../../api/snow/types/AppConfig.html)</code><br/><span class="small_desc_flat">Called by snow to request config changes, override this to change the defaults.
            This happens before ready, so the values are available when ready is called.</span>


</span>
<span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a><div class="clear"></div>
            <code class="signature apipage">new() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">The default constructor of an App is empty, so you can override it if you want, but take note that this happens way before snow is ready for use. Use [ready](#ready) for entry point.</span>


</span>
<span class="method apipage">
            <a name="ondestroy"><a class="lift" href="#ondestroy">ondestroy</a></a><div class="clear"></div>
            <code class="signature apipage">ondestroy() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Your exit point. Called for you when you should shut down your application</span>


</span>
<span class="method apipage">
            <a name="onevent"><a class="lift" href="#onevent">onevent</a></a><div class="clear"></div>
            <code class="signature apipage">onevent(event:[snow.types.SystemEvent](../../api/snow/types/SystemEvent.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Low level event handler from snow core. Often handled by the subsystems so check there first.</span>


</span>
<span class="method apipage">
            <a name="ongamepadaxis"><a class="lift" href="#ongamepadaxis">ongamepadaxis</a></a><div class="clear"></div>
            <code class="signature apipage">ongamepadaxis(gamepad:[Int](http://api.haxe.org/Int.html)<span></span>, axis:[Int](http://api.haxe.org/Int.html)<span></span>, value:[Float](http://api.haxe.org/Float.html)<span></span>, timestamp:[Float](http://api.haxe.org/Float.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Called for you when a connected gamepad axis moves, use `which` to determine gamepad id</span>


</span>
<span class="method apipage">
            <a name="ongamepaddevice"><a class="lift" href="#ongamepaddevice">ongamepaddevice</a></a><div class="clear"></div>
            <code class="signature apipage">ongamepaddevice(gamepad:[Int](http://api.haxe.org/Int.html)<span></span>, type:[snow.types.GamepadDeviceEventType](../../api/snow/types/GamepadDeviceEventType.html)<span></span>, timestamp:[Float](http://api.haxe.org/Float.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Called for you when a gamepad is connected or disconnected, use `which` to determine gamepad id</span>


</span>
<span class="method apipage">
            <a name="ongamepaddown"><a class="lift" href="#ongamepaddown">ongamepaddown</a></a><div class="clear"></div>
            <code class="signature apipage">ongamepaddown(gamepad:[Int](http://api.haxe.org/Int.html)<span></span>, button:[Int](http://api.haxe.org/Int.html)<span></span>, value:[Float](http://api.haxe.org/Float.html)<span></span>, timestamp:[Float](http://api.haxe.org/Float.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Called for you when a connected gamepad button is pressed, use `which` to determine gamepad id</span>


</span>
<span class="method apipage">
            <a name="ongamepadup"><a class="lift" href="#ongamepadup">ongamepadup</a></a><div class="clear"></div>
            <code class="signature apipage">ongamepadup(gamepad:[Int](http://api.haxe.org/Int.html)<span></span>, button:[Int](http://api.haxe.org/Int.html)<span></span>, value:[Float](http://api.haxe.org/Float.html)<span></span>, timestamp:[Float](http://api.haxe.org/Float.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Called for you when a connected gamepad button is released, use `which` to determine gamepad id</span>


</span>
<span class="method apipage">
            <a name="onkeydown"><a class="lift" href="#onkeydown">onkeydown</a></a><div class="clear"></div>
            <code class="signature apipage">onkeydown(keycode:[Int](http://api.haxe.org/Int.html)<span></span>, scancode:[Int](http://api.haxe.org/Int.html)<span></span>, repeat:[Bool](http://api.haxe.org/Bool.html)<span></span>, mod:[snow.types.ModState](../../api/snow/types/ModState.html)<span></span>, timestamp:[Float](http://api.haxe.org/Float.html)<span></span>, window\_id:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Called for you when a key is pressed down</span>


</span>
<span class="method apipage">
            <a name="onkeyup"><a class="lift" href="#onkeyup">onkeyup</a></a><div class="clear"></div>
            <code class="signature apipage">onkeyup(keycode:[Int](http://api.haxe.org/Int.html)<span></span>, scancode:[Int](http://api.haxe.org/Int.html)<span></span>, repeat:[Bool](http://api.haxe.org/Bool.html)<span></span>, mod:[snow.types.ModState](../../api/snow/types/ModState.html)<span></span>, timestamp:[Float](http://api.haxe.org/Float.html)<span></span>, window\_id:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Called for you when a key is released</span>


</span>
<span class="method apipage">
            <a name="onmousedown"><a class="lift" href="#onmousedown">onmousedown</a></a><div class="clear"></div>
            <code class="signature apipage">onmousedown(x:[Int](http://api.haxe.org/Int.html)<span></span>, y:[Int](http://api.haxe.org/Int.html)<span></span>, button:[Int](http://api.haxe.org/Int.html)<span></span>, timestamp:[Float](http://api.haxe.org/Float.html)<span></span>, window\_id:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Called for you when a mouse button is pressed</span>


</span>
<span class="method apipage">
            <a name="onmousemove"><a class="lift" href="#onmousemove">onmousemove</a></a><div class="clear"></div>
            <code class="signature apipage">onmousemove(x:[Int](http://api.haxe.org/Int.html)<span></span>, y:[Int](http://api.haxe.org/Int.html)<span></span>, xrel:[Int](http://api.haxe.org/Int.html)<span></span>, yrel:[Int](http://api.haxe.org/Int.html)<span></span>, timestamp:[Float](http://api.haxe.org/Float.html)<span></span>, window\_id:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Called for you when the mouse moves</span>


</span>
<span class="method apipage">
            <a name="onmouseup"><a class="lift" href="#onmouseup">onmouseup</a></a><div class="clear"></div>
            <code class="signature apipage">onmouseup(x:[Int](http://api.haxe.org/Int.html)<span></span>, y:[Int](http://api.haxe.org/Int.html)<span></span>, button:[Int](http://api.haxe.org/Int.html)<span></span>, timestamp:[Float](http://api.haxe.org/Float.html)<span></span>, window\_id:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Called for you when a mouse button is released</span>


</span>
<span class="method apipage">
            <a name="onmousewheel"><a class="lift" href="#onmousewheel">onmousewheel</a></a><div class="clear"></div>
            <code class="signature apipage">onmousewheel(x:[Int](http://api.haxe.org/Int.html)<span></span>, y:[Int](http://api.haxe.org/Int.html)<span></span>, timestamp:[Float](http://api.haxe.org/Float.html)<span></span>, window\_id:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Called for you when the mouse wheel moves</span>


</span>
<span class="method apipage">
            <a name="ontextinput"><a class="lift" href="#ontextinput">ontextinput</a></a><div class="clear"></div>
            <code class="signature apipage">ontextinput(text:[String](http://api.haxe.org/String.html)<span></span>, start:[Int](http://api.haxe.org/Int.html)<span></span>, length:[Int](http://api.haxe.org/Int.html)<span></span>, type:[snow.types.TextEventType](../../api/snow/types/TextEventType.html)<span></span>, timestamp:[Float](http://api.haxe.org/Float.html)<span></span>, window\_id:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Called for you when text input is happening. Use this for textfields, as it handles the complexity of unicode etc.</span>


</span>
<span class="method apipage">
            <a name="ontouchdown"><a class="lift" href="#ontouchdown">ontouchdown</a></a><div class="clear"></div>
            <code class="signature apipage">ontouchdown(x:[Float](http://api.haxe.org/Float.html)<span></span>, y:[Float](http://api.haxe.org/Float.html)<span></span>, touch\_id:[Int](http://api.haxe.org/Int.html)<span></span>, timestamp:[Float](http://api.haxe.org/Float.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Called for you when a touch is released, use the `touch_id` to track which</span>


</span>
<span class="method apipage">
            <a name="ontouchmove"><a class="lift" href="#ontouchmove">ontouchmove</a></a><div class="clear"></div>
            <code class="signature apipage">ontouchmove(x:[Float](http://api.haxe.org/Float.html)<span></span>, y:[Float](http://api.haxe.org/Float.html)<span></span>, dx:[Float](http://api.haxe.org/Float.html)<span></span>, dy:[Float](http://api.haxe.org/Float.html)<span></span>, touch\_id:[Int](http://api.haxe.org/Int.html)<span></span>, timestamp:[Float](http://api.haxe.org/Float.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Called for you when a touch is moved, use the `touch_id` to track which</span>


</span>
<span class="method apipage">
            <a name="ontouchup"><a class="lift" href="#ontouchup">ontouchup</a></a><div class="clear"></div>
            <code class="signature apipage">ontouchup(x:[Float](http://api.haxe.org/Float.html)<span></span>, y:[Float](http://api.haxe.org/Float.html)<span></span>, touch\_id:[Int](http://api.haxe.org/Int.html)<span></span>, timestamp:[Float](http://api.haxe.org/Float.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Called for you when a touch is first pressed, use the `touch_id` to track which</span>


</span>
<span class="method apipage">
            <a name="ready"><a class="lift" href="#ready">ready</a></a><div class="clear"></div>
            <code class="signature apipage">ready() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Your entry point. Called for you when you can initialize your application</span>


</span>
<span class="method apipage">
            <a name="update"><a class="lift" href="#update">update</a></a><div class="clear"></div>
            <code class="signature apipage">update(dt:[Float](http://api.haxe.org/Float.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Your update loop. Called every frame for you. The dt value depends on the timing configuration (see the {App Guide})</span>


</span>



<hr/>

&nbsp;
&nbsp;
&nbsp;
&nbsp;