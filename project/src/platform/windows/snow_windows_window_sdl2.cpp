#ifdef HX_WINDOWS

#include "snow_window.h"
#include <windows.h>

namespace snow {
    namespace platform {
        namespace window {

            void load_icon(const snow::window::Window* _window) {

                snow::window::WindowSDL2* sdl_window = reinterpret_cast<snow::window::WindowSDL2*>(_window);

                //use SDL_Window* == sdl_window->window

            } //load_icon

        } //window
    } //platform namespace
} //snow namespace


#endif //HX_WINDOWS
