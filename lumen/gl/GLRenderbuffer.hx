package lumen.gl;

#if lumen_html5

	typedef GLRenderbuffer = js.html.webgl.Renderbuffer;

#else //lumen_html5

	class GLRenderbuffer extends GLObject {
		
		public function new (version:Int, id:Dynamic) {
			super (version, id);
		}
		
		override private function getType ():String {
			return "Renderbuffer";
		}
		
	}

#end //lumen_native

