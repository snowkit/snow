#ifndef LUMEN_OPENGL_H
#define LUMEN_OPENGL_H

        //glew first, before any gl.h (important)
    #ifdef NATIVE_TOOLKIT_GLEW
        #include "GL/glew.h"
    #endif //NATIVE_TOOLKIT_GLEW

    #ifdef LUMEN_USE_SDL

            //Then the appropriate headers.
        #ifdef LUMEN_GLES
            #include "SDL_opengles2.h"
        #else
            #include "SDL_opengl.h"
        #endif

    #else //LUMEN_USE_SDL

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

    #endif //!LUMEN_USE_SDL

#endif

