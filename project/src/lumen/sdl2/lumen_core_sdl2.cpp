
#include "lumen_core.h"
#include "lumen_window.h"
#include "lumen_input.h"

#include "libs/sdl/SDL.h"

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

        //forward
    int init_core_sdl();
    int shutdown_core_sdl();
    void handle_system_event( SDL_Event &event );
    int SDLCALL system_event_watch(void *userdata, SDL_Event* event);

    const char* core_app_path();
    const char* core_pref_path(const char* org, const char* app);

    extern void handle_window_event( SDL_Event &event );
    extern void handle_input_event( SDL_Event &event );
    extern void init_input_sdl();

        //whether or not sdl was already init
    static bool core_sdl_inited = false;
        //reusable event structure
    SDL_Event sdl_event;
        //a tag for a non valid event
    static int no_event = -1;

    const char* base_path = "./";
    const char* pref_path = NULL;

        //general handler for lumen auxiliary
        //stuff, like SDL core systems
    int init_core_aux() {

        char *_base_path = SDL_GetBasePath();
        if (_base_path) {
            base_path = SDL_strdup(_base_path);
            SDL_free( _base_path );
        }

        int res = init_core_sdl();

        if(res != 0) {
            return res;
        }

        init_input_sdl();

        return 0;
    }

    int shutdown_core_aux() {

        shutdown_core_sdl();

        return 0;

    } //shutdown_core_aux

    const char* core_app_path() {

        return base_path;

    } //core_app_path

    const char* core_pref_path( const char* org, const char* app ) {

        if(pref_path == NULL) {

            char *_pref_path = SDL_GetPrefPath(org, app);
            if (_pref_path) {
                pref_path = SDL_strdup(_pref_path);
                SDL_free(_pref_path);
            }

        } //pref_path

        return pref_path;

    } //core_pref_path

    int update_core_aux() {

        //this will handle any event loop stuff from SDL
        //and forward the events into the haxe side
        sdl_event.type = -1;

        while( SDL_PollEvent( &sdl_event ) ) {

                //check if this is a window event and dispatch it
            handle_window_event( sdl_event );
                //check if this is an input event and dispatch it
            handle_input_event( sdl_event );
                //check if this is a system level event
            handle_system_event( sdl_event );

        } //while events are in queue

        return 0;

    } //update_core_aux

//Helpers

    int init_core_sdl() {

        if(core_sdl_inited) {
            return 0;
        }

        core_sdl_inited = true;

        int res = SDL_Init(SDL_INIT_TIMER);

        if(res != 0) {
            lumen::log("/ lumen / failed to initialize SDL at all : %d %s", res, SDL_GetError());
        }

            //add a listener for the core events that the system (iOS/Android for example)
            //might want handled immediately, the NULL is no user data passed in (not needed)
        SDL_AddEventWatch(system_event_watch, NULL);

        return res;

    } //init_core_sdl

    int shutdown_core_sdl() {

        core_sdl_inited = false;

        SDL_Quit();
            //after quit, maybe it pumps messages still?
        SDL_DelEventWatch(system_event_watch, NULL);

        return 0;
    }

    int SDLCALL system_event_watch(void *userdata, SDL_Event* event) {

        SystemEventType new_event_type = se_unknown;

        switch(event->type) {

            case SDL_APP_TERMINATING: {
                new_event_type = se_app_terminating;
                break;
            }
            case SDL_APP_LOWMEMORY: {
                new_event_type = se_app_lowmemory;
                break;
            }
            case SDL_APP_WILLENTERBACKGROUND: {
                new_event_type = se_app_willenterbackground;
                break;
            }
            case SDL_APP_DIDENTERBACKGROUND: {
                new_event_type = se_app_didenterbackground;
                break;
            }
            case SDL_APP_WILLENTERFOREGROUND: {
                new_event_type = se_app_willenterforeground;
                break;
            }
            case SDL_APP_DIDENTERFOREGROUND: {
                new_event_type = se_app_didenterforeground;
                break;
            }
            default: {
                return 0;
            }

        } //switch event.type

        SystemEvent new_event;
        new_event.type = new_event_type;

        dispatch_system_event( new_event );

        return 1;

    } //watch

    void handle_system_event( SDL_Event &event ) {

        SystemEventType new_event_type = se_unknown;

        switch(event.type) {

            case SDL_QUIT: {
                new_event_type = se_quit;
                break;
            }

            default: {
                return;
            }

        } //switch event.type

        SystemEvent new_event;
        new_event.type = new_event_type;

        dispatch_system_event( new_event );

    } //handle_system_event


} //namespace lumen
