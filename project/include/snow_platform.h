/*
    Copyright Sven Bergström 2014
    created for snow https://github.com/underscorediscovery/snow
    MIT license
*/

#ifndef _SNOW_PLATFORM_H_
#define _SNOW_PLATFORM_H_

#ifdef SNOW_USE_SDL
    #include "SDL.h"
#endif

#include "snow_window.h"

namespace snow {
    namespace platform {
        namespace window {

            #if defined(HX_WINDOWS) && defined(SNOW_USE_SDL)

                void load_icon(SDL_Window* window);

            #endif

        } //window namespace
    } //platform namespace
} //snow namespace

#endif //_SNOW_PLATFORM_H_