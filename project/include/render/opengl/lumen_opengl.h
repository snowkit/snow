#ifndef LUMEN_OPENGL_H
#define LUMEN_OPENGL_H

  		//glew first, before any gl.h (important)
	#ifdef LUMEN_LIB_GLEW
		#include "libs/glew/GL/glew.h"
	#endif //LUMEN_LIB_GLEW


		//Then the appropriate headers.
	#ifdef ANDROID
		#include <GLES2/gl2platform.h>
		#include <GLES2/gl2.h>
		#include <GLES2/gl2ext.h>
	#else
		#include "libs/sdl/SDL_opengl.h"
	#endif

#endif


//On android, it would use #include "libs/sdl/SDL_opengles2.h"
//except that for some reason this gl2platform.h needs to be included first.
//Somehow, it's included in the default SDL android build and I can't figure out how/why it works there.
