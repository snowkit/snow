#ifndef _SNOW_WINDOW_H_
#define _SNOW_WINDOW_H_

#include <string>

#include <hx/CFFI.h>

#include "snow_hx_bindings.h"
#include "snow_core.h"
#include "common/snow_hx.h"

namespace snow {

    namespace window {

            //forward
        class Window;
        struct window_config;
        struct WindowEvent;


        int             system_enable_vsync(bool enable);
        void            system_lock_cursor(bool enable);
        void            system_show_cursor(bool show);

        int             desktop_get_display_count();
        int             desktop_get_display_mode_count(int display);
        value           desktop_get_display_native_mode(int display);
        value           desktop_get_display_current_mode(int display);
        value           desktop_get_display_mode(int display, int mode_index);
        value           desktop_get_display_bounds(int display);
        const char*     desktop_get_display_name(int display);

        value           window_config_to_hx( const window_config &config );
        window_config   window_config_from_hx( value _in_config );
        void            dispatch_event( const WindowEvent &event );
        Window*         create_window( const window_config &config, AutoGCRoot* on_created );

        struct display_mode {
            int width;
            int height;
            int refresh_rate;
            int format;
        };

        struct bounds_rect {
            int x;
            int y;
            int width;
            int height;
        };

            //window configuration
        struct window_config {

            std::string title;

            bool fullscreen;
            bool resizable;
            bool borderless;
            bool multitouch;

            int red_bits;
            int green_bits;
            int blue_bits;
            int alpha_bits;
            int depth_bits;
            int stencil_bits;
            int antialiasing;
            int x;
            int y;
            int width;
            int height;

            window_config() {

                title            = "snow";
                fullscreen       = false;
                resizable        = true;
                borderless       = false;
                red_bits         = 8;
                green_bits       = 8;
                blue_bits        = 8;
                alpha_bits       = 8;
                depth_bits       = 0;
                stencil_bits     = 0;
                antialiasing     = 0;
                x                = 0;
                y                = 0;
                width            = 960;
                height           = 640;

            } //window_config

            window_config( const window_config &other ) {

                title = std::string(other.title);
                fullscreen = other.fullscreen;
                resizable = other.resizable;
                borderless = other.borderless;
                red_bits = other.red_bits;
                green_bits = other.green_bits;
                blue_bits = other.blue_bits;
                alpha_bits = other.alpha_bits;
                depth_bits = other.depth_bits;
                stencil_bits = other.stencil_bits;
                antialiasing = other.antialiasing;
                x = other.x;
                y = other.y;
                width = other.width;
                height = other.height;

            } //window_config( const window_config &other )

        }; //window_config

            //plausible window events
        enum WindowEventType {

            we_unknown          = 0,

            we_created          = 1,

            we_shown            = 2,
            we_hidden           = 3,
            we_exposed          = 4,
            we_moved            = 5,
            we_resized          = 6,
            we_size_changed     = 7,
            we_minimized        = 8,
            we_maximized        = 9,
            we_restored         = 10,
            we_enter            = 11,
            we_leave            = 12,
            we_focus_gained     = 13,
            we_focus_lost       = 14,
            we_close            = 15,
            we_destroy          = 16

        }; //WindowEventType

            //an event that is dispatched from a window
        struct WindowEvent {

            public:
                WindowEventType type;
                int window_id;
                double timestamp;
                value event;

            WindowEvent( WindowEventType _type = we_unknown, int _window_id = 1, double _timestamp = 0.0 )
                : type(_type), window_id(_window_id), timestamp(_timestamp)
                    {}

        };

            //Base window class
            //Window managers inherit from this, like SDL2.

        class Window {

            public:

                    //members
                int id;
                bool created;
                bool closed;
                float r;
                window_config config;
                AutoGCRoot* created_handler;

                Window() {
                    id = -1;
                    created = false;
                    closed = true;
                    created_handler = NULL;
                }

                ~Window() {
                    delete created_handler;
                }

                    //functions
                virtual void create( const window_config &_config, AutoGCRoot* _on_created ) = 0;
                virtual void simple_message( const char* message, const char* title ) = 0;
                virtual void update() = 0;
                virtual void render() = 0;
                virtual void swap() = 0;
                virtual void close() = 0;
                virtual void show() = 0;
                virtual void destroy() = 0;

                virtual void set_size(int x, int y) = 0;
                virtual void set_position(int x, int y) = 0;
                virtual void set_title(const char* title) = 0;
                virtual void set_max_size(int x, int y) = 0;
                virtual void set_min_size(int x, int y) = 0;
                virtual void fullscreen(bool enable, int flags) = 0;
                virtual void bordered(bool enable) = 0;
                    //cursor related
                virtual void grab(bool enable) = 0;
                virtual void set_cursor_position(int x, int y) = 0;

            protected:

                void on_created( bool success ) {

                    created = success;
                        //if success, closed is false
                    closed = !success;

                    if(created_handler != NULL) {

                        value _v_window = alloc_null();
                        value _v_config = alloc_null();
                        value _v_id = alloc_int(id);

                        if(success) {
                            _v_window = snow::to_hx<snow::window::Window>( this );
                            _v_config = window_config_to_hx( config );
                        }

                        val_call3( created_handler->get(), _v_window, _v_id, _v_config);

                    } //if created_handler

                } //_on_created

            private:

        };

    //Helper dispatch window events through the core event handler, since window events are agnostic and come from main SDL loop

        inline static void event_handler( const WindowEvent &event ) {

            value _event = alloc_empty_object();

                alloc_field( _event, id_type, alloc_int( event.type ) );
                alloc_field( _event, id_window_id, alloc_int( event.window_id ) );
                alloc_field( _event, id_timestamp, alloc_float( event.timestamp ) );
                alloc_field( _event, id_event, event.event );

            value _system_event = alloc_empty_object();

                    //event type is always se_window event
                alloc_field( _system_event, id_type, alloc_int( core::se_window ) );
                    //store the .window value
                alloc_field( _system_event, id_window, _event );

                //finally, call the handler
            val_call1( system_event_handler->get(), _system_event );

        } //core_event_handler

        inline void dispatch_event( const WindowEvent &event ) {

            snow::window::event_handler( event );

        } //dispatch_event


    //Helper : window config to/from

        inline value window_config_to_hx( const window_config &config ) {

            value _object = alloc_empty_object();

                alloc_field( _object, id_title, alloc_string(config.title.c_str()) );

                alloc_field( _object, id_fullscreen, alloc_bool(config.fullscreen) );
                alloc_field( _object, id_resizable, alloc_bool(config.resizable) );
                alloc_field( _object, id_borderless, alloc_bool(config.borderless) );

                alloc_field( _object, id_red_bits, alloc_int(config.red_bits) );
                alloc_field( _object, id_green_bits, alloc_int(config.green_bits) );
                alloc_field( _object, id_blue_bits, alloc_int(config.blue_bits) );
                alloc_field( _object, id_alpha_bits, alloc_int(config.alpha_bits) );
                alloc_field( _object, id_depth_bits, alloc_int(config.depth_bits) );
                alloc_field( _object, id_stencil_bits, alloc_int(config.stencil_bits) );
                alloc_field( _object, id_antialiasing, alloc_int(config.antialiasing) );
                alloc_field( _object, id_x, alloc_int(config.x) );
                alloc_field( _object, id_y, alloc_int(config.y) );
                alloc_field( _object, id_width, alloc_int(config.width) );
                alloc_field( _object, id_height, alloc_int(config.height) );

            return _object;

        } //window_config_to_hx

        inline window_config window_config_from_hx( value _in_config ) {

            //the default window config
            window_config config;

                //read them from the given config, if config is not null

            if( !val_is_null(_in_config) ) {

                config.title                    = property_string( _in_config, id_title, config.title.c_str() );

                config.fullscreen               = property_bool( _in_config, id_fullscreen, config.fullscreen );
                config.resizable                = property_bool( _in_config, id_resizable, config.resizable );
                config.borderless               = property_bool( _in_config, id_borderless, config.borderless );

                config.red_bits                 = property_int( _in_config, id_red_bits, config.red_bits );
                config.green_bits               = property_int( _in_config, id_green_bits, config.green_bits );
                config.blue_bits                = property_int( _in_config, id_blue_bits, config.blue_bits );
                config.alpha_bits               = property_int( _in_config, id_alpha_bits, config.alpha_bits );
                config.depth_bits               = property_int( _in_config, id_depth_bits, config.depth_bits );
                config.stencil_bits             = property_int( _in_config, id_stencil_bits, config.stencil_bits );
                config.antialiasing             = property_int( _in_config, id_antialiasing, config.antialiasing );
                config.x                        = property_int( _in_config, id_x, config.x );
                config.y                        = property_int( _in_config, id_y, config.y );
                config.width                    = property_int( _in_config, id_width, config.width );
                config.height                   = property_int( _in_config, id_height, config.height );

            } // _in_config != null

            return config;

        } //window_config_from_hx


    } //window namespace

} //snow namespace

#endif //_SNOW_WINDOW_H_
