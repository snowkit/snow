#ifndef LUMEN_LUMEN_WINDOW_H
#define LUMEN_LUMEN_WINDOW_H
    
#include <string>

#include <hx/CFFI.h>
#include "common/Object.h"
#include "hx_bindings.h"
#include "lumen_core.h"

namespace lumen {

        //forward
    class LumenWindow;
    struct window_config;
    struct WindowEvent;

    value window_config_to_hx( const window_config &config );
    window_config window_config_from_hx( value _in_config );

    void dispatch_window_event( const WindowEvent &event );

        //This function is called by hx_bindings, and should attempt
        // to create a window with the specified configuration,
        // any failed configuration will result in the config being updated, 
        // and when complete the configuration will be passed back to the on_complete listener.
    LumenWindow* create_window( const window_config &config, AutoGCRoot* on_created );


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
        int x;
        int y;
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
            x                = 0;
            y                = 0;
            width            = 960;
            height           = 640;

        } //window_config

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
            x = other.x;
            y = other.y;
            width = other.width;
            height = other.height;

        } //window_config( const window_config &other )

    }; //window_config

        //plausible window events
    enum WindowEventType {

        we_unknown          = 0,
        we_shown            = 1,
        we_hidden           = 2,
        we_exposed          = 3,
        we_moved            = 4,
        we_resized          = 5,
        we_size_changed     = 6,
        we_minimized        = 7,
        we_maximized        = 8,
        we_restored         = 9,
        we_enter            = 10,
        we_leave            = 11,
        we_focus_gained     = 12,
        we_focus_lost       = 13,
        we_close            = 14

    }; //WindowEventType

        //an event that is dispatched from a window
    struct WindowEvent {

        public:
            WindowEventType type;
            int window_id;
            int timestamp;
            int data1;
            int data2;

        WindowEvent( WindowEventType _type = we_unknown, int _window_id = 1, int _timestamp = 0, int _data1 = 0, int _data2 = 0 ) 
            : type(_type), window_id(_window_id), timestamp(_timestamp), data1(_data1), data2(_data2)
                {}

    };

        //Base window class, inheriting from Object in hx_bindings so 
        //that it can be wrapped in a haxe abstract and passed to hx.
        //Window managers inherit from this, like SDL2.

    class LumenWindow : public Object {

        public:

                //members
            int id;
            bool created;
            float r;
            window_config config;
            AutoGCRoot* created_handler;

            LumenWindow() {
                id = -1;
                created = false;
                created_handler = NULL;                
            }

            ~LumenWindow() {
                delete created_handler;
            }

                //functions
            virtual void create( const window_config &_config, AutoGCRoot* _on_created ) = 0;
            virtual void simple_message( const char* message, const char* title ) = 0;
            virtual void update() = 0;
            virtual void render() = 0;
            virtual void swap() = 0;

        protected:            

            void on_created() {

                created = true;                

                if(created_handler != NULL) {

                    value _v_window = Object_to_hx( this );
                    value _v_config = window_config_to_hx( config );
                    value _v_id = alloc_int(id);

                    val_call3( created_handler->get(), _v_window, _v_id, _v_config);

                } //if created_handler

            } //_on_created

        private:

    };

//Helper dispatch window events through the core event handler, since window events are agnostic and come from main SDL loop

    inline static void window_event_handler( const WindowEvent &event ) {

        value _window_event = alloc_empty_object();

            alloc_field( _window_event, id_type, alloc_int( event.type ) );
            alloc_field( _window_event, id_window_id, alloc_int( event.window_id ) );
            alloc_field( _window_event, id_timestamp, alloc_int( event.timestamp ) );
            alloc_field( _window_event, id_data1, alloc_int( event.data1 ) );
            alloc_field( _window_event, id_data2, alloc_int( event.data2 ) );

        value _system_event = alloc_empty_object();

                //event type is always se_window event
            alloc_field( _system_event, id_type, alloc_int( se_window ) );
                //store the .window value
            alloc_field( _system_event, id_window, _window_event );
            
            //finally, call the handler
        val_call1( system_event_handler->get(), _system_event );

    } //core_event_handler

    inline void dispatch_window_event( const WindowEvent &event ) {

        window_event_handler( event );

    } //dispatch_window_event


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
            config.vsync                    = property_bool( _in_config, id_vsync, config.vsync );
            config.borderless               = property_bool( _in_config, id_borderless, config.borderless );
            config.depth_buffer             = property_bool( _in_config, id_depth_buffer, config.depth_buffer );
            config.stencil_buffer           = property_bool( _in_config, id_stencil_buffer, config.stencil_buffer );

            config.antialiasing             = property_int( _in_config, id_antialiasing, config.antialiasing );
            config.fps                      = property_int( _in_config, id_fps, config.fps );
            config.x                        = property_int( _in_config, id_x, config.x );
            config.y                        = property_int( _in_config, id_y, config.y );
            config.width                    = property_int( _in_config, id_width, config.width );
            config.height                   = property_int( _in_config, id_height, config.height );

        } // _in_config != null

        return config;

    } //window_config_from_hx

} //namespace lumen

#endif //LUMEN_LUMEN_WINDOW_H
