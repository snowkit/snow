#ifndef LUMEN_HX_BINDINGS_H
#define LUMEN_HX_BINDINGS_H

#include <hx/CFFI.h>

namespace lumen {

    static int id_width;
    static int id_height;
    static int id_title;
    static int id_fullscreen;
    static int id_resizable;
    static int id_borderless;
    static int id_antialiasing;
    static int id_depth_buffer;
    static int id_stencil_buffer;
    static int id_vsync;
    static int id_fps;

    inline void lumen_init_ids() {

            //more common flags

        id_width                = val_id("width");
        id_height               = val_id("height");

            //window config flags

        id_title                = val_id("title");
        id_fullscreen           = val_id("fullscreen");
        id_resizable            = val_id("resizable");
        id_borderless           = val_id("borderless");
        id_antialiasing         = val_id("antialiasing");
        id_depth_buffer         = val_id("depth_buffer");
        id_stencil_buffer       = val_id("stencil_buffer");
        id_vsync                = val_id("vsync");
        id_fps                  = val_id("fps");

    } //lumen_init_ids


// property conversion tools


    inline bool property_bool(value _object, int _val_id, bool _default) {

       value field = val_field(_object,_val_id);

            //handle null/non-existant properties
        if( val_is_null(field) ) {
            return _default;
        } 

       return val_bool( field );

    } //property_bool

    inline int property_int(value _object, int _val_id, int _default) {

       value field = val_field(_object,_val_id);

            //handle null/non-existant properties
        if( val_is_null(field) ) {
            return _default;
        } 

       return (int)val_number( field );

    } //property_int

    inline const char* property_string(value _object, int _val_id, const char* _default) {

       value field = val_field(_object,_val_id);

            //handle null/non-existant properties
        if( val_is_null(field) ) {
            return _default;
        } 

       return val_string( field );

    } //property_string


//// property conversion tools



} //namespace lumen

#endif //LUMEN_HX_BINDINGS_H