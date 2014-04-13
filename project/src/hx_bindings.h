#ifndef LUMEN_HX_BINDINGS_H
#define LUMEN_HX_BINDINGS_H

#include <hx/CFFI.h>

namespace lumen {

    static int id_width;
    static int id_height;
    // static int id_fullscreen;

    void lumen_init_ids() {

        id_width = val_id("width");
        id_height = val_id("height");

    } //lumen_init_ids

    bool property_bool(value _object, int _val_id, bool _default) {

       value field = val_field(_object,_val_id);

            //handle null/non-existant properties
        if( val_is_null(field) ) {
            return _default;
        } 

       return val_bool( field );

    } //property_bool

    int property_int(value _object, int _val_id, int _default) {

       value field = val_field(_object,_val_id);

            //handle null/non-existant properties
        if( val_is_null(field) ) {
            return _default;
        } 

       return (int)val_number( field );

    } //property_int

    const char* property_string(value _object, int _val_id, const char* _default) {

       value field = val_field(_object,_val_id);

            //handle null/non-existant properties
        if( val_is_null(field) ) {
            return _default;
        } 

       return val_string( field );

    } //property_string

} //namespace lumen

#endif //LUMEN_HX_BINDINGS_H