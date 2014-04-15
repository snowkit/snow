
#include "lumen_core.h"
#include "lumen_window.h"

#include <SDL.h>

namespace lumen {


        //forward
    int init_core_sdl();
    int shutdown_core_sdl();
    void handle_system_event( SDL_Event &event );
    void handle_window_event( SDL_Event &event );

        //whether or not sdl was already init
    static bool core_sdl_inited = false;
        //reusable event structure
    SDL_Event sdl_event;
        //a tag for a non valid event
    static int no_event = -1;


        //general handler for lumen auxiliary 
        //stuff, like SDL core systems
    int init_core_aux() {

        init_core_sdl();

        return 0;

    }    

    int shutdown_core_aux() {

        shutdown_core_sdl();

        return 0;

    } //shutdown_core_aux

    int update_core_aux() {

        //this will handle any event loop stuff from SDL
        //and forward the events into the haxe side
        sdl_event.type = -1;

        while( SDL_PollEvent( &sdl_event ) ) {

                //check if this is a window event and dispatch it
            handle_window_event( sdl_event );
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

        return SDL_Init(SDL_INIT_TIMER);

    } //init_core_sdl   

    int shutdown_core_sdl() {

        core_sdl_inited = false;
        SDL_Quit();

        return 0;
    }

    void handle_system_event( SDL_Event &event ) {

        SystemEvent new_event;

        switch(event.type) {

            case SDL_QUIT: {
                new_event.type = se_quit;
                break;
            }
            case SDL_APP_TERMINATING: {
                new_event.type = se_app_terminating;
                break;
            }
            case SDL_APP_LOWMEMORY: {
                new_event.type = se_app_lowmemory;
                break;
            }
            case SDL_APP_WILLENTERBACKGROUND: {
                new_event.type = se_app_willenterbackground;
                break;
            }
            case SDL_APP_DIDENTERBACKGROUND: {
                new_event.type = se_app_didenterbackground;
                break;
            }
            case SDL_APP_WILLENTERFOREGROUND: {
                new_event.type = se_app_willenterforeground;
                break;
            }
            case SDL_APP_DIDENTERFOREGROUND: {
                new_event.type = se_app_didenterforeground;
                break;
            }

        } //switch event.type

        dispatch_system_event( new_event );

    } //handle_system_event

    void handle_window_event( SDL_Event &event ) {

            //not a window event?
        if(event.type != SDL_WINDOWEVENT) {
            return;
        }

            //the event to dispatch, if any
        WindowEvent new_event;        

        switch(event.type) {

            case SDL_WINDOWEVENT: {

                switch (event.window.event) {

                    case SDL_WINDOWEVENT_SHOWN: {
                        new_event.type = we_shown;
                        break;
                    } //shown

                    case SDL_WINDOWEVENT_HIDDEN: {
                        new_event.type = we_hidden;
                        break;
                    } //hidden

                    case SDL_WINDOWEVENT_EXPOSED: {
                        new_event.type = we_exposed;
                        break;
                    } //exposed

                    case SDL_WINDOWEVENT_MOVED: {
                        new_event.type = we_moved;
                        break;
                    } //moved

                    case SDL_WINDOWEVENT_RESIZED: {
                        new_event.type = we_resized;
                        break;
                    } //resized

                    case SDL_WINDOWEVENT_SIZE_CHANGED: {
                        new_event.type = we_size_changed;
                        break;
                    } //size_changed

                    case SDL_WINDOWEVENT_MINIMIZED: {
                        new_event.type = we_minimized;
                        break;
                    } //minimized

                    case SDL_WINDOWEVENT_MAXIMIZED: {
                        new_event.type = we_maximized;
                        break;
                    } //maximized

                    case SDL_WINDOWEVENT_RESTORED: {
                        new_event.type = we_restored;
                        break;
                    } //restored

                    case SDL_WINDOWEVENT_ENTER: {
                        new_event.type = we_enter;
                        break;
                    } //enter

                    case SDL_WINDOWEVENT_LEAVE: {
                        new_event.type = we_leave;
                        break;
                    } //leave

                    case SDL_WINDOWEVENT_FOCUS_GAINED: {
                        new_event.type = we_focus_gained;
                        break;
                    } //focus gain

                    case SDL_WINDOWEVENT_FOCUS_LOST: {
                        new_event.type = we_focus_lost;
                        break;
                    } //focus lost

                    case SDL_WINDOWEVENT_CLOSE: {
                        new_event.type = we_close;
                        break;
                    } //close
                
                } //switch window.event type

                break;

            } //SDL_WINDOWEVENT

        } //switch event.type

            //dispatch the event!
        new_event.data1 = event.window.data1;
        new_event.data2 = event.window.data2;
        new_event.timestamp = event.window.timestamp;
        new_event.window_id = event.window.windowID;

        dispatch_window_event( new_event );

    } //handle_window_event

} //namespace lumen
