#ifndef _SNOW_OPENAL_H_
#define _SNOW_OPENAL_H_

    #if defined(HX_MACOS) || defined(IPHONE)
        #include <OpenAL/al.h>
        #include <OpenAL/alc.h>
    #else
        #include "AL/al.h"
        #include "AL/alc.h"
    #endif


#endif //_SNOW_OPENAL_H_