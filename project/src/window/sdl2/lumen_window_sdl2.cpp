
#include "lumen_window.h"

//glew first, before any gl.h (important)
#include "libs/glew/GL/glew.h"
#include <SDL.h>
#include <SDL_opengl.h>

#include <cstdlib>

namespace lumen {

        //forward
    int init_window_sdl();    
    class LumenWindowSDL2;

        //local values
    
    static bool window_sdl_inited = false;

    static SDL_GLContext lumen_gl_context;

//LumenWindow
//LumenWindowSDL2 declaration

    class LumenWindowSDL2 : public LumenWindow {

        public:

            SDL_Window* window;            
            SDL_Event window_event;

            bool is_open;

            ~LumenWindowSDL2() {

                if(window) {
                    SDL_DestroyWindow(window);
                }
            
            }

            LumenWindowSDL2() 
                : LumenWindow(), window_event() 
                    { 
                        is_open = false; 
                        r = static_cast <float> (rand()) / static_cast <float> (RAND_MAX);
                    }
 
            void update();
            void render();
            void swap();

            void create( const window_config &config, AutoGCRoot* _on_created );
            void simple_message( const char* message, const char* title );

        private:

    }; //LumenWindowSDL2

//API implementations

    LumenWindow* create_window( const window_config &config, AutoGCRoot* on_created ) {
        
        LumenWindowSDL2* new_window = new LumenWindowSDL2();

            new_window->create( config, on_created );

        return new_window;

    } //create_window


    void LumenWindowSDL2::simple_message( const char* message, const char* title ) {

        SDL_ShowSimpleMessageBox(SDL_MESSAGEBOX_ERROR, title, message, window );

    } //LumenWindowSDL2::simple_message

    void LumenWindowSDL2::create( const window_config &_config, AutoGCRoot* _on_created ) {

            //store these first
        created_handler = _on_created;        
            //assign it now so we take a copy from the const
        config = _config;
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

        if(_config.vsync) {
            SDL_GL_SetSwapInterval(1);
        } else {
            SDL_GL_SetSwapInterval(0);
        }
      
        if(_config.antialiasing != 0) {
            SDL_GL_SetAttribute(SDL_GL_MULTISAMPLEBUFFERS, true );
            SDL_GL_SetAttribute(SDL_GL_MULTISAMPLESAMPLES, _config.antialiasing );
        }

            //now actually try and create a window
        window = SDL_CreateWindow( _config.title.c_str(), _config.x, _config.y, _config.width, _config.height, request_flags );                

        // fetch ones actually used by window
        // real_flags = SDL_GetWindowFlags( window );

        if( !window ) {
            fprintf(stderr, "/ lumen / Failed to create SDL window: %s\n", SDL_GetError());
            on_created();
            return;
        } //!window

        SDL_GetWindowPosition( window, &config.x, &config.y );
        SDL_GetWindowSize( window, &config.width, &config.height );

        is_open = true;
        id = SDL_GetWindowID(window);        

            //now try creating the GL context
        if(!lumen_gl_context) {
            
            lumen_gl_context = SDL_GL_CreateContext(window);
                
            int err = glewInit();
            if(err != 0) {
                fprintf(stderr, "/ lumen / Failed to init glew?! %s\n", glewGetErrorString(err));
                on_created();
                return;
            }

        }

        if( !lumen_gl_context ) {
            fprintf(stderr, "/ lumen / Failed to create GL context for window %d : %s\n", id, SDL_GetError() );
            on_created();
            return;
        } //!window

        on_created();

    } //LumenWindowSDL2::create

    void LumenWindowSDL2::render() {

        SDL_GL_MakeCurrent(window, lumen_gl_context);

        glClearColor( r, 0.4f, 0.1f, 1.0f );
        glClear( GL_COLOR_BUFFER_BIT );        

    }

    void LumenWindowSDL2::swap() {

        SDL_GL_SwapWindow(window);

    }

    void LumenWindowSDL2::update() {    

    } //update

//Events

    value sdl2_window_event_to_hx( WindowEvent &new_event, SDL_Event &event ) {

        value _object = alloc_empty_object();

            alloc_field( _object, id_type, alloc_int(event.window.event) );
            alloc_field( _object, id_window_id, alloc_int(event.window.windowID) );
            alloc_field( _object, id_timestamp, alloc_int(event.window.timestamp) );

            switch (event.window.event) {

                case SDL_WINDOWEVENT_MOVED:
                case SDL_WINDOWEVENT_RESIZED:
                case SDL_WINDOWEVENT_SIZE_CHANGED: {

                    alloc_field( _object, id_data1, alloc_int(event.window.data1) );
                    alloc_field( _object, id_data2, alloc_int(event.window.data2) );

                    break;

                }

            } //switch event.type

        return _object;

    } //sdl2_window_event_to_hx

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

            //populate it's event structure first
        new_event.window_id = event.window.windowID;
        new_event.timestamp = event.window.timestamp;
        new_event.event = sdl2_window_event_to_hx(new_event, event);            

            //dispatch the event!
        dispatch_window_event( new_event );

    } //handle_window_event    


//Helpers

    int init_window_sdl() {
        
        if(window_sdl_inited) {
            return 0;
        }

        window_sdl_inited = true;

        return SDL_InitSubSystem(SDL_INIT_VIDEO);

    } //init_window_sdl   


} //namespace lumen