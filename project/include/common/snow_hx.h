#ifndef _SNOW_HX_H_
#define _SNOW_HX_H_

/**
    Convert a pointer to haxe and back
    Copyright Sven Bergström 2014
    Created for snow https://github.com/underscorediscovery/snow
    License MIT

    usage :
        to haxe (store as Float on haxe side) :

            Thing* thing = new Thing();
            value thing_value = to_hx<Thing>( thing );
            return thing_value;

        from haxe again :

            Thing* thing = from_hx<Thing>( thing_value ;)
            if( thing ) {
                //use thing
            }

    :todo:
        use std::u_intptr_t from cstdint rather,
           but seems even with flags forced for HXCPP_CPP11
           i'm not seeing it found in builds on mac latest etc
*/

#include <stdint.h>

namespace snow {

    template <class T>
    T* from_hx( value _hx_value ) {
        return (T*) (uintptr_t) val_float( _hx_value );
    }

    template <class T>
    value to_hx( T* _instance ) {
        return alloc_float( (uintptr_t) _instance );
    }

} //snow namespace

#endif //_SNOW_HX_H_
