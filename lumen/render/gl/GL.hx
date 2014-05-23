package lumen.render.gl;


//Platform defines

#if lumen_html5

    typedef GL                  = lumen.platform.html5.render.gl.GL;
    typedef GLActiveInfo        = lumen.platform.html5.render.gl.GL.GLActiveInfo;
    typedef GLBuffer            = lumen.platform.html5.render.gl.GL.GLBuffer;
    typedef GLContextAttributes = lumen.platform.html5.render.gl.GL.GLContextAttributes;
    typedef GLFramebuffer       = lumen.platform.html5.render.gl.GL.GLFramebuffer;
    typedef GLProgram           = lumen.platform.html5.render.gl.GL.GLProgram;
    typedef GLRenderbuffer      = lumen.platform.html5.render.gl.GL.GLRenderbuffer;
    typedef GLShader            = lumen.platform.html5.render.gl.GL.GLShader;
    typedef GLTexture           = lumen.platform.html5.render.gl.GL.GLTexture;
    typedef GLUniformLocation   = lumen.platform.html5.render.gl.GL.GLUniformLocation;

#else

    typedef GL                  = lumen.platform.native.render.gl.GL;
    typedef GLActiveInfo        = lumen.platform.native.render.gl.GL.GLActiveInfo;
    typedef GLBuffer            = lumen.platform.native.render.gl.GL.GLBuffer;
    typedef GLContextAttributes = lumen.platform.native.render.gl.GL.GLContextAttributes;
    typedef GLFramebuffer       = lumen.platform.native.render.gl.GL.GLFramebuffer;
    typedef GLProgram           = lumen.platform.native.render.gl.GL.GLProgram;
    typedef GLRenderbuffer      = lumen.platform.native.render.gl.GL.GLRenderbuffer;
    typedef GLShader            = lumen.platform.native.render.gl.GL.GLShader;
    typedef GLTexture           = lumen.platform.native.render.gl.GL.GLTexture;
    typedef GLUniformLocation   = lumen.platform.native.render.gl.GL.GLUniformLocation;

#end //!lumen_html5


//Common defines


/** A helper class for the resources, mostly specific to native code right now but this is still being cleaned up */
class GLObject {
        
        /** The native GL handle/id. read only */
    public var id (default, null) : Dynamic;
        /** The invalidated state. read only */
    public var invalidated (get, null) : Bool;
        /** The valid state. read only */
    public var valid (get, null) : Bool;
    
    var version:Int;
        
    public function new (version:Int, id:Dynamic) {
        
        this.version = version;
        this.id = id;
        
    } //new

    function getType() : String {
        return "GLObject";
    } //getType
    
    public function invalidate() : Void {
        id = null;
    } //invalidate
    
    public function isValid() : Bool {
        return id != null && version == GL.version;
    } //isValid
    
    public function isInvalid() : Bool {
        return !isValid ();
    } //isInvalid
    
    public function toString() : String {
        return getType() + "(" + id + ")";
    } //toString
    
// Getters & Setters
    
    function get_invalidated() : Bool {
        return isInvalid ();
    } //get_invalidated
    
    function get_valid() : Bool {
        return isValid ();
    } //get_valid
    
} //GLObject
