#ifndef STATIC_LINK
#define IMPLEMENT_API
#endif

#if defined(HX_WINDOWS) || defined(HX_MACOS) || defined(HX_LINUX)
// Include neko glue....
#define NEKO_COMPATIBLE
#endif

#include <hx/CFFI.h>

#ifdef ANDROID
#include <android/log.h>
#endif

#include "./hx_bindings.h"

namespace lumen {

    static int global_lumen_init = false;

    extern "C" void lumen_entry_point() {

        if (global_lumen_init){
            return;
        }

       global_lumen_init = true;

       lumen_init_ids();

    } //lumen_entry_point

    DEFINE_ENTRY_POINT(lumen_entry_point)

        //c++ callback
    typedef void (*create_window_callback)(void);
        //haxe callback
    AutoGCRoot *create_window_on_complete = 0;


    struct lumen_window_config {

        const char* title;

        bool resizable;
        bool fullscreen;
        bool borderless;
        bool depth_buffer;
        bool stencil_buffer;
        bool multitouch;

        int antialiasing;
        int fps;
        int width;
        int height;

    }; //lumen_window_config


        //actual code
    void create_window( create_window_callback _on_complete, const lumen_window_config &config ) {
        
        // int err = InitSDL();
        
        // if (err == -1) {
        //     fprintf(stderr,"Could not initialize SDL : %s\n", SDL_GetError());
        //     inOnFrame(0);
        // }

        printf("/ lumen / creating window : %s\n", config.title );

        _on_complete();

    }

    void window_created() {
        
        val_call0( create_window_on_complete->get() );
        delete create_window_on_complete;

    }

    value lumen_create_window( value _on_complete, value _in_config ) {

            //fetch the callback for when it's done opening the window
        create_window_on_complete = new AutoGCRoot( _on_complete );

                //the default window config
            lumen_window_config config;

                config.title            = "lumen";

                config.resizable        = true;
                config.fullscreen       = false;
                config.borderless       = false;
                config.depth_buffer     = false;
                config.stencil_buffer   = false;
                config.antialiasing     = 0;
                config.fps              = 60;
                config.width            = 960;
                config.height           = 640;

                //create temp id's for the config flags

            int id_title                = val_id("title");
            int id_fullscreen           = val_id("fullscreen");
            int id_resizable            = val_id("resizable");
            int id_borderless           = val_id("borderless");
            int id_antialiasing         = val_id("antialiasing");
            int id_depth_buffer         = val_id("depth_buffer");
            int id_stencil_buffer       = val_id("stencil_buffer");
            int id_vsync                = val_id("vsync");
            int id_fps                  = val_id("fps");

                //read them from the given config, if config is not null

            if( !val_is_null(_in_config) ) {

                config.title                  = property_string( _in_config, id_title, config.title );

                config.fullscreen             = property_bool( _in_config, id_fullscreen, config.fullscreen );
                config.resizable              = property_bool( _in_config, id_resizable, config.resizable );
                config.borderless             = property_bool( _in_config, id_borderless, config.borderless );
                config.depth_buffer           = property_bool( _in_config, id_depth_buffer, config.depth_buffer );
                config.stencil_buffer         = property_bool( _in_config, id_stencil_buffer, config.stencil_buffer );

                config.antialiasing           = property_int( _in_config, id_antialiasing, config.antialiasing );
                config.fps                    = property_int( _in_config, id_fps, config.fps );
                config.width                  = property_int( _in_config, id_width, config.width );
                config.height                 = property_int( _in_config, id_height, config.height );

            } // _in_config != null
            
                //create the actual window
            create_window( window_created, config );

        return alloc_null();
    
    } DEFINE_PRIM(lumen_create_window, 2);


        // Reference this to bring in all 
        //the symbols for the static library
    #ifdef STATIC_LINK
        // extern "C" int nme_oglexport_register_prims();
    #endif //STATIC_LINK

    extern "C" int lumen_register_prims() {

       lumen_entry_point();
       
       return 0;

    } //lumen_register_prims

} //namespace lumen