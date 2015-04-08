
[![Logo](../../../../images/logo.png)](../../../../api/index.html)

<hr/>
<a href="#" id="search_bar" onclick="return;"><div> search API <em>(or start typing anywhere)</em> </div></a>
<hr/>

<script src="../../../../js/omnibar.js"> </script>
<link rel="stylesheet" type="text/css" href="../../../../css/omnibar.css" media="all">

<div id="omnibar"> <a href="#" onclick="return" id="omnibar_close"></a> <input id="omnibar_text" type="text" placeholder="search types..."></input></div>
<script  id="typelist" data-relpath="../../../../" data-types="snow.App,snow.AppFixedTimestep,snow.Snow,snow._Snow.Core,snow.api.Debug,snow.api.DebugError,snow.api.File,snow.api.FileHandle,snow.api.FileSeek,snow.api.Libs,snow.api.Promise,snow.api.PromiseError,snow.api.PromiseState,snow.api.Promises,snow.api.Timer,snow.api._Debug.LogError,snow.api._File.FileHandle_Impl_,snow.api._File.FileSeek_Impl_,snow.api._Promise.PromiseState_Impl_,snow.api.buffers.ArrayBuffer,snow.api.buffers.ArrayBufferIO,snow.api.buffers.ArrayBufferView,snow.api.buffers.Float32Array,snow.api.buffers.Float64Array,snow.api.buffers.Int16Array,snow.api.buffers.Int32Array,snow.api.buffers.Int8Array,snow.api.buffers.TAError,snow.api.buffers.TypedArrayType,snow.api.buffers.Uint16Array,snow.api.buffers.Uint32Array,snow.api.buffers.Uint8Array,snow.api.buffers.Uint8ClampedArray,snow.api.buffers._ArrayBuffer.ArrayBuffer_Impl_,snow.api.buffers._Float32Array.Float32Array_Impl_,snow.api.buffers._Float64Array.Float64Array_Impl_,snow.api.buffers._Int16Array.Int16Array_Impl_,snow.api.buffers._Int32Array.Int32Array_Impl_,snow.api.buffers._Int8Array.Int8Array_Impl_,snow.api.buffers._TypedArrayType.TypedArrayType_Impl_,snow.api.buffers._Uint16Array.Uint16Array_Impl_,snow.api.buffers._Uint32Array.Uint32Array_Impl_,snow.api.buffers._Uint8Array.Uint8Array_Impl_,snow.api.buffers._Uint8ClampedArray.Uint8ClampedArray_Impl_,snow.core.native.Core,snow.core.native._Core.StaticSnow,snow.core.native.assets.Assets,snow.core.native.assets._Assets.NativeAudioDataBlob,snow.core.native.assets._Assets.NativeAudioDataInfo,snow.core.native.assets._Assets.NativeAudioInfo,snow.core.native.audio.Audio,snow.core.native.audio.Sound,snow.core.native.input.Input,snow.core.native.io.IO,snow.core.native.window.Windowing,snow.modules.interfaces.Assets,snow.modules.interfaces.Audio,snow.modules.interfaces.IO,snow.modules.interfaces.Input,snow.modules.interfaces.Windowing,snow.modules.openal.AL,snow.modules.openal.ALC,snow.modules.openal.ALHelper,snow.modules.openal.Audio,snow.modules.openal.Context,snow.modules.openal.Device,snow.modules.openal.Sound,snow.modules.openal._AL.Context_Impl_,snow.modules.openal._AL.Device_Impl_,snow.modules.openal.sound.ALSound,snow.modules.openal.sound.ALStream,snow.modules.openal.sound.Sound,snow.modules.opengl.GL,snow.modules.opengl.GLActiveInfo,snow.modules.opengl.GLBuffer,snow.modules.opengl.GLContextAttributes,snow.modules.opengl.GLFramebuffer,snow.modules.opengl.GLProgram,snow.modules.opengl.GLRenderbuffer,snow.modules.opengl.GLShader,snow.modules.opengl.GLTexture,snow.modules.opengl.GLUniformLocation,snow.modules.opengl.native.GL,snow.modules.opengl.native.GLActiveInfo,snow.modules.opengl.native.GLBO,snow.modules.opengl.native.GLBuffer,snow.modules.opengl.native.GLContextAttributes,snow.modules.opengl.native.GLFBO,snow.modules.opengl.native.GLFramebuffer,snow.modules.opengl.native.GLObject,snow.modules.opengl.native.GLPO,snow.modules.opengl.native.GLProgram,snow.modules.opengl.native.GLRBO,snow.modules.opengl.native.GLRenderbuffer,snow.modules.opengl.native.GLSO,snow.modules.opengl.native.GLShader,snow.modules.opengl.native.GLShaderPrecisionFormat,snow.modules.opengl.native.GLTO,snow.modules.opengl.native.GLTexture,snow.modules.opengl.native.GLUniformLocation,snow.modules.opengl.native.GL_FFI,snow.modules.opengl.native._GL.GLBuffer_Impl_,snow.modules.opengl.native._GL.GLFramebuffer_Impl_,snow.modules.opengl.native._GL.GLProgram_Impl_,snow.modules.opengl.native._GL.GLRenderbuffer_Impl_,snow.modules.opengl.native._GL.GLShader_Impl_,snow.modules.opengl.native._GL.GLTexture_Impl_,snow.modules.opengl.native._GL.GLUniformLocation_Impl_,snow.modules.sdl.ControllerEventType,snow.modules.sdl.Input,snow.modules.sdl.KeyEventType,snow.modules.sdl.ModValue,snow.modules.sdl.MouseEventType,snow.modules.sdl.TouchEventType,snow.modules.sdl.Windowing,snow.modules.sdl._Input.ControllerEventType_Impl_,snow.modules.sdl._Input.KeyEventType_Impl_,snow.modules.sdl._Input.ModValue_Impl_,snow.modules.sdl._Input.MouseEventType_Impl_,snow.modules.sdl._Input.TouchEventType_Impl_,snow.system.assets.Asset,snow.system.assets.AssetBytes,snow.system.assets.AssetImage,snow.system.assets.AssetJSON,snow.system.assets.AssetText,snow.system.assets.Assets,snow.system.assets._Assets.AssetsModule,snow.system.audio.Audio,snow.system.audio.AudioModule,snow.system.audio.Sound,snow.system.input.Input,snow.system.input.Keycodes,snow.system.input.MapIntBool,snow.system.input.MapIntFloat,snow.system.input.Scancodes,snow.system.input._Input.InputModule,snow.system.io.IO,snow.system.io._IO.IOModule,snow.system.module.Assets,snow.system.module.Audio,snow.system.module.IO,snow.system.module.Input,snow.system.module.Sound,snow.system.module.Windowing,snow.system.window.Window,snow.system.window.Windowing,snow.system.window._Windowing.WindowHandleMap,snow.system.window._Windowing.WindowingModule,snow.types.AppConfig,snow.types.AppConfigNative,snow.types.AppConfigWeb,snow.types.Asset,snow.types.AssetBytes,snow.types.AssetImage,snow.types.AssetJSON,snow.types.AssetText,snow.types.AssetType,snow.types.AudioDataBlob,snow.types.AudioDataInfo,snow.types.AudioFormatType,snow.types.AudioHandle,snow.types.AudioInfo,snow.types.DisplayMode,snow.types.Error,snow.types.FileEvent,snow.types.FileEventType,snow.types.FileFilter,snow.types.GamepadDeviceEventType,snow.types.IODataOptions,snow.types.ImageInfo,snow.types.InputEvent,snow.types.InputEventType,snow.types.Key,snow.types.ModState,snow.types.OpenGLProfile,snow.types.RenderConfig,snow.types.RenderConfigOpenGL,snow.types.Scan,snow.types.SnowConfig,snow.types.SystemEvent,snow.types.SystemEventType,snow.types.TextEventType,snow.types.WindowConfig,snow.types.WindowEvent,snow.types.WindowEventType,snow.types.WindowHandle,snow.types.WindowingConfig,snow.types._Types.AssetType_Impl_,snow.types._Types.AudioFormatType_Impl_,snow.types._Types.FileEventType_Impl_,snow.types._Types.GamepadDeviceEventType_Impl_,snow.types._Types.InputEventType_Impl_,snow.types._Types.OpenGLProfile_Impl_,snow.types._Types.SystemEventType_Impl_,snow.types._Types.TextEventType_Impl_,snow.types._Types.WindowEventType_Impl_"></script>


<h1>Input</h1>
<small>`snow.system.input.Input`</small>

The snow input system. Accessed via `app.input`

<hr/>

`class`<br/><span class="meta">
meta: @:directlyUsed, @:keep, @:allow(snow.Snow)</span>

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
            <code class="signature apipage">dispatch\_gamepad\_device\_event(gamepad:[Int](http://api.haxe.org/Int.html)<span></span>, type:[snow.types.GamepadDeviceEventType](../../../../api/snow/types/GamepadDeviceEventType.html)<span></span>, timestamp:[Float](http://api.haxe.org/Float.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">manually dispatch a gamepad device event through the system, delivered to the app handlers, internal and external</span>


</span>
<span class="method apipage">
            <a name="dispatch_key_down_event"><a class="lift" href="#dispatch_key_down_event">dispatch\_key\_down\_event</a></a><div class="clear"></div>
            <code class="signature apipage">dispatch\_key\_down\_event(keycode:[Int](http://api.haxe.org/Int.html)<span></span>, scancode:[Int](http://api.haxe.org/Int.html)<span></span>, repeat:[Bool](http://api.haxe.org/Bool.html)<span></span>, mod:[snow.types.ModState](../../../../api/snow/types/ModState.html)<span></span>, timestamp:[Float](http://api.haxe.org/Float.html)<span></span>, window\_id:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">manually dispatch a key down event through the system, delivered to the app handlers, internal and external</span>


</span>
<span class="method apipage">
            <a name="dispatch_key_up_event"><a class="lift" href="#dispatch_key_up_event">dispatch\_key\_up\_event</a></a><div class="clear"></div>
            <code class="signature apipage">dispatch\_key\_up\_event(keycode:[Int](http://api.haxe.org/Int.html)<span></span>, scancode:[Int](http://api.haxe.org/Int.html)<span></span>, repeat:[Bool](http://api.haxe.org/Bool.html)<span></span>, mod:[snow.types.ModState](../../../../api/snow/types/ModState.html)<span></span>, timestamp:[Float](http://api.haxe.org/Float.html)<span></span>, window\_id:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">manually dispatch a key up event through the system, delivered to the app handlers, internal and external</span>


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
            <code class="signature apipage">dispatch\_text\_event(text:[String](http://api.haxe.org/String.html)<span></span>, start:[Int](http://api.haxe.org/Int.html)<span></span>, length:[Int](http://api.haxe.org/Int.html)<span></span>, type:[snow.types.TextEventType](../../../../api/snow/types/TextEventType.html)<span></span>, timestamp:[Float](http://api.haxe.org/Float.html)<span></span>, window\_id:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">manually dispatch a text event through the system, delivered to the app handlers, internal and external</span>


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