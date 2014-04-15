package lumen.gl;

#if lumen_html5

	typedef GLBuffer = js.html.webgl.Buffer;
	
#else

	class GLBuffer extends GLObject {
		public function new (version:Int, id:Dynamic) {
			super (version, id);
		}
		override function getType ():String {
			return "Buffer";
		}
	}

#end //lumen_html5