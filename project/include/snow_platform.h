
#ifndef _SNOW_PLATFORM_H_
#define _SNOW_PLATFORM_H_


#include "snow_window.h"

namespace snow {
    namespace platform {
        namespace window {

            #ifdef HX_WINDOWS

                void load_icon(const snow::window::Window* window);

            #endif

        } //window namespace
    } //platform namespace
} //snow namespace

#endif //_SNOW_PLATFORM_H_