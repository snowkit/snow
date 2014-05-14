
#include "lumen_window.h"

//glew first, before any gl.h (important)
// #include "libs/glew/GL/glew.h"
#include "libs/sdl/SDL.h"
#include "render/opengl/lumen_opengl.h"

#include "lumen_core.h"
#include <cstdlib>

namespace lumen {

        //forward
    int init_window_sdl();
    class LumenWindowSDL2;

        //local values
    static bool window_sdl_inited = false;

    static SDL_GLContext lumen_gl_context;
    static LumenWindowSDL2* current_gl_window;

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
            void close();

            void create( const window_config &config, AutoGCRoot* _on_created );
            void simple_message( const char* message, const char* title );
            void set_size(int x, int y);
            void set_position(int x, int y);
            void set_title(const char* title);
            void set_max_size(int x, int y);
            void set_min_size(int x, int y);
            void grab(bool enable);
            void fullscreen(bool enable, int flags);
            void bordered(bool enable);

        private:

    }; //LumenWindowSDL2

//API implementations

    LumenWindow* create_window( const window_config &config, AutoGCRoot* on_created ) {

        LumenWindowSDL2* new_window = new LumenWindowSDL2();

            new_window->create( config, on_created );
            new_window->closed = false;

        return new_window;

    } //create_window


    void LumenWindowSDL2::simple_message( const char* message, const char* title ) {

        if(closed) return;

        SDL_ShowSimpleMessageBox(SDL_MESSAGEBOX_ERROR, title, message, window );

    } //LumenWindowSDL2::simple_message

    void LumenWindowSDL2::close() {

        closed = true;

        SDL_DestroyWindow(window);

    } //LumenWindowSDL2::close

    void LumenWindowSDL2::create( const window_config &_config, AutoGCRoot* _on_created ) {

            //store these first
        created_handler = _on_created;
            //assign it now so we take a copy from the const
        config = _config;
            //then try init sdl video system

        int err = init_window_sdl();
        if (err == -1) {
            lumen::log("/ lumen / Could not initialize Video for SDL : %s\n", SDL_GetError());
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

        #ifdef LUMEN_GLES
            SDL_GL_SetAttribute(SDL_GL_RETAINED_BACKING, 1);
            SDL_GL_SetAttribute(SDL_GL_CONTEXT_MAJOR_VERSION, 2);
            SDL_GL_SetAttribute(SDL_GL_CONTEXT_MINOR_VERSION, 0);
        #endif

        if(_config.antialiasing != 0) {
            SDL_GL_SetAttribute(SDL_GL_MULTISAMPLEBUFFERS, true );
            SDL_GL_SetAttribute(SDL_GL_MULTISAMPLESAMPLES, _config.antialiasing );
        }

            //now actually try and create a window
        window = SDL_CreateWindow( _config.title.c_str(), _config.x, _config.y, _config.width, _config.height, request_flags );

        // fetch ones actually used by window
        // real_flags = SDL_GetWindowFlags( window );

        if( !window ) {
            lumen::log( "/ lumen / Failed to create SDL window: %s\n", SDL_GetError());
            on_created();
            return;
        } //!window

        SDL_GetWindowPosition( window, &config.x, &config.y );
        SDL_GetWindowSize( window, &config.width, &config.height );

        is_open = true;
        id = SDL_GetWindowID(window);

            //now try creating the GL context
        if(!lumen_gl_context) {

            lumen::log("/ lumen / Creating a GL context");
            lumen_gl_context = SDL_GL_CreateContext(window);

            #ifdef LUMEN_LIB_GLEW
                int err = glewInit();
                if(err != 0) {
                    lumen::log("/ lumen / Failed to init glew?! %s\n", glewGetErrorString(err));
                    on_created();
                    return;
                } else {
                    lumen::log("/ lumen / GLEW init ok");
                }
            #endif //LUMEN_GLEW

        }

        int res = 0;

        if(_config.vsync) {
            res = SDL_GL_SetSwapInterval(1);
        } else {
            res = SDL_GL_SetSwapInterval(0);
        }

            //on iOS we need to intercept the loop
        #ifdef IPHONE
            lumen::log("/ lumen / requesting main loop for iOS");
            SDL_iPhoneSetAnimationCallback(window, 1, lumen_core_loop, NULL);
        #endif //IPHONE


        if( !lumen_gl_context ) {
            lumen::log("/ lumen / Failed to create GL context for window %d : %s\n", id, SDL_GetError() );
            on_created();
            return;
        } else { //!window
            lumen::log("/ lumen / success in creating GL context for window %d : \n", id);
        }

        on_created();

    } //LumenWindowSDL2::create

    void LumenWindowSDL2::render() {

        if(closed) return;

        if(this != current_gl_window) {
            current_gl_window = this;
            SDL_GL_MakeCurrent(window, lumen_gl_context);
        }

    }

    void LumenWindowSDL2::swap() {

        if(closed) return;

        SDL_GL_SwapWindow(window);

    } //swap

    void LumenWindowSDL2::update() {

        if(closed) return;

    } //update

    void LumenWindowSDL2::set_size(int x, int y) {

        if(closed) return;

        SDL_SetWindowSize(window, x, y);

    } //set_size

    void LumenWindowSDL2::set_position(int x, int y) {

        if(closed) return;

        SDL_SetWindowPosition(window, x, y);

    } //set_position

    void LumenWindowSDL2::set_title(const char* title) {

        if(closed) return;

        SDL_SetWindowTitle(window, title);

    } //set_title

    void LumenWindowSDL2::set_max_size(int x, int y) {

        if(closed) return;

        SDL_SetWindowMaximumSize(window, x, y);

    } //set_max_size

    void LumenWindowSDL2::set_min_size(int x, int y) {

        if(closed) return;

        SDL_SetWindowMinimumSize(window, x, y);

    } //set_min_size

    void LumenWindowSDL2::grab(bool enable) {

        if(closed) return;

        SDL_SetWindowGrab( window, enable ? SDL_TRUE : SDL_FALSE);

    } //grab

    void LumenWindowSDL2::fullscreen(bool enable, int flags = 0) {

        if(closed) return;

        int flag = enable ? SDL_WINDOW_FULLSCREEN_DESKTOP : 0;

        if(flags == 1 && enable) {
            flag = SDL_WINDOW_FULLSCREEN;
        }

        SDL_SetWindowFullscreen( window, flag );

    } //fullscreen

    void LumenWindowSDL2::bordered(bool enable) {

        if(closed) return;

        SDL_SetWindowBordered( window, enable ? SDL_TRUE : SDL_FALSE );

    } //bordered

//Events

    value sdl2_window_event_to_hx( WindowEvent &new_event, SDL_Event &event ) {

        value _object = alloc_empty_object();

            alloc_field( _object, id_type, alloc_int(event.window.event) );
            alloc_field( _object, id_window_id, alloc_int(event.window.windowID) );
            alloc_field( _object, id_timestamp, alloc_float(event.window.timestamp/1000.0) );

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

            default: {
                return;
            }

        } //switch event.type

            //populate it's event structure first
        new_event.window_id = event.window.windowID;
        new_event.timestamp = event.window.timestamp;
        new_event.event = sdl2_window_event_to_hx(new_event, event);

            //dispatch the event!
        dispatch_window_event( new_event );

    } //handle_window_event

//Display modes

    value display_mode_to_hx( display_mode mode ) {

        value _object = alloc_empty_object();

            alloc_field( _object, id_width, alloc_int(mode.width) );
            alloc_field( _object, id_height, alloc_int(mode.height) );
            alloc_field( _object, id_refresh_rate, alloc_int(mode.refresh_rate) );
            alloc_field( _object, id_format, alloc_int(mode.format) );

        return _object;

    } //display_mode_to_hx

    value display_bounds_to_hx( bounds_rect bounds ) {

        value _object = alloc_empty_object();

            alloc_field( _object, id_x, alloc_int(bounds.x) );
            alloc_field( _object, id_y, alloc_int(bounds.y) );
            alloc_field( _object, id_width, alloc_int(bounds.width) );
            alloc_field( _object, id_height, alloc_int(bounds.height) );

        return _object;

    } //display_bounds_to_hx

    int desktop_get_display_count() {

        return SDL_GetNumVideoDisplays();

    } //desktop_get_display_count

    value desktop_get_display_native_mode(int display) {

        SDL_DisplayMode _mode;
        SDL_GetDesktopDisplayMode( display, &_mode );

        display_mode mode;

            mode.width = _mode.w;
            mode.height = _mode.h;
            mode.refresh_rate = _mode.refresh_rate;
            mode.format = _mode.format;

        return display_mode_to_hx(mode);

    } //desktop_get_display_native_mode

    value desktop_get_display_current_mode(int display) {

        SDL_DisplayMode _mode;
        SDL_GetCurrentDisplayMode( display, &_mode );

        display_mode mode;

            mode.width = _mode.w;
            mode.height = _mode.h;
            mode.refresh_rate = _mode.refresh_rate;
            mode.format = _mode.format;

        return display_mode_to_hx(mode);

    } //desktop_get_display_current_mode

    value desktop_get_display_mode(int display, int mode_index) {

        SDL_DisplayMode _mode;
        SDL_GetDisplayMode( display, mode_index, &_mode );

        display_mode mode;

            mode.width = _mode.w;
            mode.height = _mode.h;
            mode.refresh_rate = _mode.refresh_rate;
            mode.format = _mode.format;

        return display_mode_to_hx(mode);

    } //desktop_get_display_mode

    int desktop_get_display_mode_count(int display) {

        return SDL_GetNumDisplayModes(display);

    } //desktop_get_display_mode_count

    value desktop_get_display_bounds(int display) {

        SDL_Rect _rect;
        SDL_GetDisplayBounds(display, &_rect);

        bounds_rect bounds;

            bounds.x = _rect.x;
            bounds.y = _rect.y;
            bounds.width = _rect.w;
            bounds.height = _rect.h;

        return display_bounds_to_hx(bounds);

    } //desktop_get_display_bounds

    const char* desktop_get_display_name(int display) {

        return SDL_GetDisplayName(display);

    } //desktop_get_display_name


//Helpers

    int init_window_sdl() {

        if(window_sdl_inited) {
            return 0;
        }

        window_sdl_inited = true;

        return SDL_InitSubSystem(SDL_INIT_VIDEO);

    } //init_window_sdl


    int render_enable_vsync(bool enable) {

        return SDL_GL_SetSwapInterval( enable ? 1 : 0 );

    } //render_enable_vsync

    void window_show_cursor(bool enable) {

        SDL_ShowCursor( enable ? 1 : 0 );

    } //render_enable_vsync

} //namespace lumen