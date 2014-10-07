
[![Logo](../../../images/logo.png)](../../../api/index.html)

<hr/>
<a href="#" id="search_bar" onclick="return;"><div> search API <em>(or start typing anywhere)</em> </div></a>
<hr/>

<script src="../../../js/omnibar.js"> </script>
<link rel="stylesheet" type="text/css" href="../../../css/omnibar.css" media="all">

<div id="omnibar"> <a href="#" onclick="return" id="omnibar_close"></a> <input id="omnibar_text" type="text" placeholder="search types..."></input></div>
<script  id="typelist" data-relpath="../../../" data-types="snow.App,snow.AppFixedTimestep,snow.Core,snow.CoreBinding,snow.Log,snow.Snow,snow.assets.Asset,snow.assets.AssetAudio,snow.assets.AssetBytes,snow.assets.AssetImage,snow.assets.AssetSystem,snow.assets.AssetSystemBinding,snow.assets.AssetText,snow.assets.Assets,snow.audio.Audio,snow.audio.AudioSystem,snow.audio.AudioSystemBinding,snow.audio.Sound,snow.audio.SoundBinding,snow.audio.SoundStream,snow.audio._Audio.AudioHandleMap,snow.audio.openal.AL,snow.audio.openal.ALC,snow.audio.openal.Context,snow.audio.openal.Device,snow.input.Input,snow.input.InputSystem,snow.input.InputSystemBinding,snow.input.Keycodes,snow.input.MapIntBool,snow.input.MapIntFloat,snow.input.Scancodes,snow.io.IO,snow.io.IOSystem,snow.io.IOSystemBinding,snow.platform.native.Core,snow.platform.native.StaticSnow,snow.platform.native.assets.AssetSystem,snow.platform.native.audio.AudioSystem,snow.platform.native.audio.Sound,snow.platform.native.audio.SoundStream,snow.platform.native.audio.openal.AL,snow.platform.native.audio.openal.ALC,snow.platform.native.audio.openal.AudioSystem,snow.platform.native.audio.openal.Context,snow.platform.native.audio.openal.Device,snow.platform.native.audio.openal.OpenALHelper,snow.platform.native.audio.openal.Sound,snow.platform.native.audio.openal.SoundStream,snow.platform.native.audio.openal._AL.Context_Impl_,snow.platform.native.audio.openal._AL.Device_Impl_,snow.platform.native.input.InputSystem,snow.platform.native.input.sdl.ControllerEventType,snow.platform.native.input.sdl.InputSystem,snow.platform.native.input.sdl.KeyEventType,snow.platform.native.input.sdl.ModValue,snow.platform.native.input.sdl.MouseEventType,snow.platform.native.input.sdl.TouchEventType,snow.platform.native.io.IOFile,snow.platform.native.io.IOFileHandle,snow.platform.native.io.IOSystem,snow.platform.native.io._IOFile.IOFileHandle_Impl_,snow.platform.native.render.opengl.GL,snow.platform.native.render.opengl.GLActiveInfo,snow.platform.native.render.opengl.GLBuffer,snow.platform.native.render.opengl.GLContextAttributes,snow.platform.native.render.opengl.GLFBO,snow.platform.native.render.opengl.GLFramebuffer,snow.platform.native.render.opengl.GLObject,snow.platform.native.render.opengl.GLProgram,snow.platform.native.render.opengl.GLRBO,snow.platform.native.render.opengl.GLRenderbuffer,snow.platform.native.render.opengl.GLShader,snow.platform.native.render.opengl.GLShaderPrecisionFormat,snow.platform.native.render.opengl.GLTexture,snow.platform.native.render.opengl.GLUniformLocation,snow.platform.native.render.opengl._GL.GLFramebuffer_Impl_,snow.platform.native.render.opengl._GL.GLRenderbuffer_Impl_,snow.platform.native.utils.ArrayBuffer,snow.platform.native.utils.ArrayBufferView,snow.platform.native.utils.ByteArray,snow.platform.native.utils.Compression,snow.platform.native.utils.Float32Array,snow.platform.native.utils.Int16Array,snow.platform.native.utils.Int32Array,snow.platform.native.utils.Int8Array,snow.platform.native.utils.UInt16Array,snow.platform.native.utils.UInt32Array,snow.platform.native.utils.UInt8Array,snow.platform.native.utils.UInt8ClampedArray,snow.platform.native.window.WindowSystem,snow.platform.native.window.sdl.WindowSystem,snow.platform.web.assets.psd.PSD,snow.platform.web.audio.AudioSystem,snow.platform.web.audio.Sound,snow.platform.web.audio.SoundStream,snow.platform.web.audio.howlerjs.AudioParams,snow.platform.web.audio.howlerjs.AudioSystem,snow.platform.web.audio.howlerjs.Howl,snow.platform.web.audio.howlerjs.Howler,snow.platform.web.audio.howlerjs.SoundStream,snow.platform.web.audio.howlerjs.SpriteParams,snow.render.opengl.GL,snow.render.opengl.GLActiveInfo,snow.render.opengl.GLBuffer,snow.render.opengl.GLContextAttributes,snow.render.opengl.GLFramebuffer,snow.render.opengl.GLProgram,snow.render.opengl.GLRenderbuffer,snow.render.opengl.GLShader,snow.render.opengl.GLTexture,snow.render.opengl.GLUniformLocation,snow.types.AppConfig,snow.types.AppConfigNative,snow.types.AppConfigWeb,snow.types.AssetAudioOptions,snow.types.AssetBytesOptions,snow.types.AssetImageOptions,snow.types.AssetInfo,snow.types.AssetTextOptions,snow.types.AssetType,snow.types.AudioDataBlob,snow.types.AudioDataInfo,snow.types.AudioFormatType,snow.types.AudioHandle,snow.types.AudioInfo,snow.types.DisplayMode,snow.types.FileEvent,snow.types.FileEventType,snow.types.FileFilter,snow.types.GamepadDeviceEventType,snow.types.ImageInfo,snow.types.InputEvent,snow.types.InputEventType,snow.types.Key,snow.types.ModState,snow.types.Scan,snow.types.SnowConfig,snow.types.SystemEvent,snow.types.SystemEventType,snow.types.TextEventType,snow.types.WindowConfig,snow.types.WindowEvent,snow.types.WindowEventType,snow.types.WindowHandle,snow.utils.AbstractClass,snow.utils.AbstractClassBuilder,snow.utils.ArrayBuffer,snow.utils.ArrayBufferView,snow.utils.ByteArray,snow.utils.Float32Array,snow.utils.IDataInput,snow.utils.IMemoryRange,snow.utils.Int16Array,snow.utils.Int32Array,snow.utils.Int8Array,snow.utils.Libs,snow.utils.Timer,snow.utils.UInt16Array,snow.utils.UInt32Array,snow.utils.UInt8Array,snow.utils.UInt8ClampedArray,snow.utils._AbstractClass.StringMap,snow.utils.format.png.Chunk,snow.utils.format.png.Color,snow.utils.format.png.Data,snow.utils.format.png.Header,snow.utils.format.png.Reader,snow.utils.format.png.Tools,snow.utils.format.png.Writer,snow.utils.format.tools.Adler32,snow.utils.format.tools.Deflate,snow.utils.format.tools.HuffTools,snow.utils.format.tools.Huffman,snow.utils.format.tools.Inflate,snow.utils.format.tools.InflateImpl,snow.utils.format.tools.MemoryBytes,snow.utils.format.tools._InflateImpl.State,snow.utils.format.tools._InflateImpl.Window,snow.window.Window,snow.window.WindowSystem,snow.window.WindowSystemBinding,snow.window.Windowing,snow.window._Windowing.WindowHandleMap"></script>


<h1>Input</h1>
<small>`snow.input.Input`</small>

Internal input system, accessed via `app.input`

<hr/>

`class`<br/><span class="meta">
meta: @:keep</span>

<hr/>


&nbsp;
&nbsp;




<h3>Members</h3> <hr/>


<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="dispatch_gamepad_axis_event"><a class="lift" href="#dispatch_gamepad_axis_event">dispatch\_gamepad\_axis\_event</a></a><div class="clear"></div>
            <code class="signature apipage">dispatch\_gamepad\_axis\_event(gamepad:[Int](http://api.haxe.org/Int.html)<span></span>, axis:[Int](http://api.haxe.org/Int.html)<span></span>, value:[Float](http://api.haxe.org/Float.html)<span></span>, timestamp:[Float](http://api.haxe.org/Float.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">manually dispatch a gamepad axis event through the system, delivered to the app handlers, internal and external</span>


</span>
<span class="method apipage">
            <a name="dispatch_gamepad_button_down_event"><a class="lift" href="#dispatch_gamepad_button_down_event">dispatch\_gamepad\_button\_down\_event</a></a><div class="clear"></div>
            <code class="signature apipage">dispatch\_gamepad\_button\_down\_event(gamepad:[Int](http://api.haxe.org/Int.html)<span></span>, button:[Int](http://api.haxe.org/Int.html)<span></span>, value:[Float](http://api.haxe.org/Float.html)<span></span>, timestamp:[Float](http://api.haxe.org/Float.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">manually dispatch a gamepad button down event through the system, delivered to the app handlers, internal and external</span>


</span>
<span class="method apipage">
            <a name="dispatch_gamepad_button_up_event"><a class="lift" href="#dispatch_gamepad_button_up_event">dispatch\_gamepad\_button\_up\_event</a></a><div class="clear"></div>
            <code class="signature apipage">dispatch\_gamepad\_button\_up\_event(gamepad:[Int](http://api.haxe.org/Int.html)<span></span>, button:[Int](http://api.haxe.org/Int.html)<span></span>, value:[Float](http://api.haxe.org/Float.html)<span></span>, timestamp:[Float](http://api.haxe.org/Float.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">manually dispatch a gamepad button up event through the system, delivered to the app handlers, internal and external</span>


</span>
<span class="method apipage">
            <a name="dispatch_gamepad_device_event"><a class="lift" href="#dispatch_gamepad_device_event">dispatch\_gamepad\_device\_event</a></a><div class="clear"></div>
            <code class="signature apipage">dispatch\_gamepad\_device\_event(gamepad:[Int](http://api.haxe.org/Int.html)<span></span>, type:[snow.types.GamepadDeviceEventType](../../../api/snow/types/GamepadDeviceEventType.html)<span></span>, timestamp:[Float](http://api.haxe.org/Float.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">manually dispatch a gamepad device event through the system, delivered to the app handlers, internal and external</span>


</span>
<span class="method apipage">
            <a name="dispatch_key_down_event"><a class="lift" href="#dispatch_key_down_event">dispatch\_key\_down\_event</a></a><div class="clear"></div>
            <code class="signature apipage">dispatch\_key\_down\_event(keycode:[Int](http://api.haxe.org/Int.html)<span></span>, scancode:[Int](http://api.haxe.org/Int.html)<span></span>, repeat:[Bool](http://api.haxe.org/Bool.html)<span></span>, mod:[snow.types.ModState](../../../api/snow/types/ModState.html)<span></span>, timestamp:[Float](http://api.haxe.org/Float.html)<span></span>, window\_id:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">manually dispatch a key down event through the system, delivered to the app handlers, internal and external</span>


</span>
<span class="method apipage">
            <a name="dispatch_key_up_event"><a class="lift" href="#dispatch_key_up_event">dispatch\_key\_up\_event</a></a><div class="clear"></div>
            <code class="signature apipage">dispatch\_key\_up\_event(keycode:[Int](http://api.haxe.org/Int.html)<span></span>, scancode:[Int](http://api.haxe.org/Int.html)<span></span>, repeat:[Bool](http://api.haxe.org/Bool.html)<span></span>, mod:[snow.types.ModState](../../../api/snow/types/ModState.html)<span></span>, timestamp:[Float](http://api.haxe.org/Float.html)<span></span>, window\_id:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">manually dispatch a key up event through the system, delivered to the app handlers, internal and external</span>


</span>
<span class="method apipage">
            <a name="dispatch_mouse_down_event"><a class="lift" href="#dispatch_mouse_down_event">dispatch\_mouse\_down\_event</a></a><div class="clear"></div>
            <code class="signature apipage">dispatch\_mouse\_down\_event(x:[Int](http://api.haxe.org/Int.html)<span></span>, y:[Int](http://api.haxe.org/Int.html)<span></span>, button:[Int](http://api.haxe.org/Int.html)<span></span>, timestamp:[Float](http://api.haxe.org/Float.html)<span></span>, window\_id:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">manually dispatch a mouse button down event through the system, delivered to the app handlers, internal and external</span>


</span>
<span class="method apipage">
            <a name="dispatch_mouse_move_event"><a class="lift" href="#dispatch_mouse_move_event">dispatch\_mouse\_move\_event</a></a><div class="clear"></div>
            <code class="signature apipage">dispatch\_mouse\_move\_event(x:[Int](http://api.haxe.org/Int.html)<span></span>, y:[Int](http://api.haxe.org/Int.html)<span></span>, xrel:[Int](http://api.haxe.org/Int.html)<span></span>, yrel:[Int](http://api.haxe.org/Int.html)<span></span>, timestamp:[Float](http://api.haxe.org/Float.html)<span></span>, window\_id:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">manually dispatch a mouse move event through the system, delivered to the app handlers, internal and external</span>


</span>
<span class="method apipage">
            <a name="dispatch_mouse_up_event"><a class="lift" href="#dispatch_mouse_up_event">dispatch\_mouse\_up\_event</a></a><div class="clear"></div>
            <code class="signature apipage">dispatch\_mouse\_up\_event(x:[Int](http://api.haxe.org/Int.html)<span></span>, y:[Int](http://api.haxe.org/Int.html)<span></span>, button:[Int](http://api.haxe.org/Int.html)<span></span>, timestamp:[Float](http://api.haxe.org/Float.html)<span></span>, window\_id:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">manually dispatch a mouse button up event through the system, delivered to the app handlers, internal and external</span>


</span>
<span class="method apipage">
            <a name="dispatch_mouse_wheel_event"><a class="lift" href="#dispatch_mouse_wheel_event">dispatch\_mouse\_wheel\_event</a></a><div class="clear"></div>
            <code class="signature apipage">dispatch\_mouse\_wheel\_event(x:[Int](http://api.haxe.org/Int.html)<span></span>, y:[Int](http://api.haxe.org/Int.html)<span></span>, timestamp:[Float](http://api.haxe.org/Float.html)<span></span>, window\_id:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">manually dispatch a mouse wheel event through the system, delivered to the app handlers, internal and external</span>


</span>
<span class="method apipage">
            <a name="dispatch_text_event"><a class="lift" href="#dispatch_text_event">dispatch\_text\_event</a></a><div class="clear"></div>
            <code class="signature apipage">dispatch\_text\_event(text:[String](http://api.haxe.org/String.html)<span></span>, start:[Int](http://api.haxe.org/Int.html)<span></span>, length:[Int](http://api.haxe.org/Int.html)<span></span>, type:[snow.types.TextEventType](../../../api/snow/types/TextEventType.html)<span></span>, timestamp:[Float](http://api.haxe.org/Float.html)<span></span>, window\_id:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">manually dispatch a text event through the system, delivered to the app handlers, internal and external</span>


</span>
<span class="method apipage">
            <a name="dispatch_touch_down_event"><a class="lift" href="#dispatch_touch_down_event">dispatch\_touch\_down\_event</a></a><div class="clear"></div>
            <code class="signature apipage">dispatch\_touch\_down\_event(x:[Float](http://api.haxe.org/Float.html)<span></span>, y:[Float](http://api.haxe.org/Float.html)<span></span>, touch\_id:[Int](http://api.haxe.org/Int.html)<span></span>, timestamp:[Float](http://api.haxe.org/Float.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">manually dispatch a touch down through the system, delivered to the app handlers, internal and external</span>


</span>
<span class="method apipage">
            <a name="dispatch_touch_move_event"><a class="lift" href="#dispatch_touch_move_event">dispatch\_touch\_move\_event</a></a><div class="clear"></div>
            <code class="signature apipage">dispatch\_touch\_move\_event(x:[Float](http://api.haxe.org/Float.html)<span></span>, y:[Float](http://api.haxe.org/Float.html)<span></span>, dx:[Float](http://api.haxe.org/Float.html)<span></span>, dy:[Float](http://api.haxe.org/Float.html)<span></span>, touch\_id:[Int](http://api.haxe.org/Int.html)<span></span>, timestamp:[Float](http://api.haxe.org/Float.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">manually dispatch a touch move through the system, delivered to the app handlers, internal and external</span>


</span>
<span class="method apipage">
            <a name="dispatch_touch_up_event"><a class="lift" href="#dispatch_touch_up_event">dispatch\_touch\_up\_event</a></a><div class="clear"></div>
            <code class="signature apipage">dispatch\_touch\_up\_event(x:[Float](http://api.haxe.org/Float.html)<span></span>, y:[Float](http://api.haxe.org/Float.html)<span></span>, touch\_id:[Int](http://api.haxe.org/Int.html)<span></span>, timestamp:[Float](http://api.haxe.org/Float.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">manually dispatch a touch up through the system, delivered to the app handlers, internal and external</span>


</span>
<span class="method apipage">
            <a name="gamepadaxis"><a class="lift" href="#gamepadaxis">gamepadaxis</a></a><div class="clear"></div>
            <code class="signature apipage">gamepadaxis(\_gamepad:[Int](http://api.haxe.org/Int.html)<span></span>, \_axis:[Int](http://api.haxe.org/Int.html)<span></span>) : [Float](http://api.haxe.org/Float.html)</code><br/><span class="small_desc_flat">returns true if the gamepad button value is down at the time of calling this</span>


</span>
<span class="method apipage">
            <a name="gamepaddown"><a class="lift" href="#gamepaddown">gamepaddown</a></a><div class="clear"></div>
            <code class="signature apipage">gamepaddown(\_gamepad:[Int](http://api.haxe.org/Int.html)<span></span>, \_button:[Int](http://api.haxe.org/Int.html)<span></span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat">returns true if the gamepad button value is down at the time of calling this</span>


</span>
<span class="method apipage">
            <a name="gamepadpressed"><a class="lift" href="#gamepadpressed">gamepadpressed</a></a><div class="clear"></div>
            <code class="signature apipage">gamepadpressed(\_gamepad:[Int](http://api.haxe.org/Int.html)<span></span>, \_button:[Int](http://api.haxe.org/Int.html)<span></span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat">returns true if the mouse button was pressed in the latest frame</span>


</span>
<span class="method apipage">
            <a name="gamepadreleased"><a class="lift" href="#gamepadreleased">gamepadreleased</a></a><div class="clear"></div>
            <code class="signature apipage">gamepadreleased(\_gamepad:[Int](http://api.haxe.org/Int.html)<span></span>, \_button:[Int](http://api.haxe.org/Int.html)<span></span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat">returns true if the gamepad button was released in the latest frame</span>


</span>
<span class="method apipage">
            <a name="keydown"><a class="lift" href="#keydown">keydown</a></a><div class="clear"></div>
            <code class="signature apipage">keydown(\_code:[Int](http://api.haxe.org/Int.html)<span></span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat">returns true if the `Key` value is down at the time of calling this</span>


</span>
<span class="method apipage">
            <a name="keypressed"><a class="lift" href="#keypressed">keypressed</a></a><div class="clear"></div>
            <code class="signature apipage">keypressed(\_code:[Int](http://api.haxe.org/Int.html)<span></span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat">returns true if the `Key` value was pressed in the latest frame</span>


</span>
<span class="method apipage">
            <a name="keyreleased"><a class="lift" href="#keyreleased">keyreleased</a></a><div class="clear"></div>
            <code class="signature apipage">keyreleased(\_code:[Int](http://api.haxe.org/Int.html)<span></span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat">returns true if the `Key` value was released in the latest frame</span>


</span>
<span class="method apipage">
            <a name="mousedown"><a class="lift" href="#mousedown">mousedown</a></a><div class="clear"></div>
            <code class="signature apipage">mousedown(\_button:[Int](http://api.haxe.org/Int.html)<span></span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat">returns true if the mouse button value is down at the time of calling this</span>


</span>
<span class="method apipage">
            <a name="mousepressed"><a class="lift" href="#mousepressed">mousepressed</a></a><div class="clear"></div>
            <code class="signature apipage">mousepressed(\_button:[Int](http://api.haxe.org/Int.html)<span></span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat">returns true if the mouse button was pressed in the latest frame</span>


</span>
<span class="method apipage">
            <a name="mousereleased"><a class="lift" href="#mousereleased">mousereleased</a></a><div class="clear"></div>
            <code class="signature apipage">mousereleased(\_button:[Int](http://api.haxe.org/Int.html)<span></span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat">returns true if the mouse button was released in the latest frame</span>


</span>
<span class="method apipage">
            <a name="scandown"><a class="lift" href="#scandown">scandown</a></a><div class="clear"></div>
            <code class="signature apipage">scandown(\_code:[Int](http://api.haxe.org/Int.html)<span></span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat">returns true if the `Scan` value is down at the time of calling this</span>


</span>
<span class="method apipage">
            <a name="scanpressed"><a class="lift" href="#scanpressed">scanpressed</a></a><div class="clear"></div>
            <code class="signature apipage">scanpressed(\_code:[Int](http://api.haxe.org/Int.html)<span></span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat">returns true if the `Scan` value was pressed in the latest frame</span>


</span>
<span class="method apipage">
            <a name="scanreleased"><a class="lift" href="#scanreleased">scanreleased</a></a><div class="clear"></div>
            <code class="signature apipage">scanreleased(\_code:[Int](http://api.haxe.org/Int.html)<span></span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat">returns true if the `Scan` value was released in the latest frame</span>


</span>



<hr/>

&nbsp;
&nbsp;
&nbsp;
&nbsp;