/*
    Copyright Sven Bergström 2014
    created for snow https://github.com/underscorediscovery/snow
    MIT license
*/


#include "snow_window.h"
#include "snow_platform.h"

#include "SDL.h"
#include "render/opengl/snow_opengl.h"

#include "snow_core.h"
#include "snow_render.h"
#include <cstdlib>

namespace snow {

    namespace window {

            //forward
        int init_sdl();
        class WindowSDL2;

            //local values
        static bool sdl_inited = false;

        static SDL_GLContext snow_gl_context;
        static WindowSDL2* current_gl_window;

    //Window
    //WindowSDL2 declaration

        class WindowSDL2 : public Window {

            public:

                SDL_Window* window;
                SDL_Event window_event;

                ~WindowSDL2() {

                    if(window) {
                        SDL_DestroyWindow(window);
                    }

                } //~WindowSDL2

                WindowSDL2()
                    : Window(), window_event()
                        {
                            r = static_cast <float> (rand()) / static_cast <float> (RAND_MAX);
                        }
                //WindowSDL2

                void update();
                void render();
                void swap();
                void close();
                void show();
                void destroy();

                void create( const RenderConfig &render_config, const WindowConfig &config, AutoGCRoot* _on_created );
                void simple_message( const char* message, const char* title );
                void set_size(int x, int y);
                void set_position(int x, int y);
                void set_title(const char* title);
                void set_max_size(int x, int y);
                void set_min_size(int x, int y);
                void fullscreen(bool enable, int flags);
                void bordered(bool enable);
                    //cursor related
                void grab(bool enable);
                void set_cursor_position(int x, int y);

                    //hardiness
                bool probe( RenderConfig &_render_config, WindowConfig &_window_config );
                    //warnings/errors appended here for debugging
                std::string notes;

            private:

        }; //WindowSDL2

    //API implementations

        Window* create_window( const RenderConfig &render_config, const WindowConfig &config, AutoGCRoot* on_created ) {

            WindowSDL2* new_window = new WindowSDL2();

                new_window->create( render_config, config, on_created );

            return new_window;

        } //create_window


        void WindowSDL2::simple_message( const char* message, const char* title ) {

            if(closed) {
                return;
            }

            SDL_ShowSimpleMessageBox(SDL_MESSAGEBOX_ERROR, title, message, window );

        } //WindowSDL2::simple_message

        void WindowSDL2::close() {

            closed = true;

            SDL_HideWindow(window);

        } //WindowSDL2::close

        void WindowSDL2::show() {

            closed = false;

            SDL_ShowWindow(window);

        } //WindowSDL2::show

        void WindowSDL2::destroy() {

            closed = true;

            SDL_DestroyWindow(window);

                //fire an event as well
            WindowEvent destroy_event;

                destroy_event.timestamp = snow::timestamp();
                destroy_event.type = we_destroy;
                destroy_event.window_id = id;
                destroy_event.event = alloc_null();

            snow::window::dispatch_event( destroy_event );

            window = NULL;

        } //WindowSDL2::destroy


            //This function will probe for hardware capability,
            //asking the hardware for the best available settings
            //inline with the requested configs, updating them as needed.
            //this appends errors to `notes` that are found during creation
            //if given a config that can't be obtained, so we can get clearer state.
        bool WindowSDL2::probe( RenderConfig &_render_config, WindowConfig &_window_config ) {

            return false;

        } //probe


        void WindowSDL2::create( const RenderConfig &_render_config, const WindowConfig &_config, AutoGCRoot* _on_created ) {

                //store these first
            created_handler = _on_created;
                //assign it now so we take a copy from the const
            config = _config;
            render_config = _render_config;

                //then try init sdl video system
            int err = snow::window::init_sdl();
            if (err == -1) {
                snow::log(1, "/ snow / could not initialize Video for SDL : %s\n", SDL_GetError());
                on_created( false );
                return;
            }

                //then create flags for the given config

            int request_flags = 0;
            int real_flags = 0;

                request_flags |= SDL_WINDOW_OPENGL;

            if(config.resizable)            { request_flags |= SDL_WINDOW_RESIZABLE;  }
            if(config.borderless)           { request_flags |= SDL_WINDOW_BORDERLESS; }

            if(config.fullscreen) {
                if(config.fullscreen_desktop) {
                    request_flags |= SDL_WINDOW_FULLSCREEN_DESKTOP;
                } else {
                    //see :note:1: below
                }
            }

            snow::log(3, "x:%d y:%d width:%d height:%d", config.x, config.y, config.width, config.height);
            snow::log(3, "red:%d green:%d blue:%d alpha:%d depth:%d stencil:%d major:%d minor:%d profile:%d aa:%d", 
                render_config.red_bits, render_config.green_bits, render_config.blue_bits, render_config.alpha_bits,
                render_config.depth_bits, render_config.stencil_bits, render_config.opengl.major, render_config.opengl.minor,
                render_config.opengl.profile, render_config.antialiasing);

                //opengl specifics, these all need to be set before create window

            SDL_GL_SetAttribute(SDL_GL_RED_SIZE,    render_config.red_bits);
            SDL_GL_SetAttribute(SDL_GL_GREEN_SIZE,  render_config.green_bits);
            SDL_GL_SetAttribute(SDL_GL_BLUE_SIZE,   render_config.blue_bits);
            SDL_GL_SetAttribute(SDL_GL_ALPHA_SIZE,  render_config.alpha_bits);

                //:todo: this will migrate to probe above
            if(render_config.depth_bits > 0) {
                SDL_GL_SetAttribute(SDL_GL_DEPTH_SIZE, render_config.depth_bits );
            }

            if(render_config.stencil_bits > 0) {
                SDL_GL_SetAttribute(SDL_GL_STENCIL_SIZE, render_config.stencil_bits );
            }

            SDL_GL_SetAttribute(SDL_GL_DOUBLEBUFFER, 1);

            if(render_config.opengl.major != 0) {
                SDL_GL_SetAttribute(SDL_GL_CONTEXT_MAJOR_VERSION, render_config.opengl.major);
                SDL_GL_SetAttribute(SDL_GL_CONTEXT_MINOR_VERSION, render_config.opengl.minor);
            }

            #ifdef SNOW_GLES

                SDL_GL_SetAttribute(SDL_GL_RETAINED_BACKING, 1);

                    //if no explicit version, default to ES 2.0.
                if(render_config.opengl.major == 0) {
                    SDL_GL_SetAttribute(SDL_GL_CONTEXT_MAJOR_VERSION, 2);
                    SDL_GL_SetAttribute(SDL_GL_CONTEXT_MINOR_VERSION, 0);
                }

            #else

                switch(render_config.opengl.profile) {

                    case gl_profile_compatibility:{
                       SDL_GL_SetAttribute(SDL_GL_CONTEXT_PROFILE_MASK, SDL_GL_CONTEXT_PROFILE_COMPATIBILITY);
                    } break;

                    case gl_profile_core:{
                        SDL_GL_SetAttribute(SDL_GL_ACCELERATED_VISUAL, 1);
                        SDL_GL_SetAttribute(SDL_GL_CONTEXT_PROFILE_MASK, SDL_GL_CONTEXT_PROFILE_CORE);
                    } break;

                } // profile

            //GLES
            #endif

            if(render_config.antialiasing > 0) {
                SDL_GL_SetAttribute(SDL_GL_MULTISAMPLEBUFFERS, 1 );
                SDL_GL_SetAttribute(SDL_GL_MULTISAMPLESAMPLES, render_config.antialiasing );
            }

                //now actually try and create a window
            window = SDL_CreateWindow( config.title.c_str(), config.x, config.y, config.width, config.height, request_flags );

                //#21 proves this false. need to adjust.
                //based on the code in SDL, the only reasons this can fail is
                    // - no opengl at all (and we will always be requesting it so if that fails its game over)
                    // - unable to load gl functions from library (same as no gl then)
                    // - run out of memory to allocate a window (extremely unlikely but also game over)
                    // - platform specific window failure, also unavoidable
            if( !window ) {

                snow::log(1, "/ snow / window failed to create for platform, cannot recover : %s\n", SDL_GetError());
                on_created( false );
                return;

            } //!window

            SDL_GetWindowPosition( window, &config.x, &config.y );
            SDL_GetWindowSize( window, &config.width, &config.height );

            id = SDL_GetWindowID(window);

                //now try creating the GL context,
                //if one doesn't already exist
            if(!snow_gl_context) {

                snow::log(2, "/ snow / attempting to create a GL context...");

                snow_gl_context = SDL_GL_CreateContext(window);

                if( !snow_gl_context ) {

                    snow::log(1, "/ snow / failed to create GL context for windowing (window id %d): %s\n", id, SDL_GetError() );
                    snow::log(1, "/ snow / trying again in a safer mode (no AA)");

                        //try without AA as this is a common cause of problems
                    SDL_GL_SetAttribute(SDL_GL_MULTISAMPLEBUFFERS, 0);
                    SDL_GL_SetAttribute(SDL_GL_MULTISAMPLESAMPLES, 0);
                        //undo the local config for the aa, so it's sent back as off
                    render_config.antialiasing = 0;

                        //try again
                    snow_gl_context = SDL_GL_CreateContext(window);

                    if(!snow_gl_context) {

                        snow::log(1, "/ snow / failed to create GL context without AA (window id  %d): %s\n", id, SDL_GetError() );

                            //if that fails, we try and run a diagnostic test
                            //against no stencil / depth buffer, so we can log more useful information
                        SDL_GL_SetAttribute(SDL_GL_DEPTH_SIZE, 0);
                        SDL_GL_SetAttribute(SDL_GL_STENCIL_SIZE, 0 );

                        snow_gl_context = SDL_GL_CreateContext(window);

                            //if this succeeds we can at least log that there was a misconfigured depth/stencil buffer
                        if(snow_gl_context) {
                            snow::log(1, "/ snow / diagnostic test with no stencil/depth passed, meaning your stencil/depth bit combo is invalid (requested stencil:%d, depth:%d)\n",
                                render_config.stencil_bits, render_config.depth_bits );
                        } else {
                            snow::log(1, "/ snow / diagnostic test with no stencil/depth failed as well %s\n", SDL_GetError() );
                        }

                        on_created( false );
                        return;
                    }

                } //!snow_gl_context

                    //if we end up with a context
                if(snow_gl_context) {

                            //:note:1:
                            // This is related partially to the below thread, but also
                            // to https://forums.libsdl.org/viewtopic.php?t=10372 in general.
                            // :/ ?! https://forums.libsdl.org/viewtopic.php?t=10015
                            // :note:1: referenced below as well.
                            //The problem with "proper fullscreen" is that
                            //it makes a mess of the OS state etc, so it's best to
                            //use fullscreen desktop, and render upscaled instead.
                            //If for some arcane reason you need true displaymode
                            //type fullscreen, to change window resolutions,
                            //the window must be set to windowed, resized, and then
                            //set to fullscreen again. This obviously has to be aware
                            //of valid and invalid displaymodes, all of which is outside
                            //of the scope for snow's purposes, so if you must do that stuff
                            //you have all the functions in the api, have at it.
                            //all snow will do: create the window hidden at the given launch
                            //size, and switch to fullscreen after to get the desired size.
                        if(config.fullscreen) {
                            if(!config.fullscreen_desktop) {
                                SDL_SetWindowFullscreen(window, SDL_WINDOW_FULLSCREEN);
                            }
                        }

                        //update the window config flags to what
                        //SDL has actually given us in return

                        SDL_GL_GetAttribute(SDL_GL_MULTISAMPLESAMPLES, &render_config.antialiasing);

                        SDL_GL_GetAttribute(SDL_GL_RED_SIZE, &render_config.red_bits);
                        SDL_GL_GetAttribute(SDL_GL_GREEN_SIZE, &render_config.green_bits);
                        SDL_GL_GetAttribute(SDL_GL_BLUE_SIZE, &render_config.blue_bits);
                        SDL_GL_GetAttribute(SDL_GL_ALPHA_SIZE, &render_config.alpha_bits);

                        SDL_GL_GetAttribute(SDL_GL_DEPTH_SIZE, &render_config.depth_bits);
                        SDL_GL_GetAttribute(SDL_GL_STENCIL_SIZE, &render_config.stencil_bits);

                        SDL_GL_GetAttribute(SDL_GL_CONTEXT_MAJOR_VERSION, &render_config.opengl.major);
                        SDL_GL_GetAttribute(SDL_GL_CONTEXT_MINOR_VERSION, &render_config.opengl.minor);
                        int profile = (int)render_config.opengl.profile;
                        SDL_GL_GetAttribute(SDL_GL_CONTEXT_PROFILE_MASK, &profile);

                        switch(profile) {
                            case SDL_GL_CONTEXT_PROFILE_COMPATIBILITY:{
                               render_config.opengl.profile = gl_profile_compatibility;
                            } break;
                            case SDL_GL_CONTEXT_PROFILE_CORE:{
                               render_config.opengl.profile = gl_profile_core;
                            } break;
                        } // profile

                    snow::render::set_context_attributes(
                        render_config.red_bits, render_config.green_bits,
                        render_config.blue_bits, render_config.alpha_bits,
                        render_config.depth_bits, render_config.stencil_bits,
                        render_config.antialiasing
                    );

                    snow::log(2, "/ snow / success in creating GL context for window %d\n", id);

                }

                #ifdef NATIVE_TOOLKIT_GLEW
                    glewExperimental = GL_TRUE;
                    int err = glewInit();
                    if(err != 0) {
                        snow::log(1, "/ snow / failed to init glew?! %s\n", glewGetErrorString(err));
                        on_created( false );
                        return;
                    } else {
                        snow::log(2, "/ snow / GLEW init ok");
                    }
                #endif //NATIVE_TOOLKIT_GLEW

            } //!snow_gl_context

                //on iOS we need to intercept the loop
            #ifdef IPHONE
                snow::log(1, "/ snow / requesting main loop for iOS");
                SDL_iPhoneSetAnimationCallback(window, 1, snow::core::loop, NULL);
            #endif //IPHONE

            #ifdef HX_WINDOWS
                snow::platform::window::load_icon( window );
            #endif

            on_created( true );

        } //WindowSDL2::create

        void WindowSDL2::render() {

            if(closed) {
                return;
            }

            if(this != current_gl_window) {
                current_gl_window = this;
                SDL_GL_MakeCurrent(window, snow_gl_context);
            }

        } //render

        void WindowSDL2::swap() {

            if(closed) {
                return;
            }

            SDL_GL_SwapWindow(window);

        } //swap

        void WindowSDL2::update() {

            if(closed) {
                return;
            }

        } //update

        void WindowSDL2::set_size(int x, int y) {

            if(closed) {
                return;
            }

            SDL_SetWindowSize(window, x, y);

        } //set_size

        void WindowSDL2::set_position(int x, int y) {

            if(closed) {
                return;
            }

            SDL_SetWindowPosition(window, x, y);

        } //set_position

        void WindowSDL2::set_title(const char* title) {

            if(closed) {
                return;
            }

            SDL_SetWindowTitle(window, title);

        } //set_title

        void WindowSDL2::set_max_size(int x, int y) {

            if(closed) {
                return;
            }

            SDL_SetWindowMaximumSize(window, x, y);

        } //set_max_size

        void WindowSDL2::set_min_size(int x, int y) {

            if(closed) {
                return;
            }

            SDL_SetWindowMinimumSize(window, x, y);

        } //set_min_size


        void WindowSDL2::fullscreen(bool enable, int flags = 0) {

            if(closed) {
                return;
            }

                //default to fullscreen desktop here
            int flag = enable ? SDL_WINDOW_FULLSCREEN_DESKTOP : 0;

                //if fullscreen_desktop is not set (through flags=1), we use
                //the WINDOW_FULLSCREEN flag only, reverting it by setting
            if(flags == 1 && enable) {
                flag = SDL_WINDOW_FULLSCREEN;
            }

            SDL_SetWindowFullscreen( window, flag );

        } //fullscreen

        void WindowSDL2::bordered(bool enable) {

            if(closed) {
                return;
            }

            SDL_SetWindowBordered( window, enable ? SDL_TRUE : SDL_FALSE );

        } //bordered

    //Cursor related

        void WindowSDL2::grab(bool enable) {

            if(closed) {
                return;
            }

            SDL_SetWindowGrab( window, enable ? SDL_TRUE : SDL_FALSE);

        } //grab

        void WindowSDL2::set_cursor_position(int x, int y) {

            if(closed) {
                return;
            }

            SDL_WarpMouseInWindow( window, x, y);

        } //set_cursor_position


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

                        alloc_field( _object, id_x, alloc_int(event.window.data1) );
                        alloc_field( _object, id_y, alloc_int(event.window.data2) );

                        break;

                    }

                } //switch event.type

            return _object;

        } //sdl2_window_event_to_hx

        void handle_event( SDL_Event &event ) {

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
            snow::window::dispatch_event( new_event );

        } //handle_event

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


    //system helpers

        void system_lock_cursor(bool enable) {

            SDL_SetRelativeMouseMode( enable ? SDL_TRUE : SDL_FALSE );

        } //system_lock_cursor

        void system_show_cursor(bool show) {

            SDL_ShowCursor( show ? SDL_TRUE : SDL_FALSE );

        } //system_show_cursor

        int system_enable_vsync(bool enable) {

            return SDL_GL_SetSwapInterval( enable ? SDL_TRUE : SDL_FALSE );

        } //system_enable_vsync


    //Helpers

        int init_sdl() {

            if(sdl_inited) {
                return 0;
            }

            sdl_inited = true;

            return SDL_InitSubSystem(SDL_INIT_VIDEO);

        } //init_sdl



    } //window namespace

} //snow namespace