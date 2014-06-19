
#include "lumen_core.h"
#include "lumen_window.h"
#include "lumen_input.h"

#include "SDL.h"

#include <stdarg.h>

namespace lumen {

    void log(const char *fmt, ...) {
        va_list ap;

        va_start(ap, fmt);

            //by using ERROR on android, our logs will show up to normal -debug builds
        #ifdef ANDROID
            SDL_LogMessageV(SDL_LOG_CATEGORY_APPLICATION, SDL_LOG_PRIORITY_ERROR, fmt, ap);
        #else
            SDL_LogMessageV(SDL_LOG_CATEGORY_APPLICATION, SDL_LOG_PRIORITY_INFO, fmt, ap);
        #endif

        va_end(ap);
    }


        //externs
    namespace input {
        extern void init_sdl();
        extern void handle_event( SDL_Event &event );
    }

    namespace window {
        extern void handle_event( SDL_Event &event );
    }

    namespace core {

            //forward
        int init_sdl();
        int shutdown_sdl();
        void handle_event( SDL_Event &event );
        int SDLCALL system_event_watch(void *userdata, SDL_Event* event);

            //whether or not sdl was already init
        static bool sdl_inited = false;
            //reusable base path
        const char* core_base_path = "./";
            //resusable pref path
        const char* core_pref_path = NULL;
            //reusable event structure
        SDL_Event sdl_event;


        int init_aux() {

            char *_base_path = SDL_GetBasePath();
            if (_base_path) {
                core_base_path = SDL_strdup(_base_path);
                SDL_free( _base_path );
            }

            int res = lumen::core::init_sdl();

            if(res != 0) {
                return res;
            }

            lumen::input::init_sdl();

            return 0;

        } //init_core_aux

        int shutdown_aux() {

            lumen::core::shutdown_sdl();

            return 0;

        } //shutdown_core_aux

        const char* app_path() {

            return core_base_path;

        } //core_app_path

        const char* pref_path( const char* org, const char* app ) {

            if(core_pref_path == NULL) {

                char *_pref_path = SDL_GetPrefPath(org, app);
                if (_pref_path) {
                    core_pref_path = SDL_strdup(_pref_path);
                    SDL_free(_pref_path);
                }

            } //core_pref_path == null

            return core_pref_path;

        } //core_pref_path

        int update_aux() {

            //this will handle any event loop stuff from SDL
            //and forward the events into the haxe side
            sdl_event.type = -1;

            while( SDL_PollEvent( &sdl_event ) ) {

                    //check if this is a window event and dispatch it
                lumen::window::handle_event( sdl_event );
                    //check if this is an input event and dispatch it
                lumen::input::handle_event( sdl_event );
                    //check if this is a system level event
                lumen::core::handle_event( sdl_event );

            } //while events are in queue

            return 0;

        } //update_core_aux

    //Helpers


        int init_sdl() {

            if(sdl_inited) {
                return 0;
            }

            sdl_inited = true;

            int res = SDL_Init(SDL_INIT_TIMER);

            if(res != 0) {
                lumen::log("/ lumen / failed to initialize SDL at all : %d %s", res, SDL_GetError());
            }

                //add a listener for the core events that the system (iOS/Android for example)
                //might want handled immediately, the NULL is no user data passed in (not needed)
            SDL_AddEventWatch(system_event_watch, NULL);

            return res;

        } //init_sdl

        int shutdown_sdl() {

            sdl_inited = false;

            SDL_Quit();
                //after quit, maybe it pumps messages still?
            SDL_DelEventWatch(system_event_watch, NULL);

            return 0;

        } //shutdown_sdl

        int SDLCALL system_event_watch(void *userdata, SDL_Event* event) {

            SystemEventType _event_type = se_unknown;

            switch(event->type) {

                case SDL_APP_TERMINATING: {
                    _event_type = se_app_terminating;
                    break;
                }
                case SDL_APP_LOWMEMORY: {
                    _event_type = se_app_lowmemory;
                    break;
                }
                case SDL_APP_WILLENTERBACKGROUND: {
                    _event_type = se_app_willenterbackground;
                    break;
                }
                case SDL_APP_DIDENTERBACKGROUND: {
                    _event_type = se_app_didenterbackground;
                    break;
                }
                case SDL_APP_WILLENTERFOREGROUND: {
                    _event_type = se_app_willenterforeground;
                    break;
                }
                case SDL_APP_DIDENTERFOREGROUND: {
                    _event_type = se_app_didenterforeground;
                    break;
                }
                default: {
                    return 0;
                }

            } //switch event.type

            lumen::core::dispatch_event( _event_type );

            return 1;

        } //watch

        void handle_event( SDL_Event &event ) {

            switch(event.type) {

                case SDL_QUIT: {
                    lumen::core::dispatch_event( se_quit );
                    break;
                }

                default: {
                    lumen::core::dispatch_event( se_unknown );
                    return;
                }

            } //switch event.type

        } //handle_event


    } //core namespace
} //lumen namespace
