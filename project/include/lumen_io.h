#ifndef LUMEN_LUMEN_IO_H
#define LUMEN_LUMEN_IO_H

#include <stdio.h>

#ifdef LUMEN_USE_SDL
    #include "libs/sdl/SDL.h"
#endif //LUMEN_USE_SDL

#include "common/ByteArray.h"

namespace lumen {

    #ifdef LUMEN_USE_SDL

        #define lumen_iosrc SDL_RWops

        #define lumen_seek_set RW_SEEK_SET
        #define lumen_seek_cur RW_SEEK_CUR
        #define lumen_seek_end RW_SEEK_END

    #else

        #define lumen_iosrc FILE

        #define lumen_seek_set SEEK_SET
        #define lumen_seek_cur SEEK_CUR
        #define lumen_seek_end SEEK_END

    #endif //LUMEN_USE_SDL

    lumen_iosrc* iosrc_fromfile(const char *file, const char *mode);
    lumen_iosrc* iosrc_frommem(void *mem, int size);
    lumen_iosrc* iosrc_fromconstmem(const void *mem, int size);
    lumen_iosrc* iosrc_fromfp(FILE * fp, bool autoclose);

    size_t   ioread(lumen_iosrc* src, void* ptr, size_t size, size_t maxnum);
    size_t   iowrite(lumen_iosrc* src, const void* ptr, size_t size, size_t num);
    size_t   ioseek(lumen_iosrc* src, long int offset, int whence);
    long int iotell(lumen_iosrc* src);
    long int ioclose(lumen_iosrc* src);

    #ifdef ANDROID

        struct AndroidFileInfo {
            int fd;
            off_t offset;
            off_t length;
        };

        ByteArray AndroidGetAssetBytes(const char *);
        AndroidFileInfo AndroidGetAssetFD(const char *);

   #endif //ANDROID

} //namespace lumen

#endif //LUMEN_LUMEN_IO_H