
[![Logo](../../../../../images/logo.png)](../../../../../api/index.html)

<hr/>
<a href="#" id="search_bar" onclick="return;"><div> search API <em>(or start typing anywhere)</em> </div></a>
<hr/>

<script src="../../../../../js/omnibar.js"> </script>
<link rel="stylesheet" type="text/css" href="../../../../../css/omnibar.css" media="all">

<div id="omnibar"> <a href="#" onclick="return" id="omnibar_close"></a> <input id="omnibar_text" type="text" placeholder="search types..."></input></div>
<script  id="typelist" data-relpath="../../../../../" data-types="snow.App,snow.AppFixedTimestep,snow.Snow,snow._Snow.Core,snow.api.Debug,snow.api.DebugError,snow.api.File,snow.api.FileHandle,snow.api.FileSeek,snow.api.Libs,snow.api.Promise,snow.api.PromiseError,snow.api.PromiseState,snow.api.Promises,snow.api.Timer,snow.api._Debug.LogError,snow.api._File.FileHandle_Impl_,snow.api._File.FileSeek_Impl_,snow.api._Promise.PromiseState_Impl_,snow.api.buffers.ArrayBuffer,snow.api.buffers.ArrayBufferIO,snow.api.buffers.ArrayBufferView,snow.api.buffers.DataView,snow.api.buffers.Float32Array,snow.api.buffers.Float64Array,snow.api.buffers.Int16Array,snow.api.buffers.Int32Array,snow.api.buffers.Int8Array,snow.api.buffers.TAError,snow.api.buffers.TypedArrayType,snow.api.buffers.Uint16Array,snow.api.buffers.Uint32Array,snow.api.buffers.Uint8Array,snow.api.buffers.Uint8ClampedArray,snow.api.buffers._ArrayBuffer.ArrayBuffer_Impl_,snow.api.buffers._Float32Array.Float32Array_Impl_,snow.api.buffers._Float64Array.Float64Array_Impl_,snow.api.buffers._Int16Array.Int16Array_Impl_,snow.api.buffers._Int32Array.Int32Array_Impl_,snow.api.buffers._Int8Array.Int8Array_Impl_,snow.api.buffers._TypedArrayType.TypedArrayType_Impl_,snow.api.buffers._Uint16Array.Uint16Array_Impl_,snow.api.buffers._Uint32Array.Uint32Array_Impl_,snow.api.buffers._Uint8Array.Uint8Array_Impl_,snow.api.buffers._Uint8ClampedArray.Uint8ClampedArray_Impl_,snow.core.native.Core,snow.core.native._Core.StaticSnow,snow.core.native.assets.Assets,snow.core.native.assets._Assets.NativeAudioDataBlob,snow.core.native.assets._Assets.NativeAudioDataInfo,snow.core.native.assets._Assets.NativeAudioInfo,snow.core.native.audio.Audio,snow.core.native.audio.Sound,snow.core.native.input.Input,snow.core.native.io.IO,snow.core.native.window.Windowing,snow.core.web.assets.psd.PSD,snow.core.web.input.DOMKeys,snow.modules.interfaces.Assets,snow.modules.interfaces.Audio,snow.modules.interfaces.IO,snow.modules.interfaces.Input,snow.modules.interfaces.Windowing,snow.modules.openal.AL,snow.modules.openal.ALC,snow.modules.openal.ALHelper,snow.modules.openal.Audio,snow.modules.openal.Context,snow.modules.openal.Device,snow.modules.openal.Sound,snow.modules.openal._AL.Context_Impl_,snow.modules.openal._AL.Device_Impl_,snow.modules.openal.sound.ALSound,snow.modules.openal.sound.ALStream,snow.modules.openal.sound.Sound,snow.modules.opengl.GL,snow.modules.opengl.GLActiveInfo,snow.modules.opengl.GLBuffer,snow.modules.opengl.GLContextAttributes,snow.modules.opengl.GLFramebuffer,snow.modules.opengl.GLProgram,snow.modules.opengl.GLRenderbuffer,snow.modules.opengl.GLShader,snow.modules.opengl.GLTexture,snow.modules.opengl.GLUniformLocation,snow.modules.opengl.native.GL,snow.modules.opengl.native.GLActiveInfo,snow.modules.opengl.native.GLBO,snow.modules.opengl.native.GLBuffer,snow.modules.opengl.native.GLContextAttributes,snow.modules.opengl.native.GLFBO,snow.modules.opengl.native.GLFramebuffer,snow.modules.opengl.native.GLLink,snow.modules.opengl.native.GLObject,snow.modules.opengl.native.GLPO,snow.modules.opengl.native.GLProgram,snow.modules.opengl.native.GLProxy,snow.modules.opengl.native.GLRBO,snow.modules.opengl.native.GLRenderbuffer,snow.modules.opengl.native.GLSO,snow.modules.opengl.native.GLShader,snow.modules.opengl.native.GLShaderPrecisionFormat,snow.modules.opengl.native.GLTO,snow.modules.opengl.native.GLTexture,snow.modules.opengl.native.GLUniformLocation,snow.modules.opengl.native.GL_FFI,snow.modules.opengl.native.GL_Native,snow.modules.opengl.native._GL.GLBuffer_Impl_,snow.modules.opengl.native._GL.GLFramebuffer_Impl_,snow.modules.opengl.native._GL.GLProgram_Impl_,snow.modules.opengl.native._GL.GLRenderbuffer_Impl_,snow.modules.opengl.native._GL.GLShader_Impl_,snow.modules.opengl.native._GL.GLTexture_Impl_,snow.modules.opengl.native._GL.GLUniformLocation_Impl_,snow.modules.sdl.ControllerEventType,snow.modules.sdl.Input,snow.modules.sdl.KeyEventType,snow.modules.sdl.ModValue,snow.modules.sdl.MouseEventType,snow.modules.sdl.TouchEventType,snow.modules.sdl.Windowing,snow.modules.sdl._Input.ControllerEventType_Impl_,snow.modules.sdl._Input.KeyEventType_Impl_,snow.modules.sdl._Input.ModValue_Impl_,snow.modules.sdl._Input.MouseEventType_Impl_,snow.modules.sdl._Input.TouchEventType_Impl_,snow.system.assets.Asset,snow.system.assets.AssetBytes,snow.system.assets.AssetImage,snow.system.assets.AssetJSON,snow.system.assets.AssetText,snow.system.assets.Assets,snow.system.assets._Assets.AssetsModule,snow.system.audio.Audio,snow.system.audio.AudioModule,snow.system.audio.Sound,snow.system.input.Input,snow.system.input.Keycodes,snow.system.input.MapIntBool,snow.system.input.MapIntFloat,snow.system.input.Scancodes,snow.system.input._Input.InputModule,snow.system.io.IO,snow.system.io._IO.IOModule,snow.system.module.Assets,snow.system.module.Audio,snow.system.module.IO,snow.system.module.Input,snow.system.module.Sound,snow.system.module.Windowing,snow.system.window.Window,snow.system.window.Windowing,snow.system.window._Windowing.WindowHandleMap,snow.system.window._Windowing.WindowingModule,snow.types.AppConfig,snow.types.AppConfigNative,snow.types.AppConfigWeb,snow.types.Asset,snow.types.AssetBytes,snow.types.AssetImage,snow.types.AssetJSON,snow.types.AssetText,snow.types.AssetType,snow.types.AudioDataBlob,snow.types.AudioDataInfo,snow.types.AudioFormatType,snow.types.AudioHandle,snow.types.AudioInfo,snow.types.DisplayMode,snow.types.Error,snow.types.FileEvent,snow.types.FileEventType,snow.types.FileFilter,snow.types.GamepadDeviceEventType,snow.types.IODataOptions,snow.types.ImageInfo,snow.types.InputEvent,snow.types.InputEventType,snow.types.Key,snow.types.ModState,snow.types.OS,snow.types.OpenGLProfile,snow.types.Platform,snow.types.RenderConfig,snow.types.RenderConfigOpenGL,snow.types.Scan,snow.types.SnowConfig,snow.types.SystemEvent,snow.types.SystemEventType,snow.types.TextEventType,snow.types.WindowConfig,snow.types.WindowEvent,snow.types.WindowEventType,snow.types.WindowHandle,snow.types.WindowingConfig,snow.types._Types.AssetType_Impl_,snow.types._Types.AudioFormatType_Impl_,snow.types._Types.FileEventType_Impl_,snow.types._Types.GamepadDeviceEventType_Impl_,snow.types._Types.InputEventType_Impl_,snow.types._Types.OS_Impl_,snow.types._Types.OpenGLProfile_Impl_,snow.types._Types.Platform_Impl_,snow.types._Types.SystemEventType_Impl_,snow.types._Types.TextEventType_Impl_,snow.types._Types.WindowEventType_Impl_"></script>


<h1>GL_FFI</h1>
<small>`snow.modules.opengl.native.GL_FFI`</small>



<hr/>

`class`<br/><span class="meta">
meta: @:directlyUsed, @:noCompletion</span>

<hr/>


&nbsp;
&nbsp;




<h3>Members</h3> <hr/><span class="member apipage">
                <a name="ACTIVE_ATTRIBUTES"><a class="lift" href="#ACTIVE_ATTRIBUTES">ACTIVE\_ATTRIBUTES</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">ACTIVE\_ATTRIBUTES : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="ACTIVE_TEXTURE"><a class="lift" href="#ACTIVE_TEXTURE">ACTIVE\_TEXTURE</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">ACTIVE\_TEXTURE : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="ACTIVE_UNIFORMS"><a class="lift" href="#ACTIVE_UNIFORMS">ACTIVE\_UNIFORMS</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">ACTIVE\_UNIFORMS : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="ALIASED_LINE_WIDTH_RANGE"><a class="lift" href="#ALIASED_LINE_WIDTH_RANGE">ALIASED\_LINE\_WIDTH\_RANGE</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">ALIASED\_LINE\_WIDTH\_RANGE : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="ALIASED_POINT_SIZE_RANGE"><a class="lift" href="#ALIASED_POINT_SIZE_RANGE">ALIASED\_POINT\_SIZE\_RANGE</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">ALIASED\_POINT\_SIZE\_RANGE : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="ALPHA"><a class="lift" href="#ALPHA">ALPHA</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">ALPHA : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="ALPHA_BITS"><a class="lift" href="#ALPHA_BITS">ALPHA\_BITS</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">ALPHA\_BITS : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="ALWAYS"><a class="lift" href="#ALWAYS">ALWAYS</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">ALWAYS : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="ARRAY_BUFFER"><a class="lift" href="#ARRAY_BUFFER">ARRAY\_BUFFER</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">ARRAY\_BUFFER : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="ARRAY_BUFFER_BINDING"><a class="lift" href="#ARRAY_BUFFER_BINDING">ARRAY\_BUFFER\_BINDING</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">ARRAY\_BUFFER\_BINDING : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="ATTACHED_SHADERS"><a class="lift" href="#ATTACHED_SHADERS">ATTACHED\_SHADERS</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">ATTACHED\_SHADERS : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="BACK"><a class="lift" href="#BACK">BACK</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">BACK : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="BLEND"><a class="lift" href="#BLEND">BLEND</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">BLEND : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="BLEND_COLOR"><a class="lift" href="#BLEND_COLOR">BLEND\_COLOR</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">BLEND\_COLOR : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="BLEND_DST_ALPHA"><a class="lift" href="#BLEND_DST_ALPHA">BLEND\_DST\_ALPHA</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">BLEND\_DST\_ALPHA : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="BLEND_DST_RGB"><a class="lift" href="#BLEND_DST_RGB">BLEND\_DST\_RGB</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">BLEND\_DST\_RGB : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="BLEND_EQUATION"><a class="lift" href="#BLEND_EQUATION">BLEND\_EQUATION</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">BLEND\_EQUATION : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="BLEND_EQUATION_ALPHA"><a class="lift" href="#BLEND_EQUATION_ALPHA">BLEND\_EQUATION\_ALPHA</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">BLEND\_EQUATION\_ALPHA : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="BLEND_EQUATION_RGB"><a class="lift" href="#BLEND_EQUATION_RGB">BLEND\_EQUATION\_RGB</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">BLEND\_EQUATION\_RGB : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="BLEND_SRC_ALPHA"><a class="lift" href="#BLEND_SRC_ALPHA">BLEND\_SRC\_ALPHA</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">BLEND\_SRC\_ALPHA : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="BLEND_SRC_RGB"><a class="lift" href="#BLEND_SRC_RGB">BLEND\_SRC\_RGB</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">BLEND\_SRC\_RGB : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="BLUE_BITS"><a class="lift" href="#BLUE_BITS">BLUE\_BITS</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">BLUE\_BITS : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="BOOL"><a class="lift" href="#BOOL">BOOL</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">BOOL : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="BOOL_VEC2"><a class="lift" href="#BOOL_VEC2">BOOL\_VEC2</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">BOOL\_VEC2 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="BOOL_VEC3"><a class="lift" href="#BOOL_VEC3">BOOL\_VEC3</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">BOOL\_VEC3 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="BOOL_VEC4"><a class="lift" href="#BOOL_VEC4">BOOL\_VEC4</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">BOOL\_VEC4 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="BROWSER_DEFAULT_WEBGL"><a class="lift" href="#BROWSER_DEFAULT_WEBGL">BROWSER\_DEFAULT\_WEBGL</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">BROWSER\_DEFAULT\_WEBGL : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="BUFFER_SIZE"><a class="lift" href="#BUFFER_SIZE">BUFFER\_SIZE</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">BUFFER\_SIZE : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="BUFFER_USAGE"><a class="lift" href="#BUFFER_USAGE">BUFFER\_USAGE</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">BUFFER\_USAGE : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="BYTE"><a class="lift" href="#BYTE">BYTE</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">BYTE : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="CCW"><a class="lift" href="#CCW">CCW</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">CCW : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="CLAMP_TO_EDGE"><a class="lift" href="#CLAMP_TO_EDGE">CLAMP\_TO\_EDGE</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">CLAMP\_TO\_EDGE : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="COLOR_ATTACHMENT0"><a class="lift" href="#COLOR_ATTACHMENT0">COLOR\_ATTACHMENT0</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">COLOR\_ATTACHMENT0 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="COLOR_BUFFER_BIT"><a class="lift" href="#COLOR_BUFFER_BIT">COLOR\_BUFFER\_BIT</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">COLOR\_BUFFER\_BIT : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="COLOR_CLEAR_VALUE"><a class="lift" href="#COLOR_CLEAR_VALUE">COLOR\_CLEAR\_VALUE</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">COLOR\_CLEAR\_VALUE : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="COLOR_WRITEMASK"><a class="lift" href="#COLOR_WRITEMASK">COLOR\_WRITEMASK</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">COLOR\_WRITEMASK : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="COMPILE_STATUS"><a class="lift" href="#COMPILE_STATUS">COMPILE\_STATUS</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">COMPILE\_STATUS : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="COMPRESSED_TEXTURE_FORMATS"><a class="lift" href="#COMPRESSED_TEXTURE_FORMATS">COMPRESSED\_TEXTURE\_FORMATS</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">COMPRESSED\_TEXTURE\_FORMATS : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="CONSTANT_ALPHA"><a class="lift" href="#CONSTANT_ALPHA">CONSTANT\_ALPHA</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">CONSTANT\_ALPHA : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="CONSTANT_COLOR"><a class="lift" href="#CONSTANT_COLOR">CONSTANT\_COLOR</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">CONSTANT\_COLOR : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="CONTEXT_LOST_WEBGL"><a class="lift" href="#CONTEXT_LOST_WEBGL">CONTEXT\_LOST\_WEBGL</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">CONTEXT\_LOST\_WEBGL : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="CULL_FACE"><a class="lift" href="#CULL_FACE">CULL\_FACE</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">CULL\_FACE : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="CULL_FACE_MODE"><a class="lift" href="#CULL_FACE_MODE">CULL\_FACE\_MODE</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">CULL\_FACE\_MODE : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="CURRENT_PROGRAM"><a class="lift" href="#CURRENT_PROGRAM">CURRENT\_PROGRAM</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">CURRENT\_PROGRAM : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="CURRENT_VERTEX_ATTRIB"><a class="lift" href="#CURRENT_VERTEX_ATTRIB">CURRENT\_VERTEX\_ATTRIB</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">CURRENT\_VERTEX\_ATTRIB : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="CW"><a class="lift" href="#CW">CW</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">CW : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="DECR"><a class="lift" href="#DECR">DECR</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">DECR : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="DECR_WRAP"><a class="lift" href="#DECR_WRAP">DECR\_WRAP</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">DECR\_WRAP : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="DELETE_STATUS"><a class="lift" href="#DELETE_STATUS">DELETE\_STATUS</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">DELETE\_STATUS : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="DEPTH_ATTACHMENT"><a class="lift" href="#DEPTH_ATTACHMENT">DEPTH\_ATTACHMENT</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">DEPTH\_ATTACHMENT : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="DEPTH_BITS"><a class="lift" href="#DEPTH_BITS">DEPTH\_BITS</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">DEPTH\_BITS : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="DEPTH_BUFFER_BIT"><a class="lift" href="#DEPTH_BUFFER_BIT">DEPTH\_BUFFER\_BIT</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">DEPTH\_BUFFER\_BIT : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="DEPTH_CLEAR_VALUE"><a class="lift" href="#DEPTH_CLEAR_VALUE">DEPTH\_CLEAR\_VALUE</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">DEPTH\_CLEAR\_VALUE : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="DEPTH_COMPONENT"><a class="lift" href="#DEPTH_COMPONENT">DEPTH\_COMPONENT</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">DEPTH\_COMPONENT : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="DEPTH_COMPONENT16"><a class="lift" href="#DEPTH_COMPONENT16">DEPTH\_COMPONENT16</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">DEPTH\_COMPONENT16 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="DEPTH_FUNC"><a class="lift" href="#DEPTH_FUNC">DEPTH\_FUNC</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">DEPTH\_FUNC : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="DEPTH_RANGE"><a class="lift" href="#DEPTH_RANGE">DEPTH\_RANGE</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">DEPTH\_RANGE : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="DEPTH_STENCIL"><a class="lift" href="#DEPTH_STENCIL">DEPTH\_STENCIL</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">DEPTH\_STENCIL : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="DEPTH_STENCIL_ATTACHMENT"><a class="lift" href="#DEPTH_STENCIL_ATTACHMENT">DEPTH\_STENCIL\_ATTACHMENT</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">DEPTH\_STENCIL\_ATTACHMENT : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="DEPTH_TEST"><a class="lift" href="#DEPTH_TEST">DEPTH\_TEST</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">DEPTH\_TEST : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="DEPTH_WRITEMASK"><a class="lift" href="#DEPTH_WRITEMASK">DEPTH\_WRITEMASK</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">DEPTH\_WRITEMASK : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="DITHER"><a class="lift" href="#DITHER">DITHER</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">DITHER : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="DONT_CARE"><a class="lift" href="#DONT_CARE">DONT\_CARE</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">DONT\_CARE : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="DST_ALPHA"><a class="lift" href="#DST_ALPHA">DST\_ALPHA</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">DST\_ALPHA : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="DST_COLOR"><a class="lift" href="#DST_COLOR">DST\_COLOR</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">DST\_COLOR : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="DYNAMIC_DRAW"><a class="lift" href="#DYNAMIC_DRAW">DYNAMIC\_DRAW</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">DYNAMIC\_DRAW : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="ELEMENT_ARRAY_BUFFER"><a class="lift" href="#ELEMENT_ARRAY_BUFFER">ELEMENT\_ARRAY\_BUFFER</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">ELEMENT\_ARRAY\_BUFFER : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="ELEMENT_ARRAY_BUFFER_BINDING"><a class="lift" href="#ELEMENT_ARRAY_BUFFER_BINDING">ELEMENT\_ARRAY\_BUFFER\_BINDING</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">ELEMENT\_ARRAY\_BUFFER\_BINDING : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="EQUAL"><a class="lift" href="#EQUAL">EQUAL</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">EQUAL : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="FASTEST"><a class="lift" href="#FASTEST">FASTEST</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">FASTEST : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="FLOAT"><a class="lift" href="#FLOAT">FLOAT</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">FLOAT : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="FLOAT_MAT2"><a class="lift" href="#FLOAT_MAT2">FLOAT\_MAT2</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">FLOAT\_MAT2 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="FLOAT_MAT3"><a class="lift" href="#FLOAT_MAT3">FLOAT\_MAT3</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">FLOAT\_MAT3 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="FLOAT_MAT4"><a class="lift" href="#FLOAT_MAT4">FLOAT\_MAT4</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">FLOAT\_MAT4 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="FLOAT_VEC2"><a class="lift" href="#FLOAT_VEC2">FLOAT\_VEC2</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">FLOAT\_VEC2 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="FLOAT_VEC3"><a class="lift" href="#FLOAT_VEC3">FLOAT\_VEC3</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">FLOAT\_VEC3 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="FLOAT_VEC4"><a class="lift" href="#FLOAT_VEC4">FLOAT\_VEC4</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">FLOAT\_VEC4 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="FRAGMENT_SHADER"><a class="lift" href="#FRAGMENT_SHADER">FRAGMENT\_SHADER</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">FRAGMENT\_SHADER : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="FRAMEBUFFER"><a class="lift" href="#FRAMEBUFFER">FRAMEBUFFER</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">FRAMEBUFFER : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="FRAMEBUFFER_ATTACHMENT_OBJECT_NAME"><a class="lift" href="#FRAMEBUFFER_ATTACHMENT_OBJECT_NAME">FRAMEBUFFER\_ATTACHMENT\_OBJECT\_NAME</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">FRAMEBUFFER\_ATTACHMENT\_OBJECT\_NAME : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE"><a class="lift" href="#FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE">FRAMEBUFFER\_ATTACHMENT\_OBJECT\_TYPE</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">FRAMEBUFFER\_ATTACHMENT\_OBJECT\_TYPE : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="FRAMEBUFFER_ATTACHMENT_TEXTURE_CUBE_MAP_FACE"><a class="lift" href="#FRAMEBUFFER_ATTACHMENT_TEXTURE_CUBE_MAP_FACE">FRAMEBUFFER\_ATTACHMENT\_TEXTURE\_CUBE\_MAP\_FACE</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">FRAMEBUFFER\_ATTACHMENT\_TEXTURE\_CUBE\_MAP\_FACE : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="FRAMEBUFFER_ATTACHMENT_TEXTURE_LEVEL"><a class="lift" href="#FRAMEBUFFER_ATTACHMENT_TEXTURE_LEVEL">FRAMEBUFFER\_ATTACHMENT\_TEXTURE\_LEVEL</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">FRAMEBUFFER\_ATTACHMENT\_TEXTURE\_LEVEL : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="FRAMEBUFFER_BINDING"><a class="lift" href="#FRAMEBUFFER_BINDING">FRAMEBUFFER\_BINDING</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">FRAMEBUFFER\_BINDING : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="FRAMEBUFFER_COMPLETE"><a class="lift" href="#FRAMEBUFFER_COMPLETE">FRAMEBUFFER\_COMPLETE</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">FRAMEBUFFER\_COMPLETE : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="FRAMEBUFFER_INCOMPLETE_ATTACHMENT"><a class="lift" href="#FRAMEBUFFER_INCOMPLETE_ATTACHMENT">FRAMEBUFFER\_INCOMPLETE\_ATTACHMENT</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">FRAMEBUFFER\_INCOMPLETE\_ATTACHMENT : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="FRAMEBUFFER_INCOMPLETE_DIMENSIONS"><a class="lift" href="#FRAMEBUFFER_INCOMPLETE_DIMENSIONS">FRAMEBUFFER\_INCOMPLETE\_DIMENSIONS</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">FRAMEBUFFER\_INCOMPLETE\_DIMENSIONS : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="FRAMEBUFFER_INCOMPLETE_MISSING_ATTACHMENT"><a class="lift" href="#FRAMEBUFFER_INCOMPLETE_MISSING_ATTACHMENT">FRAMEBUFFER\_INCOMPLETE\_MISSING\_ATTACHMENT</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">FRAMEBUFFER\_INCOMPLETE\_MISSING\_ATTACHMENT : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="FRAMEBUFFER_UNSUPPORTED"><a class="lift" href="#FRAMEBUFFER_UNSUPPORTED">FRAMEBUFFER\_UNSUPPORTED</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">FRAMEBUFFER\_UNSUPPORTED : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="FRONT"><a class="lift" href="#FRONT">FRONT</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">FRONT : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="FRONT_AND_BACK"><a class="lift" href="#FRONT_AND_BACK">FRONT\_AND\_BACK</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">FRONT\_AND\_BACK : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="FRONT_FACE"><a class="lift" href="#FRONT_FACE">FRONT\_FACE</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">FRONT\_FACE : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="FUNC_ADD"><a class="lift" href="#FUNC_ADD">FUNC\_ADD</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">FUNC\_ADD : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="FUNC_REVERSE_SUBTRACT"><a class="lift" href="#FUNC_REVERSE_SUBTRACT">FUNC\_REVERSE\_SUBTRACT</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">FUNC\_REVERSE\_SUBTRACT : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="FUNC_SUBTRACT"><a class="lift" href="#FUNC_SUBTRACT">FUNC\_SUBTRACT</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">FUNC\_SUBTRACT : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="GENERATE_MIPMAP_HINT"><a class="lift" href="#GENERATE_MIPMAP_HINT">GENERATE\_MIPMAP\_HINT</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">GENERATE\_MIPMAP\_HINT : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="GEQUAL"><a class="lift" href="#GEQUAL">GEQUAL</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">GEQUAL : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="GREATER"><a class="lift" href="#GREATER">GREATER</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">GREATER : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="GREEN_BITS"><a class="lift" href="#GREEN_BITS">GREEN\_BITS</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">GREEN\_BITS : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="HIGH_FLOAT"><a class="lift" href="#HIGH_FLOAT">HIGH\_FLOAT</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">HIGH\_FLOAT : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="HIGH_INT"><a class="lift" href="#HIGH_INT">HIGH\_INT</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">HIGH\_INT : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="INCR"><a class="lift" href="#INCR">INCR</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">INCR : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="INCR_WRAP"><a class="lift" href="#INCR_WRAP">INCR\_WRAP</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">INCR\_WRAP : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="INT"><a class="lift" href="#INT">INT</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">INT : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="INT_VEC2"><a class="lift" href="#INT_VEC2">INT\_VEC2</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">INT\_VEC2 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="INT_VEC3"><a class="lift" href="#INT_VEC3">INT\_VEC3</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">INT\_VEC3 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="INT_VEC4"><a class="lift" href="#INT_VEC4">INT\_VEC4</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">INT\_VEC4 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="INVALID_ENUM"><a class="lift" href="#INVALID_ENUM">INVALID\_ENUM</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">INVALID\_ENUM : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="INVALID_FRAMEBUFFER_OPERATION"><a class="lift" href="#INVALID_FRAMEBUFFER_OPERATION">INVALID\_FRAMEBUFFER\_OPERATION</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">INVALID\_FRAMEBUFFER\_OPERATION : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="INVALID_OPERATION"><a class="lift" href="#INVALID_OPERATION">INVALID\_OPERATION</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">INVALID\_OPERATION : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="INVALID_VALUE"><a class="lift" href="#INVALID_VALUE">INVALID\_VALUE</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">INVALID\_VALUE : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="INVERT"><a class="lift" href="#INVERT">INVERT</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">INVERT : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="KEEP"><a class="lift" href="#KEEP">KEEP</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">KEEP : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="LEQUAL"><a class="lift" href="#LEQUAL">LEQUAL</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">LEQUAL : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="LESS"><a class="lift" href="#LESS">LESS</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">LESS : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="LINEAR"><a class="lift" href="#LINEAR">LINEAR</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">LINEAR : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="LINEAR_MIPMAP_LINEAR"><a class="lift" href="#LINEAR_MIPMAP_LINEAR">LINEAR\_MIPMAP\_LINEAR</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">LINEAR\_MIPMAP\_LINEAR : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="LINEAR_MIPMAP_NEAREST"><a class="lift" href="#LINEAR_MIPMAP_NEAREST">LINEAR\_MIPMAP\_NEAREST</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">LINEAR\_MIPMAP\_NEAREST : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="LINES"><a class="lift" href="#LINES">LINES</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">LINES : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="LINE_LOOP"><a class="lift" href="#LINE_LOOP">LINE\_LOOP</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">LINE\_LOOP : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="LINE_STRIP"><a class="lift" href="#LINE_STRIP">LINE\_STRIP</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">LINE\_STRIP : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="LINE_WIDTH"><a class="lift" href="#LINE_WIDTH">LINE\_WIDTH</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">LINE\_WIDTH : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="LINK_STATUS"><a class="lift" href="#LINK_STATUS">LINK\_STATUS</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">LINK\_STATUS : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="LOW_FLOAT"><a class="lift" href="#LOW_FLOAT">LOW\_FLOAT</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">LOW\_FLOAT : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="LOW_INT"><a class="lift" href="#LOW_INT">LOW\_INT</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">LOW\_INT : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="LUMINANCE"><a class="lift" href="#LUMINANCE">LUMINANCE</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">LUMINANCE : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="LUMINANCE_ALPHA"><a class="lift" href="#LUMINANCE_ALPHA">LUMINANCE\_ALPHA</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">LUMINANCE\_ALPHA : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="MAX_COMBINED_TEXTURE_IMAGE_UNITS"><a class="lift" href="#MAX_COMBINED_TEXTURE_IMAGE_UNITS">MAX\_COMBINED\_TEXTURE\_IMAGE\_UNITS</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">MAX\_COMBINED\_TEXTURE\_IMAGE\_UNITS : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="MAX_CUBE_MAP_TEXTURE_SIZE"><a class="lift" href="#MAX_CUBE_MAP_TEXTURE_SIZE">MAX\_CUBE\_MAP\_TEXTURE\_SIZE</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">MAX\_CUBE\_MAP\_TEXTURE\_SIZE : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="MAX_FRAGMENT_UNIFORM_VECTORS"><a class="lift" href="#MAX_FRAGMENT_UNIFORM_VECTORS">MAX\_FRAGMENT\_UNIFORM\_VECTORS</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">MAX\_FRAGMENT\_UNIFORM\_VECTORS : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="MAX_RENDERBUFFER_SIZE"><a class="lift" href="#MAX_RENDERBUFFER_SIZE">MAX\_RENDERBUFFER\_SIZE</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">MAX\_RENDERBUFFER\_SIZE : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="MAX_TEXTURE_IMAGE_UNITS"><a class="lift" href="#MAX_TEXTURE_IMAGE_UNITS">MAX\_TEXTURE\_IMAGE\_UNITS</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">MAX\_TEXTURE\_IMAGE\_UNITS : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="MAX_TEXTURE_SIZE"><a class="lift" href="#MAX_TEXTURE_SIZE">MAX\_TEXTURE\_SIZE</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">MAX\_TEXTURE\_SIZE : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="MAX_VARYING_VECTORS"><a class="lift" href="#MAX_VARYING_VECTORS">MAX\_VARYING\_VECTORS</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">MAX\_VARYING\_VECTORS : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="MAX_VERTEX_ATTRIBS"><a class="lift" href="#MAX_VERTEX_ATTRIBS">MAX\_VERTEX\_ATTRIBS</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">MAX\_VERTEX\_ATTRIBS : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="MAX_VERTEX_TEXTURE_IMAGE_UNITS"><a class="lift" href="#MAX_VERTEX_TEXTURE_IMAGE_UNITS">MAX\_VERTEX\_TEXTURE\_IMAGE\_UNITS</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">MAX\_VERTEX\_TEXTURE\_IMAGE\_UNITS : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="MAX_VERTEX_UNIFORM_VECTORS"><a class="lift" href="#MAX_VERTEX_UNIFORM_VECTORS">MAX\_VERTEX\_UNIFORM\_VECTORS</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">MAX\_VERTEX\_UNIFORM\_VECTORS : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="MAX_VIEWPORT_DIMS"><a class="lift" href="#MAX_VIEWPORT_DIMS">MAX\_VIEWPORT\_DIMS</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">MAX\_VIEWPORT\_DIMS : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="MEDIUM_FLOAT"><a class="lift" href="#MEDIUM_FLOAT">MEDIUM\_FLOAT</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">MEDIUM\_FLOAT : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="MEDIUM_INT"><a class="lift" href="#MEDIUM_INT">MEDIUM\_INT</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">MEDIUM\_INT : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="MIRRORED_REPEAT"><a class="lift" href="#MIRRORED_REPEAT">MIRRORED\_REPEAT</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">MIRRORED\_REPEAT : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="NEAREST"><a class="lift" href="#NEAREST">NEAREST</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">NEAREST : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="NEAREST_MIPMAP_LINEAR"><a class="lift" href="#NEAREST_MIPMAP_LINEAR">NEAREST\_MIPMAP\_LINEAR</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">NEAREST\_MIPMAP\_LINEAR : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="NEAREST_MIPMAP_NEAREST"><a class="lift" href="#NEAREST_MIPMAP_NEAREST">NEAREST\_MIPMAP\_NEAREST</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">NEAREST\_MIPMAP\_NEAREST : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="NEVER"><a class="lift" href="#NEVER">NEVER</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">NEVER : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="NICEST"><a class="lift" href="#NICEST">NICEST</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">NICEST : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="NONE"><a class="lift" href="#NONE">NONE</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">NONE : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="NOTEQUAL"><a class="lift" href="#NOTEQUAL">NOTEQUAL</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">NOTEQUAL : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="NO_ERROR"><a class="lift" href="#NO_ERROR">NO\_ERROR</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">NO\_ERROR : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="ONE"><a class="lift" href="#ONE">ONE</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">ONE : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="ONE_MINUS_CONSTANT_ALPHA"><a class="lift" href="#ONE_MINUS_CONSTANT_ALPHA">ONE\_MINUS\_CONSTANT\_ALPHA</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">ONE\_MINUS\_CONSTANT\_ALPHA : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="ONE_MINUS_CONSTANT_COLOR"><a class="lift" href="#ONE_MINUS_CONSTANT_COLOR">ONE\_MINUS\_CONSTANT\_COLOR</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">ONE\_MINUS\_CONSTANT\_COLOR : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="ONE_MINUS_DST_ALPHA"><a class="lift" href="#ONE_MINUS_DST_ALPHA">ONE\_MINUS\_DST\_ALPHA</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">ONE\_MINUS\_DST\_ALPHA : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="ONE_MINUS_DST_COLOR"><a class="lift" href="#ONE_MINUS_DST_COLOR">ONE\_MINUS\_DST\_COLOR</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">ONE\_MINUS\_DST\_COLOR : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="ONE_MINUS_SRC_ALPHA"><a class="lift" href="#ONE_MINUS_SRC_ALPHA">ONE\_MINUS\_SRC\_ALPHA</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">ONE\_MINUS\_SRC\_ALPHA : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="ONE_MINUS_SRC_COLOR"><a class="lift" href="#ONE_MINUS_SRC_COLOR">ONE\_MINUS\_SRC\_COLOR</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">ONE\_MINUS\_SRC\_COLOR : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="OUT_OF_MEMORY"><a class="lift" href="#OUT_OF_MEMORY">OUT\_OF\_MEMORY</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">OUT\_OF\_MEMORY : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="PACK_ALIGNMENT"><a class="lift" href="#PACK_ALIGNMENT">PACK\_ALIGNMENT</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">PACK\_ALIGNMENT : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="POINTS"><a class="lift" href="#POINTS">POINTS</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">POINTS : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="POINT_SPRITE"><a class="lift" href="#POINT_SPRITE">POINT\_SPRITE</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">POINT\_SPRITE : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="POLYGON_OFFSET_FACTOR"><a class="lift" href="#POLYGON_OFFSET_FACTOR">POLYGON\_OFFSET\_FACTOR</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">POLYGON\_OFFSET\_FACTOR : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="POLYGON_OFFSET_FILL"><a class="lift" href="#POLYGON_OFFSET_FILL">POLYGON\_OFFSET\_FILL</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">POLYGON\_OFFSET\_FILL : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="POLYGON_OFFSET_UNITS"><a class="lift" href="#POLYGON_OFFSET_UNITS">POLYGON\_OFFSET\_UNITS</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">POLYGON\_OFFSET\_UNITS : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="RED_BITS"><a class="lift" href="#RED_BITS">RED\_BITS</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">RED\_BITS : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="RENDERBUFFER"><a class="lift" href="#RENDERBUFFER">RENDERBUFFER</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">RENDERBUFFER : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="RENDERBUFFER_ALPHA_SIZE"><a class="lift" href="#RENDERBUFFER_ALPHA_SIZE">RENDERBUFFER\_ALPHA\_SIZE</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">RENDERBUFFER\_ALPHA\_SIZE : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="RENDERBUFFER_BINDING"><a class="lift" href="#RENDERBUFFER_BINDING">RENDERBUFFER\_BINDING</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">RENDERBUFFER\_BINDING : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="RENDERBUFFER_BLUE_SIZE"><a class="lift" href="#RENDERBUFFER_BLUE_SIZE">RENDERBUFFER\_BLUE\_SIZE</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">RENDERBUFFER\_BLUE\_SIZE : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="RENDERBUFFER_DEPTH_SIZE"><a class="lift" href="#RENDERBUFFER_DEPTH_SIZE">RENDERBUFFER\_DEPTH\_SIZE</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">RENDERBUFFER\_DEPTH\_SIZE : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="RENDERBUFFER_GREEN_SIZE"><a class="lift" href="#RENDERBUFFER_GREEN_SIZE">RENDERBUFFER\_GREEN\_SIZE</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">RENDERBUFFER\_GREEN\_SIZE : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="RENDERBUFFER_HEIGHT"><a class="lift" href="#RENDERBUFFER_HEIGHT">RENDERBUFFER\_HEIGHT</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">RENDERBUFFER\_HEIGHT : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="RENDERBUFFER_INTERNAL_FORMAT"><a class="lift" href="#RENDERBUFFER_INTERNAL_FORMAT">RENDERBUFFER\_INTERNAL\_FORMAT</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">RENDERBUFFER\_INTERNAL\_FORMAT : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="RENDERBUFFER_RED_SIZE"><a class="lift" href="#RENDERBUFFER_RED_SIZE">RENDERBUFFER\_RED\_SIZE</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">RENDERBUFFER\_RED\_SIZE : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="RENDERBUFFER_STENCIL_SIZE"><a class="lift" href="#RENDERBUFFER_STENCIL_SIZE">RENDERBUFFER\_STENCIL\_SIZE</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">RENDERBUFFER\_STENCIL\_SIZE : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="RENDERBUFFER_WIDTH"><a class="lift" href="#RENDERBUFFER_WIDTH">RENDERBUFFER\_WIDTH</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">RENDERBUFFER\_WIDTH : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="RENDERER"><a class="lift" href="#RENDERER">RENDERER</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">RENDERER : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="REPEAT"><a class="lift" href="#REPEAT">REPEAT</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">REPEAT : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="REPLACE"><a class="lift" href="#REPLACE">REPLACE</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">REPLACE : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="RGB"><a class="lift" href="#RGB">RGB</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">RGB : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="RGB565"><a class="lift" href="#RGB565">RGB565</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">RGB565 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="RGB5_A1"><a class="lift" href="#RGB5_A1">RGB5\_A1</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">RGB5\_A1 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="RGBA"><a class="lift" href="#RGBA">RGBA</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">RGBA : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="RGBA4"><a class="lift" href="#RGBA4">RGBA4</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">RGBA4 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="SAMPLER_2D"><a class="lift" href="#SAMPLER_2D">SAMPLER\_2D</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">SAMPLER\_2D : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="SAMPLER_CUBE"><a class="lift" href="#SAMPLER_CUBE">SAMPLER\_CUBE</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">SAMPLER\_CUBE : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="SAMPLES"><a class="lift" href="#SAMPLES">SAMPLES</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">SAMPLES : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="SAMPLE_ALPHA_TO_COVERAGE"><a class="lift" href="#SAMPLE_ALPHA_TO_COVERAGE">SAMPLE\_ALPHA\_TO\_COVERAGE</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">SAMPLE\_ALPHA\_TO\_COVERAGE : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="SAMPLE_BUFFERS"><a class="lift" href="#SAMPLE_BUFFERS">SAMPLE\_BUFFERS</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">SAMPLE\_BUFFERS : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="SAMPLE_COVERAGE"><a class="lift" href="#SAMPLE_COVERAGE">SAMPLE\_COVERAGE</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">SAMPLE\_COVERAGE : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="SAMPLE_COVERAGE_INVERT"><a class="lift" href="#SAMPLE_COVERAGE_INVERT">SAMPLE\_COVERAGE\_INVERT</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">SAMPLE\_COVERAGE\_INVERT : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="SAMPLE_COVERAGE_VALUE"><a class="lift" href="#SAMPLE_COVERAGE_VALUE">SAMPLE\_COVERAGE\_VALUE</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">SAMPLE\_COVERAGE\_VALUE : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="SCISSOR_BOX"><a class="lift" href="#SCISSOR_BOX">SCISSOR\_BOX</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">SCISSOR\_BOX : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="SCISSOR_TEST"><a class="lift" href="#SCISSOR_TEST">SCISSOR\_TEST</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">SCISSOR\_TEST : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="SHADER_TYPE"><a class="lift" href="#SHADER_TYPE">SHADER\_TYPE</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">SHADER\_TYPE : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="SHADING_LANGUAGE_VERSION"><a class="lift" href="#SHADING_LANGUAGE_VERSION">SHADING\_LANGUAGE\_VERSION</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">SHADING\_LANGUAGE\_VERSION : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="SHORT"><a class="lift" href="#SHORT">SHORT</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">SHORT : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="SRC_ALPHA"><a class="lift" href="#SRC_ALPHA">SRC\_ALPHA</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">SRC\_ALPHA : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="SRC_ALPHA_SATURATE"><a class="lift" href="#SRC_ALPHA_SATURATE">SRC\_ALPHA\_SATURATE</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">SRC\_ALPHA\_SATURATE : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="SRC_COLOR"><a class="lift" href="#SRC_COLOR">SRC\_COLOR</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">SRC\_COLOR : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="STATIC_DRAW"><a class="lift" href="#STATIC_DRAW">STATIC\_DRAW</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">STATIC\_DRAW : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="STENCIL_ATTACHMENT"><a class="lift" href="#STENCIL_ATTACHMENT">STENCIL\_ATTACHMENT</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">STENCIL\_ATTACHMENT : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="STENCIL_BACK_FAIL"><a class="lift" href="#STENCIL_BACK_FAIL">STENCIL\_BACK\_FAIL</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">STENCIL\_BACK\_FAIL : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="STENCIL_BACK_FUNC"><a class="lift" href="#STENCIL_BACK_FUNC">STENCIL\_BACK\_FUNC</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">STENCIL\_BACK\_FUNC : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="STENCIL_BACK_PASS_DEPTH_FAIL"><a class="lift" href="#STENCIL_BACK_PASS_DEPTH_FAIL">STENCIL\_BACK\_PASS\_DEPTH\_FAIL</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">STENCIL\_BACK\_PASS\_DEPTH\_FAIL : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="STENCIL_BACK_PASS_DEPTH_PASS"><a class="lift" href="#STENCIL_BACK_PASS_DEPTH_PASS">STENCIL\_BACK\_PASS\_DEPTH\_PASS</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">STENCIL\_BACK\_PASS\_DEPTH\_PASS : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="STENCIL_BACK_REF"><a class="lift" href="#STENCIL_BACK_REF">STENCIL\_BACK\_REF</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">STENCIL\_BACK\_REF : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="STENCIL_BACK_VALUE_MASK"><a class="lift" href="#STENCIL_BACK_VALUE_MASK">STENCIL\_BACK\_VALUE\_MASK</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">STENCIL\_BACK\_VALUE\_MASK : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="STENCIL_BACK_WRITEMASK"><a class="lift" href="#STENCIL_BACK_WRITEMASK">STENCIL\_BACK\_WRITEMASK</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">STENCIL\_BACK\_WRITEMASK : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="STENCIL_BITS"><a class="lift" href="#STENCIL_BITS">STENCIL\_BITS</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">STENCIL\_BITS : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="STENCIL_BUFFER_BIT"><a class="lift" href="#STENCIL_BUFFER_BIT">STENCIL\_BUFFER\_BIT</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">STENCIL\_BUFFER\_BIT : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="STENCIL_CLEAR_VALUE"><a class="lift" href="#STENCIL_CLEAR_VALUE">STENCIL\_CLEAR\_VALUE</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">STENCIL\_CLEAR\_VALUE : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="STENCIL_FAIL"><a class="lift" href="#STENCIL_FAIL">STENCIL\_FAIL</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">STENCIL\_FAIL : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="STENCIL_FUNC"><a class="lift" href="#STENCIL_FUNC">STENCIL\_FUNC</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">STENCIL\_FUNC : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="STENCIL_INDEX"><a class="lift" href="#STENCIL_INDEX">STENCIL\_INDEX</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">STENCIL\_INDEX : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="STENCIL_INDEX8"><a class="lift" href="#STENCIL_INDEX8">STENCIL\_INDEX8</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">STENCIL\_INDEX8 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="STENCIL_PASS_DEPTH_FAIL"><a class="lift" href="#STENCIL_PASS_DEPTH_FAIL">STENCIL\_PASS\_DEPTH\_FAIL</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">STENCIL\_PASS\_DEPTH\_FAIL : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="STENCIL_PASS_DEPTH_PASS"><a class="lift" href="#STENCIL_PASS_DEPTH_PASS">STENCIL\_PASS\_DEPTH\_PASS</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">STENCIL\_PASS\_DEPTH\_PASS : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="STENCIL_REF"><a class="lift" href="#STENCIL_REF">STENCIL\_REF</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">STENCIL\_REF : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="STENCIL_TEST"><a class="lift" href="#STENCIL_TEST">STENCIL\_TEST</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">STENCIL\_TEST : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="STENCIL_VALUE_MASK"><a class="lift" href="#STENCIL_VALUE_MASK">STENCIL\_VALUE\_MASK</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">STENCIL\_VALUE\_MASK : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="STENCIL_WRITEMASK"><a class="lift" href="#STENCIL_WRITEMASK">STENCIL\_WRITEMASK</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">STENCIL\_WRITEMASK : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="STREAM_DRAW"><a class="lift" href="#STREAM_DRAW">STREAM\_DRAW</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">STREAM\_DRAW : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="SUBPIXEL_BITS"><a class="lift" href="#SUBPIXEL_BITS">SUBPIXEL\_BITS</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">SUBPIXEL\_BITS : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="TEXTURE"><a class="lift" href="#TEXTURE">TEXTURE</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">TEXTURE : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="TEXTURE0"><a class="lift" href="#TEXTURE0">TEXTURE0</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">TEXTURE0 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="TEXTURE1"><a class="lift" href="#TEXTURE1">TEXTURE1</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">TEXTURE1 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="TEXTURE10"><a class="lift" href="#TEXTURE10">TEXTURE10</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">TEXTURE10 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="TEXTURE11"><a class="lift" href="#TEXTURE11">TEXTURE11</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">TEXTURE11 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="TEXTURE12"><a class="lift" href="#TEXTURE12">TEXTURE12</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">TEXTURE12 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="TEXTURE13"><a class="lift" href="#TEXTURE13">TEXTURE13</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">TEXTURE13 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="TEXTURE14"><a class="lift" href="#TEXTURE14">TEXTURE14</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">TEXTURE14 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="TEXTURE15"><a class="lift" href="#TEXTURE15">TEXTURE15</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">TEXTURE15 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="TEXTURE16"><a class="lift" href="#TEXTURE16">TEXTURE16</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">TEXTURE16 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="TEXTURE17"><a class="lift" href="#TEXTURE17">TEXTURE17</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">TEXTURE17 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="TEXTURE18"><a class="lift" href="#TEXTURE18">TEXTURE18</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">TEXTURE18 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="TEXTURE19"><a class="lift" href="#TEXTURE19">TEXTURE19</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">TEXTURE19 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="TEXTURE2"><a class="lift" href="#TEXTURE2">TEXTURE2</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">TEXTURE2 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="TEXTURE20"><a class="lift" href="#TEXTURE20">TEXTURE20</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">TEXTURE20 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="TEXTURE21"><a class="lift" href="#TEXTURE21">TEXTURE21</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">TEXTURE21 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="TEXTURE22"><a class="lift" href="#TEXTURE22">TEXTURE22</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">TEXTURE22 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="TEXTURE23"><a class="lift" href="#TEXTURE23">TEXTURE23</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">TEXTURE23 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="TEXTURE24"><a class="lift" href="#TEXTURE24">TEXTURE24</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">TEXTURE24 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="TEXTURE25"><a class="lift" href="#TEXTURE25">TEXTURE25</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">TEXTURE25 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="TEXTURE26"><a class="lift" href="#TEXTURE26">TEXTURE26</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">TEXTURE26 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="TEXTURE27"><a class="lift" href="#TEXTURE27">TEXTURE27</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">TEXTURE27 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="TEXTURE28"><a class="lift" href="#TEXTURE28">TEXTURE28</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">TEXTURE28 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="TEXTURE29"><a class="lift" href="#TEXTURE29">TEXTURE29</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">TEXTURE29 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="TEXTURE3"><a class="lift" href="#TEXTURE3">TEXTURE3</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">TEXTURE3 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="TEXTURE30"><a class="lift" href="#TEXTURE30">TEXTURE30</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">TEXTURE30 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="TEXTURE31"><a class="lift" href="#TEXTURE31">TEXTURE31</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">TEXTURE31 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="TEXTURE4"><a class="lift" href="#TEXTURE4">TEXTURE4</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">TEXTURE4 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="TEXTURE5"><a class="lift" href="#TEXTURE5">TEXTURE5</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">TEXTURE5 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="TEXTURE6"><a class="lift" href="#TEXTURE6">TEXTURE6</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">TEXTURE6 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="TEXTURE7"><a class="lift" href="#TEXTURE7">TEXTURE7</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">TEXTURE7 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="TEXTURE8"><a class="lift" href="#TEXTURE8">TEXTURE8</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">TEXTURE8 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="TEXTURE9"><a class="lift" href="#TEXTURE9">TEXTURE9</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">TEXTURE9 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="TEXTURE_2D"><a class="lift" href="#TEXTURE_2D">TEXTURE\_2D</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">TEXTURE\_2D : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="TEXTURE_BINDING_2D"><a class="lift" href="#TEXTURE_BINDING_2D">TEXTURE\_BINDING\_2D</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">TEXTURE\_BINDING\_2D : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="TEXTURE_BINDING_CUBE_MAP"><a class="lift" href="#TEXTURE_BINDING_CUBE_MAP">TEXTURE\_BINDING\_CUBE\_MAP</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">TEXTURE\_BINDING\_CUBE\_MAP : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="TEXTURE_CUBE_MAP"><a class="lift" href="#TEXTURE_CUBE_MAP">TEXTURE\_CUBE\_MAP</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">TEXTURE\_CUBE\_MAP : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="TEXTURE_CUBE_MAP_NEGATIVE_X"><a class="lift" href="#TEXTURE_CUBE_MAP_NEGATIVE_X">TEXTURE\_CUBE\_MAP\_NEGATIVE\_X</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">TEXTURE\_CUBE\_MAP\_NEGATIVE\_X : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="TEXTURE_CUBE_MAP_NEGATIVE_Y"><a class="lift" href="#TEXTURE_CUBE_MAP_NEGATIVE_Y">TEXTURE\_CUBE\_MAP\_NEGATIVE\_Y</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">TEXTURE\_CUBE\_MAP\_NEGATIVE\_Y : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="TEXTURE_CUBE_MAP_NEGATIVE_Z"><a class="lift" href="#TEXTURE_CUBE_MAP_NEGATIVE_Z">TEXTURE\_CUBE\_MAP\_NEGATIVE\_Z</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">TEXTURE\_CUBE\_MAP\_NEGATIVE\_Z : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="TEXTURE_CUBE_MAP_POSITIVE_X"><a class="lift" href="#TEXTURE_CUBE_MAP_POSITIVE_X">TEXTURE\_CUBE\_MAP\_POSITIVE\_X</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">TEXTURE\_CUBE\_MAP\_POSITIVE\_X : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="TEXTURE_CUBE_MAP_POSITIVE_Y"><a class="lift" href="#TEXTURE_CUBE_MAP_POSITIVE_Y">TEXTURE\_CUBE\_MAP\_POSITIVE\_Y</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">TEXTURE\_CUBE\_MAP\_POSITIVE\_Y : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="TEXTURE_CUBE_MAP_POSITIVE_Z"><a class="lift" href="#TEXTURE_CUBE_MAP_POSITIVE_Z">TEXTURE\_CUBE\_MAP\_POSITIVE\_Z</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">TEXTURE\_CUBE\_MAP\_POSITIVE\_Z : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="TEXTURE_MAG_FILTER"><a class="lift" href="#TEXTURE_MAG_FILTER">TEXTURE\_MAG\_FILTER</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">TEXTURE\_MAG\_FILTER : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="TEXTURE_MIN_FILTER"><a class="lift" href="#TEXTURE_MIN_FILTER">TEXTURE\_MIN\_FILTER</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">TEXTURE\_MIN\_FILTER : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="TEXTURE_WRAP_S"><a class="lift" href="#TEXTURE_WRAP_S">TEXTURE\_WRAP\_S</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">TEXTURE\_WRAP\_S : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="TEXTURE_WRAP_T"><a class="lift" href="#TEXTURE_WRAP_T">TEXTURE\_WRAP\_T</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">TEXTURE\_WRAP\_T : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="TRIANGLES"><a class="lift" href="#TRIANGLES">TRIANGLES</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">TRIANGLES : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="TRIANGLE_FAN"><a class="lift" href="#TRIANGLE_FAN">TRIANGLE\_FAN</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">TRIANGLE\_FAN : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="TRIANGLE_STRIP"><a class="lift" href="#TRIANGLE_STRIP">TRIANGLE\_STRIP</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">TRIANGLE\_STRIP : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="UNPACK_ALIGNMENT"><a class="lift" href="#UNPACK_ALIGNMENT">UNPACK\_ALIGNMENT</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">UNPACK\_ALIGNMENT : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="UNPACK_COLORSPACE_CONVERSION_WEBGL"><a class="lift" href="#UNPACK_COLORSPACE_CONVERSION_WEBGL">UNPACK\_COLORSPACE\_CONVERSION\_WEBGL</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">UNPACK\_COLORSPACE\_CONVERSION\_WEBGL : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="UNPACK_FLIP_Y_WEBGL"><a class="lift" href="#UNPACK_FLIP_Y_WEBGL">UNPACK\_FLIP\_Y\_WEBGL</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">UNPACK\_FLIP\_Y\_WEBGL : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="UNPACK_PREMULTIPLY_ALPHA_WEBGL"><a class="lift" href="#UNPACK_PREMULTIPLY_ALPHA_WEBGL">UNPACK\_PREMULTIPLY\_ALPHA\_WEBGL</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">UNPACK\_PREMULTIPLY\_ALPHA\_WEBGL : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="UNSIGNED_BYTE"><a class="lift" href="#UNSIGNED_BYTE">UNSIGNED\_BYTE</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">UNSIGNED\_BYTE : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="UNSIGNED_INT"><a class="lift" href="#UNSIGNED_INT">UNSIGNED\_INT</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">UNSIGNED\_INT : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="UNSIGNED_SHORT"><a class="lift" href="#UNSIGNED_SHORT">UNSIGNED\_SHORT</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">UNSIGNED\_SHORT : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="UNSIGNED_SHORT_4_4_4_4"><a class="lift" href="#UNSIGNED_SHORT_4_4_4_4">UNSIGNED\_SHORT\_4\_4\_4\_4</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">UNSIGNED\_SHORT\_4\_4\_4\_4 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="UNSIGNED_SHORT_5_5_5_1"><a class="lift" href="#UNSIGNED_SHORT_5_5_5_1">UNSIGNED\_SHORT\_5\_5\_5\_1</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">UNSIGNED\_SHORT\_5\_5\_5\_1 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="UNSIGNED_SHORT_5_6_5"><a class="lift" href="#UNSIGNED_SHORT_5_6_5">UNSIGNED\_SHORT\_5\_6\_5</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">UNSIGNED\_SHORT\_5\_6\_5 : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="VALIDATE_STATUS"><a class="lift" href="#VALIDATE_STATUS">VALIDATE\_STATUS</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">VALIDATE\_STATUS : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="VENDOR"><a class="lift" href="#VENDOR">VENDOR</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">VENDOR : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="VERSION"><a class="lift" href="#VERSION">VERSION</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">VERSION : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="VERTEX_ATTRIB_ARRAY_BUFFER_BINDING"><a class="lift" href="#VERTEX_ATTRIB_ARRAY_BUFFER_BINDING">VERTEX\_ATTRIB\_ARRAY\_BUFFER\_BINDING</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">VERTEX\_ATTRIB\_ARRAY\_BUFFER\_BINDING : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="VERTEX_ATTRIB_ARRAY_ENABLED"><a class="lift" href="#VERTEX_ATTRIB_ARRAY_ENABLED">VERTEX\_ATTRIB\_ARRAY\_ENABLED</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">VERTEX\_ATTRIB\_ARRAY\_ENABLED : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="VERTEX_ATTRIB_ARRAY_NORMALIZED"><a class="lift" href="#VERTEX_ATTRIB_ARRAY_NORMALIZED">VERTEX\_ATTRIB\_ARRAY\_NORMALIZED</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">VERTEX\_ATTRIB\_ARRAY\_NORMALIZED : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="VERTEX_ATTRIB_ARRAY_POINTER"><a class="lift" href="#VERTEX_ATTRIB_ARRAY_POINTER">VERTEX\_ATTRIB\_ARRAY\_POINTER</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">VERTEX\_ATTRIB\_ARRAY\_POINTER : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="VERTEX_ATTRIB_ARRAY_SIZE"><a class="lift" href="#VERTEX_ATTRIB_ARRAY_SIZE">VERTEX\_ATTRIB\_ARRAY\_SIZE</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">VERTEX\_ATTRIB\_ARRAY\_SIZE : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="VERTEX_ATTRIB_ARRAY_STRIDE"><a class="lift" href="#VERTEX_ATTRIB_ARRAY_STRIDE">VERTEX\_ATTRIB\_ARRAY\_STRIDE</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">VERTEX\_ATTRIB\_ARRAY\_STRIDE : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="VERTEX_ATTRIB_ARRAY_TYPE"><a class="lift" href="#VERTEX_ATTRIB_ARRAY_TYPE">VERTEX\_ATTRIB\_ARRAY\_TYPE</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">VERTEX\_ATTRIB\_ARRAY\_TYPE : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="VERTEX_PROGRAM_POINT_SIZE"><a class="lift" href="#VERTEX_PROGRAM_POINT_SIZE">VERTEX\_PROGRAM\_POINT\_SIZE</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">VERTEX\_PROGRAM\_POINT\_SIZE : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="VERTEX_SHADER"><a class="lift" href="#VERTEX_SHADER">VERTEX\_SHADER</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">VERTEX\_SHADER : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="VIEWPORT"><a class="lift" href="#VIEWPORT">VIEWPORT</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">VIEWPORT : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="ZERO"><a class="lift" href="#ZERO">ZERO</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">ZERO : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/>


<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="activeTexture"><a class="lift" href="#activeTexture">activeTexture</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">activeTexture(texture:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="attachShader"><a class="lift" href="#attachShader">attachShader</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">attachShader(program:[snow.modules.opengl.native.GLProgram](../../../../../api/snow/modules/opengl/native/GLProgram.html)<span></span>, shader:[snow.modules.opengl.native.GLShader](../../../../../api/snow/modules/opengl/native/GLShader.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="bindAttribLocation"><a class="lift" href="#bindAttribLocation">bindAttribLocation</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">bindAttribLocation(program:[snow.modules.opengl.native.GLProgram](../../../../../api/snow/modules/opengl/native/GLProgram.html)<span></span>, index:[Int](http://api.haxe.org/Int.html)<span></span>, name:[String](http://api.haxe.org/String.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="bindBuffer"><a class="lift" href="#bindBuffer">bindBuffer</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">bindBuffer(target:[Int](http://api.haxe.org/Int.html)<span></span>, buffer:[snow.modules.opengl.native.GLBuffer](../../../../../api/snow/modules/opengl/native/GLBuffer.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="bindFramebuffer"><a class="lift" href="#bindFramebuffer">bindFramebuffer</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">bindFramebuffer(target:[Int](http://api.haxe.org/Int.html)<span></span>, framebuffer:[snow.modules.opengl.native.GLFramebuffer](../../../../../api/snow/modules/opengl/native/GLFramebuffer.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="bindRenderbuffer"><a class="lift" href="#bindRenderbuffer">bindRenderbuffer</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">bindRenderbuffer(target:[Int](http://api.haxe.org/Int.html)<span></span>, renderbuffer:[snow.modules.opengl.native.GLRenderbuffer](../../../../../api/snow/modules/opengl/native/GLRenderbuffer.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="bindTexture"><a class="lift" href="#bindTexture">bindTexture</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">bindTexture(target:[Int](http://api.haxe.org/Int.html)<span></span>, texture:[snow.modules.opengl.native.GLTexture](../../../../../api/snow/modules/opengl/native/GLTexture.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="blendColor"><a class="lift" href="#blendColor">blendColor</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">blendColor(red:[Float](http://api.haxe.org/Float.html)<span></span>, green:[Float](http://api.haxe.org/Float.html)<span></span>, blue:[Float](http://api.haxe.org/Float.html)<span></span>, alpha:[Float](http://api.haxe.org/Float.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="blendEquation"><a class="lift" href="#blendEquation">blendEquation</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">blendEquation(mode:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="blendEquationSeparate"><a class="lift" href="#blendEquationSeparate">blendEquationSeparate</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">blendEquationSeparate(modeRGB:[Int](http://api.haxe.org/Int.html)<span></span>, modeAlpha:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="blendFunc"><a class="lift" href="#blendFunc">blendFunc</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">blendFunc(sfactor:[Int](http://api.haxe.org/Int.html)<span></span>, dfactor:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="blendFuncSeparate"><a class="lift" href="#blendFuncSeparate">blendFuncSeparate</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">blendFuncSeparate(srcRGB:[Int](http://api.haxe.org/Int.html)<span></span>, dstRGB:[Int](http://api.haxe.org/Int.html)<span></span>, srcAlpha:[Int](http://api.haxe.org/Int.html)<span></span>, dstAlpha:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="bufferData"><a class="lift" href="#bufferData">bufferData</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">bufferData(target:[Int](http://api.haxe.org/Int.html)<span></span>, data:[snow.api.buffers.ArrayBufferView](../../../../../api/snow/api/buffers/ArrayBufferView.html)<span></span>, usage:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="bufferSubData"><a class="lift" href="#bufferSubData">bufferSubData</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">bufferSubData(target:[Int](http://api.haxe.org/Int.html)<span></span>, offset:[Int](http://api.haxe.org/Int.html)<span></span>, data:[snow.api.buffers.ArrayBufferView](../../../../../api/snow/api/buffers/ArrayBufferView.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="checkFramebufferStatus"><a class="lift" href="#checkFramebufferStatus">checkFramebufferStatus</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">checkFramebufferStatus(target:[Int](http://api.haxe.org/Int.html)<span></span>) : [Int](http://api.haxe.org/Int.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="clear"><a class="lift" href="#clear">clear</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">clear(mask:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="clearColor"><a class="lift" href="#clearColor">clearColor</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">clearColor(red:[Float](http://api.haxe.org/Float.html)<span></span>, green:[Float](http://api.haxe.org/Float.html)<span></span>, blue:[Float](http://api.haxe.org/Float.html)<span></span>, alpha:[Float](http://api.haxe.org/Float.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="clearDepth"><a class="lift" href="#clearDepth">clearDepth</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">clearDepth(depth:[Float](http://api.haxe.org/Float.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="clearStencil"><a class="lift" href="#clearStencil">clearStencil</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">clearStencil(s:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="colorMask"><a class="lift" href="#colorMask">colorMask</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">colorMask(red:[Bool](http://api.haxe.org/Bool.html)<span></span>, green:[Bool](http://api.haxe.org/Bool.html)<span></span>, blue:[Bool](http://api.haxe.org/Bool.html)<span></span>, alpha:[Bool](http://api.haxe.org/Bool.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="compileShader"><a class="lift" href="#compileShader">compileShader</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">compileShader(shader:[snow.modules.opengl.native.GLShader](../../../../../api/snow/modules/opengl/native/GLShader.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="compressedTexImage2D"><a class="lift" href="#compressedTexImage2D">compressedTexImage2D</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">compressedTexImage2D(target:[Int](http://api.haxe.org/Int.html)<span></span>, level:[Int](http://api.haxe.org/Int.html)<span></span>, internalformat:[Int](http://api.haxe.org/Int.html)<span></span>, width:[Int](http://api.haxe.org/Int.html)<span></span>, height:[Int](http://api.haxe.org/Int.html)<span></span>, border:[Int](http://api.haxe.org/Int.html)<span></span>, data:[snow.api.buffers.ArrayBufferView](../../../../../api/snow/api/buffers/ArrayBufferView.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="compressedTexSubImage2D"><a class="lift" href="#compressedTexSubImage2D">compressedTexSubImage2D</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">compressedTexSubImage2D(target:[Int](http://api.haxe.org/Int.html)<span></span>, level:[Int](http://api.haxe.org/Int.html)<span></span>, xoffset:[Int](http://api.haxe.org/Int.html)<span></span>, yoffset:[Int](http://api.haxe.org/Int.html)<span></span>, width:[Int](http://api.haxe.org/Int.html)<span></span>, height:[Int](http://api.haxe.org/Int.html)<span></span>, format:[Int](http://api.haxe.org/Int.html)<span></span>, data:[snow.api.buffers.ArrayBufferView](../../../../../api/snow/api/buffers/ArrayBufferView.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="copyTexImage2D"><a class="lift" href="#copyTexImage2D">copyTexImage2D</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">copyTexImage2D(target:[Int](http://api.haxe.org/Int.html)<span></span>, level:[Int](http://api.haxe.org/Int.html)<span></span>, internalformat:[Int](http://api.haxe.org/Int.html)<span></span>, x:[Int](http://api.haxe.org/Int.html)<span></span>, y:[Int](http://api.haxe.org/Int.html)<span></span>, width:[Int](http://api.haxe.org/Int.html)<span></span>, height:[Int](http://api.haxe.org/Int.html)<span></span>, border:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="copyTexSubImage2D"><a class="lift" href="#copyTexSubImage2D">copyTexSubImage2D</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">copyTexSubImage2D(target:[Int](http://api.haxe.org/Int.html)<span></span>, level:[Int](http://api.haxe.org/Int.html)<span></span>, xoffset:[Int](http://api.haxe.org/Int.html)<span></span>, yoffset:[Int](http://api.haxe.org/Int.html)<span></span>, x:[Int](http://api.haxe.org/Int.html)<span></span>, y:[Int](http://api.haxe.org/Int.html)<span></span>, width:[Int](http://api.haxe.org/Int.html)<span></span>, height:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="createBuffer"><a class="lift" href="#createBuffer">createBuffer</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">createBuffer() : [snow.modules.opengl.native.GLBuffer](../../../../../api/snow/modules/opengl/native/GLBuffer.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="createFramebuffer"><a class="lift" href="#createFramebuffer">createFramebuffer</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">createFramebuffer() : [snow.modules.opengl.native.GLFramebuffer](../../../../../api/snow/modules/opengl/native/GLFramebuffer.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="createProgram"><a class="lift" href="#createProgram">createProgram</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">createProgram() : [snow.modules.opengl.native.GLProgram](../../../../../api/snow/modules/opengl/native/GLProgram.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="createRenderbuffer"><a class="lift" href="#createRenderbuffer">createRenderbuffer</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">createRenderbuffer() : [snow.modules.opengl.native.GLRenderbuffer](../../../../../api/snow/modules/opengl/native/GLRenderbuffer.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="createShader"><a class="lift" href="#createShader">createShader</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">createShader(type:[Int](http://api.haxe.org/Int.html)<span></span>) : [snow.modules.opengl.native.GLShader](../../../../../api/snow/modules/opengl/native/GLShader.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="createTexture"><a class="lift" href="#createTexture">createTexture</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">createTexture() : [snow.modules.opengl.native.GLTexture](../../../../../api/snow/modules/opengl/native/GLTexture.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="cullFace"><a class="lift" href="#cullFace">cullFace</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">cullFace(mode:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="deleteBuffer"><a class="lift" href="#deleteBuffer">deleteBuffer</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">deleteBuffer(buffer:[snow.modules.opengl.native.GLBuffer](../../../../../api/snow/modules/opengl/native/GLBuffer.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="deleteFramebuffer"><a class="lift" href="#deleteFramebuffer">deleteFramebuffer</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">deleteFramebuffer(framebuffer:[snow.modules.opengl.native.GLFramebuffer](../../../../../api/snow/modules/opengl/native/GLFramebuffer.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="deleteProgram"><a class="lift" href="#deleteProgram">deleteProgram</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">deleteProgram(program:[snow.modules.opengl.native.GLProgram](../../../../../api/snow/modules/opengl/native/GLProgram.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="deleteRenderbuffer"><a class="lift" href="#deleteRenderbuffer">deleteRenderbuffer</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">deleteRenderbuffer(renderbuffer:[snow.modules.opengl.native.GLRenderbuffer](../../../../../api/snow/modules/opengl/native/GLRenderbuffer.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="deleteShader"><a class="lift" href="#deleteShader">deleteShader</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">deleteShader(shader:[snow.modules.opengl.native.GLShader](../../../../../api/snow/modules/opengl/native/GLShader.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="deleteTexture"><a class="lift" href="#deleteTexture">deleteTexture</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">deleteTexture(texture:[snow.modules.opengl.native.GLTexture](../../../../../api/snow/modules/opengl/native/GLTexture.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="depthFunc"><a class="lift" href="#depthFunc">depthFunc</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">depthFunc(func:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="depthMask"><a class="lift" href="#depthMask">depthMask</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">depthMask(flag:[Bool](http://api.haxe.org/Bool.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="depthRange"><a class="lift" href="#depthRange">depthRange</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">depthRange(zNear:[Float](http://api.haxe.org/Float.html)<span></span>, zFar:[Float](http://api.haxe.org/Float.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="detachShader"><a class="lift" href="#detachShader">detachShader</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">detachShader(program:[snow.modules.opengl.native.GLProgram](../../../../../api/snow/modules/opengl/native/GLProgram.html)<span></span>, shader:[snow.modules.opengl.native.GLShader](../../../../../api/snow/modules/opengl/native/GLShader.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="disable"><a class="lift" href="#disable">disable</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">disable(cap:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="disableVertexAttribArray"><a class="lift" href="#disableVertexAttribArray">disableVertexAttribArray</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">disableVertexAttribArray(index:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="drawArrays"><a class="lift" href="#drawArrays">drawArrays</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">drawArrays(mode:[Int](http://api.haxe.org/Int.html)<span></span>, first:[Int](http://api.haxe.org/Int.html)<span></span>, count:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="drawElements"><a class="lift" href="#drawElements">drawElements</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">drawElements(mode:[Int](http://api.haxe.org/Int.html)<span></span>, count:[Int](http://api.haxe.org/Int.html)<span></span>, type:[Int](http://api.haxe.org/Int.html)<span></span>, offset:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="enable"><a class="lift" href="#enable">enable</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">enable(cap:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="enableVertexAttribArray"><a class="lift" href="#enableVertexAttribArray">enableVertexAttribArray</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">enableVertexAttribArray(index:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="finish"><a class="lift" href="#finish">finish</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">finish() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="flush"><a class="lift" href="#flush">flush</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">flush() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="framebufferRenderbuffer"><a class="lift" href="#framebufferRenderbuffer">framebufferRenderbuffer</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">framebufferRenderbuffer(target:[Int](http://api.haxe.org/Int.html)<span></span>, attachment:[Int](http://api.haxe.org/Int.html)<span></span>, renderbuffertarget:[Int](http://api.haxe.org/Int.html)<span></span>, renderbuffer:[snow.modules.opengl.native.GLRenderbuffer](../../../../../api/snow/modules/opengl/native/GLRenderbuffer.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="framebufferTexture2D"><a class="lift" href="#framebufferTexture2D">framebufferTexture2D</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">framebufferTexture2D(target:[Int](http://api.haxe.org/Int.html)<span></span>, attachment:[Int](http://api.haxe.org/Int.html)<span></span>, textarget:[Int](http://api.haxe.org/Int.html)<span></span>, texture:[snow.modules.opengl.native.GLTexture](../../../../../api/snow/modules/opengl/native/GLTexture.html)<span></span>, level:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="frontFace"><a class="lift" href="#frontFace">frontFace</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">frontFace(mode:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="generateMipmap"><a class="lift" href="#generateMipmap">generateMipmap</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">generateMipmap(target:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="getActiveAttrib"><a class="lift" href="#getActiveAttrib">getActiveAttrib</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">getActiveAttrib(program:[snow.modules.opengl.native.GLProgram](../../../../../api/snow/modules/opengl/native/GLProgram.html)<span></span>, index:[Int](http://api.haxe.org/Int.html)<span></span>) : [snow.modules.opengl.native.GLActiveInfo](../../../../../api/snow/modules/opengl/native/GLActiveInfo.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="getActiveUniform"><a class="lift" href="#getActiveUniform">getActiveUniform</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">getActiveUniform(program:[snow.modules.opengl.native.GLProgram](../../../../../api/snow/modules/opengl/native/GLProgram.html)<span></span>, index:[Int](http://api.haxe.org/Int.html)<span></span>) : [snow.modules.opengl.native.GLActiveInfo](../../../../../api/snow/modules/opengl/native/GLActiveInfo.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="getAttachedShaders"><a class="lift" href="#getAttachedShaders">getAttachedShaders</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">getAttachedShaders(program:[snow.modules.opengl.native.GLProgram](../../../../../api/snow/modules/opengl/native/GLProgram.html)<span></span>) : [Array](http://api.haxe.org/Array.html)&lt;[snow.modules.opengl.native.GLShader](../../../../../api/snow/modules/opengl/native/GLShader.html)&gt;</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="getAttribLocation"><a class="lift" href="#getAttribLocation">getAttribLocation</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">getAttribLocation(program:[snow.modules.opengl.native.GLProgram](../../../../../api/snow/modules/opengl/native/GLProgram.html)<span></span>, name:[String](http://api.haxe.org/String.html)<span></span>) : [Int](http://api.haxe.org/Int.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="getBufferParameter"><a class="lift" href="#getBufferParameter">getBufferParameter</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">getBufferParameter(target:[Int](http://api.haxe.org/Int.html)<span></span>, pname:[Int](http://api.haxe.org/Int.html)<span></span>) : [Dynamic](#)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="getContextAttributes"><a class="lift" href="#getContextAttributes">getContextAttributes</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">getContextAttributes() : [snow.modules.opengl.native.GLContextAttributes](../../../../../api/snow/modules/opengl/native/GLContextAttributes.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="getError"><a class="lift" href="#getError">getError</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">getError() : [Int](http://api.haxe.org/Int.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="getExtension"><a class="lift" href="#getExtension">getExtension</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">getExtension(name:[String](http://api.haxe.org/String.html)<span></span>) : [Dynamic](#)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="getFramebufferAttachmentParameter"><a class="lift" href="#getFramebufferAttachmentParameter">getFramebufferAttachmentParameter</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">getFramebufferAttachmentParameter(target:[Int](http://api.haxe.org/Int.html)<span></span>, attachment:[Int](http://api.haxe.org/Int.html)<span></span>, pname:[Int](http://api.haxe.org/Int.html)<span></span>) : [Dynamic](#)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="getParameter"><a class="lift" href="#getParameter">getParameter</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">getParameter(pname:[Int](http://api.haxe.org/Int.html)<span></span>) : [Dynamic](#)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="getProgramInfoLog"><a class="lift" href="#getProgramInfoLog">getProgramInfoLog</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">getProgramInfoLog(program:[snow.modules.opengl.native.GLProgram](../../../../../api/snow/modules/opengl/native/GLProgram.html)<span></span>) : [String](http://api.haxe.org/String.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="getProgramParameter"><a class="lift" href="#getProgramParameter">getProgramParameter</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">getProgramParameter(program:[snow.modules.opengl.native.GLProgram](../../../../../api/snow/modules/opengl/native/GLProgram.html)<span></span>, pname:[Int](http://api.haxe.org/Int.html)<span></span>) : [Int](http://api.haxe.org/Int.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="getRenderbufferParameter"><a class="lift" href="#getRenderbufferParameter">getRenderbufferParameter</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">getRenderbufferParameter(target:[Int](http://api.haxe.org/Int.html)<span></span>, pname:[Int](http://api.haxe.org/Int.html)<span></span>) : [Dynamic](#)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="getShaderInfoLog"><a class="lift" href="#getShaderInfoLog">getShaderInfoLog</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">getShaderInfoLog(shader:[snow.modules.opengl.native.GLShader](../../../../../api/snow/modules/opengl/native/GLShader.html)<span></span>) : [String](http://api.haxe.org/String.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="getShaderParameter"><a class="lift" href="#getShaderParameter">getShaderParameter</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">getShaderParameter(shader:[snow.modules.opengl.native.GLShader](../../../../../api/snow/modules/opengl/native/GLShader.html)<span></span>, pname:[Int](http://api.haxe.org/Int.html)<span></span>) : [Int](http://api.haxe.org/Int.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="getShaderPrecisionFormat"><a class="lift" href="#getShaderPrecisionFormat">getShaderPrecisionFormat</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">getShaderPrecisionFormat(shadertype:[Int](http://api.haxe.org/Int.html)<span></span>, precisiontype:[Int](http://api.haxe.org/Int.html)<span></span>) : [snow.modules.opengl.native.GLShaderPrecisionFormat](../../../../../api/snow/modules/opengl/native/GLShaderPrecisionFormat.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="getShaderSource"><a class="lift" href="#getShaderSource">getShaderSource</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">getShaderSource(shader:[snow.modules.opengl.native.GLShader](../../../../../api/snow/modules/opengl/native/GLShader.html)<span></span>) : [String](http://api.haxe.org/String.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="getSupportedExtensions"><a class="lift" href="#getSupportedExtensions">getSupportedExtensions</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">getSupportedExtensions() : [Array](http://api.haxe.org/Array.html)&lt;[String](http://api.haxe.org/String.html)&gt;</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="getTexParameter"><a class="lift" href="#getTexParameter">getTexParameter</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">getTexParameter(target:[Int](http://api.haxe.org/Int.html)<span></span>, pname:[Int](http://api.haxe.org/Int.html)<span></span>) : [Dynamic](#)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="getUniform"><a class="lift" href="#getUniform">getUniform</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">getUniform(program:[snow.modules.opengl.native.GLProgram](../../../../../api/snow/modules/opengl/native/GLProgram.html)<span></span>, location:[snow.modules.opengl.native.GLUniformLocation](../../../../../api/snow/modules/opengl/native/GLUniformLocation.html)<span></span>) : [Dynamic](#)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="getUniformLocation"><a class="lift" href="#getUniformLocation">getUniformLocation</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">getUniformLocation(program:[snow.modules.opengl.native.GLProgram](../../../../../api/snow/modules/opengl/native/GLProgram.html)<span></span>, name:[String](http://api.haxe.org/String.html)<span></span>) : [Dynamic](#)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="getVertexAttrib"><a class="lift" href="#getVertexAttrib">getVertexAttrib</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">getVertexAttrib(index:[Int](http://api.haxe.org/Int.html)<span></span>, pname:[Int](http://api.haxe.org/Int.html)<span></span>) : [Dynamic](#)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="getVertexAttribOffset"><a class="lift" href="#getVertexAttribOffset">getVertexAttribOffset</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">getVertexAttribOffset(index:[Int](http://api.haxe.org/Int.html)<span></span>, pname:[Int](http://api.haxe.org/Int.html)<span></span>) : [Int](http://api.haxe.org/Int.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="hint"><a class="lift" href="#hint">hint</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">hint(target:[Int](http://api.haxe.org/Int.html)<span></span>, mode:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="isBuffer"><a class="lift" href="#isBuffer">isBuffer</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">isBuffer(buffer:[snow.modules.opengl.native.GLBuffer](../../../../../api/snow/modules/opengl/native/GLBuffer.html)<span></span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="isEnabled"><a class="lift" href="#isEnabled">isEnabled</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">isEnabled(cap:[Int](http://api.haxe.org/Int.html)<span></span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="isFramebuffer"><a class="lift" href="#isFramebuffer">isFramebuffer</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">isFramebuffer(framebuffer:[snow.modules.opengl.native.GLFramebuffer](../../../../../api/snow/modules/opengl/native/GLFramebuffer.html)<span></span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="isProgram"><a class="lift" href="#isProgram">isProgram</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">isProgram(program:[snow.modules.opengl.native.GLProgram](../../../../../api/snow/modules/opengl/native/GLProgram.html)<span></span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="isRenderbuffer"><a class="lift" href="#isRenderbuffer">isRenderbuffer</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">isRenderbuffer(renderbuffer:[snow.modules.opengl.native.GLRenderbuffer](../../../../../api/snow/modules/opengl/native/GLRenderbuffer.html)<span></span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="isShader"><a class="lift" href="#isShader">isShader</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">isShader(shader:[snow.modules.opengl.native.GLShader](../../../../../api/snow/modules/opengl/native/GLShader.html)<span></span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="isTexture"><a class="lift" href="#isTexture">isTexture</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">isTexture(texture:[snow.modules.opengl.native.GLTexture](../../../../../api/snow/modules/opengl/native/GLTexture.html)<span></span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="lineWidth"><a class="lift" href="#lineWidth">lineWidth</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">lineWidth(width:[Float](http://api.haxe.org/Float.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="linkProgram"><a class="lift" href="#linkProgram">linkProgram</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">linkProgram(program:[snow.modules.opengl.native.GLProgram](../../../../../api/snow/modules/opengl/native/GLProgram.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="pixelStorei"><a class="lift" href="#pixelStorei">pixelStorei</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">pixelStorei(pname:[Int](http://api.haxe.org/Int.html)<span></span>, param:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="polygonOffset"><a class="lift" href="#polygonOffset">polygonOffset</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">polygonOffset(factor:[Float](http://api.haxe.org/Float.html)<span></span>, units:[Float](http://api.haxe.org/Float.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="readPixels"><a class="lift" href="#readPixels">readPixels</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">readPixels(x:[Int](http://api.haxe.org/Int.html)<span></span>, y:[Int](http://api.haxe.org/Int.html)<span></span>, width:[Int](http://api.haxe.org/Int.html)<span></span>, height:[Int](http://api.haxe.org/Int.html)<span></span>, format:[Int](http://api.haxe.org/Int.html)<span></span>, type:[Int](http://api.haxe.org/Int.html)<span></span>, data:[snow.api.buffers.ArrayBufferView](../../../../../api/snow/api/buffers/ArrayBufferView.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="renderbufferStorage"><a class="lift" href="#renderbufferStorage">renderbufferStorage</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">renderbufferStorage(target:[Int](http://api.haxe.org/Int.html)<span></span>, internalformat:[Int](http://api.haxe.org/Int.html)<span></span>, width:[Int](http://api.haxe.org/Int.html)<span></span>, height:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="sampleCoverage"><a class="lift" href="#sampleCoverage">sampleCoverage</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">sampleCoverage(value:[Float](http://api.haxe.org/Float.html)<span></span>, invert:[Bool](http://api.haxe.org/Bool.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="scissor"><a class="lift" href="#scissor">scissor</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">scissor(x:[Int](http://api.haxe.org/Int.html)<span></span>, y:[Int](http://api.haxe.org/Int.html)<span></span>, width:[Int](http://api.haxe.org/Int.html)<span></span>, height:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="shaderSource"><a class="lift" href="#shaderSource">shaderSource</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">shaderSource(shader:[snow.modules.opengl.native.GLShader](../../../../../api/snow/modules/opengl/native/GLShader.html)<span></span>, source:[String](http://api.haxe.org/String.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="stencilFunc"><a class="lift" href="#stencilFunc">stencilFunc</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">stencilFunc(func:[Int](http://api.haxe.org/Int.html)<span></span>, ref:[Int](http://api.haxe.org/Int.html)<span></span>, mask:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="stencilFuncSeparate"><a class="lift" href="#stencilFuncSeparate">stencilFuncSeparate</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">stencilFuncSeparate(face:[Int](http://api.haxe.org/Int.html)<span></span>, func:[Int](http://api.haxe.org/Int.html)<span></span>, ref:[Int](http://api.haxe.org/Int.html)<span></span>, mask:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="stencilMask"><a class="lift" href="#stencilMask">stencilMask</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">stencilMask(mask:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="stencilMaskSeparate"><a class="lift" href="#stencilMaskSeparate">stencilMaskSeparate</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">stencilMaskSeparate(face:[Int](http://api.haxe.org/Int.html)<span></span>, mask:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="stencilOp"><a class="lift" href="#stencilOp">stencilOp</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">stencilOp(fail:[Int](http://api.haxe.org/Int.html)<span></span>, zfail:[Int](http://api.haxe.org/Int.html)<span></span>, zpass:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="stencilOpSeparate"><a class="lift" href="#stencilOpSeparate">stencilOpSeparate</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">stencilOpSeparate(face:[Int](http://api.haxe.org/Int.html)<span></span>, fail:[Int](http://api.haxe.org/Int.html)<span></span>, zfail:[Int](http://api.haxe.org/Int.html)<span></span>, zpass:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="texImage2D"><a class="lift" href="#texImage2D">texImage2D</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">texImage2D(target:[Int](http://api.haxe.org/Int.html)<span></span>, level:[Int](http://api.haxe.org/Int.html)<span></span>, internalformat:[Int](http://api.haxe.org/Int.html)<span></span>, width:[Int](http://api.haxe.org/Int.html)<span></span>, height:[Int](http://api.haxe.org/Int.html)<span></span>, border:[Int](http://api.haxe.org/Int.html)<span></span>, format:[Int](http://api.haxe.org/Int.html)<span></span>, type:[Int](http://api.haxe.org/Int.html)<span></span>, data:[snow.api.buffers.ArrayBufferView](../../../../../api/snow/api/buffers/ArrayBufferView.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="texParameterf"><a class="lift" href="#texParameterf">texParameterf</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">texParameterf(target:[Int](http://api.haxe.org/Int.html)<span></span>, pname:[Int](http://api.haxe.org/Int.html)<span></span>, param:[Float](http://api.haxe.org/Float.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="texParameteri"><a class="lift" href="#texParameteri">texParameteri</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">texParameteri(target:[Int](http://api.haxe.org/Int.html)<span></span>, pname:[Int](http://api.haxe.org/Int.html)<span></span>, param:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="texSubImage2D"><a class="lift" href="#texSubImage2D">texSubImage2D</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">texSubImage2D(target:[Int](http://api.haxe.org/Int.html)<span></span>, level:[Int](http://api.haxe.org/Int.html)<span></span>, xoffset:[Int](http://api.haxe.org/Int.html)<span></span>, yoffset:[Int](http://api.haxe.org/Int.html)<span></span>, width:[Int](http://api.haxe.org/Int.html)<span></span>, height:[Int](http://api.haxe.org/Int.html)<span></span>, format:[Int](http://api.haxe.org/Int.html)<span></span>, type:[Int](http://api.haxe.org/Int.html)<span></span>, data:[snow.api.buffers.ArrayBufferView](../../../../../api/snow/api/buffers/ArrayBufferView.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="uniform1f"><a class="lift" href="#uniform1f">uniform1f</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">uniform1f(location:[snow.modules.opengl.native.GLUniformLocation](../../../../../api/snow/modules/opengl/native/GLUniformLocation.html)<span></span>, x:[Float](http://api.haxe.org/Float.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="uniform1fv"><a class="lift" href="#uniform1fv">uniform1fv</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">uniform1fv(location:[snow.modules.opengl.native.GLUniformLocation](../../../../../api/snow/modules/opengl/native/GLUniformLocation.html)<span></span>, data:[snow.api.buffers.Float32Array](../../../../../api/snow/api/buffers/Float32Array.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="uniform1i"><a class="lift" href="#uniform1i">uniform1i</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">uniform1i(location:[snow.modules.opengl.native.GLUniformLocation](../../../../../api/snow/modules/opengl/native/GLUniformLocation.html)<span></span>, x:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="uniform1iv"><a class="lift" href="#uniform1iv">uniform1iv</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">uniform1iv(location:[snow.modules.opengl.native.GLUniformLocation](../../../../../api/snow/modules/opengl/native/GLUniformLocation.html)<span></span>, data:[snow.api.buffers.Int32Array](../../../../../api/snow/api/buffers/Int32Array.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="uniform2f"><a class="lift" href="#uniform2f">uniform2f</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">uniform2f(location:[snow.modules.opengl.native.GLUniformLocation](../../../../../api/snow/modules/opengl/native/GLUniformLocation.html)<span></span>, x:[Float](http://api.haxe.org/Float.html)<span></span>, y:[Float](http://api.haxe.org/Float.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="uniform2fv"><a class="lift" href="#uniform2fv">uniform2fv</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">uniform2fv(location:[snow.modules.opengl.native.GLUniformLocation](../../../../../api/snow/modules/opengl/native/GLUniformLocation.html)<span></span>, data:[snow.api.buffers.Float32Array](../../../../../api/snow/api/buffers/Float32Array.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="uniform2i"><a class="lift" href="#uniform2i">uniform2i</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">uniform2i(location:[snow.modules.opengl.native.GLUniformLocation](../../../../../api/snow/modules/opengl/native/GLUniformLocation.html)<span></span>, x:[Int](http://api.haxe.org/Int.html)<span></span>, y:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="uniform2iv"><a class="lift" href="#uniform2iv">uniform2iv</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">uniform2iv(location:[snow.modules.opengl.native.GLUniformLocation](../../../../../api/snow/modules/opengl/native/GLUniformLocation.html)<span></span>, data:[snow.api.buffers.Int32Array](../../../../../api/snow/api/buffers/Int32Array.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="uniform3f"><a class="lift" href="#uniform3f">uniform3f</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">uniform3f(location:[snow.modules.opengl.native.GLUniformLocation](../../../../../api/snow/modules/opengl/native/GLUniformLocation.html)<span></span>, x:[Float](http://api.haxe.org/Float.html)<span></span>, y:[Float](http://api.haxe.org/Float.html)<span></span>, z:[Float](http://api.haxe.org/Float.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="uniform3fv"><a class="lift" href="#uniform3fv">uniform3fv</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">uniform3fv(location:[snow.modules.opengl.native.GLUniformLocation](../../../../../api/snow/modules/opengl/native/GLUniformLocation.html)<span></span>, data:[snow.api.buffers.Float32Array](../../../../../api/snow/api/buffers/Float32Array.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="uniform3i"><a class="lift" href="#uniform3i">uniform3i</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">uniform3i(location:[snow.modules.opengl.native.GLUniformLocation](../../../../../api/snow/modules/opengl/native/GLUniformLocation.html)<span></span>, x:[Int](http://api.haxe.org/Int.html)<span></span>, y:[Int](http://api.haxe.org/Int.html)<span></span>, z:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="uniform3iv"><a class="lift" href="#uniform3iv">uniform3iv</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">uniform3iv(location:[snow.modules.opengl.native.GLUniformLocation](../../../../../api/snow/modules/opengl/native/GLUniformLocation.html)<span></span>, data:[snow.api.buffers.Int32Array](../../../../../api/snow/api/buffers/Int32Array.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="uniform4f"><a class="lift" href="#uniform4f">uniform4f</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">uniform4f(location:[snow.modules.opengl.native.GLUniformLocation](../../../../../api/snow/modules/opengl/native/GLUniformLocation.html)<span></span>, x:[Float](http://api.haxe.org/Float.html)<span></span>, y:[Float](http://api.haxe.org/Float.html)<span></span>, z:[Float](http://api.haxe.org/Float.html)<span></span>, w:[Float](http://api.haxe.org/Float.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="uniform4fv"><a class="lift" href="#uniform4fv">uniform4fv</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">uniform4fv(location:[snow.modules.opengl.native.GLUniformLocation](../../../../../api/snow/modules/opengl/native/GLUniformLocation.html)<span></span>, data:[snow.api.buffers.Float32Array](../../../../../api/snow/api/buffers/Float32Array.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="uniform4i"><a class="lift" href="#uniform4i">uniform4i</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">uniform4i(location:[snow.modules.opengl.native.GLUniformLocation](../../../../../api/snow/modules/opengl/native/GLUniformLocation.html)<span></span>, x:[Int](http://api.haxe.org/Int.html)<span></span>, y:[Int](http://api.haxe.org/Int.html)<span></span>, z:[Int](http://api.haxe.org/Int.html)<span></span>, w:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="uniform4iv"><a class="lift" href="#uniform4iv">uniform4iv</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">uniform4iv(location:[snow.modules.opengl.native.GLUniformLocation](../../../../../api/snow/modules/opengl/native/GLUniformLocation.html)<span></span>, data:[snow.api.buffers.Int32Array](../../../../../api/snow/api/buffers/Int32Array.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="uniformMatrix2fv"><a class="lift" href="#uniformMatrix2fv">uniformMatrix2fv</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">uniformMatrix2fv(location:[snow.modules.opengl.native.GLUniformLocation](../../../../../api/snow/modules/opengl/native/GLUniformLocation.html)<span></span>, transpose:[Bool](http://api.haxe.org/Bool.html)<span></span>, data:[snow.api.buffers.Float32Array](../../../../../api/snow/api/buffers/Float32Array.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="uniformMatrix3fv"><a class="lift" href="#uniformMatrix3fv">uniformMatrix3fv</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">uniformMatrix3fv(location:[snow.modules.opengl.native.GLUniformLocation](../../../../../api/snow/modules/opengl/native/GLUniformLocation.html)<span></span>, transpose:[Bool](http://api.haxe.org/Bool.html)<span></span>, data:[snow.api.buffers.Float32Array](../../../../../api/snow/api/buffers/Float32Array.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="uniformMatrix4fv"><a class="lift" href="#uniformMatrix4fv">uniformMatrix4fv</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">uniformMatrix4fv(location:[snow.modules.opengl.native.GLUniformLocation](../../../../../api/snow/modules/opengl/native/GLUniformLocation.html)<span></span>, transpose:[Bool](http://api.haxe.org/Bool.html)<span></span>, data:[snow.api.buffers.Float32Array](../../../../../api/snow/api/buffers/Float32Array.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="useProgram"><a class="lift" href="#useProgram">useProgram</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">useProgram(program:[snow.modules.opengl.native.GLProgram](../../../../../api/snow/modules/opengl/native/GLProgram.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="validateProgram"><a class="lift" href="#validateProgram">validateProgram</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">validateProgram(program:[snow.modules.opengl.native.GLProgram](../../../../../api/snow/modules/opengl/native/GLProgram.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="versionString"><a class="lift" href="#versionString">versionString</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">versionString() : [String](http://api.haxe.org/String.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="vertexAttrib1f"><a class="lift" href="#vertexAttrib1f">vertexAttrib1f</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">vertexAttrib1f(indx:[Int](http://api.haxe.org/Int.html)<span></span>, x:[Float](http://api.haxe.org/Float.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="vertexAttrib1fv"><a class="lift" href="#vertexAttrib1fv">vertexAttrib1fv</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">vertexAttrib1fv(indx:[Int](http://api.haxe.org/Int.html)<span></span>, data:[snow.api.buffers.Float32Array](../../../../../api/snow/api/buffers/Float32Array.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="vertexAttrib2f"><a class="lift" href="#vertexAttrib2f">vertexAttrib2f</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">vertexAttrib2f(indx:[Int](http://api.haxe.org/Int.html)<span></span>, x:[Float](http://api.haxe.org/Float.html)<span></span>, y:[Float](http://api.haxe.org/Float.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="vertexAttrib2fv"><a class="lift" href="#vertexAttrib2fv">vertexAttrib2fv</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">vertexAttrib2fv(indx:[Int](http://api.haxe.org/Int.html)<span></span>, data:[snow.api.buffers.Float32Array](../../../../../api/snow/api/buffers/Float32Array.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="vertexAttrib3f"><a class="lift" href="#vertexAttrib3f">vertexAttrib3f</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">vertexAttrib3f(indx:[Int](http://api.haxe.org/Int.html)<span></span>, x:[Float](http://api.haxe.org/Float.html)<span></span>, y:[Float](http://api.haxe.org/Float.html)<span></span>, z:[Float](http://api.haxe.org/Float.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="vertexAttrib3fv"><a class="lift" href="#vertexAttrib3fv">vertexAttrib3fv</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">vertexAttrib3fv(indx:[Int](http://api.haxe.org/Int.html)<span></span>, data:[snow.api.buffers.Float32Array](../../../../../api/snow/api/buffers/Float32Array.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="vertexAttrib4f"><a class="lift" href="#vertexAttrib4f">vertexAttrib4f</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">vertexAttrib4f(indx:[Int](http://api.haxe.org/Int.html)<span></span>, x:[Float](http://api.haxe.org/Float.html)<span></span>, y:[Float](http://api.haxe.org/Float.html)<span></span>, z:[Float](http://api.haxe.org/Float.html)<span></span>, w:[Float](http://api.haxe.org/Float.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="vertexAttrib4fv"><a class="lift" href="#vertexAttrib4fv">vertexAttrib4fv</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">vertexAttrib4fv(indx:[Int](http://api.haxe.org/Int.html)<span></span>, data:[snow.api.buffers.Float32Array](../../../../../api/snow/api/buffers/Float32Array.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="vertexAttribPointer"><a class="lift" href="#vertexAttribPointer">vertexAttribPointer</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">vertexAttribPointer(indx:[Int](http://api.haxe.org/Int.html)<span></span>, size:[Int](http://api.haxe.org/Int.html)<span></span>, type:[Int](http://api.haxe.org/Int.html)<span></span>, normalized:[Bool](http://api.haxe.org/Bool.html)<span></span>, stride:[Int](http://api.haxe.org/Int.html)<span></span>, offset:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="viewport"><a class="lift" href="#viewport">viewport</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">viewport(x:[Int](http://api.haxe.org/Int.html)<span></span>, y:[Int](http://api.haxe.org/Int.html)<span></span>, width:[Int](http://api.haxe.org/Int.html)<span></span>, height:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>



<hr/>

&nbsp;
&nbsp;
&nbsp;
&nbsp;