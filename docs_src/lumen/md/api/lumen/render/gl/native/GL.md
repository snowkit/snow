
[![Logo](../../../../../images/logo.png)](../../../../../index.html)

---


##[API Index](../../../../../api/index.html#lumen.render)   
[lumen.render.gl](../)     
&emsp;&emsp;&emsp;[lumen.render.gl.native](./)   
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;GL

---

#GL


---


[Properties](#Properties)   
[StaticMethods](#StaticMethods)   


---

&nbsp;   

&nbsp;   

<a class="lift" name="Properties" ></a>
###Properties   
---
<a class="lift" name="version" href="#version">version</a>



`version : Int`

<span class="small_desc_flat">  </span>   

&nbsp;   

<a class="lift" name="StaticMethods" ></a>
###StaticMethods   
---
<a class="lift" name="activeTexture" href="#activeTexture">activeTexture</a>



`activeTexture(texture:Int) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="attachShader" href="#attachShader">attachShader</a>



`attachShader(program:lumen.render.gl.GLProgram, shader:lumen.render.gl.GLShader) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="bindAttribLocation" href="#bindAttribLocation">bindAttribLocation</a>



`bindAttribLocation(program:lumen.render.gl.GLProgram, index:Int, name:String) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="bindBuffer" href="#bindBuffer">bindBuffer</a>



`bindBuffer(target:Int, buffer:lumen.render.gl.GLBuffer) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="bindFramebuffer" href="#bindFramebuffer">bindFramebuffer</a>



`bindFramebuffer(target:Int, framebuffer:lumen.render.gl.GLFramebuffer) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="bindRenderbuffer" href="#bindRenderbuffer">bindRenderbuffer</a>



`bindRenderbuffer(target:Int, renderbuffer:lumen.render.gl.GLRenderbuffer) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="bindTexture" href="#bindTexture">bindTexture</a>



`bindTexture(target:Int, texture:lumen.render.gl.GLTexture) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="blendColor" href="#blendColor">blendColor</a>



`blendColor(red:Float, green:Float, blue:Float, alpha:Float) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="blendEquation" href="#blendEquation">blendEquation</a>



`blendEquation(mode:Int) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="blendEquationSeparate" href="#blendEquationSeparate">blendEquationSeparate</a>



`blendEquationSeparate(modeRGB:Int, modeAlpha:Int) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="blendFunc" href="#blendFunc">blendFunc</a>



`blendFunc(sfactor:Int, dfactor:Int) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="blendFuncSeparate" href="#blendFuncSeparate">blendFuncSeparate</a>



`blendFuncSeparate(srcRGB:Int, dstRGB:Int, srcAlpha:Int, dstAlpha:Int) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="bufferData" href="#bufferData">bufferData</a>



`bufferData(target:Int, data:lumen.utils.IMemoryRange, usage:Int) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="bufferSubData" href="#bufferSubData">bufferSubData</a>



`bufferSubData(target:Int, offset:Int, data:lumen.utils.IMemoryRange) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="checkFramebufferStatus" href="#checkFramebufferStatus">checkFramebufferStatus</a>



`checkFramebufferStatus(target:Int) : Int`

<span class="small_desc_flat">  </span>   

<a class="lift" name="clear" href="#clear">clear</a>



`clear(mask:Int) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="clearColor" href="#clearColor">clearColor</a>



`clearColor(red:Float, green:Float, blue:Float, alpha:Float) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="clearDepth" href="#clearDepth">clearDepth</a>



`clearDepth(depth:Float) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="clearStencil" href="#clearStencil">clearStencil</a>



`clearStencil(s:Int) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="colorMask" href="#colorMask">colorMask</a>



`colorMask(red:Bool, green:Bool, blue:Bool, alpha:Bool) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="compileShader" href="#compileShader">compileShader</a>



`compileShader(shader:lumen.render.gl.GLShader) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="compressedTexImage2D" href="#compressedTexImage2D">compressedTexImage2D</a>



`compressedTexImage2D(target:Int, level:Int, internalformat:Int, width:Int, height:Int, border:Int, data:lumen.utils.IMemoryRange) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="compressedTexSubImage2D" href="#compressedTexSubImage2D">compressedTexSubImage2D</a>



`compressedTexSubImage2D(target:Int, level:Int, xoffset:Int, yoffset:Int, width:Int, height:Int, format:Int, data:lumen.utils.IMemoryRange) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="copyTexImage2D" href="#copyTexImage2D">copyTexImage2D</a>



`copyTexImage2D(target:Int, level:Int, internalformat:Int, x:Int, y:Int, width:Int, height:Int, border:Int) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="copyTexSubImage2D" href="#copyTexSubImage2D">copyTexSubImage2D</a>



`copyTexSubImage2D(target:Int, level:Int, xoffset:Int, yoffset:Int, x:Int, y:Int, width:Int, height:Int) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="createBuffer" href="#createBuffer">createBuffer</a>



`createBuffer() : lumen.render.gl.GLBuffer`

<span class="small_desc_flat">  </span>   

<a class="lift" name="createFramebuffer" href="#createFramebuffer">createFramebuffer</a>



`createFramebuffer() : lumen.render.gl.GLFramebuffer`

<span class="small_desc_flat">  </span>   

<a class="lift" name="createProgram" href="#createProgram">createProgram</a>



`createProgram() : lumen.render.gl.GLProgram`

<span class="small_desc_flat">  </span>   

<a class="lift" name="createRenderbuffer" href="#createRenderbuffer">createRenderbuffer</a>



`createRenderbuffer() : lumen.render.gl.GLRenderbuffer`

<span class="small_desc_flat">  </span>   

<a class="lift" name="createShader" href="#createShader">createShader</a>



`createShader(type:Int) : lumen.render.gl.GLShader`

<span class="small_desc_flat">  </span>   

<a class="lift" name="createTexture" href="#createTexture">createTexture</a>



`createTexture() : lumen.render.gl.GLTexture`

<span class="small_desc_flat">  </span>   

<a class="lift" name="cullFace" href="#cullFace">cullFace</a>



`cullFace(mode:Int) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="deleteBuffer" href="#deleteBuffer">deleteBuffer</a>



`deleteBuffer(buffer:lumen.render.gl.GLBuffer) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="deleteFramebuffer" href="#deleteFramebuffer">deleteFramebuffer</a>



`deleteFramebuffer(framebuffer:lumen.render.gl.GLFramebuffer) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="deleteProgram" href="#deleteProgram">deleteProgram</a>



`deleteProgram(program:lumen.render.gl.GLProgram) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="deleteRenderbuffer" href="#deleteRenderbuffer">deleteRenderbuffer</a>



`deleteRenderbuffer(renderbuffer:lumen.render.gl.GLRenderbuffer) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="deleteShader" href="#deleteShader">deleteShader</a>



`deleteShader(shader:lumen.render.gl.GLShader) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="deleteTexture" href="#deleteTexture">deleteTexture</a>



`deleteTexture(texture:lumen.render.gl.GLTexture) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="depthFunc" href="#depthFunc">depthFunc</a>



`depthFunc(func:Int) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="depthMask" href="#depthMask">depthMask</a>



`depthMask(flag:Bool) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="depthRange" href="#depthRange">depthRange</a>



`depthRange(zNear:Float, zFar:Float) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="detachShader" href="#detachShader">detachShader</a>



`detachShader(program:lumen.render.gl.GLProgram, shader:lumen.render.gl.GLShader) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="disable" href="#disable">disable</a>



`disable(cap:Int) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="disableVertexAttribArray" href="#disableVertexAttribArray">disableVertexAttribArray</a>



`disableVertexAttribArray(index:Int) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="drawArrays" href="#drawArrays">drawArrays</a>



`drawArrays(mode:Int, first:Int, count:Int) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="drawElements" href="#drawElements">drawElements</a>



`drawElements(mode:Int, count:Int, type:Int, offset:Int) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="enable" href="#enable">enable</a>



`enable(cap:Int) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="enableVertexAttribArray" href="#enableVertexAttribArray">enableVertexAttribArray</a>



`enableVertexAttribArray(index:Int) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="finish" href="#finish">finish</a>



`finish() : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="flush" href="#flush">flush</a>



`flush() : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="framebufferRenderbuffer" href="#framebufferRenderbuffer">framebufferRenderbuffer</a>



`framebufferRenderbuffer(target:Int, attachment:Int, renderbuffertarget:Int, renderbuffer:lumen.render.gl.GLRenderbuffer) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="framebufferTexture2D" href="#framebufferTexture2D">framebufferTexture2D</a>



`framebufferTexture2D(target:Int, attachment:Int, textarget:Int, texture:lumen.render.gl.GLTexture, level:Int) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="frontFace" href="#frontFace">frontFace</a>



`frontFace(mode:Int) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="generateMipmap" href="#generateMipmap">generateMipmap</a>



`generateMipmap(target:Int) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="getActiveAttrib" href="#getActiveAttrib">getActiveAttrib</a>



`getActiveAttrib(program:lumen.render.gl.GLProgram, index:Int) : lumen.render.gl.GLActiveInfo`

<span class="small_desc_flat">  </span>   

<a class="lift" name="getActiveUniform" href="#getActiveUniform">getActiveUniform</a>



`getActiveUniform(program:lumen.render.gl.GLProgram, index:Int) : lumen.render.gl.GLActiveInfo`

<span class="small_desc_flat">  </span>   

<a class="lift" name="getAttachedShaders" href="#getAttachedShaders">getAttachedShaders</a>



`getAttachedShaders(program:lumen.render.gl.GLProgram) : Array<lumen.render.gl.GLShader>`

<span class="small_desc_flat">  </span>   

<a class="lift" name="getAttribLocation" href="#getAttribLocation">getAttribLocation</a>



`getAttribLocation(program:lumen.render.gl.GLProgram, name:String) : Int`

<span class="small_desc_flat">  </span>   

<a class="lift" name="getBufferParameter" href="#getBufferParameter">getBufferParameter</a>



`getBufferParameter(target:Int, pname:Int) : Dynamic`

<span class="small_desc_flat">  </span>   

<a class="lift" name="getContextAttributes" href="#getContextAttributes">getContextAttributes</a>



`getContextAttributes() : lumen.render.gl.GLContextAttributes`

<span class="small_desc_flat">  </span>   

<a class="lift" name="getError" href="#getError">getError</a>



`getError() : Int`

<span class="small_desc_flat">  </span>   

<a class="lift" name="getExtension" href="#getExtension">getExtension</a>



`getExtension(name:String) : Dynamic`

<span class="small_desc_flat">  </span>   

<a class="lift" name="getFramebufferAttachmentParameter" href="#getFramebufferAttachmentParameter">getFramebufferAttachmentParameter</a>



`getFramebufferAttachmentParameter(target:Int, attachment:Int, pname:Int) : Dynamic`

<span class="small_desc_flat">  </span>   

<a class="lift" name="getParameter" href="#getParameter">getParameter</a>



`getParameter(pname:Int) : Dynamic`

<span class="small_desc_flat">  </span>   

<a class="lift" name="getProgramInfoLog" href="#getProgramInfoLog">getProgramInfoLog</a>



`getProgramInfoLog(program:lumen.render.gl.GLProgram) : String`

<span class="small_desc_flat">  </span>   

<a class="lift" name="getProgramParameter" href="#getProgramParameter">getProgramParameter</a>



`getProgramParameter(program:lumen.render.gl.GLProgram, pname:Int) : Int`

<span class="small_desc_flat">  </span>   

<a class="lift" name="getRenderbufferParameter" href="#getRenderbufferParameter">getRenderbufferParameter</a>



`getRenderbufferParameter(target:Int, pname:Int) : Dynamic`

<span class="small_desc_flat">  </span>   

<a class="lift" name="getShaderInfoLog" href="#getShaderInfoLog">getShaderInfoLog</a>



`getShaderInfoLog(shader:lumen.render.gl.GLShader) : String`

<span class="small_desc_flat">  </span>   

<a class="lift" name="getShaderParameter" href="#getShaderParameter">getShaderParameter</a>



`getShaderParameter(shader:lumen.render.gl.GLShader, pname:Int) : Int`

<span class="small_desc_flat">  </span>   

<a class="lift" name="getShaderPrecisionFormat" href="#getShaderPrecisionFormat">getShaderPrecisionFormat</a>



`getShaderPrecisionFormat(shadertype:Int, precisiontype:Int) : lumen.render.gl.native.ShaderPrecisionFormat`

<span class="small_desc_flat">  </span>   

<a class="lift" name="getShaderSource" href="#getShaderSource">getShaderSource</a>



`getShaderSource(shader:lumen.render.gl.GLShader) : String`

<span class="small_desc_flat">  </span>   

<a class="lift" name="getSupportedExtensions" href="#getSupportedExtensions">getSupportedExtensions</a>



`getSupportedExtensions() : Array<String>`

<span class="small_desc_flat">  </span>   

<a class="lift" name="getTexParameter" href="#getTexParameter">getTexParameter</a>



`getTexParameter(target:Int, pname:Int) : Dynamic`

<span class="small_desc_flat">  </span>   

<a class="lift" name="getUniform" href="#getUniform">getUniform</a>



`getUniform(program:lumen.render.gl.GLProgram, location:lumen.render.gl.GLUniformLocation) : Dynamic`

<span class="small_desc_flat">  </span>   

<a class="lift" name="getUniformLocation" href="#getUniformLocation">getUniformLocation</a>



`getUniformLocation(program:lumen.render.gl.GLProgram, name:String) : Dynamic`

<span class="small_desc_flat">  </span>   

<a class="lift" name="getVertexAttrib" href="#getVertexAttrib">getVertexAttrib</a>



`getVertexAttrib(index:Int, pname:Int) : Dynamic`

<span class="small_desc_flat">  </span>   

<a class="lift" name="getVertexAttribOffset" href="#getVertexAttribOffset">getVertexAttribOffset</a>



`getVertexAttribOffset(index:Int, pname:Int) : Int`

<span class="small_desc_flat">  </span>   

<a class="lift" name="hint" href="#hint">hint</a>



`hint(target:Int, mode:Int) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="isBuffer" href="#isBuffer">isBuffer</a>



`isBuffer(buffer:lumen.render.gl.GLBuffer) : Bool`

<span class="small_desc_flat">  </span>   

<a class="lift" name="isEnabled" href="#isEnabled">isEnabled</a>



`isEnabled(cap:Int) : Bool`

<span class="small_desc_flat">  </span>   

<a class="lift" name="isFramebuffer" href="#isFramebuffer">isFramebuffer</a>



`isFramebuffer(framebuffer:lumen.render.gl.GLFramebuffer) : Bool`

<span class="small_desc_flat">  </span>   

<a class="lift" name="isProgram" href="#isProgram">isProgram</a>



`isProgram(program:lumen.render.gl.GLProgram) : Bool`

<span class="small_desc_flat">  </span>   

<a class="lift" name="isRenderbuffer" href="#isRenderbuffer">isRenderbuffer</a>



`isRenderbuffer(renderbuffer:lumen.render.gl.GLRenderbuffer) : Bool`

<span class="small_desc_flat">  </span>   

<a class="lift" name="isShader" href="#isShader">isShader</a>



`isShader(shader:lumen.render.gl.GLShader) : Bool`

<span class="small_desc_flat">  </span>   

<a class="lift" name="isTexture" href="#isTexture">isTexture</a>



`isTexture(texture:lumen.render.gl.GLTexture) : Bool`

<span class="small_desc_flat">  </span>   

<a class="lift" name="lineWidth" href="#lineWidth">lineWidth</a>



`lineWidth(width:Float) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="linkProgram" href="#linkProgram">linkProgram</a>



`linkProgram(program:lumen.render.gl.GLProgram) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="pixelStorei" href="#pixelStorei">pixelStorei</a>



`pixelStorei(pname:Int, param:Int) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="polygonOffset" href="#polygonOffset">polygonOffset</a>



`polygonOffset(factor:Float, units:Float) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="readPixels" href="#readPixels">readPixels</a>



`readPixels(x:Int, y:Int, width:Int, height:Int, format:Int, type:Int, pixels:lumen.utils.ArrayBufferView) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="renderbufferStorage" href="#renderbufferStorage">renderbufferStorage</a>



`renderbufferStorage(target:Int, internalformat:Int, width:Int, height:Int) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="sampleCoverage" href="#sampleCoverage">sampleCoverage</a>



`sampleCoverage(value:Float, invert:Bool) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="scissor" href="#scissor">scissor</a>



`scissor(x:Int, y:Int, width:Int, height:Int) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="shaderSource" href="#shaderSource">shaderSource</a>



`shaderSource(shader:lumen.render.gl.GLShader, source:String) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="stencilFunc" href="#stencilFunc">stencilFunc</a>



`stencilFunc(func:Int, ref:Int, mask:Int) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="stencilFuncSeparate" href="#stencilFuncSeparate">stencilFuncSeparate</a>



`stencilFuncSeparate(face:Int, func:Int, ref:Int, mask:Int) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="stencilMask" href="#stencilMask">stencilMask</a>



`stencilMask(mask:Int) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="stencilMaskSeparate" href="#stencilMaskSeparate">stencilMaskSeparate</a>



`stencilMaskSeparate(face:Int, mask:Int) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="stencilOp" href="#stencilOp">stencilOp</a>



`stencilOp(fail:Int, zfail:Int, zpass:Int) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="stencilOpSeparate" href="#stencilOpSeparate">stencilOpSeparate</a>



`stencilOpSeparate(face:Int, fail:Int, zfail:Int, zpass:Int) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="texImage2D" href="#texImage2D">texImage2D</a>



`texImage2D(target:Int, level:Int, internalformat:Int, width:Int, height:Int, border:Int, format:Int, type:Int, pixels:lumen.utils.ArrayBufferView) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="texParameterf" href="#texParameterf">texParameterf</a>



`texParameterf(target:Int, pname:Int, param:Float) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="texParameteri" href="#texParameteri">texParameteri</a>



`texParameteri(target:Int, pname:Int, param:Int) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="texSubImage2D" href="#texSubImage2D">texSubImage2D</a>



`texSubImage2D(target:Int, level:Int, xoffset:Int, yoffset:Int, width:Int, height:Int, format:Int, type:Int, pixels:lumen.utils.ArrayBufferView) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="uniform1f" href="#uniform1f">uniform1f</a>



`uniform1f(location:lumen.render.gl.GLUniformLocation, x:Float) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="uniform1fv" href="#uniform1fv">uniform1fv</a>



`uniform1fv(location:lumen.render.gl.GLUniformLocation, x:lumen.utils.Float32Array) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="uniform1i" href="#uniform1i">uniform1i</a>



`uniform1i(location:lumen.render.gl.GLUniformLocation, x:Int) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="uniform1iv" href="#uniform1iv">uniform1iv</a>



`uniform1iv(location:lumen.render.gl.GLUniformLocation, v:lumen.utils.Int32Array) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="uniform2f" href="#uniform2f">uniform2f</a>



`uniform2f(location:lumen.render.gl.GLUniformLocation, x:Float, y:Float) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="uniform2fv" href="#uniform2fv">uniform2fv</a>



`uniform2fv(location:lumen.render.gl.GLUniformLocation, v:lumen.utils.Float32Array) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="uniform2i" href="#uniform2i">uniform2i</a>



`uniform2i(location:lumen.render.gl.GLUniformLocation, x:Int, y:Int) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="uniform2iv" href="#uniform2iv">uniform2iv</a>



`uniform2iv(location:lumen.render.gl.GLUniformLocation, v:lumen.utils.Int32Array) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="uniform3f" href="#uniform3f">uniform3f</a>



`uniform3f(location:lumen.render.gl.GLUniformLocation, x:Float, y:Float, z:Float) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="uniform3fv" href="#uniform3fv">uniform3fv</a>



`uniform3fv(location:lumen.render.gl.GLUniformLocation, v:lumen.utils.Float32Array) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="uniform3i" href="#uniform3i">uniform3i</a>



`uniform3i(location:lumen.render.gl.GLUniformLocation, x:Int, y:Int, z:Int) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="uniform3iv" href="#uniform3iv">uniform3iv</a>



`uniform3iv(location:lumen.render.gl.GLUniformLocation, v:lumen.utils.Int32Array) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="uniform4f" href="#uniform4f">uniform4f</a>



`uniform4f(location:lumen.render.gl.GLUniformLocation, x:Float, y:Float, z:Float, w:Float) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="uniform4fv" href="#uniform4fv">uniform4fv</a>



`uniform4fv(location:lumen.render.gl.GLUniformLocation, v:lumen.utils.Float32Array) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="uniform4i" href="#uniform4i">uniform4i</a>



`uniform4i(location:lumen.render.gl.GLUniformLocation, x:Int, y:Int, z:Int, w:Int) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="uniform4iv" href="#uniform4iv">uniform4iv</a>



`uniform4iv(location:lumen.render.gl.GLUniformLocation, v:lumen.utils.Int32Array) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="uniformMatrix2fv" href="#uniformMatrix2fv">uniformMatrix2fv</a>



`uniformMatrix2fv(location:lumen.render.gl.GLUniformLocation, transpose:Bool, v:lumen.utils.Float32Array) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="uniformMatrix3D" href="#uniformMatrix3D">uniformMatrix3D</a>



`uniformMatrix3D(location:lumen.render.gl.GLUniformLocation, transpose:Bool, matrix:lumen.utils.compat.Matrix3D) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="uniformMatrix3fv" href="#uniformMatrix3fv">uniformMatrix3fv</a>



`uniformMatrix3fv(location:lumen.render.gl.GLUniformLocation, transpose:Bool, v:lumen.utils.Float32Array) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="uniformMatrix4fv" href="#uniformMatrix4fv">uniformMatrix4fv</a>



`uniformMatrix4fv(location:lumen.render.gl.GLUniformLocation, transpose:Bool, v:lumen.utils.Float32Array) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="useProgram" href="#useProgram">useProgram</a>



`useProgram(program:lumen.render.gl.GLProgram) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="validateProgram" href="#validateProgram">validateProgram</a>



`validateProgram(program:lumen.render.gl.GLProgram) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="versionString" href="#versionString">versionString</a>



`versionString() : String`

<span class="small_desc_flat">  </span>   

<a class="lift" name="vertexAttrib1f" href="#vertexAttrib1f">vertexAttrib1f</a>



`vertexAttrib1f(indx:Int, x:Float) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="vertexAttrib1fv" href="#vertexAttrib1fv">vertexAttrib1fv</a>



`vertexAttrib1fv(indx:Int, values:lumen.utils.Float32Array) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="vertexAttrib2f" href="#vertexAttrib2f">vertexAttrib2f</a>



`vertexAttrib2f(indx:Int, x:Float, y:Float) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="vertexAttrib2fv" href="#vertexAttrib2fv">vertexAttrib2fv</a>



`vertexAttrib2fv(indx:Int, values:lumen.utils.Float32Array) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="vertexAttrib3f" href="#vertexAttrib3f">vertexAttrib3f</a>



`vertexAttrib3f(indx:Int, x:Float, y:Float, z:Float) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="vertexAttrib3fv" href="#vertexAttrib3fv">vertexAttrib3fv</a>



`vertexAttrib3fv(indx:Int, values:lumen.utils.Float32Array) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="vertexAttrib4f" href="#vertexAttrib4f">vertexAttrib4f</a>



`vertexAttrib4f(indx:Int, x:Float, y:Float, z:Float, w:Float) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="vertexAttrib4fv" href="#vertexAttrib4fv">vertexAttrib4fv</a>



`vertexAttrib4fv(indx:Int, values:lumen.utils.Float32Array) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="vertexAttribPointer" href="#vertexAttribPointer">vertexAttribPointer</a>



`vertexAttribPointer(indx:Int, size:Int, type:Int, normalized:Bool, stride:Int, offset:Int) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="viewport" href="#viewport">viewport</a>



`viewport(x:Int, y:Int, width:Int, height:Int) : Void`

<span class="small_desc_flat">  </span>   

&nbsp;   



&nbsp;
&nbsp;
&nbsp;

---  


&nbsp;   
&nbsp;   