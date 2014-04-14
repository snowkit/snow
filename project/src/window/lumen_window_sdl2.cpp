
#include "lumen_window.h"

#include <SDL.h>

namespace lumen {

        //forward
    int init_window_sdl();    
    class LumenWindowSDL2;

        //local values
    static int no_event = -1;
    static bool window_sdl_inited = false;


//LumenWindow
//LumenWindowSDL2 declaration

    class LumenWindowSDL2 : public LumenWindow {

        public:

            SDL_Window* window;
            SDL_Renderer* renderer;
            SDL_Event window_event;

            bool is_open;

            ~LumenWindowSDL2() {}
            LumenWindowSDL2() 
                : LumenWindow(), window_event() 
                    { is_open = false; }
 
            void update();
            void create( const window_config &config, AutoGCRoot* _on_created, AutoGCRoot* _on_event );
            void simple_message( const char* message, const char* title );

            void handle_sdl_event(SDL_Event &event);

        private:

    }; //LumenWindowSDL2

//API implementations

    LumenWindow* create_window( const window_config &config, AutoGCRoot* on_created, AutoGCRoot* on_event ) {
        
        printf("/ lumen / creating window : %s\n", config.title.c_str() );

        LumenWindowSDL2* new_window = new LumenWindowSDL2();

            new_window->create( config, on_created, on_event );

        return new_window;

    } //create_window


    void LumenWindowSDL2::simple_message( const char* message, const char* title ) {

        SDL_ShowSimpleMessageBox(SDL_MESSAGEBOX_ERROR, message, title, window );

    } //LumenWindowSDL2::simple_message

    void LumenWindowSDL2::create( const window_config &_config, AutoGCRoot* _on_created, AutoGCRoot* _on_event ) {

            //store these first
        created_handler = _on_created;
        event_handler = _on_event;

            //then try init sdl video system

        int err = init_window_sdl();
        if (err == -1) {
            fprintf(stderr,"/ lumen / Could not initialize Video for SDL : %s\n", SDL_GetError());
            on_created();
            return;
        }

            //then create flags for the given config

        int request_flags = 0;
        int real_flags = 0;

            request_flags |= SDL_WINDOW_OPENGL;
               
        if(_config.resizable)    { request_flags |= SDL_WINDOW_RESIZABLE;  }
        if(_config.borderless)   { request_flags |= SDL_WINDOW_BORDERLESS; }
        if(_config.fullscreen)   { request_flags |= SDL_WINDOW_FULLSCREEN; } //SDL_WINDOW_FULLSCREEN_DESKTOP;

            //opengl specifics

        SDL_GL_SetAttribute(SDL_GL_RED_SIZE, 8);
        SDL_GL_SetAttribute(SDL_GL_GREEN_SIZE, 8);
        SDL_GL_SetAttribute(SDL_GL_BLUE_SIZE, 8);
        
        if(_config.depth_buffer) {
            SDL_GL_SetAttribute(SDL_GL_DEPTH_SIZE, 32 - (_config.stencil_buffer ? 8 : 0) );
        }
      
        if(_config.stencil_buffer) {
            SDL_GL_SetAttribute(SDL_GL_STENCIL_SIZE, 8);
        }
      
        SDL_GL_SetAttribute(SDL_GL_DOUBLEBUFFER, 1);
      
        if(_config.antialiasing != 0) {
            SDL_GL_SetAttribute(SDL_GL_MULTISAMPLEBUFFERS, true);
            SDL_GL_SetAttribute(SDL_GL_MULTISAMPLESAMPLES, _config.antialiasing);
        }

                //now actually try and create a window

            window = NULL;
            renderer = NULL;    

            int trycount = 0;

                //keep trying to create a window
            while (!window || !renderer) { 

                    // if there's an old window around
                    // from a failed attempt, destroy it
                if (window) {
                    SDL_DestroyWindow(window);
                    window = NULL;
                } //window exists

                ++trycount;

                window = SDL_CreateWindow( _config.title.c_str(), SDL_WINDOWPOS_UNDEFINED, SDL_WINDOWPOS_UNDEFINED, _config.width, _config.height, request_flags );
                    
                    //fetch ones actually used by window
                real_flags = SDL_GetWindowFlags( window );

                int render_flags = SDL_RENDERER_ACCELERATED;

                    if(_config.vsync) { render_flags |= SDL_RENDERER_PRESENTVSYNC; }

                renderer = SDL_CreateRenderer( window, -1, render_flags );

                if (!renderer && _config.antialiasing != 0) {

                        // if no window was created and AA was enabled, disable AA and try again
                    fprintf(stderr, "Multisampling is not available. Retrying without. (%s)\n", SDL_GetError());
                    SDL_GL_SetAttribute(SDL_GL_MULTISAMPLEBUFFERS, false);
                    SDL_GL_SetAttribute(SDL_GL_MULTISAMPLESAMPLES, 0);
                        //update the config for return
                    // _config.antialiasing = 0;

                } else {
                    break;
                }

            } //while !window && !renderer

        printf("/ lumen / tried %d times for a window\n", trycount);

        if( !window ) {
            fprintf(stderr, "/ lumen / Failed to create SDL window: %s\n", SDL_GetError());
            on_created();
            return;
        } //!window
       
        if( !renderer ) {
            fprintf(stderr, "/ lumen / Failed to create SDL renderer: %s\n", SDL_GetError());
            on_created();
            return;
        } //!renderer

        is_open = true;
        id = SDL_GetWindowID(window);
        config = _config;

        on_created();

    } //LumenWindowSDL2::create

    void LumenWindowSDL2::update() {    

        window_event.type = we_unknown;

        while( SDL_PollEvent( &window_event ) ) {
                        
            handle_sdl_event( window_event );

                //if one of these was a close event
                //we don't want to keep processing 
                //against a closed window so break
            if(!is_open) {
                break;
            }

            window_event.type = we_unknown;

        } //while events are in queue

    } //update


    void LumenWindowSDL2::handle_sdl_event( SDL_Event &event ) {

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
                        is_open = false;
                        break;
                    } //close
                
                } //switch window.event type

                break;

            } //SDL_WINDOWEVENT

        } //switch event.type

            //dispatch the event!
        if(new_event.type != we_unknown) {
            handle_event( new_event );
        }

    } // LumenWindowSDL2::handle_sdl_event

//Helpers

    int init_window_sdl() {
        
        if(window_sdl_inited) {
            return 0;
        }

        window_sdl_inited = true;

        return SDL_InitSubSystem(SDL_INIT_VIDEO);

    } //init_window_sdl   


} //namespace lumen