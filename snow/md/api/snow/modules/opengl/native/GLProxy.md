
[![Logo](../../../../../images/logo.png)](../../../../../api/index.html)

<hr/>
<a href="#" id="search_bar" onclick="return;"><div> search API <em>(or start typing anywhere)</em> </div></a>
<hr/>

<script src="../../../../../js/omnibar.js"> </script>
<link rel="stylesheet" type="text/css" href="../../../../../css/omnibar.css" media="all">

<div id="omnibar"> <a href="#" onclick="return" id="omnibar_close"></a> <input id="omnibar_text" type="text" placeholder="search types..."></input></div>
<script  id="typelist" data-relpath="../../../../../" data-types="snow.App,snow.AppFixedTimestep,snow.Snow,snow._Snow.Core,snow.api.Debug,snow.api.DebugError,snow.api.File,snow.api.FileHandle,snow.api.FileSeek,snow.api.Libs,snow.api.Promise,snow.api.PromiseError,snow.api.PromiseState,snow.api.Promises,snow.api.Timer,snow.api._Debug.LogError,snow.api._File.FileHandle_Impl_,snow.api._File.FileSeek_Impl_,snow.api._Promise.PromiseState_Impl_,snow.api.buffers.ArrayBuffer,snow.api.buffers.ArrayBufferIO,snow.api.buffers.ArrayBufferView,snow.api.buffers.DataView,snow.api.buffers.Float32Array,snow.api.buffers.Float64Array,snow.api.buffers.Int16Array,snow.api.buffers.Int32Array,snow.api.buffers.Int8Array,snow.api.buffers.TAError,snow.api.buffers.TypedArrayType,snow.api.buffers.Uint16Array,snow.api.buffers.Uint32Array,snow.api.buffers.Uint8Array,snow.api.buffers.Uint8ClampedArray,snow.api.buffers._ArrayBuffer.ArrayBuffer_Impl_,snow.api.buffers._Float32Array.Float32Array_Impl_,snow.api.buffers._Float64Array.Float64Array_Impl_,snow.api.buffers._Int16Array.Int16Array_Impl_,snow.api.buffers._Int32Array.Int32Array_Impl_,snow.api.buffers._Int8Array.Int8Array_Impl_,snow.api.buffers._TypedArrayType.TypedArrayType_Impl_,snow.api.buffers._Uint16Array.Uint16Array_Impl_,snow.api.buffers._Uint32Array.Uint32Array_Impl_,snow.api.buffers._Uint8Array.Uint8Array_Impl_,snow.api.buffers._Uint8ClampedArray.Uint8ClampedArray_Impl_,snow.core.native.Core,snow.core.native._Core.StaticSnow,snow.core.native.assets.Assets,snow.core.native.assets._Assets.NativeAudioDataBlob,snow.core.native.assets._Assets.NativeAudioDataInfo,snow.core.native.assets._Assets.NativeAudioInfo,snow.core.native.audio.Audio,snow.core.native.audio.Sound,snow.core.native.input.Input,snow.core.native.io.IO,snow.core.native.window.Windowing,snow.core.web.assets.psd.PSD,snow.core.web.input.DOMKeys,snow.modules.interfaces.Assets,snow.modules.interfaces.Audio,snow.modules.interfaces.IO,snow.modules.interfaces.Input,snow.modules.interfaces.Windowing,snow.modules.openal.AL,snow.modules.openal.ALC,snow.modules.openal.ALHelper,snow.modules.openal.Audio,snow.modules.openal.Context,snow.modules.openal.Device,snow.modules.openal.Sound,snow.modules.openal._AL.Context_Impl_,snow.modules.openal._AL.Device_Impl_,snow.modules.openal.sound.ALSound,snow.modules.openal.sound.ALStream,snow.modules.openal.sound.Sound,snow.modules.opengl.GL,snow.modules.opengl.GLActiveInfo,snow.modules.opengl.GLBuffer,snow.modules.opengl.GLContextAttributes,snow.modules.opengl.GLFramebuffer,snow.modules.opengl.GLProgram,snow.modules.opengl.GLRenderbuffer,snow.modules.opengl.GLShader,snow.modules.opengl.GLTexture,snow.modules.opengl.GLUniformLocation,snow.modules.opengl.native.GL,snow.modules.opengl.native.GLActiveInfo,snow.modules.opengl.native.GLBO,snow.modules.opengl.native.GLBuffer,snow.modules.opengl.native.GLContextAttributes,snow.modules.opengl.native.GLFBO,snow.modules.opengl.native.GLFramebuffer,snow.modules.opengl.native.GLLink,snow.modules.opengl.native.GLObject,snow.modules.opengl.native.GLPO,snow.modules.opengl.native.GLProgram,snow.modules.opengl.native.GLProxy,snow.modules.opengl.native.GLRBO,snow.modules.opengl.native.GLRenderbuffer,snow.modules.opengl.native.GLSO,snow.modules.opengl.native.GLShader,snow.modules.opengl.native.GLShaderPrecisionFormat,snow.modules.opengl.native.GLTO,snow.modules.opengl.native.GLTexture,snow.modules.opengl.native.GLUniformLocation,snow.modules.opengl.native.GL_FFI,snow.modules.opengl.native.GL_Native,snow.modules.opengl.native._GL.GLBuffer_Impl_,snow.modules.opengl.native._GL.GLFramebuffer_Impl_,snow.modules.opengl.native._GL.GLProgram_Impl_,snow.modules.opengl.native._GL.GLRenderbuffer_Impl_,snow.modules.opengl.native._GL.GLShader_Impl_,snow.modules.opengl.native._GL.GLTexture_Impl_,snow.modules.opengl.native._GL.GLUniformLocation_Impl_,snow.modules.sdl.ControllerEventType,snow.modules.sdl.Input,snow.modules.sdl.KeyEventType,snow.modules.sdl.ModValue,snow.modules.sdl.MouseEventType,snow.modules.sdl.TouchEventType,snow.modules.sdl.Windowing,snow.modules.sdl._Input.ControllerEventType_Impl_,snow.modules.sdl._Input.KeyEventType_Impl_,snow.modules.sdl._Input.ModValue_Impl_,snow.modules.sdl._Input.MouseEventType_Impl_,snow.modules.sdl._Input.TouchEventType_Impl_,snow.system.assets.Asset,snow.system.assets.AssetBytes,snow.system.assets.AssetImage,snow.system.assets.AssetJSON,snow.system.assets.AssetText,snow.system.assets.Assets,snow.system.assets._Assets.AssetsModule,snow.system.audio.Audio,snow.system.audio.AudioModule,snow.system.audio.Sound,snow.system.input.Input,snow.system.input.Keycodes,snow.system.input.MapIntBool,snow.system.input.MapIntFloat,snow.system.input.Scancodes,snow.system.input._Input.InputModule,snow.system.io.IO,snow.system.io._IO.IOModule,snow.system.module.Assets,snow.system.module.Audio,snow.system.module.IO,snow.system.module.Input,snow.system.module.Sound,snow.system.module.Windowing,snow.system.window.Window,snow.system.window.Windowing,snow.system.window._Windowing.WindowHandleMap,snow.system.window._Windowing.WindowingModule,snow.types.AppConfig,snow.types.AppConfigNative,snow.types.AppConfigWeb,snow.types.Asset,snow.types.AssetBytes,snow.types.AssetImage,snow.types.AssetJSON,snow.types.AssetText,snow.types.AssetType,snow.types.AudioDataBlob,snow.types.AudioDataInfo,snow.types.AudioFormatType,snow.types.AudioHandle,snow.types.AudioInfo,snow.types.DisplayMode,snow.types.Error,snow.types.FileEvent,snow.types.FileEventType,snow.types.FileFilter,snow.types.GamepadDeviceEventType,snow.types.IODataOptions,snow.types.ImageInfo,snow.types.InputEvent,snow.types.InputEventType,snow.types.Key,snow.types.ModState,snow.types.OS,snow.types.OpenGLProfile,snow.types.Platform,snow.types.RenderConfig,snow.types.RenderConfigOpenGL,snow.types.Scan,snow.types.SnowConfig,snow.types.SystemEvent,snow.types.SystemEventType,snow.types.TextEventType,snow.types.WindowConfig,snow.types.WindowEvent,snow.types.WindowEventType,snow.types.WindowHandle,snow.types.WindowingConfig,snow.types._Types.AssetType_Impl_,snow.types._Types.AudioFormatType_Impl_,snow.types._Types.FileEventType_Impl_,snow.types._Types.GamepadDeviceEventType_Impl_,snow.types._Types.InputEventType_Impl_,snow.types._Types.OS_Impl_,snow.types._Types.OpenGLProfile_Impl_,snow.types._Types.Platform_Impl_,snow.types._Types.SystemEventType_Impl_,snow.types._Types.TextEventType_Impl_,snow.types._Types.WindowEventType_Impl_"></script>


<h1>GLProxy</h1>
<small>`snow.modules.opengl.native.GLProxy`</small>



<hr/>

`class`<br/><span class="meta">
meta: @:cppFileCode(&lt;![CDATA[&quot;\r\n    #include \&quot;render/opengl/snow_opengl.h\&quot;\r\n    #include \&quot;snow_core.h\&quot;\r\n    #include \&quot;haxe/io/Bytes.h\&quot;\r\n\r\n    #ifdef NATIVE_TOOLKIT_GLEW\r\n        #define HAS_EXT_framebuffer_object GLEW_EXT_framebuffer_object\r\n    #else\r\n        #define HAS_EXT_framebuffer_object true\r\n    #endif\r\n\r\n    namespace snow{\r\n    namespace platform{\r\n    namespace native{\r\n    namespace render{\r\n    namespace opengl{\r\n\r\n            int create_texture() {\r\n                printf(\&quot;%s\\n\&quot;, \&quot;inside create texture\&quot;);\r\n                unsigned int id = 0;\r\n                glGenTextures(1,&amp;id);\r\n                printf(\&quot;%s\\n\&quot;, \&quot;after create texture\&quot;);\r\n                return id;\r\n            }\r\n\r\n            void delete_texture(int id) {\r\n                glDeleteTextures(1, (GLuint*)&amp;id);\r\n            }\r\n\r\n            int create_buffer() {\r\n                GLuint buffers;\r\n                glGenBuffers(1,&amp;buffers);\r\n                return buffers;\r\n            }\r\n\r\n            int get_shader_parameter(int id, int param) {\r\n                int result = 0;\r\n                glGetShaderiv(id, param, &amp;result);\r\n                return result;\r\n            }\r\n\r\n            ::String get_shader_source(int id) {\r\n                int len = 0;\r\n                glGetShaderiv(id, GL_SHADER_SOURCE_LENGTH, &amp;len);\r\n                if (len == 0) return null();\r\n                char *buf = new char[len+1];\r\n                glGetShaderSource(id, len+1, 0, buf);\r\n                ::String result(buf);\r\n                delete [] buf;\r\n                return result;\r\n            }\r\n\r\n            ::String get_shader_info_log(int id) {\r\n                char buf[1024] = \&quot;\&quot;;\r\n                glGetShaderInfoLog(id, 1024, 0, buf);\r\n                return ::String(buf);\r\n            }\r\n\r\n            ::String get_program_info_log(int id) {\r\n                char buf[1024] = \&quot;\&quot;;\r\n                glGetProgramInfoLog(id, 1024, 0, buf);\r\n                return ::String(buf);\r\n            }\r\n\r\n            ::String get_parameter_str(int param) {\r\n                switch(param) {\r\n                    case GL_VENDOR:\r\n                    case GL_VERSION:\r\n                    case GL_RENDERER:\r\n                        return ::String((const char *)glGetString(param));\r\n                    break;\r\n                }\r\n                return ::String();\r\n            }\r\n\r\n            int get_parameter(int param) {\r\n                switch(param) {\r\n                    case GL_ARRAY_BUFFER_BINDING:\r\n                    case GL_CURRENT_PROGRAM:\r\n                    case GL_ELEMENT_ARRAY_BUFFER_BINDING:\r\n                    case GL_FRAMEBUFFER_BINDING:\r\n                    case GL_RENDERBUFFER_BINDING:\r\n                    case GL_TEXTURE_BINDING_2D:\r\n                    case GL_TEXTURE_BINDING_CUBE_MAP:\r\n                    case GL_DEPTH_CLEAR_VALUE:\r\n                    case GL_LINE_WIDTH:\r\n                    case GL_POLYGON_OFFSET_FACTOR:\r\n                    case GL_POLYGON_OFFSET_UNITS:\r\n                    case GL_SAMPLE_COVERAGE_VALUE:\r\n                    case GL_BLEND:\r\n                    case GL_DEPTH_WRITEMASK:\r\n                    case GL_DITHER:\r\n                    case GL_CULL_FACE:\r\n                    case GL_POLYGON_OFFSET_FILL:\r\n                    case GL_SAMPLE_COVERAGE_INVERT:\r\n                    case GL_STENCIL_TEST:\r\n                    case GL_ALPHA_BITS:\r\n                    case GL_ACTIVE_TEXTURE:\r\n                    case GL_BLEND_DST_ALPHA:\r\n                    case GL_BLEND_DST_RGB:\r\n                    case GL_BLEND_EQUATION_ALPHA:\r\n                    case GL_BLEND_EQUATION_RGB:\r\n                    case GL_BLEND_SRC_ALPHA:\r\n                    case GL_BLEND_SRC_RGB:\r\n                    case GL_BLUE_BITS:\r\n                    case GL_CULL_FACE_MODE:\r\n                    case GL_DEPTH_BITS:\r\n                    case GL_DEPTH_FUNC:\r\n                    case GL_DEPTH_TEST:\r\n                    case GL_FRONT_FACE:\r\n                    case GL_GENERATE_MIPMAP_HINT:\r\n                    case GL_GREEN_BITS:\r\n                    case GL_MAX_COMBINED_TEXTURE_IMAGE_UNITS:\r\n                    case GL_MAX_CUBE_MAP_TEXTURE_SIZE:\r\n                    case GL_MAX_TEXTURE_IMAGE_UNITS:\r\n                    case GL_MAX_TEXTURE_SIZE:\r\n                    case GL_MAX_VERTEX_ATTRIBS:\r\n                    case GL_MAX_VERTEX_TEXTURE_IMAGE_UNITS:\r\n                    case GL_NUM_COMPRESSED_TEXTURE_FORMATS:\r\n                    case GL_PACK_ALIGNMENT:\r\n                    case GL_RED_BITS:\r\n                    case GL_SAMPLE_BUFFERS:\r\n                    case GL_SAMPLES:\r\n                    case GL_SCISSOR_TEST:\r\n                    case GL_SHADING_LANGUAGE_VERSION:\r\n                    case GL_STENCIL_BACK_FAIL:\r\n                    case GL_STENCIL_BACK_FUNC:\r\n                    case GL_STENCIL_BACK_PASS_DEPTH_FAIL:\r\n                    case GL_STENCIL_BACK_PASS_DEPTH_PASS:\r\n                    case GL_STENCIL_BACK_REF:\r\n                    case GL_STENCIL_BACK_VALUE_MASK:\r\n                    case GL_STENCIL_BACK_WRITEMASK:\r\n                    case GL_STENCIL_BITS:\r\n                    case GL_STENCIL_CLEAR_VALUE:\r\n                    case GL_STENCIL_FAIL:\r\n                    case GL_STENCIL_FUNC:\r\n                    case GL_STENCIL_PASS_DEPTH_FAIL:\r\n                    case GL_STENCIL_PASS_DEPTH_PASS:\r\n                    case GL_STENCIL_REF:\r\n                    case GL_STENCIL_VALUE_MASK:\r\n                    case GL_STENCIL_WRITEMASK:\r\n                    case GL_SUBPIXEL_BITS:\r\n                    case GL_UNPACK_ALIGNMENT:\r\n                        int val;\r\n                        glGetIntegerv(param,&amp;val);\r\n                        return val;\r\n                    break;\r\n\r\n                }\r\n                return 0;\r\n            }\r\n\r\n            Array&lt; ::String &gt; get_supported_extensions() {\r\n                Array&lt; ::String &gt; result = Array_obj&lt; ::String &gt;::__new();\r\n\r\n                const char *ext = (const char *)glGetString(GL_EXTENSIONS);\r\n                if (ext &amp;&amp; *ext) {\r\n                    while(true) {\r\n                        const char *next = ext;\r\n                        while(*next &amp;&amp; *next!=&#x27; &#x27;) {\r\n                            next++;\r\n                        }\r\n\r\n                        result-&gt;push( ::String(ext, next - ext) );\r\n\r\n                        if (!*next || !next[1]) {\r\n                            break;\r\n                        }\r\n\r\n                        ext = next+1;\r\n                    } //while true\r\n                } //if ext and *ext\r\n                return result;\r\n            }\r\n\r\n            void shader_source(int id, const char* source) {\r\n                glShaderSource(id, 1, &amp;source, 0);\r\n            }\r\n\r\n            int get_program_parameter(int id, int param) {\r\n                int result = 0;\r\n                glGetProgramiv(id, param, &amp;result);\r\n                return result;\r\n            }\r\n\r\n            int create_frame_buffer() {\r\n                GLuint id = 0;\r\n                if( HAS_EXT_framebuffer_object ) {\r\n                    glGenFramebuffers( 1, &amp;id );\r\n                } else {\r\n                    printf(\&quot;%s\\n\&quot;, \&quot;snow / framebuffer object extension not found. / createFramebuffer\&quot;);\r\n                }\r\n                return id;\r\n            }\r\n\r\n            bool is_frame_buffer(int id) {\r\n                if (HAS_EXT_framebuffer_object) {\r\n                    return glIsFramebuffer(id);\r\n                } else {\r\n                    printf(\&quot;%s\\n\&quot;, \&quot;snow / framebuffer object extension not found. / IsFramebuffer\&quot;);\r\n                }\r\n                return false;\r\n            }\r\n\r\n            bool is_render_buffer(int id) {\r\n                if (HAS_EXT_framebuffer_object) {\r\n                    return glIsRenderbuffer(id);\r\n                } else {\r\n                    printf(\&quot;%s\\n\&quot;, \&quot;snow / framebuffer object extension not found. / IsRenderbuffer\&quot;);\r\n                }\r\n                return false;\r\n            }\r\n\r\n            int create_render_buffer() {\r\n                GLuint id = 0;\r\n                if( HAS_EXT_framebuffer_object ) {\r\n                    glGenRenderbuffers( 1, &amp;id );\r\n                } else {\r\n                    printf(\&quot;%s\\n\&quot;, \&quot;snow / framebuffer object extension not found. / createRenderbuffer\&quot;);\r\n                }\r\n                return id;\r\n            }\r\n\r\n            void delete_frame_buffer(int id) {\r\n                if (HAS_EXT_framebuffer_object) {\r\n                    glDeleteFramebuffers(1, (GLuint*)&amp;id);\r\n                } else {\r\n                    printf(\&quot;%s\\n\&quot;, \&quot;snow / framebuffer object extension not found. / DeleteFramebuffers\&quot;);\r\n                }\r\n            }\r\n\r\n            void delete_render_buffer(int id) {\r\n                if (HAS_EXT_framebuffer_object) {\r\n                    glDeleteRenderbuffers(1, (GLuint*)&amp;id);\r\n                } else {\r\n                    printf(\&quot;%s\\n\&quot;, \&quot;snow / framebuffer object extension not found. / DeleteRenderbuffers\&quot;);\r\n                }\r\n            }\r\n\r\n            ::String get_version_string() {\r\n                const char* gl_ver = (const char*)glGetString(GL_VERSION);\r\n                const char* gl_sl  = (const char*)glGetString(GL_SHADING_LANGUAGE_VERSION);\r\n                const char* gl_ren = (const char*)glGetString(GL_RENDERER);\r\n                const char* gl_ven = (const char*)glGetString(GL_VENDOR);\r\n                ::String ver = ::String( gl_ver ? gl_ver   : \&quot;GL(null)\&quot; );\r\n                ::String sl  = ::String( gl_sl  ? gl_sl    : \&quot;GLSL(null)\&quot; );\r\n                ::String ren = ::String( gl_ren ? gl_ren   : \&quot;GLRenderer(null)\&quot; );\r\n                ::String ven = ::String( gl_ven ? gl_ven   : \&quot;GLVendor(null)\&quot; );\r\n                ::String slash(\&quot; / \&quot;);\r\n                return slash + ver + slash + sl + slash + ren + slash + ven + slash;\r\n            }\r\n\r\n    } //opengl\r\n    } //render\r\n    } //native\r\n    } //platform\r\n    } //snow\r\n\r\n&quot;]]&gt;), @:headerCode(&lt;![CDATA[&quot;\r\n    #include \&quot;render/opengl/snow_opengl.h\&quot;\r\n\r\n    namespace snow {\r\n    namespace platform {\r\n    namespace native {\r\n    namespace render {\r\n    namespace opengl {\r\n        extern int create_texture();\r\n        extern void delete_texture(int id);\r\n        extern int create_buffer();\r\n        extern void delete_buffer(int id);\r\n        extern bool is_frame_buffer(int id);\r\n        extern bool is_render_buffer(int id);\r\n        extern int create_frame_buffer();\r\n        extern void delete_frame_buffer(int id);\r\n        extern int create_render_buffer();\r\n        extern void delete_render_buffer(int id);\r\n        extern int get_shader_parameter(int id, int param);\r\n        extern ::String get_shader_source(int id);\r\n        extern ::String get_shader_info_log(int id);\r\n        extern ::String get_program_info_log(int id);\r\n        extern int get_parameter(int param);\r\n        extern ::String get_parameter_str(int param);\r\n        extern Array&lt; ::String &gt; get_supported_extensions();\r\n        extern void shader_source(int id, const char* source);\r\n        extern int get_program_parameter(int id, int param);\r\n        extern ::String get_version_string();\r\n    } //opengl\r\n    } //render\r\n    } //native\r\n    } //platform\r\n    } //snow\r\n&quot;]]&gt;), @:keep</span>

<hr/>


&nbsp;
&nbsp;






<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="bufferData"><a class="lift" href="#bufferData">bufferData</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">bufferData(target:[Int](http://api.haxe.org/Int.html)<span></span>, data:[snow.api.buffers.ArrayBufferView](../../../../../api/snow/api/buffers/ArrayBufferView.html)<span></span>, usage:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="bufferSubData"><a class="lift" href="#bufferSubData">bufferSubData</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">bufferSubData(target:[Int](http://api.haxe.org/Int.html)<span></span>, offset:[Int](http://api.haxe.org/Int.html)<span></span>, data:[snow.api.buffers.ArrayBufferView](../../../../../api/snow/api/buffers/ArrayBufferView.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


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
            <a name="readPixels"><a class="lift" href="#readPixels">readPixels</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">readPixels(x:[Int](http://api.haxe.org/Int.html)<span></span>, y:[Int](http://api.haxe.org/Int.html)<span></span>, width:[Int](http://api.haxe.org/Int.html)<span></span>, height:[Int](http://api.haxe.org/Int.html)<span></span>, format:[Int](http://api.haxe.org/Int.html)<span></span>, type:[Int](http://api.haxe.org/Int.html)<span></span>, data:[snow.api.buffers.ArrayBufferView](../../../../../api/snow/api/buffers/ArrayBufferView.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="texImage2D"><a class="lift" href="#texImage2D">texImage2D</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">texImage2D(target:[Int](http://api.haxe.org/Int.html)<span></span>, level:[Int](http://api.haxe.org/Int.html)<span></span>, internalformat:[Int](http://api.haxe.org/Int.html)<span></span>, width:[Int](http://api.haxe.org/Int.html)<span></span>, height:[Int](http://api.haxe.org/Int.html)<span></span>, border:[Int](http://api.haxe.org/Int.html)<span></span>, format:[Int](http://api.haxe.org/Int.html)<span></span>, type:[Int](http://api.haxe.org/Int.html)<span></span>, data:[snow.api.buffers.ArrayBufferView](../../../../../api/snow/api/buffers/ArrayBufferView.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="texSubImage2D"><a class="lift" href="#texSubImage2D">texSubImage2D</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">texSubImage2D(target:[Int](http://api.haxe.org/Int.html)<span></span>, level:[Int](http://api.haxe.org/Int.html)<span></span>, xoffset:[Int](http://api.haxe.org/Int.html)<span></span>, yoffset:[Int](http://api.haxe.org/Int.html)<span></span>, width:[Int](http://api.haxe.org/Int.html)<span></span>, height:[Int](http://api.haxe.org/Int.html)<span></span>, format:[Int](http://api.haxe.org/Int.html)<span></span>, type:[Int](http://api.haxe.org/Int.html)<span></span>, data:[snow.api.buffers.ArrayBufferView](../../../../../api/snow/api/buffers/ArrayBufferView.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="uniform1fv"><a class="lift" href="#uniform1fv">uniform1fv</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">uniform1fv(location:[snow.modules.opengl.native.GLUniformLocation](../../../../../api/snow/modules/opengl/native/GLUniformLocation.html)<span></span>, data:[snow.api.buffers.Float32Array](../../../../../api/snow/api/buffers/Float32Array.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="uniform1iv"><a class="lift" href="#uniform1iv">uniform1iv</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">uniform1iv(location:[snow.modules.opengl.native.GLUniformLocation](../../../../../api/snow/modules/opengl/native/GLUniformLocation.html)<span></span>, data:[snow.api.buffers.Int32Array](../../../../../api/snow/api/buffers/Int32Array.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="uniform2fv"><a class="lift" href="#uniform2fv">uniform2fv</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">uniform2fv(location:[snow.modules.opengl.native.GLUniformLocation](../../../../../api/snow/modules/opengl/native/GLUniformLocation.html)<span></span>, data:[snow.api.buffers.Float32Array](../../../../../api/snow/api/buffers/Float32Array.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="uniform2iv"><a class="lift" href="#uniform2iv">uniform2iv</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">uniform2iv(location:[snow.modules.opengl.native.GLUniformLocation](../../../../../api/snow/modules/opengl/native/GLUniformLocation.html)<span></span>, data:[snow.api.buffers.Int32Array](../../../../../api/snow/api/buffers/Int32Array.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="uniform3fv"><a class="lift" href="#uniform3fv">uniform3fv</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">uniform3fv(location:[snow.modules.opengl.native.GLUniformLocation](../../../../../api/snow/modules/opengl/native/GLUniformLocation.html)<span></span>, data:[snow.api.buffers.Float32Array](../../../../../api/snow/api/buffers/Float32Array.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="uniform3iv"><a class="lift" href="#uniform3iv">uniform3iv</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">uniform3iv(location:[snow.modules.opengl.native.GLUniformLocation](../../../../../api/snow/modules/opengl/native/GLUniformLocation.html)<span></span>, data:[snow.api.buffers.Int32Array](../../../../../api/snow/api/buffers/Int32Array.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="uniform4fv"><a class="lift" href="#uniform4fv">uniform4fv</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">uniform4fv(location:[snow.modules.opengl.native.GLUniformLocation](../../../../../api/snow/modules/opengl/native/GLUniformLocation.html)<span></span>, data:[snow.api.buffers.Float32Array](../../../../../api/snow/api/buffers/Float32Array.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


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
            <a name="vertexAttrib1fv"><a class="lift" href="#vertexAttrib1fv">vertexAttrib1fv</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">vertexAttrib1fv(indx:[Int](http://api.haxe.org/Int.html)<span></span>, data:[snow.api.buffers.Float32Array](../../../../../api/snow/api/buffers/Float32Array.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="vertexAttrib2fv"><a class="lift" href="#vertexAttrib2fv">vertexAttrib2fv</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">vertexAttrib2fv(indx:[Int](http://api.haxe.org/Int.html)<span></span>, data:[snow.api.buffers.Float32Array](../../../../../api/snow/api/buffers/Float32Array.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="vertexAttrib3fv"><a class="lift" href="#vertexAttrib3fv">vertexAttrib3fv</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">vertexAttrib3fv(indx:[Int](http://api.haxe.org/Int.html)<span></span>, data:[snow.api.buffers.Float32Array](../../../../../api/snow/api/buffers/Float32Array.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="vertexAttrib4fv"><a class="lift" href="#vertexAttrib4fv">vertexAttrib4fv</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">vertexAttrib4fv(indx:[Int](http://api.haxe.org/Int.html)<span></span>, data:[snow.api.buffers.Float32Array](../../../../../api/snow/api/buffers/Float32Array.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="vertexAttribPointer"><a class="lift" href="#vertexAttribPointer">vertexAttribPointer</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">vertexAttribPointer(indx:[Int](http://api.haxe.org/Int.html)<span></span>, size:[Int](http://api.haxe.org/Int.html)<span></span>, type:[Int](http://api.haxe.org/Int.html)<span></span>, normalized:[Bool](http://api.haxe.org/Bool.html)<span></span>, stride:[Int](http://api.haxe.org/Int.html)<span></span>, offset:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>



<hr/>

&nbsp;
&nbsp;
&nbsp;
&nbsp;