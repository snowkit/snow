package lumen.render.opengl;


//Platform defines

#if lumen_html5

    typedef GL                  = lumen.platform.html5.render.opengl.GL;
    typedef GLActiveInfo        = lumen.platform.html5.render.opengl.GL.GLActiveInfo;
    typedef GLBuffer            = lumen.platform.html5.render.opengl.GL.GLBuffer;
    typedef GLContextAttributes = lumen.platform.html5.render.opengl.GL.GLContextAttributes;
    typedef GLFramebuffer       = lumen.platform.html5.render.opengl.GL.GLFramebuffer;
    typedef GLProgram           = lumen.platform.html5.render.opengl.GL.GLProgram;
    typedef GLRenderbuffer      = lumen.platform.html5.render.opengl.GL.GLRenderbuffer;
    typedef GLShader            = lumen.platform.html5.render.opengl.GL.GLShader;
    typedef GLTexture           = lumen.platform.html5.render.opengl.GL.GLTexture;
    typedef GLUniformLocation   = lumen.platform.html5.render.opengl.GL.GLUniformLocation;

#else

    typedef GL                  = lumen.platform.native.render.opengl.GL;
    typedef GLActiveInfo        = lumen.platform.native.render.opengl.GL.GLActiveInfo;
    typedef GLBuffer            = lumen.platform.native.render.opengl.GL.GLBuffer;
    typedef GLContextAttributes = lumen.platform.native.render.opengl.GL.GLContextAttributes;
    typedef GLFramebuffer       = lumen.platform.native.render.opengl.GL.GLFramebuffer;
    typedef GLProgram           = lumen.platform.native.render.opengl.GL.GLProgram;
    typedef GLRenderbuffer      = lumen.platform.native.render.opengl.GL.GLRenderbuffer;
    typedef GLShader            = lumen.platform.native.render.opengl.GL.GLShader;
    typedef GLTexture           = lumen.platform.native.render.opengl.GL.GLTexture;
    typedef GLUniformLocation   = lumen.platform.native.render.opengl.GL.GLUniformLocation;

#end //!lumen_html5
