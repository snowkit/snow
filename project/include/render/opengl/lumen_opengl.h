#ifndef LUMEN_OPENGL_H
#define LUMEN_OPENGL_H

  		//glew first, before any gl.h (important)
	#ifdef NATIVE_TOOLKIT_GLEW
		#include "GL/glew.h"
	#endif //NATIVE_TOOLKIT_GLEW


		//Then the appropriate headers.
	#ifdef LUMEN_GLES
		#include "SDL_opengles2.h"
	#else
		#include "SDL_opengl.h"
	#endif

#endif

