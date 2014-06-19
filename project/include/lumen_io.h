#ifndef LUMEN_LUMEN_IO_H
#define LUMEN_LUMEN_IO_H

#include <stdio.h>
#include <string>

#ifdef LUMEN_USE_SDL
    #include "SDL.h"
#endif //LUMEN_USE_SDL

#include "common/ByteArray.h"

namespace lumen {

    namespace io {


        #ifdef LUMEN_USE_SDL

            typedef SDL_RWops iosrc;

            #define lumen_seek_set RW_SEEK_SET
            #define lumen_seek_cur RW_SEEK_CUR
            #define lumen_seek_end RW_SEEK_END

        #else

            typedef FILE iosrc;

            #define lumen_seek_set SEEK_SET
            #define lumen_seek_cur SEEK_CUR
            #define lumen_seek_end SEEK_END

        #endif //LUMEN_USE_SDL


        iosrc* iosrc_fromfile(const char *file, const char *mode);
        iosrc* iosrc_frommem(void *mem, int size);
        iosrc* iosrc_fromconstmem(const void *mem, int size);
        iosrc* iosrc_fromfp(FILE * fp, bool autoclose);


        size_t   read(iosrc* src, void* dest, size_t size, size_t maxnum);
        size_t   write(iosrc* dest, const void* data, size_t size, size_t num);
        size_t   seek(iosrc* src, long int offset, int whence);
        long int tell(iosrc* src);
        long int close(iosrc* src);


        class iosrc_file : public lumen::Object {

            public:
                iosrc*              file_source;
                std::string         source_name;
                off_t               offset;
                off_t               length;

            iosrc_file() :
                offset(0), length(0)
                    { }
            //iosrc_file

            ~iosrc_file() {

                    //ensure the file is closed
                if(file_source) {
                    lumen::io::close( file_source );
                }

                file_source = NULL;

            } //~iosrc_file

        }; //iosrc_file


    } //io namespace

} //lumen namespace

#endif //LUMEN_LUMEN_IO_H