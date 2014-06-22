#ifndef _SNOW_IO_H_
#define _SNOW_IO_H_

#include <stdio.h>
#include <string>

#ifdef SNOW_USE_SDL
    #include "SDL.h"
#endif //SNOW_USE_SDL

#include "common/ByteArray.h"

namespace snow {

    namespace io {


        #ifdef SNOW_USE_SDL

            typedef SDL_RWops iosrc;

            #define snow_seek_set RW_SEEK_SET
            #define snow_seek_cur RW_SEEK_CUR
            #define snow_seek_end RW_SEEK_END

        #else

            typedef FILE iosrc;

            #define snow_seek_set SEEK_SET
            #define snow_seek_cur SEEK_CUR
            #define snow_seek_end SEEK_END

        #endif //SNOW_USE_SDL


        iosrc* iosrc_fromfile(const char *file, const char *mode);
        iosrc* iosrc_frommem(void *mem, int size);
        iosrc* iosrc_fromconstmem(const void *mem, int size);
        iosrc* iosrc_fromfp(FILE * fp, bool autoclose);


        size_t   read(iosrc* src, void* dest, size_t size, size_t maxnum);
        size_t   write(iosrc* dest, const void* data, size_t size, size_t num);
        size_t   seek(iosrc* src, long int offset, int whence);
        long int tell(iosrc* src);
        long int close(iosrc* src);


        class iosrc_file : public snow::Object {

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
                    snow::io::close( file_source );
                }

                file_source = NULL;

            } //~iosrc_file

        }; //iosrc_file


    } //io namespace

} //snow namespace

#endif //_SNOW_IO_H_