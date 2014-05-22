package lumen.render.gl;


#if lumen_html5
    
    typedef GLShader = js.html.webgl.Shader;

#else //lumen_html5

    class GLShader extends GLObject {
        
        public function new (version:Int, id:Dynamic) {
            super (version, id);
        }
        
        override function getType ():String {
            return "Shader";
        }
        
    }

#end //lumen_native

