package lumen.render.gl;


#if lumen_html5

    typedef GLObject = Dynamic;
    
#else //lumen_html5

    class GLObject {
        
        public var id (default, null):Dynamic;
        public var invalidated (get, null):Bool;
        public var valid (get, null):Bool;
        
        var version:Int;
        
        function new (version:Int, id:Dynamic) {
            
            this.version = version;
            this.id = id;
            
        }
        
        function getType ():String {
            return "GLObject";
        }
        
        public function invalidate ():Void {
            id = null;
        }
        
        public function isValid ():Bool {
            return id != null && version == GL.version;
        }
        
        public function isInvalid ():Bool {
            return !isValid ();
        }
        
        public function toString ():String {
            return getType () + "(" + id + ")";
        }
        
        // Getters & Setters
        
        function get_invalidated ():Bool {
            return isInvalid ();
        }
        
        function get_valid ():Bool {
            return isValid ();
        }
        
    }

#end //lumen_native
