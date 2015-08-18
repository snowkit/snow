
[![Logo](../../images/logo.png)](../../api/index.html)

<hr/>
<a href="#" id="search_bar" onclick="return;"><div> search API <em>(or start typing anywhere)</em> </div></a>
<hr/>

<script src="../../js/omnibar.js"> </script>
<link rel="stylesheet" type="text/css" href="../../css/omnibar.css" media="all">

<div id="omnibar"> <a href="#" onclick="return" id="omnibar_close"></a> <input id="omnibar_text" type="text" placeholder="search types..."></input></div>
<script  id="typelist" data-relpath="../../" data-types="snow.App,snow.AppFixedTimestep,snow.Snow,snow._Snow.Core,snow.api.Debug,snow.api.DebugError,snow.api.File,snow.api.FileHandle,snow.api.FileSeek,snow.api.Libs,snow.api.Promise,snow.api.PromiseError,snow.api.PromiseState,snow.api.Promises,snow.api.Timer,snow.api._Debug.LogError,snow.api._File.FileHandle_Impl_,snow.api._File.FileSeek_Impl_,snow.api._Promise.PromiseState_Impl_,snow.api.buffers.ArrayBuffer,snow.api.buffers.ArrayBufferIO,snow.api.buffers.ArrayBufferView,snow.api.buffers.DataView,snow.api.buffers.Float32Array,snow.api.buffers.Float64Array,snow.api.buffers.Int16Array,snow.api.buffers.Int32Array,snow.api.buffers.Int8Array,snow.api.buffers.TAError,snow.api.buffers.TypedArrayType,snow.api.buffers.Uint16Array,snow.api.buffers.Uint32Array,snow.api.buffers.Uint8Array,snow.api.buffers.Uint8ClampedArray,snow.api.buffers._ArrayBuffer.ArrayBuffer_Impl_,snow.api.buffers._Float32Array.Float32Array_Impl_,snow.api.buffers._Float64Array.Float64Array_Impl_,snow.api.buffers._Int16Array.Int16Array_Impl_,snow.api.buffers._Int32Array.Int32Array_Impl_,snow.api.buffers._Int8Array.Int8Array_Impl_,snow.api.buffers._TypedArrayType.TypedArrayType_Impl_,snow.api.buffers._Uint16Array.Uint16Array_Impl_,snow.api.buffers._Uint32Array.Uint32Array_Impl_,snow.api.buffers._Uint8Array.Uint8Array_Impl_,snow.api.buffers._Uint8ClampedArray.Uint8ClampedArray_Impl_,snow.core.native.Core,snow.core.native._Core.StaticSnow,snow.core.native.assets.Assets,snow.core.native.assets._Assets.NativeAudioDataBlob,snow.core.native.assets._Assets.NativeAudioDataInfo,snow.core.native.assets._Assets.NativeAudioInfo,snow.core.native.audio.Audio,snow.core.native.audio.Sound,snow.core.native.input.Input,snow.core.native.io.IO,snow.core.native.window.Windowing,snow.core.web.assets.psd.PSD,snow.core.web.input.DOMKeys,snow.modules.interfaces.Assets,snow.modules.interfaces.Audio,snow.modules.interfaces.IO,snow.modules.interfaces.Input,snow.modules.interfaces.Windowing,snow.modules.openal.AL,snow.modules.openal.ALC,snow.modules.openal.ALHelper,snow.modules.openal.Audio,snow.modules.openal.Context,snow.modules.openal.Device,snow.modules.openal.Sound,snow.modules.openal._AL.Context_Impl_,snow.modules.openal._AL.Device_Impl_,snow.modules.openal.sound.ALSound,snow.modules.openal.sound.ALStream,snow.modules.openal.sound.Sound,snow.modules.opengl.GL,snow.modules.opengl.GLActiveInfo,snow.modules.opengl.GLBuffer,snow.modules.opengl.GLContextAttributes,snow.modules.opengl.GLFramebuffer,snow.modules.opengl.GLProgram,snow.modules.opengl.GLRenderbuffer,snow.modules.opengl.GLShader,snow.modules.opengl.GLTexture,snow.modules.opengl.GLUniformLocation,snow.modules.opengl.native.GL,snow.modules.opengl.native.GLActiveInfo,snow.modules.opengl.native.GLBO,snow.modules.opengl.native.GLBuffer,snow.modules.opengl.native.GLContextAttributes,snow.modules.opengl.native.GLFBO,snow.modules.opengl.native.GLFramebuffer,snow.modules.opengl.native.GLLink,snow.modules.opengl.native.GLObject,snow.modules.opengl.native.GLPO,snow.modules.opengl.native.GLProgram,snow.modules.opengl.native.GLProxy,snow.modules.opengl.native.GLRBO,snow.modules.opengl.native.GLRenderbuffer,snow.modules.opengl.native.GLSO,snow.modules.opengl.native.GLShader,snow.modules.opengl.native.GLShaderPrecisionFormat,snow.modules.opengl.native.GLTO,snow.modules.opengl.native.GLTexture,snow.modules.opengl.native.GLUniformLocation,snow.modules.opengl.native.GL_FFI,snow.modules.opengl.native.GL_Native,snow.modules.opengl.native._GL.GLBuffer_Impl_,snow.modules.opengl.native._GL.GLFramebuffer_Impl_,snow.modules.opengl.native._GL.GLProgram_Impl_,snow.modules.opengl.native._GL.GLRenderbuffer_Impl_,snow.modules.opengl.native._GL.GLShader_Impl_,snow.modules.opengl.native._GL.GLTexture_Impl_,snow.modules.opengl.native._GL.GLUniformLocation_Impl_,snow.modules.sdl.ControllerEventType,snow.modules.sdl.Input,snow.modules.sdl.KeyEventType,snow.modules.sdl.ModValue,snow.modules.sdl.MouseEventType,snow.modules.sdl.TouchEventType,snow.modules.sdl.Windowing,snow.modules.sdl._Input.ControllerEventType_Impl_,snow.modules.sdl._Input.KeyEventType_Impl_,snow.modules.sdl._Input.ModValue_Impl_,snow.modules.sdl._Input.MouseEventType_Impl_,snow.modules.sdl._Input.TouchEventType_Impl_,snow.system.assets.Asset,snow.system.assets.AssetBytes,snow.system.assets.AssetImage,snow.system.assets.AssetJSON,snow.system.assets.AssetText,snow.system.assets.Assets,snow.system.assets._Assets.AssetsModule,snow.system.audio.Audio,snow.system.audio.AudioModule,snow.system.audio.Sound,snow.system.input.Input,snow.system.input.Keycodes,snow.system.input.MapIntBool,snow.system.input.MapIntFloat,snow.system.input.Scancodes,snow.system.input._Input.InputModule,snow.system.io.IO,snow.system.io._IO.IOModule,snow.system.module.Assets,snow.system.module.Audio,snow.system.module.IO,snow.system.module.Input,snow.system.module.Sound,snow.system.module.Windowing,snow.system.window.Window,snow.system.window.Windowing,snow.system.window._Windowing.WindowHandleMap,snow.system.window._Windowing.WindowingModule,snow.types.AppConfig,snow.types.AppConfigNative,snow.types.AppConfigWeb,snow.types.Asset,snow.types.AssetBytes,snow.types.AssetImage,snow.types.AssetJSON,snow.types.AssetText,snow.types.AssetType,snow.types.AudioDataBlob,snow.types.AudioDataInfo,snow.types.AudioFormatType,snow.types.AudioHandle,snow.types.AudioInfo,snow.types.DisplayMode,snow.types.Error,snow.types.FileEvent,snow.types.FileEventType,snow.types.FileFilter,snow.types.GamepadDeviceEventType,snow.types.IODataOptions,snow.types.ImageInfo,snow.types.InputEvent,snow.types.InputEventType,snow.types.Key,snow.types.ModState,snow.types.OS,snow.types.OpenGLProfile,snow.types.Platform,snow.types.RenderConfig,snow.types.RenderConfigOpenGL,snow.types.Scan,snow.types.SnowConfig,snow.types.SystemEvent,snow.types.SystemEventType,snow.types.TextEventType,snow.types.WindowConfig,snow.types.WindowEvent,snow.types.WindowEventType,snow.types.WindowHandle,snow.types.WindowingConfig,snow.types._Types.AssetType_Impl_,snow.types._Types.AudioFormatType_Impl_,snow.types._Types.FileEventType_Impl_,snow.types._Types.GamepadDeviceEventType_Impl_,snow.types._Types.InputEventType_Impl_,snow.types._Types.OS_Impl_,snow.types._Types.OpenGLProfile_Impl_,snow.types._Types.Platform_Impl_,snow.types._Types.SystemEventType_Impl_,snow.types._Types.TextEventType_Impl_,snow.types._Types.WindowEventType_Impl_"></script>


<h1>App</h1>
<small>`snow.App`</small>

The default type of snow application, with variable delta, update limit, render limit, timescale and more. 
    See the {App Guide} for complete details.

<hr/>

`class`
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