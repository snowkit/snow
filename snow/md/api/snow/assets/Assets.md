
[![Logo](../../../images/logo.png)](../../../api/index.html)

<hr/>
<a href="#" id="search_bar" onclick="return;"><div> search API <em>(or start typing anywhere)</em> </div></a>
<hr/>

<script src="../../../js/omnibar.js"> </script>
<link rel="stylesheet" type="text/css" href="../../../css/omnibar.css" media="all">

<div id="omnibar"> <a href="#" onclick="return" id="omnibar_close"></a> <input id="omnibar_text" type="text" placeholder="search types..."></input></div>
<script  id="typelist" data-relpath="../../../" data-types="snow.App,snow.AppFixedTimestep,snow.Core,snow.CoreBinding,snow.Log,snow.Snow,snow.assets.Asset,snow.assets.AssetAudio,snow.assets.AssetBytes,snow.assets.AssetImage,snow.assets.AssetSystem,snow.assets.AssetSystemBinding,snow.assets.AssetText,snow.assets.Assets,snow.audio.Audio,snow.audio.AudioSystem,snow.audio.AudioSystemBinding,snow.audio.Sound,snow.audio.SoundBinding,snow.audio.SoundStream,snow.audio._Audio.AudioHandleMap,snow.audio.openal.AL,snow.audio.openal.ALC,snow.audio.openal.Context,snow.audio.openal.Device,snow.input.Input,snow.input.InputSystem,snow.input.InputSystemBinding,snow.input.Keycodes,snow.input.MapIntBool,snow.input.MapIntFloat,snow.input.Scancodes,snow.io.IO,snow.io.IOSystem,snow.io.IOSystemBinding,snow.platform.native.Core,snow.platform.native.StaticSnow,snow.platform.native.assets.AssetSystem,snow.platform.native.audio.AudioSystem,snow.platform.native.audio.Sound,snow.platform.native.audio.SoundStream,snow.platform.native.audio.openal.AL,snow.platform.native.audio.openal.ALC,snow.platform.native.audio.openal.AudioSystem,snow.platform.native.audio.openal.Context,snow.platform.native.audio.openal.Device,snow.platform.native.audio.openal.OpenALHelper,snow.platform.native.audio.openal.Sound,snow.platform.native.audio.openal.SoundStream,snow.platform.native.audio.openal._AL.Context_Impl_,snow.platform.native.audio.openal._AL.Device_Impl_,snow.platform.native.input.InputSystem,snow.platform.native.input.sdl.ControllerEventType,snow.platform.native.input.sdl.InputSystem,snow.platform.native.input.sdl.KeyEventType,snow.platform.native.input.sdl.ModValue,snow.platform.native.input.sdl.MouseEventType,snow.platform.native.input.sdl.TouchEventType,snow.platform.native.io.IOFile,snow.platform.native.io.IOFileHandle,snow.platform.native.io.IOSystem,snow.platform.native.io._IOFile.IOFileHandle_Impl_,snow.platform.native.render.opengl.GL,snow.platform.native.render.opengl.GLActiveInfo,snow.platform.native.render.opengl.GLBuffer,snow.platform.native.render.opengl.GLContextAttributes,snow.platform.native.render.opengl.GLFBO,snow.platform.native.render.opengl.GLFramebuffer,snow.platform.native.render.opengl.GLObject,snow.platform.native.render.opengl.GLProgram,snow.platform.native.render.opengl.GLRBO,snow.platform.native.render.opengl.GLRenderbuffer,snow.platform.native.render.opengl.GLShader,snow.platform.native.render.opengl.GLShaderPrecisionFormat,snow.platform.native.render.opengl.GLTexture,snow.platform.native.render.opengl.GLUniformLocation,snow.platform.native.render.opengl._GL.GLFramebuffer_Impl_,snow.platform.native.render.opengl._GL.GLRenderbuffer_Impl_,snow.platform.native.utils.ArrayBuffer,snow.platform.native.utils.ArrayBufferView,snow.platform.native.utils.ByteArray,snow.platform.native.utils.Compression,snow.platform.native.utils.Float32Array,snow.platform.native.utils.Int16Array,snow.platform.native.utils.Int32Array,snow.platform.native.utils.Int8Array,snow.platform.native.utils.UInt16Array,snow.platform.native.utils.UInt32Array,snow.platform.native.utils.UInt8Array,snow.platform.native.utils.UInt8ClampedArray,snow.platform.native.window.WindowSystem,snow.platform.native.window.sdl.WindowSystem,snow.platform.web.assets.psd.PSD,snow.platform.web.audio.AudioSystem,snow.platform.web.audio.Sound,snow.platform.web.audio.SoundStream,snow.platform.web.audio.howlerjs.AudioParams,snow.platform.web.audio.howlerjs.AudioSystem,snow.platform.web.audio.howlerjs.Howl,snow.platform.web.audio.howlerjs.Howler,snow.platform.web.audio.howlerjs.SoundStream,snow.platform.web.audio.howlerjs.SpriteParams,snow.render.opengl.GL,snow.render.opengl.GLActiveInfo,snow.render.opengl.GLBuffer,snow.render.opengl.GLContextAttributes,snow.render.opengl.GLFramebuffer,snow.render.opengl.GLProgram,snow.render.opengl.GLRenderbuffer,snow.render.opengl.GLShader,snow.render.opengl.GLTexture,snow.render.opengl.GLUniformLocation,snow.types.AppConfig,snow.types.AppConfigNative,snow.types.AppConfigWeb,snow.types.AssetAudioOptions,snow.types.AssetBytesOptions,snow.types.AssetImageOptions,snow.types.AssetInfo,snow.types.AssetTextOptions,snow.types.AssetType,snow.types.AudioDataBlob,snow.types.AudioDataInfo,snow.types.AudioFormatType,snow.types.AudioHandle,snow.types.AudioInfo,snow.types.DisplayMode,snow.types.FileEvent,snow.types.FileEventType,snow.types.FileFilter,snow.types.GamepadDeviceEventType,snow.types.ImageInfo,snow.types.InputEvent,snow.types.InputEventType,snow.types.Key,snow.types.ModState,snow.types.Scan,snow.types.SnowConfig,snow.types.SystemEvent,snow.types.SystemEventType,snow.types.TextEventType,snow.types.WindowConfig,snow.types.WindowEvent,snow.types.WindowEventType,snow.types.WindowHandle,snow.utils.AbstractClass,snow.utils.AbstractClassBuilder,snow.utils.ArrayBuffer,snow.utils.ArrayBufferView,snow.utils.ByteArray,snow.utils.Float32Array,snow.utils.IDataInput,snow.utils.IMemoryRange,snow.utils.Int16Array,snow.utils.Int32Array,snow.utils.Int8Array,snow.utils.Libs,snow.utils.Timer,snow.utils.UInt16Array,snow.utils.UInt32Array,snow.utils.UInt8Array,snow.utils.UInt8ClampedArray,snow.utils._AbstractClass.StringMap,snow.utils.format.png.Chunk,snow.utils.format.png.Color,snow.utils.format.png.Data,snow.utils.format.png.Header,snow.utils.format.png.Reader,snow.utils.format.png.Tools,snow.utils.format.png.Writer,snow.utils.format.tools.Adler32,snow.utils.format.tools.Deflate,snow.utils.format.tools.HuffTools,snow.utils.format.tools.Huffman,snow.utils.format.tools.Inflate,snow.utils.format.tools.InflateImpl,snow.utils.format.tools.MemoryBytes,snow.utils.format.tools._InflateImpl.State,snow.utils.format.tools._InflateImpl.Window,snow.window.Window,snow.window.WindowSystem,snow.window.WindowSystemBinding,snow.window.Windowing,snow.window._Windowing.WindowHandleMap"></script>


<h1>Assets</h1>
<small>`snow.assets.Assets`</small>

The asset system class gives you access to fetching and manipulating assets,
    handling loading files and data in a consistent cross platform way

<hr/>

`class`<br/><span class="meta">
meta: @:keep</span>

<hr/>


&nbsp;
&nbsp;




<h3>Members</h3> <hr/><span class="member apipage">
                <a name="assets_root"><a class="lift" href="#assets_root">assets\_root</a></a><div class="clear"></div>
                <code class="signature apipage">assets\_root : [String](http://api.haxe.org/String.html)</code><br/></span>
            <span class="small_desc_flat">If the assets are not relative to the runtime root path, this value can adjust all asset paths. This is automatically handled and exists to allow control.</span><br/><span class="member apipage">
                <a name="list"><a class="lift" href="#list">list</a></a><div class="clear"></div>
                <code class="signature apipage">list : [Map](http://api.haxe.org/Map.html)&lt;[String](http://api.haxe.org/String.html), [snow.types.AssetInfo](../../../api/snow/types/AssetInfo.html)&gt;</code><br/></span>
            <span class="small_desc_flat">The list of assets in the system, added at startup by the `App` class, in the `get_asset_list` function</span><br/><span class="member apipage">
                <a name="manifest_path"><a class="lift" href="#manifest_path">manifest\_path</a></a><div class="clear"></div>
                <code class="signature apipage">manifest\_path : [String](http://api.haxe.org/String.html)</code><br/></span>
            <span class="small_desc_flat">The manifest file to parse for the asset list. By default, this is set to `manifest` from the build tools but the `App` class can have a custom `get_asset_list` handler use this value.</span><br/><span class="member apipage">
                <a name="strict"><a class="lift" href="#strict">strict</a></a><div class="clear"></div>
                <code class="signature apipage">strict : [Bool](http://api.haxe.org/Bool.html)</code><br/></span>
            <span class="small_desc_flat">The default approach to finding assets, overridable in each get call, this value will be used if the flag is not specified.</span><br/>


<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="add"><a class="lift" href="#add">add</a></a><div class="clear"></div>
            <code class="signature apipage">add(\_list:[Array](http://api.haxe.org/Array.html)&lt;[snow.types.AssetInfo](../../../api/snow/types/AssetInfo.html)&gt;<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Add an asset info list to the system</span>


</span>
<span class="method apipage">
            <a name="audio"><a class="lift" href="#audio">audio</a></a><div class="clear"></div>
            <code class="signature apipage">audio(\_id:[String](http://api.haxe.org/String.html)<span></span>, options:[snow.types.AssetAudioOptions](../../../api/snow/types/AssetAudioOptions.html)<span>=null</span>) : [snow.assets.AssetAudio](../../../api/snow/assets/AssetAudio.html)</code><br/><span class="small_desc_flat">Get an asset as a `AssetAudio`, used for audio files</span>


</span>
<span class="method apipage">
            <a name="bytes"><a class="lift" href="#bytes">bytes</a></a><div class="clear"></div>
            <code class="signature apipage">bytes(\_id:[String](http://api.haxe.org/String.html)<span></span>, options:[snow.types.AssetBytesOptions](../../../api/snow/types/AssetBytesOptions.html)<span>=null</span>) : [snow.assets.AssetBytes](../../../api/snow/assets/AssetBytes.html)</code><br/><span class="small_desc_flat">Get an asset as a `AssetBytes`, data stored as `ByteArray` used for binary assets.</span>


</span>
<span class="method apipage">
            <a name="exists"><a class="lift" href="#exists">exists</a></a><div class="clear"></div>
            <code class="signature apipage">exists(\_id:[String](http://api.haxe.org/String.html)<span></span>, \_strict:[Bool](http://api.haxe.org/Bool.html)<span>=true</span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat">Check if an asset exists for a given id.
            On web targets, there is no file exists check so unless it is stored in the asset list
            this function will return false specyifying why.</span>


</span>
<span class="method apipage">
            <a name="get"><a class="lift" href="#get">get</a></a><div class="clear"></div>
            <code class="signature apipage">get(\_id:[String](http://api.haxe.org/String.html)<span></span>) : [snow.types.AssetInfo](../../../api/snow/types/AssetInfo.html)</code><br/><span class="small_desc_flat">Get an asset info for a given id</span>


</span>
<span class="method apipage">
            <a name="image"><a class="lift" href="#image">image</a></a><div class="clear"></div>
            <code class="signature apipage">image(\_id:[String](http://api.haxe.org/String.html)<span></span>, options:[snow.types.AssetImageOptions](../../../api/snow/types/AssetImageOptions.html)<span>=null</span>) : [snow.assets.AssetImage](../../../api/snow/assets/AssetImage.html)</code><br/><span class="small_desc_flat">Get an asset as a `AssetImage`, data stored as `ImageInfo`, used for image files</span>


</span>
<span class="method apipage">
            <a name="listed"><a class="lift" href="#listed">listed</a></a><div class="clear"></div>
            <code class="signature apipage">listed(\_id:[String](http://api.haxe.org/String.html)<span></span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat">Check if an asset info exists in the list for a given id.</span>


</span>
<span class="method apipage">
            <a name="path"><a class="lift" href="#path">path</a></a><div class="clear"></div>
            <code class="signature apipage">path(\_id:[String](http://api.haxe.org/String.html)<span></span>) : [String](http://api.haxe.org/String.html)</code><br/><span class="small_desc_flat">Get the asset path for an asset, adjusted by platform, root etc.
            If it fails to find the asset the id is returned as is with the asset root prefixed.</span>


</span>
<span class="method apipage">
            <a name="text"><a class="lift" href="#text">text</a></a><div class="clear"></div>
            <code class="signature apipage">text(\_id:[String](http://api.haxe.org/String.html)<span></span>, options:[snow.types.AssetTextOptions](../../../api/snow/types/AssetTextOptions.html)<span>=null</span>) : [snow.assets.AssetText](../../../api/snow/assets/AssetText.html)</code><br/><span class="small_desc_flat">Get an asset as a `AssetText`, data stored as `String`, used for text based assets</span>


</span>



<hr/>

&nbsp;
&nbsp;
&nbsp;
&nbsp;