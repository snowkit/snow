package snow.render.opengl;


//Platform defines

#if snow_web

    typedef GL                  = snow.platform.web.render.opengl.GL;
    typedef GLActiveInfo        = snow.platform.web.render.opengl.GL.GLActiveInfo;
    typedef GLBuffer            = snow.platform.web.render.opengl.GL.GLBuffer;
    typedef GLContextAttributes = snow.platform.web.render.opengl.GL.GLContextAttributes;
    typedef GLFramebuffer       = snow.platform.web.render.opengl.GL.GLFramebuffer;
    typedef GLProgram           = snow.platform.web.render.opengl.GL.GLProgram;
    typedef GLRenderbuffer      = snow.platform.web.render.opengl.GL.GLRenderbuffer;
    typedef GLShader            = snow.platform.web.render.opengl.GL.GLShader;
    typedef GLTexture           = snow.platform.web.render.opengl.GL.GLTexture;
    typedef GLUniformLocation   = snow.platform.web.render.opengl.GL.GLUniformLocation;

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

    #if snow_render_gl_native
    typedef GLLink              = snow.platform.native.render.opengl.GL_Native.GLLink;
    #end

#end //!snow_web
