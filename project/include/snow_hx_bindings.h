#ifndef _SNOW_HX_BINDINGS_H_
#define _SNOW_HX_BINDINGS_H_

#include <hx/CFFI.h>
#include "common/Object.h"

#include <string>
#include <vector>

namespace snow {


        //externs
    extern vkind global_snow_object_kind;
    extern AutoGCRoot *system_event_handler;

        //id's
    extern int id_id;
    extern int id_type;
    extern int id_event;
    extern int id_x;
    extern int id_y;
    extern int id_width;
    extern int id_height;
    extern int id_text;
    extern int id_length;
    extern int id_data;
    extern int id_bytes;
    extern int id_handle;
    extern int id_complete;

        //window related

    extern int id_window;
    extern int id_window_id;
    extern int id_timestamp;
    extern int id_data1;
    extern int id_data2;

        //io related

    extern int id_path;
    extern int id_filewatch;
    extern int id_extension;
    extern int id_desc;

        //display related

    extern int id_refresh_rate;

        //input related

    extern int id_input;
    extern int id_start;
    extern int id_state;
    extern int id_repeat;
    extern int id_mod;
    extern int id_keysym;
    extern int id_sym;
    extern int id_scancode;
    extern int id_which;
    extern int id_xrel;
    extern int id_yrel;
    extern int id_button;
    extern int id_dx;
    extern int id_dy;
    extern int id_finger_id;
    extern int id_touch_id;
    extern int id_pressure;
    extern int id_axis;
    extern int id_value;
    extern int id_ball;
    extern int id_hat;

        //image related

    extern int id_bpp;
    extern int id_bpp_source;

        //audio related

    extern int id_format;
    extern int id_length_pcm;
    extern int id_channels;
    extern int id_rate;
    extern int id_bitrate;
    extern int id_bits_per_sample;
    extern int id_bitrate_upper;
    extern int id_bitrate_nominal;
    extern int id_bitrate_lower;
    extern int id_bitrate_window;

        //window config

    extern int id_title;
    extern int id_fullscreen;
    extern int id_resizable;
    extern int id_borderless;
    extern int id_antialiasing;
    extern int id_red_bits;
    extern int id_green_bits;
    extern int id_blue_bits;
    extern int id_alpha_bits;
    extern int id_depth_bits;
    extern int id_stencil_bits;

    inline void snow_init_ids() {

            //global

        kind_share( &global_snow_object_kind, "snow::Object");

            //more common flags

        id_id                   = val_id("id");
        id_type                 = val_id("type");
        id_event                = val_id("event");
        id_x                    = val_id("x");
        id_y                    = val_id("y");
        id_width                = val_id("width");
        id_height               = val_id("height");
        id_text                 = val_id("text");
        id_length               = val_id("length");
        id_data                 = val_id("data");
        id_bytes                = val_id("bytes");
        id_handle               = val_id("handle");
        id_complete             = val_id("complete");

            //window related flags

        id_window               = val_id("window");
        id_window_id            = val_id("window_id");
        id_timestamp            = val_id("timestamp");
        id_data1                = val_id("data1");
        id_data2                = val_id("data2");

            //io related flags

        id_path                 = val_id("path");
        id_filewatch            = val_id("filewatch");
        id_extension            = val_id("extension");
        id_desc                 = val_id("desc");

            //display related flags

        id_refresh_rate         = val_id("refresh_rate");

            //input related flags

        id_input                = val_id("input");
        id_start                = val_id("start");
        id_state                = val_id("state");
        id_repeat               = val_id("repeat");
        id_mod                  = val_id("mod");
        id_keysym               = val_id("keysym");
        id_sym                  = val_id("sym");
        id_scancode             = val_id("scancode");
        id_which                = val_id("which");
        id_xrel                 = val_id("xrel");
        id_yrel                 = val_id("yrel");
        id_button               = val_id("button");
        id_dx                   = val_id("dx");
        id_dy                   = val_id("dy");
        id_finger_id            = val_id("finger_id");
        id_touch_id             = val_id("touch_id");
        id_pressure             = val_id("pressure");
        id_axis                 = val_id("axis");
        id_value                = val_id("value");
        id_ball                 = val_id("ball");
        id_hat                  = val_id("hat");

            //image related

        id_bpp                  = val_id("bpp");
        id_bpp_source           = val_id("bpp_source");

            //audio related

        id_format               = val_id("format");
        id_length_pcm           = val_id("length_pcm");
        id_channels             = val_id("channels");
        id_rate                 = val_id("rate");
        id_bitrate              = val_id("bitrate");
        id_bits_per_sample      = val_id("bits_per_sample");
        id_bitrate_upper        = val_id("bitrate_upper");
        id_bitrate_nominal      = val_id("bitrate_nominal");
        id_bitrate_lower        = val_id("bitrate_lower");
        id_bitrate_window       = val_id("bitrate_window");

            //window config related

        id_title                = val_id("title");
        id_fullscreen           = val_id("fullscreen");
        id_resizable            = val_id("resizable");
        id_borderless           = val_id("borderless");
        id_antialiasing         = val_id("antialiasing");
        id_red_bits             = val_id("red_bits");
        id_green_bits           = val_id("green_bits");
        id_blue_bits            = val_id("blue_bits");
        id_alpha_bits           = val_id("alpha_bits");
        id_depth_bits           = val_id("depth_bits");
        id_stencil_bits         = val_id("stencil_bits");

    } //snow_init_ids

    inline value Object_to_hx( Object *object ) {

       struct releaser {

            static void release_object(value _in_object) {

                if( val_is_kind(_in_object, global_snow_object_kind) ) {

                    Object *obj = (Object *)val_to_kind( _in_object, global_snow_object_kind );

                    if(obj) {
                        obj->drop();
                    }

                } //if is global_snow_object_kind

            } //release_object

       }; //releaser

            //increase references
        object->grab();

            //create the haxe abstract for returning
        value result = alloc_abstract( global_snow_object_kind, object );
            //tell the gc to collect this object from the releaser struct callback
        val_gc( result, releaser::release_object );

        return result;

    } //Object_to_hx


    template<typename T> bool Object_from_hx( value _in_object, T *&_out_object) {

        _out_object = 0;

                //check if it's the right kind of object first
            if ( !val_is_kind( _in_object, global_snow_object_kind) ) {
                return false;
            }

                //fetch the wrapped Object
           Object *object = (Object *)val_to_kind(_in_object,global_snow_object_kind);
                //cast to the type given and set the out reference
            _out_object = dynamic_cast<T*>( object );

        return _out_object != NULL;

    } //Object_from_hx

// array conversion tools

    inline std::vector<std::string> array_string(value _array) {

        if(val_is_null(_array)) {
            return std::vector<std::string>();
        }

        std::vector<std::string> list;
        int count = val_array_size(_array);

        for(int i = 0; i < count; ++i) {
            value _item = val_array_i(_array, i);

            list.push_back( std::string(val_string(_item)) );
        }

        return list;

    } //array_string

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

    inline const value property_value(value _object, int _val_id) {

        return val_field(_object,_val_id);

    } //property_value


//// property conversion tools



} //snow namespace

#endif //_SNOW_HX_BINDINGS_H_