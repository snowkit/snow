#ifdef HX_WINDOWS

#include <windows.h>
#include "SDL.h"
#include "SDL_syswm.h"



namespace snow {
    namespace platform {
        namespace window {

            void load_icon(SDL_Window* _window) {

                SDL_SysWMinfo wminfo;
                SDL_VERSION(&wminfo.version)
                if (SDL_GetWindowWMInfo(_window,&wminfo)) {

                	HINSTANCE handle = ::GetModuleHandle(NULL);
                	HWND hwnd = wminfo.info.win.window;
                	HICON icon = ::LoadIcon(handle, "IDI_MAIN_ICON");	

                	::SetClassLong(hwnd, GCL_HICON, (LONG) icon);
                }

            } //load_icon

        } //window
    } //platform namespace
} //snow namespace


#endif //HX_WINDOWS
