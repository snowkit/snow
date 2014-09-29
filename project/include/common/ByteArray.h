/*
    Copyright Sven Bergström 2014
    Portions adapted from https://github.com/haxenme/nme/
    created for snow https://github.com/underscorediscovery/snow
    MIT license
*/

#ifndef _SNOW_BYTE_ARRAY_H_
#define _SNOW_BYTE_ARRAY_H_

#include "common/QuickVec.h"

#include <stdio.h>

namespace snow {

    typedef unsigned char uint8;

        //this was //HX_WINDOWS,
        //but we aren't using _wfopen by
        //default anymore right now
    #if 0

        typedef wchar_t OSChar;
        #define val_os_string val_wstring

    #else

        typedef char OSChar;
        #define val_os_string val_string

    #endif

    // If you put this structure on the stack, then you do not have to worry about GC.
    // If you store this in a heap structure, then you will need to use GC roots for mValue...
    struct ByteArray {

        ByteArray(int inSize);
        ByteArray(const ByteArray &inRHS);
        ByteArray();
        ByteArray(struct _value *Value);
        ByteArray(const QuickVec<unsigned char>  &inValue);

        void                    Resize(int inSize);
        int                     Size() const;
        unsigned char*          Bytes();
        const unsigned char*    Bytes() const;
        bool                    Ok() { return mValue!=0; }

        struct _value *mValue;

        static ByteArray        FromFile(const OSChar *inFilename);
        static int              ToFile(const OSChar *inFilename, const ByteArray array);

   }; //ByteArray

} //snow namespace


#endif //_SNOW_BYTE_ARRAY_H_
