
[![Logo](../../../../images/logo.png)](../../../../api/index.html)

<hr/>
<a href="#" id="search_bar" onclick="return;"><div> search API <em>(or start typing anywhere)</em> </div></a>
<hr/>

<script src="../../../../js/omnibar.js"> </script>
<link rel="stylesheet" type="text/css" href="../../../../css/omnibar.css" media="all">

<div id="omnibar"> <a href="#" onclick="return" id="omnibar_close"></a> <input id="omnibar_text" type="text" placeholder="search types..."></input></div>
<script  id="typelist" data-relpath="../../../../" data-types="snow.App,snow.AppFixedTimestep,snow.Core,snow.CoreBinding,snow.Log,snow.Snow,snow.assets.Asset,snow.assets.AssetAudio,snow.assets.AssetBytes,snow.assets.AssetImage,snow.assets.AssetSystem,snow.assets.AssetSystemBinding,snow.assets.AssetText,snow.assets.Assets,snow.audio.Audio,snow.audio.AudioSystem,snow.audio.AudioSystemBinding,snow.audio.Sound,snow.audio.SoundBinding,snow.audio.SoundStream,snow.audio._Audio.AudioHandleMap,snow.audio.openal.AL,snow.audio.openal.ALC,snow.audio.openal.Context,snow.audio.openal.Device,snow.input.Input,snow.input.InputSystem,snow.input.InputSystemBinding,snow.input.Keycodes,snow.input.MapIntBool,snow.input.MapIntFloat,snow.input.Scancodes,snow.io.IO,snow.io.IOSystem,snow.io.IOSystemBinding,snow.platform.native.Core,snow.platform.native.StaticSnow,snow.platform.native.assets.AssetSystem,snow.platform.native.audio.AudioSystem,snow.platform.native.audio.Sound,snow.platform.native.audio.SoundStream,snow.platform.native.audio.openal.AL,snow.platform.native.audio.openal.ALC,snow.platform.native.audio.openal.AudioSystem,snow.platform.native.audio.openal.Context,snow.platform.native.audio.openal.Device,snow.platform.native.audio.openal.OpenALHelper,snow.platform.native.audio.openal.Sound,snow.platform.native.audio.openal.SoundStream,snow.platform.native.audio.openal._AL.Context_Impl_,snow.platform.native.audio.openal._AL.Device_Impl_,snow.platform.native.input.InputSystem,snow.platform.native.input.sdl.ControllerEventType,snow.platform.native.input.sdl.InputSystem,snow.platform.native.input.sdl.KeyEventType,snow.platform.native.input.sdl.ModValue,snow.platform.native.input.sdl.MouseEventType,snow.platform.native.input.sdl.TouchEventType,snow.platform.native.io.IOFile,snow.platform.native.io.IOFileHandle,snow.platform.native.io.IOSystem,snow.platform.native.io._IOFile.IOFileHandle_Impl_,snow.platform.native.render.opengl.GL,snow.platform.native.render.opengl.GLActiveInfo,snow.platform.native.render.opengl.GLBuffer,snow.platform.native.render.opengl.GLContextAttributes,snow.platform.native.render.opengl.GLFBO,snow.platform.native.render.opengl.GLFramebuffer,snow.platform.native.render.opengl.GLObject,snow.platform.native.render.opengl.GLProgram,snow.platform.native.render.opengl.GLRBO,snow.platform.native.render.opengl.GLRenderbuffer,snow.platform.native.render.opengl.GLShader,snow.platform.native.render.opengl.GLShaderPrecisionFormat,snow.platform.native.render.opengl.GLTexture,snow.platform.native.render.opengl.GLUniformLocation,snow.platform.native.render.opengl._GL.GLFramebuffer_Impl_,snow.platform.native.render.opengl._GL.GLRenderbuffer_Impl_,snow.platform.native.utils.ArrayBuffer,snow.platform.native.utils.ArrayBufferView,snow.platform.native.utils.ByteArray,snow.platform.native.utils.Compression,snow.platform.native.utils.Float32Array,snow.platform.native.utils.Int16Array,snow.platform.native.utils.Int32Array,snow.platform.native.utils.Int8Array,snow.platform.native.utils.UInt16Array,snow.platform.native.utils.UInt32Array,snow.platform.native.utils.UInt8Array,snow.platform.native.utils.UInt8ClampedArray,snow.platform.native.window.WindowSystem,snow.platform.native.window.sdl.WindowSystem,snow.platform.web.assets.psd.PSD,snow.platform.web.audio.AudioSystem,snow.platform.web.audio.Sound,snow.platform.web.audio.SoundStream,snow.platform.web.audio.howlerjs.AudioParams,snow.platform.web.audio.howlerjs.AudioSystem,snow.platform.web.audio.howlerjs.Howl,snow.platform.web.audio.howlerjs.Howler,snow.platform.web.audio.howlerjs.SoundStream,snow.platform.web.audio.howlerjs.SpriteParams,snow.render.opengl.GL,snow.render.opengl.GLActiveInfo,snow.render.opengl.GLBuffer,snow.render.opengl.GLContextAttributes,snow.render.opengl.GLFramebuffer,snow.render.opengl.GLProgram,snow.render.opengl.GLRenderbuffer,snow.render.opengl.GLShader,snow.render.opengl.GLTexture,snow.render.opengl.GLUniformLocation,snow.types.AppConfig,snow.types.AppConfigNative,snow.types.AppConfigWeb,snow.types.AssetAudioOptions,snow.types.AssetBytesOptions,snow.types.AssetImageOptions,snow.types.AssetInfo,snow.types.AssetTextOptions,snow.types.AssetType,snow.types.AudioDataBlob,snow.types.AudioDataInfo,snow.types.AudioFormatType,snow.types.AudioHandle,snow.types.AudioInfo,snow.types.DisplayMode,snow.types.FileEvent,snow.types.FileEventType,snow.types.FileFilter,snow.types.GamepadDeviceEventType,snow.types.ImageInfo,snow.types.InputEvent,snow.types.InputEventType,snow.types.Key,snow.types.ModState,snow.types.Scan,snow.types.SnowConfig,snow.types.SystemEvent,snow.types.SystemEventType,snow.types.TextEventType,snow.types.WindowConfig,snow.types.WindowEvent,snow.types.WindowEventType,snow.types.WindowHandle,snow.utils.AbstractClass,snow.utils.AbstractClassBuilder,snow.utils.ArrayBuffer,snow.utils.ArrayBufferView,snow.utils.ByteArray,snow.utils.Float32Array,snow.utils.IDataInput,snow.utils.IMemoryRange,snow.utils.Int16Array,snow.utils.Int32Array,snow.utils.Int8Array,snow.utils.Libs,snow.utils.Timer,snow.utils.UInt16Array,snow.utils.UInt32Array,snow.utils.UInt8Array,snow.utils.UInt8ClampedArray,snow.utils._AbstractClass.StringMap,snow.utils.format.png.Chunk,snow.utils.format.png.Color,snow.utils.format.png.Data,snow.utils.format.png.Header,snow.utils.format.png.Reader,snow.utils.format.png.Tools,snow.utils.format.png.Writer,snow.utils.format.tools.Adler32,snow.utils.format.tools.Deflate,snow.utils.format.tools.HuffTools,snow.utils.format.tools.Huffman,snow.utils.format.tools.Inflate,snow.utils.format.tools.InflateImpl,snow.utils.format.tools.MemoryBytes,snow.utils.format.tools._InflateImpl.State,snow.utils.format.tools._InflateImpl.Window,snow.window.Window,snow.window.WindowSystem,snow.window.WindowSystemBinding,snow.window.Windowing,snow.window._Windowing.WindowHandleMap"></script>


<h1>GL</h1>
<small>`snow.render.opengl.GL`</small>



<hr/>

`typedef`&nbsp;alias of `snow.platform.native.render.opengl.GL`   

<hr/>


&nbsp;
&nbsp;





<h3>Members</h3> <hr/>


<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="activeTexture"><a class="lift" href="#activeTexture">activeTexture</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">activeTexture(texture:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="attachShader"><a class="lift" href="#attachShader">attachShader</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">attachShader(program:[snow.platform.native.render.opengl.GLProgram](../../../../api/snow/platform/native/render/opengl/GLProgram.html)<span></span>, shader:[snow.platform.native.render.opengl.GLShader](../../../../api/snow/platform/native/render/opengl/GLShader.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="bindAttribLocation"><a class="lift" href="#bindAttribLocation">bindAttribLocation</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">bindAttribLocation(program:[snow.platform.native.render.opengl.GLProgram](../../../../api/snow/platform/native/render/opengl/GLProgram.html)<span></span>, index:[Int](http://api.haxe.org/Int.html)<span></span>, name:[String](http://api.haxe.org/String.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="bindBuffer"><a class="lift" href="#bindBuffer">bindBuffer</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">bindBuffer(target:[Int](http://api.haxe.org/Int.html)<span></span>, buffer:[snow.platform.native.render.opengl.GLBuffer](../../../../api/snow/platform/native/render/opengl/GLBuffer.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="bindFramebuffer"><a class="lift" href="#bindFramebuffer">bindFramebuffer</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">bindFramebuffer(target:[Int](http://api.haxe.org/Int.html)<span></span>, framebuffer:[snow.platform.native.render.opengl.GLFramebuffer](../../../../api/snow/platform/native/render/opengl/GLFramebuffer.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="bindRenderbuffer"><a class="lift" href="#bindRenderbuffer">bindRenderbuffer</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">bindRenderbuffer(target:[Int](http://api.haxe.org/Int.html)<span></span>, renderbuffer:[snow.platform.native.render.opengl.GLRenderbuffer](../../../../api/snow/platform/native/render/opengl/GLRenderbuffer.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="bindTexture"><a class="lift" href="#bindTexture">bindTexture</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">bindTexture(target:[Int](http://api.haxe.org/Int.html)<span></span>, texture:[snow.platform.native.render.opengl.GLTexture](../../../../api/snow/platform/native/render/opengl/GLTexture.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


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
            <code class="signature apipage">bufferData(target:[Int](http://api.haxe.org/Int.html)<span></span>, data:[snow.utils.IMemoryRange](../../../../api/snow/utils/IMemoryRange.html)<span></span>, usage:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="bufferSubData"><a class="lift" href="#bufferSubData">bufferSubData</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">bufferSubData(target:[Int](http://api.haxe.org/Int.html)<span></span>, offset:[Int](http://api.haxe.org/Int.html)<span></span>, data:[snow.utils.IMemoryRange](../../../../api/snow/utils/IMemoryRange.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


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
            <code class="signature apipage">compileShader(shader:[snow.platform.native.render.opengl.GLShader](../../../../api/snow/platform/native/render/opengl/GLShader.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="compressedTexImage2D"><a class="lift" href="#compressedTexImage2D">compressedTexImage2D</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">compressedTexImage2D(target:[Int](http://api.haxe.org/Int.html)<span></span>, level:[Int](http://api.haxe.org/Int.html)<span></span>, internalformat:[Int](http://api.haxe.org/Int.html)<span></span>, width:[Int](http://api.haxe.org/Int.html)<span></span>, height:[Int](http://api.haxe.org/Int.html)<span></span>, border:[Int](http://api.haxe.org/Int.html)<span></span>, data:[snow.utils.IMemoryRange](../../../../api/snow/utils/IMemoryRange.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="compressedTexSubImage2D"><a class="lift" href="#compressedTexSubImage2D">compressedTexSubImage2D</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">compressedTexSubImage2D(target:[Int](http://api.haxe.org/Int.html)<span></span>, level:[Int](http://api.haxe.org/Int.html)<span></span>, xoffset:[Int](http://api.haxe.org/Int.html)<span></span>, yoffset:[Int](http://api.haxe.org/Int.html)<span></span>, width:[Int](http://api.haxe.org/Int.html)<span></span>, height:[Int](http://api.haxe.org/Int.html)<span></span>, format:[Int](http://api.haxe.org/Int.html)<span></span>, data:[snow.utils.IMemoryRange](../../../../api/snow/utils/IMemoryRange.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


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
            <code class="signature apipage">createBuffer() : [snow.platform.native.render.opengl.GLBuffer](../../../../api/snow/platform/native/render/opengl/GLBuffer.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="createFramebuffer"><a class="lift" href="#createFramebuffer">createFramebuffer</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">createFramebuffer() : [snow.platform.native.render.opengl.GLFramebuffer](../../../../api/snow/platform/native/render/opengl/GLFramebuffer.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="createProgram"><a class="lift" href="#createProgram">createProgram</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">createProgram() : [snow.platform.native.render.opengl.GLProgram](../../../../api/snow/platform/native/render/opengl/GLProgram.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="createRenderbuffer"><a class="lift" href="#createRenderbuffer">createRenderbuffer</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">createRenderbuffer() : [snow.platform.native.render.opengl.GLRenderbuffer](../../../../api/snow/platform/native/render/opengl/GLRenderbuffer.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="createShader"><a class="lift" href="#createShader">createShader</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">createShader(type:[Int](http://api.haxe.org/Int.html)<span></span>) : [snow.platform.native.render.opengl.GLShader](../../../../api/snow/platform/native/render/opengl/GLShader.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="createTexture"><a class="lift" href="#createTexture">createTexture</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">createTexture() : [snow.platform.native.render.opengl.GLTexture](../../../../api/snow/platform/native/render/opengl/GLTexture.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="cullFace"><a class="lift" href="#cullFace">cullFace</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">cullFace(mode:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="deleteBuffer"><a class="lift" href="#deleteBuffer">deleteBuffer</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">deleteBuffer(buffer:[snow.platform.native.render.opengl.GLBuffer](../../../../api/snow/platform/native/render/opengl/GLBuffer.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="deleteFramebuffer"><a class="lift" href="#deleteFramebuffer">deleteFramebuffer</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">deleteFramebuffer(framebuffer:[snow.platform.native.render.opengl.GLFramebuffer](../../../../api/snow/platform/native/render/opengl/GLFramebuffer.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="deleteProgram"><a class="lift" href="#deleteProgram">deleteProgram</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">deleteProgram(program:[snow.platform.native.render.opengl.GLProgram](../../../../api/snow/platform/native/render/opengl/GLProgram.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="deleteRenderbuffer"><a class="lift" href="#deleteRenderbuffer">deleteRenderbuffer</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">deleteRenderbuffer(renderbuffer:[snow.platform.native.render.opengl.GLRenderbuffer](../../../../api/snow/platform/native/render/opengl/GLRenderbuffer.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="deleteShader"><a class="lift" href="#deleteShader">deleteShader</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">deleteShader(shader:[snow.platform.native.render.opengl.GLShader](../../../../api/snow/platform/native/render/opengl/GLShader.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="deleteTexture"><a class="lift" href="#deleteTexture">deleteTexture</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">deleteTexture(texture:[snow.platform.native.render.opengl.GLTexture](../../../../api/snow/platform/native/render/opengl/GLTexture.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


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
            <code class="signature apipage">detachShader(program:[snow.platform.native.render.opengl.GLProgram](../../../../api/snow/platform/native/render/opengl/GLProgram.html)<span></span>, shader:[snow.platform.native.render.opengl.GLShader](../../../../api/snow/platform/native/render/opengl/GLShader.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


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
            <code class="signature apipage">framebufferRenderbuffer(target:[Int](http://api.haxe.org/Int.html)<span></span>, attachment:[Int](http://api.haxe.org/Int.html)<span></span>, renderbuffertarget:[Int](http://api.haxe.org/Int.html)<span></span>, renderbuffer:[snow.platform.native.render.opengl.GLRenderbuffer](../../../../api/snow/platform/native/render/opengl/GLRenderbuffer.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="framebufferTexture2D"><a class="lift" href="#framebufferTexture2D">framebufferTexture2D</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">framebufferTexture2D(target:[Int](http://api.haxe.org/Int.html)<span></span>, attachment:[Int](http://api.haxe.org/Int.html)<span></span>, textarget:[Int](http://api.haxe.org/Int.html)<span></span>, texture:[snow.platform.native.render.opengl.GLTexture](../../../../api/snow/platform/native/render/opengl/GLTexture.html)<span></span>, level:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


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
            <code class="signature apipage">getActiveAttrib(program:[snow.platform.native.render.opengl.GLProgram](../../../../api/snow/platform/native/render/opengl/GLProgram.html)<span></span>, index:[Int](http://api.haxe.org/Int.html)<span></span>) : [snow.platform.native.render.opengl.GLActiveInfo](../../../../api/snow/platform/native/render/opengl/GLActiveInfo.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="getActiveUniform"><a class="lift" href="#getActiveUniform">getActiveUniform</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">getActiveUniform(program:[snow.platform.native.render.opengl.GLProgram](../../../../api/snow/platform/native/render/opengl/GLProgram.html)<span></span>, index:[Int](http://api.haxe.org/Int.html)<span></span>) : [snow.platform.native.render.opengl.GLActiveInfo](../../../../api/snow/platform/native/render/opengl/GLActiveInfo.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="getAttachedShaders"><a class="lift" href="#getAttachedShaders">getAttachedShaders</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">getAttachedShaders(program:[snow.platform.native.render.opengl.GLProgram](../../../../api/snow/platform/native/render/opengl/GLProgram.html)<span></span>) : [Array](http://api.haxe.org/Array.html)&lt;[snow.platform.native.render.opengl.GLShader](../../../../api/snow/platform/native/render/opengl/GLShader.html)&gt;</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="getAttribLocation"><a class="lift" href="#getAttribLocation">getAttribLocation</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">getAttribLocation(program:[snow.platform.native.render.opengl.GLProgram](../../../../api/snow/platform/native/render/opengl/GLProgram.html)<span></span>, name:[String](http://api.haxe.org/String.html)<span></span>) : [Int](http://api.haxe.org/Int.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="getBufferParameter"><a class="lift" href="#getBufferParameter">getBufferParameter</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">getBufferParameter(target:[Int](http://api.haxe.org/Int.html)<span></span>, pname:[Int](http://api.haxe.org/Int.html)<span></span>) : [Dynamic](#)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="getContextAttributes"><a class="lift" href="#getContextAttributes">getContextAttributes</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">getContextAttributes() : [snow.platform.native.render.opengl.GLContextAttributes](../../../../api/snow/platform/native/render/opengl/GLContextAttributes.html)</code><br/><span class="small_desc_flat"></span>


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
            <code class="signature apipage">getProgramInfoLog(program:[snow.platform.native.render.opengl.GLProgram](../../../../api/snow/platform/native/render/opengl/GLProgram.html)<span></span>) : [String](http://api.haxe.org/String.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="getProgramParameter"><a class="lift" href="#getProgramParameter">getProgramParameter</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">getProgramParameter(program:[snow.platform.native.render.opengl.GLProgram](../../../../api/snow/platform/native/render/opengl/GLProgram.html)<span></span>, pname:[Int](http://api.haxe.org/Int.html)<span></span>) : [Int](http://api.haxe.org/Int.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="getRenderbufferParameter"><a class="lift" href="#getRenderbufferParameter">getRenderbufferParameter</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">getRenderbufferParameter(target:[Int](http://api.haxe.org/Int.html)<span></span>, pname:[Int](http://api.haxe.org/Int.html)<span></span>) : [Dynamic](#)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="getShaderInfoLog"><a class="lift" href="#getShaderInfoLog">getShaderInfoLog</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">getShaderInfoLog(shader:[snow.platform.native.render.opengl.GLShader](../../../../api/snow/platform/native/render/opengl/GLShader.html)<span></span>) : [String](http://api.haxe.org/String.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="getShaderParameter"><a class="lift" href="#getShaderParameter">getShaderParameter</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">getShaderParameter(shader:[snow.platform.native.render.opengl.GLShader](../../../../api/snow/platform/native/render/opengl/GLShader.html)<span></span>, pname:[Int](http://api.haxe.org/Int.html)<span></span>) : [Int](http://api.haxe.org/Int.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="getShaderPrecisionFormat"><a class="lift" href="#getShaderPrecisionFormat">getShaderPrecisionFormat</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">getShaderPrecisionFormat(shadertype:[Int](http://api.haxe.org/Int.html)<span></span>, precisiontype:[Int](http://api.haxe.org/Int.html)<span></span>) : [snow.platform.native.render.opengl.GLShaderPrecisionFormat](../../../../api/snow/platform/native/render/opengl/GLShaderPrecisionFormat.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="getShaderSource"><a class="lift" href="#getShaderSource">getShaderSource</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">getShaderSource(shader:[snow.platform.native.render.opengl.GLShader](../../../../api/snow/platform/native/render/opengl/GLShader.html)<span></span>) : [String](http://api.haxe.org/String.html)</code><br/><span class="small_desc_flat"></span>


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
            <code class="signature apipage">getUniform(program:[snow.platform.native.render.opengl.GLProgram](../../../../api/snow/platform/native/render/opengl/GLProgram.html)<span></span>, location:[snow.platform.native.render.opengl.GLUniformLocation](../../../../api/snow/platform/native/render/opengl/GLUniformLocation.html)<span></span>) : [Dynamic](#)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="getUniformLocation"><a class="lift" href="#getUniformLocation">getUniformLocation</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">getUniformLocation(program:[snow.platform.native.render.opengl.GLProgram](../../../../api/snow/platform/native/render/opengl/GLProgram.html)<span></span>, name:[String](http://api.haxe.org/String.html)<span></span>) : [Dynamic](#)</code><br/><span class="small_desc_flat"></span>


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
            <code class="signature apipage">isBuffer(buffer:[snow.platform.native.render.opengl.GLBuffer](../../../../api/snow/platform/native/render/opengl/GLBuffer.html)<span></span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="isEnabled"><a class="lift" href="#isEnabled">isEnabled</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">isEnabled(cap:[Int](http://api.haxe.org/Int.html)<span></span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="isFramebuffer"><a class="lift" href="#isFramebuffer">isFramebuffer</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">isFramebuffer(framebuffer:[snow.platform.native.render.opengl.GLFramebuffer](../../../../api/snow/platform/native/render/opengl/GLFramebuffer.html)<span></span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="isProgram"><a class="lift" href="#isProgram">isProgram</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">isProgram(program:[snow.platform.native.render.opengl.GLProgram](../../../../api/snow/platform/native/render/opengl/GLProgram.html)<span></span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="isRenderbuffer"><a class="lift" href="#isRenderbuffer">isRenderbuffer</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">isRenderbuffer(renderbuffer:[snow.platform.native.render.opengl.GLRenderbuffer](../../../../api/snow/platform/native/render/opengl/GLRenderbuffer.html)<span></span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="isShader"><a class="lift" href="#isShader">isShader</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">isShader(shader:[snow.platform.native.render.opengl.GLShader](../../../../api/snow/platform/native/render/opengl/GLShader.html)<span></span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="isTexture"><a class="lift" href="#isTexture">isTexture</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">isTexture(texture:[snow.platform.native.render.opengl.GLTexture](../../../../api/snow/platform/native/render/opengl/GLTexture.html)<span></span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="lineWidth"><a class="lift" href="#lineWidth">lineWidth</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">lineWidth(width:[Float](http://api.haxe.org/Float.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="linkProgram"><a class="lift" href="#linkProgram">linkProgram</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">linkProgram(program:[snow.platform.native.render.opengl.GLProgram](../../../../api/snow/platform/native/render/opengl/GLProgram.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


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
            <code class="signature apipage">readPixels(x:[Int](http://api.haxe.org/Int.html)<span></span>, y:[Int](http://api.haxe.org/Int.html)<span></span>, width:[Int](http://api.haxe.org/Int.html)<span></span>, height:[Int](http://api.haxe.org/Int.html)<span></span>, format:[Int](http://api.haxe.org/Int.html)<span></span>, type:[Int](http://api.haxe.org/Int.html)<span></span>, pixels:[snow.utils.ArrayBufferView](../../../../api/snow/utils/ArrayBufferView.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


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
            <code class="signature apipage">shaderSource(shader:[snow.platform.native.render.opengl.GLShader](../../../../api/snow/platform/native/render/opengl/GLShader.html)<span></span>, source:[String](http://api.haxe.org/String.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


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
            <code class="signature apipage">texImage2D(target:[Int](http://api.haxe.org/Int.html)<span></span>, level:[Int](http://api.haxe.org/Int.html)<span></span>, internalformat:[Int](http://api.haxe.org/Int.html)<span></span>, width:[Int](http://api.haxe.org/Int.html)<span></span>, height:[Int](http://api.haxe.org/Int.html)<span></span>, border:[Int](http://api.haxe.org/Int.html)<span></span>, format:[Int](http://api.haxe.org/Int.html)<span></span>, type:[Int](http://api.haxe.org/Int.html)<span></span>, pixels:[snow.utils.ArrayBufferView](../../../../api/snow/utils/ArrayBufferView.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


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
            <code class="signature apipage">texSubImage2D(target:[Int](http://api.haxe.org/Int.html)<span></span>, level:[Int](http://api.haxe.org/Int.html)<span></span>, xoffset:[Int](http://api.haxe.org/Int.html)<span></span>, yoffset:[Int](http://api.haxe.org/Int.html)<span></span>, width:[Int](http://api.haxe.org/Int.html)<span></span>, height:[Int](http://api.haxe.org/Int.html)<span></span>, format:[Int](http://api.haxe.org/Int.html)<span></span>, type:[Int](http://api.haxe.org/Int.html)<span></span>, pixels:[snow.utils.ArrayBufferView](../../../../api/snow/utils/ArrayBufferView.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="uniform1f"><a class="lift" href="#uniform1f">uniform1f</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">uniform1f(location:[snow.platform.native.render.opengl.GLUniformLocation](../../../../api/snow/platform/native/render/opengl/GLUniformLocation.html)<span></span>, x:[Float](http://api.haxe.org/Float.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="uniform1fv"><a class="lift" href="#uniform1fv">uniform1fv</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">uniform1fv(location:[snow.platform.native.render.opengl.GLUniformLocation](../../../../api/snow/platform/native/render/opengl/GLUniformLocation.html)<span></span>, x:[snow.utils.Float32Array](../../../../api/snow/utils/Float32Array.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="uniform1i"><a class="lift" href="#uniform1i">uniform1i</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">uniform1i(location:[snow.platform.native.render.opengl.GLUniformLocation](../../../../api/snow/platform/native/render/opengl/GLUniformLocation.html)<span></span>, x:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="uniform1iv"><a class="lift" href="#uniform1iv">uniform1iv</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">uniform1iv(location:[snow.platform.native.render.opengl.GLUniformLocation](../../../../api/snow/platform/native/render/opengl/GLUniformLocation.html)<span></span>, v:[snow.utils.Int32Array](../../../../api/snow/utils/Int32Array.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="uniform2f"><a class="lift" href="#uniform2f">uniform2f</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">uniform2f(location:[snow.platform.native.render.opengl.GLUniformLocation](../../../../api/snow/platform/native/render/opengl/GLUniformLocation.html)<span></span>, x:[Float](http://api.haxe.org/Float.html)<span></span>, y:[Float](http://api.haxe.org/Float.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="uniform2fv"><a class="lift" href="#uniform2fv">uniform2fv</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">uniform2fv(location:[snow.platform.native.render.opengl.GLUniformLocation](../../../../api/snow/platform/native/render/opengl/GLUniformLocation.html)<span></span>, v:[snow.utils.Float32Array](../../../../api/snow/utils/Float32Array.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="uniform2i"><a class="lift" href="#uniform2i">uniform2i</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">uniform2i(location:[snow.platform.native.render.opengl.GLUniformLocation](../../../../api/snow/platform/native/render/opengl/GLUniformLocation.html)<span></span>, x:[Int](http://api.haxe.org/Int.html)<span></span>, y:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="uniform2iv"><a class="lift" href="#uniform2iv">uniform2iv</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">uniform2iv(location:[snow.platform.native.render.opengl.GLUniformLocation](../../../../api/snow/platform/native/render/opengl/GLUniformLocation.html)<span></span>, v:[snow.utils.Int32Array](../../../../api/snow/utils/Int32Array.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="uniform3f"><a class="lift" href="#uniform3f">uniform3f</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">uniform3f(location:[snow.platform.native.render.opengl.GLUniformLocation](../../../../api/snow/platform/native/render/opengl/GLUniformLocation.html)<span></span>, x:[Float](http://api.haxe.org/Float.html)<span></span>, y:[Float](http://api.haxe.org/Float.html)<span></span>, z:[Float](http://api.haxe.org/Float.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="uniform3fv"><a class="lift" href="#uniform3fv">uniform3fv</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">uniform3fv(location:[snow.platform.native.render.opengl.GLUniformLocation](../../../../api/snow/platform/native/render/opengl/GLUniformLocation.html)<span></span>, v:[snow.utils.Float32Array](../../../../api/snow/utils/Float32Array.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="uniform3i"><a class="lift" href="#uniform3i">uniform3i</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">uniform3i(location:[snow.platform.native.render.opengl.GLUniformLocation](../../../../api/snow/platform/native/render/opengl/GLUniformLocation.html)<span></span>, x:[Int](http://api.haxe.org/Int.html)<span></span>, y:[Int](http://api.haxe.org/Int.html)<span></span>, z:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="uniform3iv"><a class="lift" href="#uniform3iv">uniform3iv</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">uniform3iv(location:[snow.platform.native.render.opengl.GLUniformLocation](../../../../api/snow/platform/native/render/opengl/GLUniformLocation.html)<span></span>, v:[snow.utils.Int32Array](../../../../api/snow/utils/Int32Array.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="uniform4f"><a class="lift" href="#uniform4f">uniform4f</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">uniform4f(location:[snow.platform.native.render.opengl.GLUniformLocation](../../../../api/snow/platform/native/render/opengl/GLUniformLocation.html)<span></span>, x:[Float](http://api.haxe.org/Float.html)<span></span>, y:[Float](http://api.haxe.org/Float.html)<span></span>, z:[Float](http://api.haxe.org/Float.html)<span></span>, w:[Float](http://api.haxe.org/Float.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="uniform4fv"><a class="lift" href="#uniform4fv">uniform4fv</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">uniform4fv(location:[snow.platform.native.render.opengl.GLUniformLocation](../../../../api/snow/platform/native/render/opengl/GLUniformLocation.html)<span></span>, v:[snow.utils.Float32Array](../../../../api/snow/utils/Float32Array.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="uniform4i"><a class="lift" href="#uniform4i">uniform4i</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">uniform4i(location:[snow.platform.native.render.opengl.GLUniformLocation](../../../../api/snow/platform/native/render/opengl/GLUniformLocation.html)<span></span>, x:[Int](http://api.haxe.org/Int.html)<span></span>, y:[Int](http://api.haxe.org/Int.html)<span></span>, z:[Int](http://api.haxe.org/Int.html)<span></span>, w:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="uniform4iv"><a class="lift" href="#uniform4iv">uniform4iv</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">uniform4iv(location:[snow.platform.native.render.opengl.GLUniformLocation](../../../../api/snow/platform/native/render/opengl/GLUniformLocation.html)<span></span>, v:[snow.utils.Int32Array](../../../../api/snow/utils/Int32Array.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="uniformMatrix2fv"><a class="lift" href="#uniformMatrix2fv">uniformMatrix2fv</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">uniformMatrix2fv(location:[snow.platform.native.render.opengl.GLUniformLocation](../../../../api/snow/platform/native/render/opengl/GLUniformLocation.html)<span></span>, transpose:[Bool](http://api.haxe.org/Bool.html)<span></span>, v:[snow.utils.Float32Array](../../../../api/snow/utils/Float32Array.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="uniformMatrix3fv"><a class="lift" href="#uniformMatrix3fv">uniformMatrix3fv</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">uniformMatrix3fv(location:[snow.platform.native.render.opengl.GLUniformLocation](../../../../api/snow/platform/native/render/opengl/GLUniformLocation.html)<span></span>, transpose:[Bool](http://api.haxe.org/Bool.html)<span></span>, v:[snow.utils.Float32Array](../../../../api/snow/utils/Float32Array.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="uniformMatrix4fv"><a class="lift" href="#uniformMatrix4fv">uniformMatrix4fv</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">uniformMatrix4fv(location:[snow.platform.native.render.opengl.GLUniformLocation](../../../../api/snow/platform/native/render/opengl/GLUniformLocation.html)<span></span>, transpose:[Bool](http://api.haxe.org/Bool.html)<span></span>, v:[snow.utils.Float32Array](../../../../api/snow/utils/Float32Array.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="useProgram"><a class="lift" href="#useProgram">useProgram</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">useProgram(program:[snow.platform.native.render.opengl.GLProgram](../../../../api/snow/platform/native/render/opengl/GLProgram.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="validateProgram"><a class="lift" href="#validateProgram">validateProgram</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">validateProgram(program:[snow.platform.native.render.opengl.GLProgram](../../../../api/snow/platform/native/render/opengl/GLProgram.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


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
            <code class="signature apipage">vertexAttrib1fv(indx:[Int](http://api.haxe.org/Int.html)<span></span>, values:[snow.utils.Float32Array](../../../../api/snow/utils/Float32Array.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="vertexAttrib2f"><a class="lift" href="#vertexAttrib2f">vertexAttrib2f</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">vertexAttrib2f(indx:[Int](http://api.haxe.org/Int.html)<span></span>, x:[Float](http://api.haxe.org/Float.html)<span></span>, y:[Float](http://api.haxe.org/Float.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="vertexAttrib2fv"><a class="lift" href="#vertexAttrib2fv">vertexAttrib2fv</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">vertexAttrib2fv(indx:[Int](http://api.haxe.org/Int.html)<span></span>, values:[snow.utils.Float32Array](../../../../api/snow/utils/Float32Array.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="vertexAttrib3f"><a class="lift" href="#vertexAttrib3f">vertexAttrib3f</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">vertexAttrib3f(indx:[Int](http://api.haxe.org/Int.html)<span></span>, x:[Float](http://api.haxe.org/Float.html)<span></span>, y:[Float](http://api.haxe.org/Float.html)<span></span>, z:[Float](http://api.haxe.org/Float.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="vertexAttrib3fv"><a class="lift" href="#vertexAttrib3fv">vertexAttrib3fv</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">vertexAttrib3fv(indx:[Int](http://api.haxe.org/Int.html)<span></span>, values:[snow.utils.Float32Array](../../../../api/snow/utils/Float32Array.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="vertexAttrib4f"><a class="lift" href="#vertexAttrib4f">vertexAttrib4f</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">vertexAttrib4f(indx:[Int](http://api.haxe.org/Int.html)<span></span>, x:[Float](http://api.haxe.org/Float.html)<span></span>, y:[Float](http://api.haxe.org/Float.html)<span></span>, z:[Float](http://api.haxe.org/Float.html)<span></span>, w:[Float](http://api.haxe.org/Float.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="vertexAttrib4fv"><a class="lift" href="#vertexAttrib4fv">vertexAttrib4fv</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">vertexAttrib4fv(indx:[Int](http://api.haxe.org/Int.html)<span></span>, values:[snow.utils.Float32Array](../../../../api/snow/utils/Float32Array.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


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