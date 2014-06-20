#ifndef LUMEN_OPENAL_H
#define LUMEN_OPENAL_H

    #if defined(HX_MACOS) || defined(IPHONE)
        #include <OpenAL/al.h>
        #include <OpenAL/alc.h>
    #else
        #include "AL/al.h"
        #include "AL/alc.h"
    #endif


#endif //LUMEN_OPENAL_H