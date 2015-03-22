package snow.platform.web.render.opengl;

#if snow_web

import js.html.webgl.RenderingContext;

import snow.io.typedarray.ArrayBuffer;
import snow.io.typedarray.ArrayBufferView;
import snow.io.typedarray.Int32Array;
import snow.io.typedarray.Float32Array;


typedef GLActiveInfo                = js.html.webgl.ActiveInfo;
typedef GLBuffer                    = js.html.webgl.Buffer;
typedef GLContextAttributes         = js.html.webgl.ContextAttributes;
typedef GLFramebuffer               = js.html.webgl.Framebuffer;
typedef GLProgram                   = js.html.webgl.Program;
typedef GLRenderbuffer              = js.html.webgl.Renderbuffer;
typedef GLShader                    = js.html.webgl.Shader;
typedef GLTexture                   = js.html.webgl.Texture;
typedef GLUniformLocation           = js.html.webgl.UniformLocation;
typedef GLShaderPrecisionFormat     = js.html.webgl.ShaderPrecisionFormat;

class GL {



    public static var version(get_version, null):Int;
    public static var current_context:RenderingContext;

//non-spec

    public static function versionString():String {

        var ver = current_context.getParameter(VERSION);
        var slver = current_context.getParameter(SHADING_LANGUAGE_VERSION);
        var ren = current_context.getParameter(RENDERER);
        var ven = current_context.getParameter(VENDOR);

        return "/ " + ver + " / " + slver + " / " + ren + " / " + ven + " /";
    }

//spec

    public static function activeTexture(texture:Int):Void
        current_context.activeTexture(texture);

    public static function attachShader(program:GLProgram, shader:GLShader):Void
        current_context.attachShader(program, shader);

    public static function bindAttribLocation(program:GLProgram, index:Int, name:String):Void
        current_context.bindAttribLocation(program, index, name);

    public static function bindBuffer(target:Int, buffer:GLBuffer):Void
        current_context.bindBuffer(target, buffer);

    public static function bindFramebuffer(target:Int, framebuffer:GLFramebuffer):Void
        current_context.bindFramebuffer(target, framebuffer);

    public static function bindRenderbuffer(target:Int, renderbuffer:GLRenderbuffer):Void
        current_context.bindRenderbuffer(target, renderbuffer);

    public static function bindTexture(target:Int, texture:GLTexture):Void
        current_context.bindTexture(target, texture);

    public static function blendColor(red:Float, green:Float, blue:Float, alpha:Float):Void
        current_context.blendColor(red, green, blue, alpha);

    public static function blendEquation(mode:Int):Void
        current_context.blendEquation(mode);

    public static function blendEquationSeparate(modeRGB:Int, modeAlpha:Int):Void
        current_context.blendEquationSeparate(modeRGB, modeAlpha);

    public static function blendFunc(sfactor:Int, dfactor:Int):Void
        current_context.blendFunc(sfactor, dfactor);

    public static function blendFuncSeparate(srcRGB:Int, dstRGB:Int, srcAlpha:Int, dstAlpha:Int):Void
        current_context.blendFuncSeparate(srcRGB, dstRGB, srcAlpha, dstAlpha);

    public static function bufferData(target:Int, data:ArrayBufferView, usage:Int):Void
        current_context.bufferData( target, data, usage );

    public static function bufferSubData(target:Int, offset:Int, data:ArrayBufferView):Void
        current_context.bufferSubData(target, offset, data);

    public static function checkFramebufferStatus(target:Int):Int
        return current_context.checkFramebufferStatus(target);

    public static function clear(mask:Int):Void
        current_context.clear(mask);

    public static function clearColor(red:Float, green:Float, blue:Float, alpha:Float):Void
        current_context.clearColor(red, green, blue, alpha);

    public static function clearDepth(depth:Float):Void
        current_context.clearDepth(depth);

    public static function clearStencil(s:Int):Void
        current_context.clearStencil(s);

    public static function colorMask(red:Bool, green:Bool, blue:Bool, alpha:Bool):Void
        current_context.colorMask(red, green, blue, alpha);

    public static function compileShader(shader:GLShader):Void
        current_context.compileShader(shader);

    public static function compressedTexImage2D(target:Int, level:Int, internalformat:Int, width:Int, height:Int, border:Int, data:ArrayBufferView):Void
        current_context.compressedTexImage2D(target, level, internalformat, width, height, border, data);

    public static function compressedTexSubImage2D(target:Int, level:Int, xoffset:Int, yoffset:Int, width:Int, height:Int, format:Int, data:ArrayBufferView):Void
        current_context.compressedTexSubImage2D(target, level, xoffset, yoffset, width, height, format, data);

    public static function copyTexImage2D(target:Int, level:Int, internalformat:Int, x:Int, y:Int, width:Int, height:Int, border:Int):Void
        current_context.copyTexImage2D(target, level, internalformat, x, y, width, height, border);

    public static function copyTexSubImage2D(target:Int, level:Int, xoffset:Int, yoffset:Int, x:Int, y:Int, width:Int, height:Int):Void
        current_context.copyTexSubImage2D(target, level, xoffset, yoffset, x, y, width, height);

    public static function createBuffer():GLBuffer
        return current_context.createBuffer();

    public static function createFramebuffer():GLFramebuffer
        return current_context.createFramebuffer();

    public static function createProgram():GLProgram
        return current_context.createProgram();

    public static function createRenderbuffer():GLRenderbuffer
        return current_context.createRenderbuffer();

    public static function createShader(type:Int):GLShader
        return current_context.createShader(type);

    public static function createTexture():GLTexture
        return current_context.createTexture();

    public static function cullFace(mode:Int):Void
        current_context.cullFace(mode);

    public static function deleteBuffer(buffer:GLBuffer):Void
        current_context.deleteBuffer(buffer);

    public static function deleteFramebuffer(framebuffer:GLFramebuffer):Void
        current_context.deleteFramebuffer(framebuffer);

    public static function deleteProgram(program:GLProgram):Void
        current_context.deleteProgram(program);

    public static function deleteRenderbuffer(renderbuffer:GLRenderbuffer):Void
        current_context.deleteRenderbuffer(renderbuffer);

    public static function deleteShader(shader:GLShader):Void
        current_context.deleteShader(shader);

    public static function deleteTexture(texture:GLTexture):Void
        current_context.deleteTexture(texture);

    public static function depthFunc(func:Int):Void
        current_context.depthFunc(func);

    public static function depthMask(flag:Bool):Void
        current_context.depthMask(flag);

    public static function depthRange(zNear:Float, zFar:Float):Void
        current_context.depthRange(zNear, zFar);

    public static function detachShader(program:GLProgram, shader:GLShader):Void
        current_context.detachShader(program, shader);

    public static function disable(cap:Int):Void
        current_context.disable(cap);

    public static function disableVertexAttribArray(index:Int):Void
        current_context.disableVertexAttribArray(index);

    public static function drawArrays(mode:Int, first:Int, count:Int):Void
        current_context.drawArrays(mode, first, count);

    public static function drawElements(mode:Int, count:Int, type:Int, offset:Int):Void
        current_context.drawElements(mode, count, type, offset);

    public static function enable(cap:Int):Void
        current_context.enable(cap);

    public static function enableVertexAttribArray(index:Int):Void
        current_context.enableVertexAttribArray(index);

    public static function finish():Void
        current_context.finish();

    public static function flush():Void
        current_context.flush();

    public static function framebufferRenderbuffer(target:Int, attachment:Int, renderbuffertarget:Int, renderbuffer:GLRenderbuffer):Void
        current_context.framebufferRenderbuffer(target, attachment, renderbuffertarget, renderbuffer);

    public static function framebufferTexture2D(target:Int, attachment:Int, textarget:Int, texture:GLTexture, level:Int):Void
        current_context.framebufferTexture2D(target, attachment, textarget, texture, level);

    public static function frontFace(mode:Int):Void
        current_context.frontFace(mode);

    public static function generateMipmap(target:Int):Void
        current_context.generateMipmap(target);

    public static function getActiveAttrib(program:GLProgram, index:Int):GLActiveInfo
        return current_context.getActiveAttrib(program, index);

    public static function getActiveUniform(program:GLProgram, index:Int):GLActiveInfo
        return current_context.getActiveUniform(program, index);

    public static function getAttachedShaders(program:GLProgram):Array<GLShader>
        return current_context.getAttachedShaders(program);

    public static function getAttribLocation(program:GLProgram, name:String):Int
        return current_context.getAttribLocation(program, name);

    public static function getBufferParameter(target:Int, pname:Int):Dynamic
        return current_context.getBufferParameter(target, pname);

    public static function getContextAttributes():GLContextAttributes
        return current_context.getContextAttributes();

    public static function getError():Int
        return current_context.getError();

    public static function getExtension(name:String):Dynamic
        return current_context.getExtension(name);

    public static function getFramebufferAttachmentParameter(target:Int, attachment:Int, pname:Int):Dynamic
        return current_context.getFramebufferAttachmentParameter(target, attachment, pname);

    public static function getParameter(pname:Int):Dynamic
        return current_context.getParameter(pname);

    public static function getProgramInfoLog(program:GLProgram):String
        return current_context.getProgramInfoLog(program);

    public static function getProgramParameter(program:GLProgram, pname:Int):Int
        return current_context.getProgramParameter(program, pname);

    public static function getRenderbufferParameter(target:Int, pname:Int):Dynamic
        return current_context.getRenderbufferParameter(target, pname);

    public static function getShaderInfoLog(shader:GLShader):String
        return current_context.getShaderInfoLog(shader);

    public static function getShaderParameter(shader:GLShader, pname:Int):Int
        return current_context.getShaderParameter(shader, pname);

    public static function getShaderPrecisionFormat(shadertype:Int, precisiontype:Int) : GLShaderPrecisionFormat
        return current_context.getShaderPrecisionFormat(shadertype, precisiontype);

    public static function getShaderSource(shader:GLShader):String
        return current_context.getShaderSource(shader);

    public static function getSupportedExtensions() : Array<String>
        return current_context.getSupportedExtensions();

    public static function getTexParameter(target:Int, pname:Int):Dynamic
        return current_context.getTexParameter(target, pname);

    public static function getUniform(program:GLProgram, location:GLUniformLocation):Dynamic
        return current_context.getUniform(program, location);

    public static function getUniformLocation(program:GLProgram, name:String):GLUniformLocation
        return current_context.getUniformLocation(program, name);

    public static function getVertexAttrib(index:Int, pname:Int):Dynamic
        return current_context.getVertexAttrib(index, pname);

    public static function getVertexAttribOffset(index:Int, pname:Int):Int
        return current_context.getVertexAttribOffset(index, pname);

    public static function hint(target:Int, mode:Int):Void
        current_context.hint(target, mode);

    public static function isBuffer(buffer:GLBuffer):Bool
        return current_context.isBuffer(buffer);

    // This is non-static
    // public function isContextLost():Bool { return false; }

    public static function isEnabled(cap:Int):Bool
        return current_context.isEnabled(cap);

    public static function isFramebuffer(framebuffer:GLFramebuffer):Bool
        return current_context.isFramebuffer(framebuffer);

    public static function isProgram(program:GLProgram):Bool
        return current_context.isProgram(program);

    public static function isRenderbuffer(renderbuffer:GLRenderbuffer):Bool
        return current_context.isRenderbuffer(renderbuffer);

    public static function isShader(shader:GLShader):Bool
        return current_context.isShader(shader);

    public static function isTexture(texture:GLTexture):Bool
        return current_context.isTexture(texture);

    public static function lineWidth(width:Float):Void
        current_context.lineWidth(width);

    public static function linkProgram(program:GLProgram):Void
        current_context.linkProgram(program);

    public static function pixelStorei(pname:Int, param:Int):Void
        current_context.pixelStorei(pname, param);

    public static function polygonOffset(factor:Float, units:Float):Void
        current_context.polygonOffset(factor, units);

        // TODO: pixels? May need setting to work (canvas.getContext("experimental-webgl", {preserveDrawingBuffer: true});)
    public static function readPixels(x:Int, y:Int, width:Int, height:Int, format:Int, type:Int, data:ArrayBufferView):Void
        current_context.readPixels(x, y, width, height, format, type, data);

    public static function renderbufferStorage(target:Int, internalformat:Int, width:Int, height:Int):Void
        current_context.renderbufferStorage(target, internalformat, width, height);

    public static function sampleCoverage(value:Float, invert:Bool):Void
        current_context.sampleCoverage(value, invert);

    public static function scissor(x:Int, y:Int, width:Int, height:Int):Void
        current_context.scissor(x, y, width, height);

    public static function shaderSource(shader:GLShader, source:String):Void
        current_context.shaderSource(shader, source);

    public static function stencilFunc(func:Int, ref:Int, mask:Int):Void
        current_context.stencilFunc(func, ref, mask);

    public static function stencilFuncSeparate(face:Int, func:Int, ref:Int, mask:Int):Void
        current_context.stencilFuncSeparate(face, func, ref, mask);

    public static function stencilMask(mask:Int):Void
        current_context.stencilMask(mask);

    public static function stencilMaskSeparate(face:Int, mask:Int):Void
        current_context.stencilMaskSeparate(face, mask);

    public static function stencilOp(fail:Int, zfail:Int, zpass:Int):Void
        current_context.stencilOp(fail, zfail, zpass);

    public static function stencilOpSeparate(face:Int, fail:Int, zfail:Int, zpass:Int):Void
        current_context.stencilOpSeparate(face, fail, zfail, zpass);

    public static function texImage2D(target:Int, level:Int, internalformat:Int, width:Int, height:Int, border:Int, format:Int, type:Int, data:ArrayBufferView):Void
        current_context.texImage2D(target, level, internalformat, width, height, border, format, type, data);

    public static function texParameterf(target:Int, pname:Int, param:Float):Void
        current_context.texParameterf(target, pname, param);

    public static function texParameteri(target:Int, pname:Int, param:Int):Void
        current_context.texParameteri(target, pname, param);

    public static function texSubImage2D(target:Int, level:Int, xoffset:Int, yoffset:Int, width:Int, height:Int, format:Int, type:Int, data:ArrayBufferView):Void
        current_context.texSubImage2D(target, level, xoffset, yoffset, width, height, format, type, data);

    public static function uniform1f(location:GLUniformLocation, x:Float):Void
        current_context.uniform1f(location, x);

    public static function uniform1fv(location:GLUniformLocation, data:Float32Array):Void
        current_context.uniform1fv(location, data);

    public static function uniform1i(location:GLUniformLocation, x:Int):Void
        current_context.uniform1i(location, x);

    public static function uniform1iv(location:GLUniformLocation, data:Int32Array):Void
        current_context.uniform1iv(location, data);

    public static function uniform2f(location:GLUniformLocation, x:Float, y:Float):Void
        current_context.uniform2f(location, x, y);

    public static function uniform2fv(location:GLUniformLocation, data:Float32Array):Void
        current_context.uniform2fv(location, data);

    public static function uniform2i(location:GLUniformLocation, x:Int, y:Int):Void
        current_context.uniform2i(location, x, y);

    public static function uniform2iv(location:GLUniformLocation, data:Int32Array):Void
        current_context.uniform2iv(location, data);

    public static function uniform3f(location:GLUniformLocation, x:Float, y:Float, z:Float):Void
        current_context.uniform3f(location, x, y, z);

    public static function uniform3fv(location:GLUniformLocation, data:Float32Array):Void
        current_context.uniform3fv(location, data);

    public static function uniform3i(location:GLUniformLocation, x:Int, y:Int, z:Int):Void
        current_context.uniform3i(location, x, y, z);

    public static function uniform3iv(location:GLUniformLocation, data:Int32Array):Void
        current_context.uniform3iv(location, data);

    public static function uniform4f(location:GLUniformLocation, x:Float, y:Float, z:Float, w:Float):Void
        current_context.uniform4f(location, x, y, z, w);

    public static function uniform4fv(location:GLUniformLocation, data:Float32Array):Void
        current_context.uniform4fv(location, data);

    public static function uniform4i(location:GLUniformLocation, x:Int, y:Int, z:Int, w:Int):Void
        current_context.uniform4i(location, x, y, z, w);

    public static function uniform4iv(location:GLUniformLocation, data:Int32Array):Void
        current_context.uniform4iv(location, data);

    public static function uniformMatrix2fv(location:GLUniformLocation, transpose:Bool, data:Float32Array):Void
        current_context.uniformMatrix2fv(location, transpose, data);

    public static function uniformMatrix3fv(location:GLUniformLocation, transpose:Bool, data:Float32Array):Void
        current_context.uniformMatrix3fv(location, transpose, data);

    public static function uniformMatrix4fv(location:GLUniformLocation, transpose:Bool, data:Float32Array):Void
        current_context.uniformMatrix4fv(location, transpose, data);

    public static function useProgram(program:GLProgram):Void
        current_context.useProgram(program);

    public static function validateProgram(program:GLProgram):Void
        current_context.validateProgram(program);

    public static function vertexAttrib1f(indx:Int, x:Float):Void
        current_context.vertexAttrib1f(indx, x);

    public static function vertexAttrib1fv(indx:Int, data:Float32Array):Void
        current_context.vertexAttrib1fv(indx, data);

    public static function vertexAttrib2f(indx:Int, x:Float, y:Float):Void
        current_context.vertexAttrib2f(indx, x, y);

    public static function vertexAttrib2fv(indx:Int, data:Float32Array):Void
        current_context.vertexAttrib2fv(indx, data);

    public static function vertexAttrib3f(indx:Int, x:Float, y:Float, z:Float):Void
        current_context.vertexAttrib3f(indx, x, y, z);

    public static function vertexAttrib3fv(indx:Int, data:Float32Array):Void
        current_context.vertexAttrib3fv(indx, data);

    public static function vertexAttrib4f(indx:Int, x:Float, y:Float, z:Float, w:Float):Void
        current_context.vertexAttrib4f(indx, x, y, z, w);

    public static function vertexAttrib4fv(indx:Int, data:Float32Array):Void
        current_context.vertexAttrib4fv(indx, data);

    public static function vertexAttribPointer(indx:Int, size:Int, type:Int, normalized:Bool, stride:Int, offset:Int):Void
        current_context.vertexAttribPointer(indx, size, type, normalized, stride, offset);

    public static function viewport(x:Int, y:Int, width:Int, height:Int):Void
        current_context.viewport(x, y, width, height);


// getters/setters

    static function get_version():Int { return RenderingContext.VERSION; }

//defines

    /* ClearBufferMask */
    public static inline var DEPTH_BUFFER_BIT               = 0x00000100;
    public static inline var STENCIL_BUFFER_BIT             = 0x00000400;
    public static inline var COLOR_BUFFER_BIT               = 0x00004000;

    /* BeginMode */
    public static inline var POINTS                         = 0x0000;
    public static inline var LINES                          = 0x0001;
    public static inline var LINE_LOOP                      = 0x0002;
    public static inline var LINE_STRIP                     = 0x0003;
    public static inline var TRIANGLES                      = 0x0004;
    public static inline var TRIANGLE_STRIP                 = 0x0005;
    public static inline var TRIANGLE_FAN                   = 0x0006;

    /* AlphaFunction(not supported in ES20) */
    /*      NEVER */
    /*      LESS */
    /*      EQUAL */
    /*      LEQUAL */
    /*      GREATER */
    /*      NOTEQUAL */
    /*      GEQUAL */
    /*      ALWAYS */

    /* BlendingFactorDest */
    public static inline var ZERO                           = 0;
    public static inline var ONE                            = 1;
    public static inline var SRC_COLOR                      = 0x0300;
    public static inline var ONE_MINUS_SRC_COLOR            = 0x0301;
    public static inline var SRC_ALPHA                      = 0x0302;
    public static inline var ONE_MINUS_SRC_ALPHA            = 0x0303;
    public static inline var DST_ALPHA                      = 0x0304;
    public static inline var ONE_MINUS_DST_ALPHA            = 0x0305;

    /* BlendingFactorSrc */
    /*      ZERO */
    /*      ONE */
    public static inline var DST_COLOR                      = 0x0306;
    public static inline var ONE_MINUS_DST_COLOR            = 0x0307;
    public static inline var SRC_ALPHA_SATURATE             = 0x0308;
    /*      SRC_ALPHA */
    /*      ONE_MINUS_SRC_ALPHA */
    /*      DST_ALPHA */
    /*      ONE_MINUS_DST_ALPHA */

    /* BlendEquationSeparate */
    public static inline var FUNC_ADD                       = 0x8006;
    public static inline var BLEND_EQUATION                 = 0x8009;
    public static inline var BLEND_EQUATION_RGB             = 0x8009;   /* same as BLEND_EQUATION */
    public static inline var BLEND_EQUATION_ALPHA           = 0x883D;

    /* BlendSubtract */
    public static inline var FUNC_SUBTRACT                  = 0x800A;
    public static inline var FUNC_REVERSE_SUBTRACT          = 0x800B;

    /* Separate Blend Functions */
    public static inline var BLEND_DST_RGB                  = 0x80C8;
    public static inline var BLEND_SRC_RGB                  = 0x80C9;
    public static inline var BLEND_DST_ALPHA                = 0x80CA;
    public static inline var BLEND_SRC_ALPHA                = 0x80CB;
    public static inline var CONSTANT_COLOR                 = 0x8001;
    public static inline var ONE_MINUS_CONSTANT_COLOR       = 0x8002;
    public static inline var CONSTANT_ALPHA                 = 0x8003;
    public static inline var ONE_MINUS_CONSTANT_ALPHA       = 0x8004;
    public static inline var BLEND_COLOR                    = 0x8005;

    /* GLBuffer Objects */
    public static inline var ARRAY_BUFFER                   = 0x8892;
    public static inline var ELEMENT_ARRAY_BUFFER           = 0x8893;
    public static inline var ARRAY_BUFFER_BINDING           = 0x8894;
    public static inline var ELEMENT_ARRAY_BUFFER_BINDING   = 0x8895;

    public static inline var STREAM_DRAW                    = 0x88E0;
    public static inline var STATIC_DRAW                    = 0x88E4;
    public static inline var DYNAMIC_DRAW                   = 0x88E8;

    public static inline var BUFFER_SIZE                    = 0x8764;
    public static inline var BUFFER_USAGE                   = 0x8765;

    public static inline var CURRENT_VERTEX_ATTRIB          = 0x8626;

    /* CullFaceMode */
    public static inline var FRONT                          = 0x0404;
    public static inline var BACK                           = 0x0405;
    public static inline var FRONT_AND_BACK                 = 0x0408;

    /* DepthFunction */
    /*      NEVER */
    /*      LESS */
    /*      EQUAL */
    /*      LEQUAL */
    /*      GREATER */
    /*      NOTEQUAL */
    /*      GEQUAL */
    /*      ALWAYS */

    /* EnableCap */
    /* TEXTURE_2D */
    public static inline var CULL_FACE                      = 0x0B44;
    public static inline var BLEND                          = 0x0BE2;
    public static inline var DITHER                         = 0x0BD0;
    public static inline var STENCIL_TEST                   = 0x0B90;
    public static inline var DEPTH_TEST                     = 0x0B71;
    public static inline var SCISSOR_TEST                   = 0x0C11;
    public static inline var POLYGON_OFFSET_FILL            = 0x8037;
    public static inline var SAMPLE_ALPHA_TO_COVERAGE       = 0x809E;
    public static inline var SAMPLE_COVERAGE                = 0x80A0;

    /* ErrorCode */
    public static inline var NO_ERROR                       = 0;
    public static inline var INVALID_ENUM                   = 0x0500;
    public static inline var INVALID_VALUE                  = 0x0501;
    public static inline var INVALID_OPERATION              = 0x0502;
    public static inline var OUT_OF_MEMORY                  = 0x0505;

    /* FrontFaceDirection */
    public static inline var CW                             = 0x0900;
    public static inline var CCW                            = 0x0901;

    /* GetPName */
    public static inline var LINE_WIDTH                     = 0x0B21;
    public static inline var ALIASED_POINT_SIZE_RANGE       = 0x846D;
    public static inline var ALIASED_LINE_WIDTH_RANGE       = 0x846E;
    public static inline var CULL_FACE_MODE                 = 0x0B45;
    public static inline var FRONT_FACE                     = 0x0B46;
    public static inline var DEPTH_RANGE                    = 0x0B70;
    public static inline var DEPTH_WRITEMASK                = 0x0B72;
    public static inline var DEPTH_CLEAR_VALUE              = 0x0B73;
    public static inline var DEPTH_FUNC                     = 0x0B74;
    public static inline var STENCIL_CLEAR_VALUE            = 0x0B91;
    public static inline var STENCIL_FUNC                   = 0x0B92;
    public static inline var STENCIL_FAIL                   = 0x0B94;
    public static inline var STENCIL_PASS_DEPTH_FAIL        = 0x0B95;
    public static inline var STENCIL_PASS_DEPTH_PASS        = 0x0B96;
    public static inline var STENCIL_REF                    = 0x0B97;
    public static inline var STENCIL_VALUE_MASK             = 0x0B93;
    public static inline var STENCIL_WRITEMASK              = 0x0B98;
    public static inline var STENCIL_BACK_FUNC              = 0x8800;
    public static inline var STENCIL_BACK_FAIL              = 0x8801;
    public static inline var STENCIL_BACK_PASS_DEPTH_FAIL   = 0x8802;
    public static inline var STENCIL_BACK_PASS_DEPTH_PASS   = 0x8803;
    public static inline var STENCIL_BACK_REF               = 0x8CA3;
    public static inline var STENCIL_BACK_VALUE_MASK        = 0x8CA4;
    public static inline var STENCIL_BACK_WRITEMASK         = 0x8CA5;
    public static inline var VIEWPORT                       = 0x0BA2;
    public static inline var SCISSOR_BOX                    = 0x0C10;
    /*      SCISSOR_TEST */
    public static inline var COLOR_CLEAR_VALUE              = 0x0C22;
    public static inline var COLOR_WRITEMASK                = 0x0C23;
    public static inline var UNPACK_ALIGNMENT               = 0x0CF5;
    public static inline var PACK_ALIGNMENT                 = 0x0D05;
    public static inline var MAX_TEXTURE_SIZE               = 0x0D33;
    public static inline var MAX_VIEWPORT_DIMS              = 0x0D3A;
    public static inline var SUBPIXEL_BITS                  = 0x0D50;
    public static inline var RED_BITS                       = 0x0D52;
    public static inline var GREEN_BITS                     = 0x0D53;
    public static inline var BLUE_BITS                      = 0x0D54;
    public static inline var ALPHA_BITS                     = 0x0D55;
    public static inline var DEPTH_BITS                     = 0x0D56;
    public static inline var STENCIL_BITS                   = 0x0D57;
    public static inline var POLYGON_OFFSET_UNITS           = 0x2A00;
    /*      POLYGON_OFFSET_FILL */
    public static inline var POLYGON_OFFSET_FACTOR          = 0x8038;
    public static inline var TEXTURE_BINDING_2D             = 0x8069;
    public static inline var SAMPLE_BUFFERS                 = 0x80A8;
    public static inline var SAMPLES                        = 0x80A9;
    public static inline var SAMPLE_COVERAGE_VALUE          = 0x80AA;
    public static inline var SAMPLE_COVERAGE_INVERT         = 0x80AB;

    /* GetTextureParameter */
    /*      TEXTURE_MAG_FILTER */
    /*      TEXTURE_MIN_FILTER */
    /*      TEXTURE_WRAP_S */
    /*      TEXTURE_WRAP_T */

    public static inline var COMPRESSED_TEXTURE_FORMATS     = 0x86A3;

    /* HintMode */
    public static inline var DONT_CARE                      = 0x1100;
    public static inline var FASTEST                        = 0x1101;
    public static inline var NICEST                         = 0x1102;

    /* HintTarget */
    public static inline var GENERATE_MIPMAP_HINT            = 0x8192;

    /* DataType */
    public static inline var BYTE                           = 0x1400;
    public static inline var UNSIGNED_BYTE                  = 0x1401;
    public static inline var SHORT                          = 0x1402;
    public static inline var UNSIGNED_SHORT                 = 0x1403;
    public static inline var INT                            = 0x1404;
    public static inline var UNSIGNED_INT                   = 0x1405;
    public static inline var FLOAT                          = 0x1406;

    /* PixelFormat */
    public static inline var DEPTH_COMPONENT                = 0x1902;
    public static inline var ALPHA                          = 0x1906;
    public static inline var RGB                            = 0x1907;
    public static inline var RGBA                           = 0x1908;
    public static inline var LUMINANCE                      = 0x1909;
    public static inline var LUMINANCE_ALPHA                = 0x190A;

    /* PixelType */
    /*      UNSIGNED_BYTE */
    public static inline var UNSIGNED_SHORT_4_4_4_4         = 0x8033;
    public static inline var UNSIGNED_SHORT_5_5_5_1         = 0x8034;
    public static inline var UNSIGNED_SHORT_5_6_5           = 0x8363;

    /* Shaders */
    public static inline var FRAGMENT_SHADER                  = 0x8B30;
    public static inline var VERTEX_SHADER                    = 0x8B31;
    public static inline var MAX_VERTEX_ATTRIBS               = 0x8869;
    public static inline var MAX_VERTEX_UNIFORM_VECTORS       = 0x8DFB;
    public static inline var MAX_VARYING_VECTORS              = 0x8DFC;
    public static inline var MAX_COMBINED_TEXTURE_IMAGE_UNITS = 0x8B4D;
    public static inline var MAX_VERTEX_TEXTURE_IMAGE_UNITS   = 0x8B4C;
    public static inline var MAX_TEXTURE_IMAGE_UNITS          = 0x8872;
    public static inline var MAX_FRAGMENT_UNIFORM_VECTORS     = 0x8DFD;
    public static inline var SHADER_TYPE                      = 0x8B4F;
    public static inline var DELETE_STATUS                    = 0x8B80;
    public static inline var LINK_STATUS                      = 0x8B82;
    public static inline var VALIDATE_STATUS                  = 0x8B83;
    public static inline var ATTACHED_SHADERS                 = 0x8B85;
    public static inline var ACTIVE_UNIFORMS                  = 0x8B86;
    public static inline var ACTIVE_ATTRIBUTES                = 0x8B89;
    public static inline var SHADING_LANGUAGE_VERSION         = 0x8B8C;
    public static inline var CURRENT_PROGRAM                  = 0x8B8D;

    /* StencilFunction */
    public static inline var NEVER                          = 0x0200;
    public static inline var LESS                           = 0x0201;
    public static inline var EQUAL                          = 0x0202;
    public static inline var LEQUAL                         = 0x0203;
    public static inline var GREATER                        = 0x0204;
    public static inline var NOTEQUAL                       = 0x0205;
    public static inline var GEQUAL                         = 0x0206;
    public static inline var ALWAYS                         = 0x0207;

    /* StencilOp */
    /*      ZERO */
    public static inline var KEEP                           = 0x1E00;
    public static inline var REPLACE                        = 0x1E01;
    public static inline var INCR                           = 0x1E02;
    public static inline var DECR                           = 0x1E03;
    public static inline var INVERT                         = 0x150A;
    public static inline var INCR_WRAP                      = 0x8507;
    public static inline var DECR_WRAP                      = 0x8508;

    /* StringName */
    public static inline var VENDOR                         = 0x1F00;
    public static inline var RENDERER                       = 0x1F01;
    public static inline var VERSION                        = 0x1F02;

    /* TextureMagFilter */
    public static inline var NEAREST                        = 0x2600;
    public static inline var LINEAR                         = 0x2601;

    /* TextureMinFilter */
    /*      NEAREST */
    /*      LINEAR */
    public static inline var NEAREST_MIPMAP_NEAREST         = 0x2700;
    public static inline var LINEAR_MIPMAP_NEAREST          = 0x2701;
    public static inline var NEAREST_MIPMAP_LINEAR          = 0x2702;
    public static inline var LINEAR_MIPMAP_LINEAR           = 0x2703;

    /* TextureParameterName */
    public static inline var TEXTURE_MAG_FILTER             = 0x2800;
    public static inline var TEXTURE_MIN_FILTER             = 0x2801;
    public static inline var TEXTURE_WRAP_S                 = 0x2802;
    public static inline var TEXTURE_WRAP_T                 = 0x2803;

    /* TextureTarget */
    public static inline var TEXTURE_2D                     = 0x0DE1;
    public static inline var TEXTURE                        = 0x1702;

    public static inline var TEXTURE_CUBE_MAP               = 0x8513;
    public static inline var TEXTURE_BINDING_CUBE_MAP       = 0x8514;
    public static inline var TEXTURE_CUBE_MAP_POSITIVE_X    = 0x8515;
    public static inline var TEXTURE_CUBE_MAP_NEGATIVE_X    = 0x8516;
    public static inline var TEXTURE_CUBE_MAP_POSITIVE_Y    = 0x8517;
    public static inline var TEXTURE_CUBE_MAP_NEGATIVE_Y    = 0x8518;
    public static inline var TEXTURE_CUBE_MAP_POSITIVE_Z    = 0x8519;
    public static inline var TEXTURE_CUBE_MAP_NEGATIVE_Z    = 0x851A;
    public static inline var MAX_CUBE_MAP_TEXTURE_SIZE      = 0x851C;

    /* TextureUnit */
    public static inline var TEXTURE0                       = 0x84C0;
    public static inline var TEXTURE1                       = 0x84C1;
    public static inline var TEXTURE2                       = 0x84C2;
    public static inline var TEXTURE3                       = 0x84C3;
    public static inline var TEXTURE4                       = 0x84C4;
    public static inline var TEXTURE5                       = 0x84C5;
    public static inline var TEXTURE6                       = 0x84C6;
    public static inline var TEXTURE7                       = 0x84C7;
    public static inline var TEXTURE8                       = 0x84C8;
    public static inline var TEXTURE9                       = 0x84C9;
    public static inline var TEXTURE10                      = 0x84CA;
    public static inline var TEXTURE11                      = 0x84CB;
    public static inline var TEXTURE12                      = 0x84CC;
    public static inline var TEXTURE13                      = 0x84CD;
    public static inline var TEXTURE14                      = 0x84CE;
    public static inline var TEXTURE15                      = 0x84CF;
    public static inline var TEXTURE16                      = 0x84D0;
    public static inline var TEXTURE17                      = 0x84D1;
    public static inline var TEXTURE18                      = 0x84D2;
    public static inline var TEXTURE19                      = 0x84D3;
    public static inline var TEXTURE20                      = 0x84D4;
    public static inline var TEXTURE21                      = 0x84D5;
    public static inline var TEXTURE22                      = 0x84D6;
    public static inline var TEXTURE23                      = 0x84D7;
    public static inline var TEXTURE24                      = 0x84D8;
    public static inline var TEXTURE25                      = 0x84D9;
    public static inline var TEXTURE26                      = 0x84DA;
    public static inline var TEXTURE27                      = 0x84DB;
    public static inline var TEXTURE28                      = 0x84DC;
    public static inline var TEXTURE29                      = 0x84DD;
    public static inline var TEXTURE30                      = 0x84DE;
    public static inline var TEXTURE31                      = 0x84DF;
    public static inline var ACTIVE_TEXTURE                 = 0x84E0;

    /* TextureWrapMode */
    public static inline var REPEAT                         = 0x2901;
    public static inline var CLAMP_TO_EDGE                  = 0x812F;
    public static inline var MIRRORED_REPEAT                = 0x8370;

    /* Uniform Types */
    public static inline var FLOAT_VEC2                     = 0x8B50;
    public static inline var FLOAT_VEC3                     = 0x8B51;
    public static inline var FLOAT_VEC4                     = 0x8B52;
    public static inline var INT_VEC2                       = 0x8B53;
    public static inline var INT_VEC3                       = 0x8B54;
    public static inline var INT_VEC4                       = 0x8B55;
    public static inline var BOOL                           = 0x8B56;
    public static inline var BOOL_VEC2                      = 0x8B57;
    public static inline var BOOL_VEC3                      = 0x8B58;
    public static inline var BOOL_VEC4                      = 0x8B59;
    public static inline var FLOAT_MAT2                     = 0x8B5A;
    public static inline var FLOAT_MAT3                     = 0x8B5B;
    public static inline var FLOAT_MAT4                     = 0x8B5C;
    public static inline var SAMPLER_2D                     = 0x8B5E;
    public static inline var SAMPLER_CUBE                   = 0x8B60;

    /* Vertex Arrays */
    public static inline var VERTEX_ATTRIB_ARRAY_ENABLED        = 0x8622;
    public static inline var VERTEX_ATTRIB_ARRAY_SIZE           = 0x8623;
    public static inline var VERTEX_ATTRIB_ARRAY_STRIDE         = 0x8624;
    public static inline var VERTEX_ATTRIB_ARRAY_TYPE           = 0x8625;
    public static inline var VERTEX_ATTRIB_ARRAY_NORMALIZED     = 0x886A;
    public static inline var VERTEX_ATTRIB_ARRAY_POINTER        = 0x8645;
    public static inline var VERTEX_ATTRIB_ARRAY_BUFFER_BINDING = 0x889F;

    /* Point Size */
    public static inline var VERTEX_PROGRAM_POINT_SIZE       = 0x8642;
    public static inline var POINT_SPRITE                    = 0x8861;

    /* GLShader Source */
    public static inline var COMPILE_STATUS                 = 0x8B81;

    /* GLShader Precision-Specified Types */
    public static inline var LOW_FLOAT                      = 0x8DF0;
    public static inline var MEDIUM_FLOAT                   = 0x8DF1;
    public static inline var HIGH_FLOAT                     = 0x8DF2;
    public static inline var LOW_INT                        = 0x8DF3;
    public static inline var MEDIUM_INT                     = 0x8DF4;
    public static inline var HIGH_INT                       = 0x8DF5;

    /* GLFramebuffer Object. */
    public static inline var FRAMEBUFFER                    = 0x8D40;
    public static inline var RENDERBUFFER                   = 0x8D41;

    public static inline var RGBA4                          = 0x8056;
    public static inline var RGB5_A1                        = 0x8057;
    public static inline var RGB565                         = 0x8D62;
    public static inline var DEPTH_COMPONENT16              = 0x81A5;
    public static inline var STENCIL_INDEX                  = 0x1901;
    public static inline var STENCIL_INDEX8                 = 0x8D48;
    public static inline var DEPTH_STENCIL                  = 0x84F9;

    public static inline var RENDERBUFFER_WIDTH             = 0x8D42;
    public static inline var RENDERBUFFER_HEIGHT            = 0x8D43;
    public static inline var RENDERBUFFER_INTERNAL_FORMAT   = 0x8D44;
    public static inline var RENDERBUFFER_RED_SIZE          = 0x8D50;
    public static inline var RENDERBUFFER_GREEN_SIZE        = 0x8D51;
    public static inline var RENDERBUFFER_BLUE_SIZE         = 0x8D52;
    public static inline var RENDERBUFFER_ALPHA_SIZE        = 0x8D53;
    public static inline var RENDERBUFFER_DEPTH_SIZE        = 0x8D54;
    public static inline var RENDERBUFFER_STENCIL_SIZE      = 0x8D55;

    public static inline var FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE           = 0x8CD0;
    public static inline var FRAMEBUFFER_ATTACHMENT_OBJECT_NAME           = 0x8CD1;
    public static inline var FRAMEBUFFER_ATTACHMENT_TEXTURE_LEVEL         = 0x8CD2;
    public static inline var FRAMEBUFFER_ATTACHMENT_TEXTURE_CUBE_MAP_FACE = 0x8CD3;

    public static inline var COLOR_ATTACHMENT0              = 0x8CE0;
    public static inline var DEPTH_ATTACHMENT               = 0x8D00;
    public static inline var STENCIL_ATTACHMENT             = 0x8D20;
    public static inline var DEPTH_STENCIL_ATTACHMENT       = 0x821A;

    public static inline var NONE                           = 0;

    public static inline var FRAMEBUFFER_COMPLETE                      = 0x8CD5;
    public static inline var FRAMEBUFFER_INCOMPLETE_ATTACHMENT         = 0x8CD6;
    public static inline var FRAMEBUFFER_INCOMPLETE_MISSING_ATTACHMENT = 0x8CD7;
    public static inline var FRAMEBUFFER_INCOMPLETE_DIMENSIONS         = 0x8CD9;
    public static inline var FRAMEBUFFER_UNSUPPORTED                   = 0x8CDD;

    public static inline var FRAMEBUFFER_BINDING            = 0x8CA6;
    public static inline var RENDERBUFFER_BINDING           = 0x8CA7;
    public static inline var MAX_RENDERBUFFER_SIZE          = 0x84E8;

    public static inline var INVALID_FRAMEBUFFER_OPERATION  = 0x0506;

    /* WebGL-specific enums */
    public static inline var UNPACK_FLIP_Y_WEBGL            = 0x9240;
    public static inline var UNPACK_PREMULTIPLY_ALPHA_WEBGL = 0x9241;
    public static inline var CONTEXT_LOST_WEBGL             = 0x9242;
    public static inline var UNPACK_COLORSPACE_CONVERSION_WEBGL = 0x9243;
    public static inline var BROWSER_DEFAULT_WEBGL          = 0x9244;



}

#end //snow_web