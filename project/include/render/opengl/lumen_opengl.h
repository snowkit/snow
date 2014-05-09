#ifndef LUMEN_OPENGL_H
#define LUMEN_OPENGL_H

  		//glew first, before any gl.h (important)
	#ifdef LUMEN_LIB_GLEW
		#include "libs/glew/GL/glew.h"
	#endif //LUMEN_LIB_GLEW


		//Then the appropriate headers.
	#ifdef ANDROID
		#include "libs/sdl/SDL_opengles2.h"
	#else
		#include "libs/sdl/SDL_opengl.h"
	#endif

#endif

