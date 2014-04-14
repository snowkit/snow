#ifndef LUMEN_LUMEN_WINDOW_H
#define LUMEN_LUMEN_WINDOW_H
    
#include <string>

#include <hx/CFFI.h>
#include "hx_bindings.h"
#include "lumen_core.h"

namespace lumen {

        //forward
    class LumenWindow;
    struct window_config;    
    value window_config_to_hx( const window_config &config );
    window_config window_config_from_hx( value _in_config );

        //This function is called by hx_bindings, and should attempt
        // to create a window with the specified configuration,
        // any failed configuration will result in the config being updated, 
        // and when complete the configuration will be passed back to the on_complete listener.
        // events from the window should be forwarded to the on_event         
    LumenWindow* create_window( const window_config &config, AutoGCRoot* on_created, AutoGCRoot* on_event );


        //window configuration 
    struct window_config {

        std::string title;

        bool fullscreen;
        bool resizable;
        bool vsync;
        bool borderless;
        bool depth_buffer;
        bool stencil_buffer;
        bool multitouch;

        int antialiasing;
        int fps;
        int width;
        int height;

        window_config() {
            title            = "lumen";
            fullscreen       = false;
            resizable        = true;
            vsync            = false;
            borderless       = false;
            depth_buffer     = false;
            stencil_buffer   = false;
            antialiasing     = 0;
            fps              = 60;
            width            = 960;
            height           = 640;
        }

        window_config( const window_config &other ) {

            title = std::string(other.title);
            fullscreen = other.fullscreen;
            resizable = other.resizable;
            vsync = other.vsync;
            borderless = other.borderless;
            depth_buffer = other.depth_buffer;
            stencil_buffer = other.stencil_buffer;
            antialiasing = other.antialiasing;
            fps = other.fps;
            width = other.width;
            height = other.height;

        }

    }; //window_config

        //plausible window events
    enum WindowEventType {

        we_unknown          = 0,
        we_shown            = 1,
        we_hidden           = 2,
        we_exposed          = 3,
        we_moved            = 4,
        we_resized          = 5,
        we_minimized        = 6,
        we_maximized        = 7,
        we_restored         = 8,
        we_enter            = 9,
        we_leave            = 10,
        we_focus_gained     = 11,
        we_focus_lost       = 12,
        we_close            = 13

    }; //WindowEventType

        //an event that is dispatched from a window
    struct WindowEvent {

        public:
            WindowEventType type;

        WindowEvent( WindowEventType _type = we_unknown ) 
            : type(_type)
                {}

    };

        //Base window class, inheriting from Object in hx_bindings so 
        //that it can be wrapped in a haxe abstract and passed to hx.
        //Window managers inherit from this, like SDL2.

    inline void print_config( const window_config &config ) {

        printf("fs : %d, rs : %d, b : %d, aa : %d, s : %d, d : %d, v : %d, f : %d, w : %d, h : %d, t : %s  \n", 
            config.fullscreen, config.resizable, config.borderless, config.antialiasing, 
            config.stencil_buffer, config.depth_buffer, config.vsync, config.fps, 
            config.width, config.height, config.title.c_str());

    }

    class LumenWindow : public Object {

        public:

                //members
            int id;
            bool created;
            window_config config;
            AutoGCRoot* event_handler;
            AutoGCRoot* created_handler;

            LumenWindow() {
                id = -1;
                created = false;
                event_handler = NULL;
                created_handler = NULL;
            }

            ~LumenWindow() {
                delete event_handler;
                delete created_handler;
            }

                //functions
            virtual void create( const window_config &_config, AutoGCRoot* _on_created, AutoGCRoot* _on_event ) = 0;
            virtual void simple_message( const char* message, const char* title ) = 0;
            virtual void update() = 0;

        protected:            

            void on_created() {

                created = true;                

                print_config(config);

                if(created_handler != NULL) {

                    value _v_window = Object_to_hx( this );
                    value _v_config = window_config_to_hx( config );
                    value _v_id = alloc_int(id);

                    val_call3( created_handler->get(), _v_window, _v_id, _v_config);

                } //if created_handler

            } //_on_created

            void handle_event( lumen::WindowEvent &event ) {

                if(event_handler != NULL) {

                    value _event = alloc_empty_object();

                       alloc_field( _event, id_type, alloc_int(event.type) );

                    val_call1( event_handler->get(), _event );

                    //event.result = (EventResult)val_int( val_field(_event, id_result) );

                } //if event_handler != NULL

            } //handle_event

        private:

    };


//Helper : window config to/from

    inline value window_config_to_hx( const window_config &config ) {

        value _object = alloc_empty_object();

            alloc_field( _object, id_title, alloc_string(config.title.c_str()) );

            alloc_field( _object, id_fullscreen, alloc_bool(config.fullscreen) );
            alloc_field( _object, id_resizable, alloc_bool(config.resizable) );
            alloc_field( _object, id_vsync, alloc_bool(config.vsync) );
            alloc_field( _object, id_borderless, alloc_bool(config.borderless) );
            alloc_field( _object, id_depth_buffer, alloc_bool(config.depth_buffer) );
            alloc_field( _object, id_stencil_buffer, alloc_bool(config.stencil_buffer) );
            
            alloc_field( _object, id_antialiasing, alloc_int(config.antialiasing) );
            alloc_field( _object, id_fps, alloc_int(config.fps) );
            alloc_field( _object, id_width, alloc_int(config.width) );
            alloc_field( _object, id_height, alloc_int(config.height) );

        return _object;

    } //window_config_to_hx

    inline window_config window_config_from_hx( value _in_config ) {

        //the default window config
        window_config config;

            //read them from the given config, if config is not null

        if( !val_is_null(_in_config) ) {

            config.title                  = property_string( _in_config, id_title, config.title.c_str() );

            config.fullscreen             = property_bool( _in_config, id_fullscreen, config.fullscreen );
            config.resizable              = property_bool( _in_config, id_resizable, config.resizable );
            config.vsync                  = property_bool( _in_config, id_vsync, config.vsync );
            config.borderless             = property_bool( _in_config, id_borderless, config.borderless );
            config.depth_buffer           = property_bool( _in_config, id_depth_buffer, config.depth_buffer );
            config.stencil_buffer         = property_bool( _in_config, id_stencil_buffer, config.stencil_buffer );

            config.antialiasing           = property_int( _in_config, id_antialiasing, config.antialiasing );
            config.fps                    = property_int( _in_config, id_fps, config.fps );
            config.width                  = property_int( _in_config, id_width, config.width );
            config.height                 = property_int( _in_config, id_height, config.height );

        } // _in_config != null

        return config;

    } //window_config_from_hx

} //namespace lumen

#endif //LUMEN_LUMEN_WINDOW_H
