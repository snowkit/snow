/*
    Copyright Sven Bergström 2014
    created for snow https://github.com/underscorediscovery/snow
    MIT license
*/

#ifndef _SNOW_OPENGL_H_
#define _SNOW_OPENGL_H_

        //glew first, before any gl.h (important)
    #ifdef NATIVE_TOOLKIT_GLEW
        #include "GL/glew.h"
    #endif //NATIVE_TOOLKIT_GLEW

    #ifdef SNOW_USE_SDL

            //Then the appropriate headers.
        #ifdef SNOW_GLES
            #include "SDL_opengles2.h"
        #else
            #include "SDL_opengl.h"
        #endif

    #else //SNOW_USE_SDL

        #ifdef __APPLE__
            #include <OpenGL/gl.h>
            #include <OpenGL/glu.h>
        #else
            #ifdef _WIN32
                #include <windows.h>
            #endif
            #include <GL/gl.h>
            #include <GL/glu.h>
        #endif

    #endif //!SNOW_USE_SDL

#endif //_SNOW_OPENGL_H_

