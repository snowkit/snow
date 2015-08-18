
[![Logo](../images/logo.png)](../index.html)

<hr/>
<a href="#" id="search_bar" onclick="return;"><div> search API <em>(or start typing anywhere)</em> </div></a>
<hr/>

<script src="../js/omnibar.js"> </script>
<link rel="stylesheet" type="text/css" href="../css/omnibar.css" media="all">

<div id="omnibar"> <a href="#" onclick="return" id="omnibar_close"></a> <input id="omnibar_text" type="text" placeholder="search types..."></input></div>
<script  id="typelist" data-relpath="../" data-types="snow.App,snow.AppFixedTimestep,snow.Snow,snow._Snow.Core,snow.api.Debug,snow.api.DebugError,snow.api.File,snow.api.FileHandle,snow.api.FileSeek,snow.api.Libs,snow.api.Promise,snow.api.PromiseError,snow.api.PromiseState,snow.api.Promises,snow.api.Timer,snow.api._Debug.LogError,snow.api._File.FileHandle_Impl_,snow.api._File.FileSeek_Impl_,snow.api._Promise.PromiseState_Impl_,snow.api.buffers.ArrayBuffer,snow.api.buffers.ArrayBufferIO,snow.api.buffers.ArrayBufferView,snow.api.buffers.DataView,snow.api.buffers.Float32Array,snow.api.buffers.Float64Array,snow.api.buffers.Int16Array,snow.api.buffers.Int32Array,snow.api.buffers.Int8Array,snow.api.buffers.TAError,snow.api.buffers.TypedArrayType,snow.api.buffers.Uint16Array,snow.api.buffers.Uint32Array,snow.api.buffers.Uint8Array,snow.api.buffers.Uint8ClampedArray,snow.api.buffers._ArrayBuffer.ArrayBuffer_Impl_,snow.api.buffers._Float32Array.Float32Array_Impl_,snow.api.buffers._Float64Array.Float64Array_Impl_,snow.api.buffers._Int16Array.Int16Array_Impl_,snow.api.buffers._Int32Array.Int32Array_Impl_,snow.api.buffers._Int8Array.Int8Array_Impl_,snow.api.buffers._TypedArrayType.TypedArrayType_Impl_,snow.api.buffers._Uint16Array.Uint16Array_Impl_,snow.api.buffers._Uint32Array.Uint32Array_Impl_,snow.api.buffers._Uint8Array.Uint8Array_Impl_,snow.api.buffers._Uint8ClampedArray.Uint8ClampedArray_Impl_,snow.core.native.Core,snow.core.native._Core.StaticSnow,snow.core.native.assets.Assets,snow.core.native.assets._Assets.NativeAudioDataBlob,snow.core.native.assets._Assets.NativeAudioDataInfo,snow.core.native.assets._Assets.NativeAudioInfo,snow.core.native.audio.Audio,snow.core.native.audio.Sound,snow.core.native.input.Input,snow.core.native.io.IO,snow.core.native.window.Windowing,snow.core.web.assets.psd.PSD,snow.core.web.input.DOMKeys,snow.modules.interfaces.Assets,snow.modules.interfaces.Audio,snow.modules.interfaces.IO,snow.modules.interfaces.Input,snow.modules.interfaces.Windowing,snow.modules.openal.AL,snow.modules.openal.ALC,snow.modules.openal.ALHelper,snow.modules.openal.Audio,snow.modules.openal.Context,snow.modules.openal.Device,snow.modules.openal.Sound,snow.modules.openal._AL.Context_Impl_,snow.modules.openal._AL.Device_Impl_,snow.modules.openal.sound.ALSound,snow.modules.openal.sound.ALStream,snow.modules.openal.sound.Sound,snow.modules.opengl.GL,snow.modules.opengl.GLActiveInfo,snow.modules.opengl.GLBuffer,snow.modules.opengl.GLContextAttributes,snow.modules.opengl.GLFramebuffer,snow.modules.opengl.GLProgram,snow.modules.opengl.GLRenderbuffer,snow.modules.opengl.GLShader,snow.modules.opengl.GLTexture,snow.modules.opengl.GLUniformLocation,snow.modules.opengl.native.GL,snow.modules.opengl.native.GLActiveInfo,snow.modules.opengl.native.GLBO,snow.modules.opengl.native.GLBuffer,snow.modules.opengl.native.GLContextAttributes,snow.modules.opengl.native.GLFBO,snow.modules.opengl.native.GLFramebuffer,snow.modules.opengl.native.GLLink,snow.modules.opengl.native.GLObject,snow.modules.opengl.native.GLPO,snow.modules.opengl.native.GLProgram,snow.modules.opengl.native.GLProxy,snow.modules.opengl.native.GLRBO,snow.modules.opengl.native.GLRenderbuffer,snow.modules.opengl.native.GLSO,snow.modules.opengl.native.GLShader,snow.modules.opengl.native.GLShaderPrecisionFormat,snow.modules.opengl.native.GLTO,snow.modules.opengl.native.GLTexture,snow.modules.opengl.native.GLUniformLocation,snow.modules.opengl.native.GL_FFI,snow.modules.opengl.native.GL_Native,snow.modules.opengl.native._GL.GLBuffer_Impl_,snow.modules.opengl.native._GL.GLFramebuffer_Impl_,snow.modules.opengl.native._GL.GLProgram_Impl_,snow.modules.opengl.native._GL.GLRenderbuffer_Impl_,snow.modules.opengl.native._GL.GLShader_Impl_,snow.modules.opengl.native._GL.GLTexture_Impl_,snow.modules.opengl.native._GL.GLUniformLocation_Impl_,snow.modules.sdl.ControllerEventType,snow.modules.sdl.Input,snow.modules.sdl.KeyEventType,snow.modules.sdl.ModValue,snow.modules.sdl.MouseEventType,snow.modules.sdl.TouchEventType,snow.modules.sdl.Windowing,snow.modules.sdl._Input.ControllerEventType_Impl_,snow.modules.sdl._Input.KeyEventType_Impl_,snow.modules.sdl._Input.ModValue_Impl_,snow.modules.sdl._Input.MouseEventType_Impl_,snow.modules.sdl._Input.TouchEventType_Impl_,snow.system.assets.Asset,snow.system.assets.AssetBytes,snow.system.assets.AssetImage,snow.system.assets.AssetJSON,snow.system.assets.AssetText,snow.system.assets.Assets,snow.system.assets._Assets.AssetsModule,snow.system.audio.Audio,snow.system.audio.AudioModule,snow.system.audio.Sound,snow.system.input.Input,snow.system.input.Keycodes,snow.system.input.MapIntBool,snow.system.input.MapIntFloat,snow.system.input.Scancodes,snow.system.input._Input.InputModule,snow.system.io.IO,snow.system.io._IO.IOModule,snow.system.module.Assets,snow.system.module.Audio,snow.system.module.IO,snow.system.module.Input,snow.system.module.Sound,snow.system.module.Windowing,snow.system.window.Window,snow.system.window.Windowing,snow.system.window._Windowing.WindowHandleMap,snow.system.window._Windowing.WindowingModule,snow.types.AppConfig,snow.types.AppConfigNative,snow.types.AppConfigWeb,snow.types.Asset,snow.types.AssetBytes,snow.types.AssetImage,snow.types.AssetJSON,snow.types.AssetText,snow.types.AssetType,snow.types.AudioDataBlob,snow.types.AudioDataInfo,snow.types.AudioFormatType,snow.types.AudioHandle,snow.types.AudioInfo,snow.types.DisplayMode,snow.types.Error,snow.types.FileEvent,snow.types.FileEventType,snow.types.FileFilter,snow.types.GamepadDeviceEventType,snow.types.IODataOptions,snow.types.ImageInfo,snow.types.InputEvent,snow.types.InputEventType,snow.types.Key,snow.types.ModState,snow.types.OS,snow.types.OpenGLProfile,snow.types.Platform,snow.types.RenderConfig,snow.types.RenderConfigOpenGL,snow.types.Scan,snow.types.SnowConfig,snow.types.SystemEvent,snow.types.SystemEventType,snow.types.TextEventType,snow.types.WindowConfig,snow.types.WindowEvent,snow.types.WindowEventType,snow.types.WindowHandle,snow.types.WindowingConfig,snow.types._Types.AssetType_Impl_,snow.types._Types.AudioFormatType_Impl_,snow.types._Types.FileEventType_Impl_,snow.types._Types.GamepadDeviceEventType_Impl_,snow.types._Types.InputEventType_Impl_,snow.types._Types.OS_Impl_,snow.types._Types.OpenGLProfile_Impl_,snow.types._Types.Platform_Impl_,snow.types._Types.SystemEventType_Impl_,snow.types._Types.TextEventType_Impl_,snow.types._Types.WindowEventType_Impl_"></script>

## Packages


<h4 class="package-root">[snow](#snow)</h4>

&emsp;&emsp;
<span class="package_item inline-block"> [api](#snow.api) </span><span class="package_item inline-block"> [core](#snow.core) </span><span class="package_item inline-block"> [modules](#snow.modules) </span><span class="package_item inline-block"> [system](#snow.system) </span><span class="package_item inline-block"> [types](#snow.types) </span>
<br/><hr/>
## Types


   
   <a name="empty"><h5> [_no package_](#empty) </h5></a>



<a name="snow"><h3> [snow](#snow) </h3></a><div class="package-node">&bull; [App](snow/App.html) </div> <br/><div class="package-node">&bull; [AppFixedTimestep](snow/AppFixedTimestep.html) </div> <br/><div class="package-node">&bull; [Snow](snow/Snow.html) </div> <br/>
<div class="indent">

<a name="snow.api"><h3> [api](#snow.api) </h3></a><div class="package-node">&bull; [Debug](snow/api/Debug.html) </div><br/><div class="package-node">&bull; [DebugError](snow/api/DebugError.html) </div><br/><div class="package-node">&bull; [File](snow/api/File.html) </div><br/><div class="package-node">&bull; [FileHandle](snow/api/FileHandle.html) </div><br/><div class="package-node">&bull; [FileSeek](snow/api/FileSeek.html) </div><br/><div class="package-node">&bull; [Libs](snow/api/Libs.html) </div><br/><div class="package-node">&bull; [Promise](snow/api/Promise.html) </div><br/><div class="package-node">&bull; [PromiseError](snow/api/PromiseError.html) </div><br/><div class="package-node">&bull; [PromiseState](snow/api/PromiseState.html) </div><br/><div class="package-node">&bull; [Promises](snow/api/Promises.html) </div><br/><div class="package-node">&bull; [Timer](snow/api/Timer.html) </div><br/>
<div class="indent">

</div><div class="indent">

</div><div class="indent">

</div><div class="indent">
<a name="snow.api.buffers"><h3> [buffers](#snow.api.buffers) </h3></a><div class="package-node">&bull; [ArrayBuffer](snow/api/buffers/ArrayBuffer.html) </div> <br/><div class="package-node">&bull; [ArrayBufferIO](snow/api/buffers/ArrayBufferIO.html) </div> <br/><div class="package-node">&bull; [ArrayBufferView](snow/api/buffers/ArrayBufferView.html) </div> <br/><div class="package-node">&bull; [DataView](snow/api/buffers/DataView.html) </div> <br/><div class="package-node">&bull; [Float32Array](snow/api/buffers/Float32Array.html) </div> <br/><div class="package-node">&bull; [Float64Array](snow/api/buffers/Float64Array.html) </div> <br/><div class="package-node">&bull; [Int16Array](snow/api/buffers/Int16Array.html) </div> <br/><div class="package-node">&bull; [Int32Array](snow/api/buffers/Int32Array.html) </div> <br/><div class="package-node">&bull; [Int8Array](snow/api/buffers/Int8Array.html) </div> <br/><div class="package-node">&bull; [TAError](snow/api/buffers/TAError.html) </div> <br/><div class="package-node">&bull; [TypedArrayType](snow/api/buffers/TypedArrayType.html) </div> <br/><div class="package-node">&bull; [Uint16Array](snow/api/buffers/Uint16Array.html) </div> <br/><div class="package-node">&bull; [Uint32Array](snow/api/buffers/Uint32Array.html) </div> <br/><div class="package-node">&bull; [Uint8Array](snow/api/buffers/Uint8Array.html) </div> <br/><div class="package-node">&bull; [Uint8ClampedArray](snow/api/buffers/Uint8ClampedArray.html) </div> <br/>
</div>
</div><div class="indent">

<a name="snow.core"><h3> [core](#snow.core) </h3></a>
<div class="indent">
<a name="snow.core.native"><h3> [native](#snow.core.native) </h3></a>
<div class="indent">

<a name="snow.core.native.assets"><h3> [assets](#snow.core.native.assets) </h3></a><div class="package-node">&bull; [Assets](snow/core/native/assets/Assets.html) </div><br/>
<div class="indent">

</div>
</div><div class="indent">

<a name="snow.core.native.audio"><h3> [audio](#snow.core.native.audio) </h3></a><div class="package-node">&bull; [Audio](snow/core/native/audio/Audio.html) </div><br/><div class="package-node">&bull; [Sound](snow/core/native/audio/Sound.html) </div><br/>

</div><div class="indent">

<a name="snow.core.native.input"><h3> [input](#snow.core.native.input) </h3></a><div class="package-node">&bull; [Input](snow/core/native/input/Input.html) </div><br/>

</div><div class="indent">

<a name="snow.core.native.io"><h3> [io](#snow.core.native.io) </h3></a><div class="package-node">&bull; [IO](snow/core/native/io/IO.html) </div><br/>

</div><div class="indent">

<a name="snow.core.native.window"><h3> [window](#snow.core.native.window) </h3></a><div class="package-node">&bull; [Windowing](snow/core/native/window/Windowing.html) </div><br/>

</div></div><div class="indent">
<a name="snow.core.web"><h3> [web](#snow.core.web) </h3></a>
<div class="indent">

<a name="snow.core.web.assets"><h3> [assets](#snow.core.web.assets) </h3></a>
<div class="indent">
<a name="snow.core.web.assets.psd"><h3> [psd](#snow.core.web.assets.psd) </h3></a><div class="package-node">&bull; [PSD](snow/core/web/assets/psd/PSD.html) </div> <br/>
</div>
</div><div class="indent">

<a name="snow.core.web.input"><h3> [input](#snow.core.web.input) </h3></a>

</div></div>
</div><div class="indent">

<a name="snow.modules"><h3> [modules](#snow.modules) </h3></a>
<div class="indent">
<a name="snow.modules.interfaces"><h3> [interfaces](#snow.modules.interfaces) </h3></a>
</div><div class="indent">
<a name="snow.modules.openal"><h3> [openal](#snow.modules.openal) </h3></a><div class="package-node">&bull; [AL](snow/modules/openal/AL.html) </div> <br/><div class="package-node">&bull; [ALC](snow/modules/openal/ALC.html) </div> <br/><div class="package-node">&bull; [Context](snow/modules/openal/Context.html) </div> <br/><div class="package-node">&bull; [Device](snow/modules/openal/Device.html) </div> <br/>
<div class="indent">

<a name="snow.modules.openal.sound"><h3> [sound](#snow.modules.openal.sound) </h3></a>

</div></div><div class="indent">
<a name="snow.modules.opengl"><h3> [opengl](#snow.modules.opengl) </h3></a><div class="package-node">&bull; [GL](snow/modules/opengl/GL.html) </div> <br/><div class="package-node">&bull; [GLActiveInfo](snow/modules/opengl/GLActiveInfo.html) </div> <br/><div class="package-node">&bull; [GLBuffer](snow/modules/opengl/GLBuffer.html) </div> <br/><div class="package-node">&bull; [GLContextAttributes](snow/modules/opengl/GLContextAttributes.html) </div> <br/><div class="package-node">&bull; [GLFramebuffer](snow/modules/opengl/GLFramebuffer.html) </div> <br/><div class="package-node">&bull; [GLProgram](snow/modules/opengl/GLProgram.html) </div> <br/><div class="package-node">&bull; [GLRenderbuffer](snow/modules/opengl/GLRenderbuffer.html) </div> <br/><div class="package-node">&bull; [GLShader](snow/modules/opengl/GLShader.html) </div> <br/><div class="package-node">&bull; [GLTexture](snow/modules/opengl/GLTexture.html) </div> <br/><div class="package-node">&bull; [GLUniformLocation](snow/modules/opengl/GLUniformLocation.html) </div> <br/>
<div class="indent">

<a name="snow.modules.opengl.native"><h3> [native](#snow.modules.opengl.native) </h3></a><div class="package-node">&bull; [GL](snow/modules/opengl/native/GL.html) </div><br/><div class="package-node">&bull; [GLActiveInfo](snow/modules/opengl/native/GLActiveInfo.html) </div><br/><div class="package-node">&bull; [GLBuffer](snow/modules/opengl/native/GLBuffer.html) </div><br/><div class="package-node">&bull; [GLContextAttributes](snow/modules/opengl/native/GLContextAttributes.html) </div><br/><div class="package-node">&bull; [GLFramebuffer](snow/modules/opengl/native/GLFramebuffer.html) </div><br/><div class="package-node">&bull; [GLLink](snow/modules/opengl/native/GLLink.html) </div><br/><div class="package-node">&bull; [GLObject](snow/modules/opengl/native/GLObject.html) </div><br/><div class="package-node">&bull; [GLProgram](snow/modules/opengl/native/GLProgram.html) </div><br/><div class="package-node">&bull; [GLProxy](snow/modules/opengl/native/GLProxy.html) </div><br/><div class="package-node">&bull; [GLRenderbuffer](snow/modules/opengl/native/GLRenderbuffer.html) </div><br/><div class="package-node">&bull; [GLShader](snow/modules/opengl/native/GLShader.html) </div><br/><div class="package-node">&bull; [GLShaderPrecisionFormat](snow/modules/opengl/native/GLShaderPrecisionFormat.html) </div><br/><div class="package-node">&bull; [GLTexture](snow/modules/opengl/native/GLTexture.html) </div><br/><div class="package-node">&bull; [GLUniformLocation](snow/modules/opengl/native/GLUniformLocation.html) </div><br/><div class="package-node">&bull; [GL\_Native](snow/modules/opengl/native/GL_Native.html) </div><br/>
<div class="indent">

</div>
</div></div><div class="indent">
<a name="snow.modules.sdl"><h3> [sdl](#snow.modules.sdl) </h3></a>
</div>
</div><div class="indent">

<a name="snow.system"><h3> [system](#snow.system) </h3></a>
<div class="indent">
<a name="snow.system.assets"><h3> [assets](#snow.system.assets) </h3></a><div class="package-node">&bull; [Asset](snow/system/assets/Asset.html) </div> <br/><div class="package-node">&bull; [AssetBytes](snow/system/assets/AssetBytes.html) </div> <br/><div class="package-node">&bull; [AssetImage](snow/system/assets/AssetImage.html) </div> <br/><div class="package-node">&bull; [AssetJSON](snow/system/assets/AssetJSON.html) </div> <br/><div class="package-node">&bull; [AssetText](snow/system/assets/AssetText.html) </div> <br/><div class="package-node">&bull; [Assets](snow/system/assets/Assets.html) </div> <br/>
</div><div class="indent">
<a name="snow.system.audio"><h3> [audio](#snow.system.audio) </h3></a><div class="package-node">&bull; [Audio](snow/system/audio/Audio.html) </div> <br/><div class="package-node">&bull; [AudioModule](snow/system/audio/AudioModule.html) </div> <br/><div class="package-node">&bull; [Sound](snow/system/audio/Sound.html) </div> <br/>
</div><div class="indent">
<a name="snow.system.input"><h3> [input](#snow.system.input) </h3></a><div class="package-node">&bull; [Input](snow/system/input/Input.html) </div> <br/><div class="package-node">&bull; [MapIntBool](snow/system/input/MapIntBool.html) </div> <br/><div class="package-node">&bull; [MapIntFloat](snow/system/input/MapIntFloat.html) </div> <br/>
</div><div class="indent">
<a name="snow.system.io"><h3> [io](#snow.system.io) </h3></a><div class="package-node">&bull; [IO](snow/system/io/IO.html) </div> <br/>
</div><div class="indent">
<a name="snow.system.module"><h3> [module](#snow.system.module) </h3></a><div class="package-node">&bull; [Assets](snow/system/module/Assets.html) </div> <br/><div class="package-node">&bull; [Audio](snow/system/module/Audio.html) </div> <br/><div class="package-node">&bull; [IO](snow/system/module/IO.html) </div> <br/><div class="package-node">&bull; [Input](snow/system/module/Input.html) </div> <br/><div class="package-node">&bull; [Sound](snow/system/module/Sound.html) </div> <br/><div class="package-node">&bull; [Windowing](snow/system/module/Windowing.html) </div> <br/>
</div><div class="indent">
<a name="snow.system.window"><h3> [window](#snow.system.window) </h3></a><div class="package-node">&bull; [Window](snow/system/window/Window.html) </div> <br/><div class="package-node">&bull; [Windowing](snow/system/window/Windowing.html) </div> <br/>
</div>
</div><div class="indent">

<a name="snow.types"><h3> [types](#snow.types) </h3></a><div class="package-node">&bull; [AppConfig](snow/types/AppConfig.html) </div><br/><div class="package-node">&bull; [AppConfigNative](snow/types/AppConfigNative.html) </div><br/><div class="package-node">&bull; [AppConfigWeb](snow/types/AppConfigWeb.html) </div><br/><div class="package-node">&bull; [Asset](snow/types/Asset.html) </div><br/><div class="package-node">&bull; [AssetBytes](snow/types/AssetBytes.html) </div><br/><div class="package-node">&bull; [AssetImage](snow/types/AssetImage.html) </div><br/><div class="package-node">&bull; [AssetJSON](snow/types/AssetJSON.html) </div><br/><div class="package-node">&bull; [AssetText](snow/types/AssetText.html) </div><br/><div class="package-node">&bull; [AssetType](snow/types/AssetType.html) </div><br/><div class="package-node">&bull; [AudioDataBlob](snow/types/AudioDataBlob.html) </div><br/><div class="package-node">&bull; [AudioDataInfo](snow/types/AudioDataInfo.html) </div><br/><div class="package-node">&bull; [AudioFormatType](snow/types/AudioFormatType.html) </div><br/><div class="package-node">&bull; [AudioHandle](snow/types/AudioHandle.html) </div><br/><div class="package-node">&bull; [AudioInfo](snow/types/AudioInfo.html) </div><br/><div class="package-node">&bull; [DisplayMode](snow/types/DisplayMode.html) </div><br/><div class="package-node">&bull; [Error](snow/types/Error.html) </div><br/><div class="package-node">&bull; [FileEvent](snow/types/FileEvent.html) </div><br/><div class="package-node">&bull; [FileEventType](snow/types/FileEventType.html) </div><br/><div class="package-node">&bull; [FileFilter](snow/types/FileFilter.html) </div><br/><div class="package-node">&bull; [GamepadDeviceEventType](snow/types/GamepadDeviceEventType.html) </div><br/><div class="package-node">&bull; [IODataOptions](snow/types/IODataOptions.html) </div><br/><div class="package-node">&bull; [ImageInfo](snow/types/ImageInfo.html) </div><br/><div class="package-node">&bull; [InputEvent](snow/types/InputEvent.html) </div><br/><div class="package-node">&bull; [InputEventType](snow/types/InputEventType.html) </div><br/><div class="package-node">&bull; [Key](snow/types/Key.html) </div><br/><div class="package-node">&bull; [ModState](snow/types/ModState.html) </div><br/><div class="package-node">&bull; [OS](snow/types/OS.html) </div><br/><div class="package-node">&bull; [OpenGLProfile](snow/types/OpenGLProfile.html) </div><br/><div class="package-node">&bull; [Platform](snow/types/Platform.html) </div><br/><div class="package-node">&bull; [RenderConfig](snow/types/RenderConfig.html) </div><br/><div class="package-node">&bull; [RenderConfigOpenGL](snow/types/RenderConfigOpenGL.html) </div><br/><div class="package-node">&bull; [Scan](snow/types/Scan.html) </div><br/><div class="package-node">&bull; [SnowConfig](snow/types/SnowConfig.html) </div><br/><div class="package-node">&bull; [SystemEvent](snow/types/SystemEvent.html) </div><br/><div class="package-node">&bull; [SystemEventType](snow/types/SystemEventType.html) </div><br/><div class="package-node">&bull; [TextEventType](snow/types/TextEventType.html) </div><br/><div class="package-node">&bull; [WindowConfig](snow/types/WindowConfig.html) </div><br/><div class="package-node">&bull; [WindowEvent](snow/types/WindowEvent.html) </div><br/><div class="package-node">&bull; [WindowEventType](snow/types/WindowEventType.html) </div><br/><div class="package-node">&bull; [WindowHandle](snow/types/WindowHandle.html) </div><br/>
<div class="indent">

</div>
</div><br/>
<hr/>

&nbsp;
&nbsp;