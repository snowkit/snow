
#include "lumen_window.h"

#include <SDL.h>

namespace lumen {

    static bool sdl_inited = false;
    static bool sdl_has_gamepads = false;

    int init_sdl() {
        
        if(sdl_inited) {
            return 0;
        }

        sdl_inited = true;

            //try and inititate SDL with video and timer
        int err = SDL_Init(SDL_INIT_VIDEO | SDL_INIT_TIMER);
            //check and init gamepad subsystem
        if (err == 0 && SDL_InitSubSystem(SDL_INIT_JOYSTICK) == 0) {
            sdl_has_gamepads = true;
        }
       
        return err;

    } //init_sdl

    class LumenWindowSDL2 : public LumenWindow {
        public:
            SDL_Window* window;
            SDL_Renderer* renderer;
            window_config create( window_config config );
        private:
    };

    static LumenWindowSDL2* window_sdl2;

    static bool is_running = true;

#ifndef SDL_NOEVENT
#define SDL_NOEVENT -1;
#endif

    void start_loop() {
        
        SDL_Event event;
        bool first = true;

        while(is_running) {
            
            event.type = SDL_NOEVENT;

            while (is_running && (first || SDL_WaitEvent(&event))) {

                first = false;

                // if (sgTimerActive && sgTimerID) {
                //     SDL_RemoveTimer(sgTimerID);
                //     sgTimerActive = false;
                //     sgTimerID = 0;
                // }

                if (event.type == SDL_QUIT || event.type == SDL_WINDOWEVENT_CLOSE) {
                    is_running = false;
                }

                if(!is_running) {
                    break;
                }

                event.type = SDL_NOEVENT;

                while (SDL_PollEvent(&event)) {
                    
                    // ProcessEvent (event);
                    if (event.type == SDL_QUIT || event.type == SDL_WINDOWEVENT_CLOSE) {
                        is_running = false;
                    }

                    if(!is_running) {
                        break;
                    }

                    event.type = -1;
                }

                // Event poll(etPoll);
                // sgSDLFrame->ProcessEvent(poll);

                if(!is_running) {
                    break;
                }

                // double next = sgSDLFrame->GetStage()->GetNextWake() - GetTimeStamp();

                // if (next > 0.001) {
                //     int snooze = next*1000.0;
                //     sgTimerActive = true;
                //     sgTimerID = SDL_AddTimer(snooze, OnTimer, 0);
                // } else { 
                //     OnTimer(0, 0);
                // }
                SDL_RenderPresent(window_sdl2->renderer);
            }
        }

        SDL_ShowSimpleMessageBox(SDL_MESSAGEBOX_ERROR, "DONE!?", "YES!", window_sdl2->window);

        SDL_Quit();

    } //start_loop

    window_config create_window( create_window_callback _on_complete, window_config config ) {
        
        printf("/ lumen / creating window : %s\n", config.title );

        window_sdl2 = new LumenWindowSDL2();
        config = window_sdl2->create(config);

        _on_complete( config );

        start_loop();

        return config;

    } //create_window



    window_config LumenWindowSDL2::create(window_config config) {

        int err = init_sdl();
        if (err == -1) {
            fprintf(stderr,"Could not initialize SDL : %s\n", SDL_GetError());
            return config;
        }

        int request_flags = 0;
        int real_flags = 0;

            request_flags |= SDL_WINDOW_OPENGL;
               
        if(config.resizable)    { request_flags |= SDL_WINDOW_RESIZABLE;  }
        if(config.borderless)   { request_flags |= SDL_WINDOW_BORDERLESS; }
        if(config.fullscreen)   { request_flags |= SDL_WINDOW_FULLSCREEN; } //SDL_WINDOW_FULLSCREEN_DESKTOP;

            //opengl specifics
        SDL_GL_SetAttribute(SDL_GL_RED_SIZE, 8);
        SDL_GL_SetAttribute(SDL_GL_GREEN_SIZE, 8);
        SDL_GL_SetAttribute(SDL_GL_BLUE_SIZE, 8);
        
        if(config.depth_buffer) {
            SDL_GL_SetAttribute(SDL_GL_DEPTH_SIZE, 32 - (config.stencil_buffer ? 8 : 0) );
        }
      
        if(config.stencil_buffer) {
            SDL_GL_SetAttribute(SDL_GL_STENCIL_SIZE, 8);
        }
      
        SDL_GL_SetAttribute(SDL_GL_DOUBLEBUFFER, 1);
      
        if(config.antialiasing != 0) {
            SDL_GL_SetAttribute(SDL_GL_MULTISAMPLEBUFFERS, true);
            SDL_GL_SetAttribute(SDL_GL_MULTISAMPLESAMPLES, config.antialiasing);
        }

        window = NULL;
        renderer = NULL;

            //keep trying to create a window
        while (!window || !renderer) {

                // if there's an old window around
                // from a failed attempt, destroy it
            if (window) {
                SDL_DestroyWindow(window);
                window = NULL;
            } //window exists

            window = SDL_CreateWindow( config.title, SDL_WINDOWPOS_UNDEFINED, SDL_WINDOWPOS_UNDEFINED, config.width, config.height, request_flags );
                //fetch ones actually used by window
            real_flags = SDL_GetWindowFlags( window );

            int render_flags = SDL_RENDERER_ACCELERATED;

                if(config.vsync) { render_flags |= SDL_RENDERER_PRESENTVSYNC; }

            renderer = SDL_CreateRenderer( window, -1, render_flags );

            if (!renderer && config.antialiasing != 0) {

                    // if no window was created and AA was enabled, disable AA and try again
                fprintf(stderr, "Multisampling is not available. Retrying without. (%s)\n", SDL_GetError());
                SDL_GL_SetAttribute(SDL_GL_MULTISAMPLEBUFFERS, false);
                SDL_GL_SetAttribute(SDL_GL_MULTISAMPLESAMPLES, 0);
                    //update the config for sending back to them
                config.antialiasing = 0;
            
            } else {
                break;
            }

        } //while !window && !renderer

        if( !window ) {
            fprintf(stderr, "Failed to create SDL window: %s\n", SDL_GetError());
            return config;
        }  
       
        if( !renderer ) {
            fprintf(stderr, "Failed to create SDL renderer: %s\n", SDL_GetError());
            return config;
        }

        return config;

    } //LumenWindowSDL2::create

} //namespace lumen