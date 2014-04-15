package lumen.gl;


#if lumen_html5

	typedef GLTexture = js.html.webgl.Texture;

#else //lumen_html5

	class GLTexture extends GLObject {
		
		public function new (version:Int, id:Dynamic) {
			super (version, id);
		}
		
		override private function getType ():String {
			return "Texture";
		}
		
	}

#end //lumen_native


