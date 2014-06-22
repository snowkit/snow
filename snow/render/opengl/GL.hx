package snow.render.opengl;


//Platform defines

#if snow_html5

    typedef GL                  = snow.platform.html5.render.opengl.GL;
    typedef GLActiveInfo        = snow.platform.html5.render.opengl.GL.GLActiveInfo;
    typedef GLBuffer            = snow.platform.html5.render.opengl.GL.GLBuffer;
    typedef GLContextAttributes = snow.platform.html5.render.opengl.GL.GLContextAttributes;
    typedef GLFramebuffer       = snow.platform.html5.render.opengl.GL.GLFramebuffer;
    typedef GLProgram           = snow.platform.html5.render.opengl.GL.GLProgram;
    typedef GLRenderbuffer      = snow.platform.html5.render.opengl.GL.GLRenderbuffer;
    typedef GLShader            = snow.platform.html5.render.opengl.GL.GLShader;
    typedef GLTexture           = snow.platform.html5.render.opengl.GL.GLTexture;
    typedef GLUniformLocation   = snow.platform.html5.render.opengl.GL.GLUniformLocation;

#else

    typedef GL                  = snow.platform.native.render.opengl.GL;
    typedef GLActiveInfo        = snow.platform.native.render.opengl.GL.GLActiveInfo;
    typedef GLBuffer            = snow.platform.native.render.opengl.GL.GLBuffer;
    typedef GLContextAttributes = snow.platform.native.render.opengl.GL.GLContextAttributes;
    typedef GLFramebuffer       = snow.platform.native.render.opengl.GL.GLFramebuffer;
    typedef GLProgram           = snow.platform.native.render.opengl.GL.GLProgram;
    typedef GLRenderbuffer      = snow.platform.native.render.opengl.GL.GLRenderbuffer;
    typedef GLShader            = snow.platform.native.render.opengl.GL.GLShader;
    typedef GLTexture           = snow.platform.native.render.opengl.GL.GLTexture;
    typedef GLUniformLocation   = snow.platform.native.render.opengl.GL.GLUniformLocation;

#end //!snow_html5
