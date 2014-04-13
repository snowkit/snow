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

#include "hx_bindings.h"
#include "lumen_window.h"

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

    value lumen_create_window( value _on_complete, value _in_config ) {

            //fetch the callback for when it's done opening the window
        create_window_on_complete = new AutoGCRoot( _on_complete );
            
            //create the actual window
        create_window( window_created, window_config_from_hx(_in_config) );

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