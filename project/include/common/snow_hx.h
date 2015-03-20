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


#ifndef _SNOW_HX_H_
#define _SNOW_HX_H_

#include <stdint.h>
#include <string.h> //memcpy

namespace snow {

    //convert pointer from C++ to intptr and pass to haxe through Float
    //for ensuring bit storage space for the size of the value.

        template <class T>
        inline T* from_hx( value _hx_value ) {
            return (T*) (uintptr_t) val_float( _hx_value );
        }

        template <class T>
        inline value to_hx( T* _value ) {
            return alloc_float( (uintptr_t) _value );
        }

    //convert haxe.io.BytesData to and from unsigned char*

        inline const unsigned char* bytes_from_hx( value bytes ) {

            if (val_is_string(bytes)) {
                return (unsigned char *)val_string(bytes);
            }

            buffer buf = val_to_buffer(bytes);

                //null is allowed for things like passing null
                //to GL or AL etc to allocate storages
            if (buf == 0) {
                return NULL;
            }

            return (unsigned char*)buffer_data(buf);

        } //const to_bytes

            //non-const read/write bytes
        inline unsigned char* bytes_from_hx_rw( value bytes ) {

            if (val_is_string(bytes)) {
                return (unsigned char *)val_string(bytes);
            }

            buffer buf = val_to_buffer(bytes);

            if (buf == 0) {
                val_throw(alloc_string("to_bytes_rw, invalid byte data! since it's rw version, this is likely to explode on returning NULL"));
            }

            return (unsigned char*)buffer_data(buf);

        } //non-const to_bytes_rw


            //take note that the from_bytes function copies the memory into a newly allocated
            //haxe byte Array before returning the value to it! clean up your original if you don't need it

        inline value bytes_to_hx( const unsigned char* bytes, int byteLength ) {

            buffer buf = alloc_buffer_len(byteLength);
            char* dest = buffer_data(buf);
            memcpy(dest, bytes, byteLength);

            return buffer_val(buf);

        } //bytes_to_hx with const unsigned char*

        inline value bytes_to_hx( unsigned char* bytes, int byteLength ) {

            buffer buf = alloc_buffer_len(byteLength);
            char* dest = buffer_data(buf);
            memcpy(dest, bytes, byteLength);

            return buffer_val(buf);


        }  //bytes_to_hx with unsigned char*

} //snow namespace

#endif //_SNOW_HX_H_
