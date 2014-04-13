#ifndef LUMEN_LUMEN_WINDOW_H
#define LUMEN_LUMEN_WINDOW_H

#include <hx/CFFI.h>

#include "hx_bindings.h"

namespace lumen {

        //window configuration 
    struct window_config {

        const char* title;

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

    }; //window_config


        //window class
    class LumenWindow {
        public:
            virtual window_config create( window_config config ) = 0;
        private:
    };

        //from c++ -> haxe
    value window_config_to_hx( const window_config &config );
        //from haxe -> c++
    window_config window_config_from_hx( value _in_config );


        //c++ callback type
    typedef void (*create_window_callback)(window_config);
        //haxe callback object
    static AutoGCRoot *create_window_on_complete = 0;

//Handler : create_window

        //will attempt to create a window with the specified configuration,
        //any failed configuration will result in the config being updated, 
        //and when complete the configuration will be passed back to the on_complete listener
        //implemented in the per window manager files (like lumen_window_sdl2)
    window_config create_window( create_window_callback _on_complete, window_config config );

    inline void window_created( window_config config ) {
        
        val_call1( create_window_on_complete->get(), window_config_to_hx(config) );
        delete create_window_on_complete;

    } //window_created

//Helper : window config to/from

    inline value window_config_to_hx( const window_config &config ) {

        value _object = alloc_empty_object();

            alloc_field( _object, id_title, alloc_string(config.title) );

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

            config.title            = "lumen";

            config.fullscreen       = false;
            config.resizable        = true;
            config.vsync            = false;
            config.borderless       = false;
            config.depth_buffer     = false;
            config.stencil_buffer   = false;
            config.antialiasing     = 0;
            config.fps              = 60;
            config.width            = 960;
            config.height           = 640;

            //read them from the given config, if config is not null

        if( !val_is_null(_in_config) ) {

            config.title                  = property_string( _in_config, id_title, config.title );

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