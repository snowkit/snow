#ifndef _SNOW_IO_H_
#define _SNOW_IO_H_

#include <stdio.h>
#include <string>
#include <vector>

#ifdef SNOW_USE_SDL
    #include "SDL.h"
#endif //SNOW_USE_SDL

#include "common/ByteArray.h"
#include "snow_core.h"

namespace snow {

    namespace io {

//file watching

        struct FileWatchEvent;
        void dispatch_event( const FileWatchEvent &event );

            //plausible file watch events
        enum FileWatchEventType {

            fe_unknown                      = 0,

            fe_modify                       = 1,
            fe_remove                       = 2,
            fe_create                       = 3

        }; //FileWatchEventType

        struct FileWatchEvent {

            public:
                FileWatchEventType type;
                double timestamp;
                std::string path;

            FileWatchEvent( FileWatchEventType _type = fe_unknown, double _timestamp = 0.0, const std::string &_path = std::string() )
                : type(_type), timestamp(_timestamp), path(_path)
                    { }

        }; //FileWatchEvent

            //filled in by platform specific handlers
        bool init_filewatch();
        void shutdown_filewatch();
        void refresh_filewatch();

            //common filewatch handling
        extern std::vector<std::string> watched_paths;

        inline void add_watch(const std::string &path) {

                //store in the list of watched paths
            watched_paths.push_back( std::string(path) );
                //then reset the watch system to include the new path
            snow::io::refresh_filewatch();

        } //add_watch

        inline bool remove_watch(const std::string &path) {

                //find the path in the list
            std::vector<std::string>::iterator found = std::find(watched_paths.begin(), watched_paths.end(), path);
                //if it's found
            if(found != watched_paths.end()) {
                    //remove the found instance in the path
                watched_paths.erase( found );
                    //then reset the watch system to remove the path
                snow::io::refresh_filewatch();

                return true;

            } // found

            return false;

        } //remove_watch

    //Helper dispatch io events through the core event handler

        inline static void event_handler( const FileWatchEvent &event ) {

            value _event = alloc_empty_object();

                alloc_field( _event, id_type,       alloc_int( event.type ) );
                alloc_field( _event, id_timestamp,  alloc_float( event.timestamp ) );
                alloc_field( _event, id_path,       alloc_string( event.path.c_str() ) );

            value _system_event = alloc_empty_object();

                    //event type is always se_input event
                alloc_field( _system_event, id_type, alloc_int( core::se_filewatch ) );
                    //store the .filewatch value
                alloc_field( _system_event, id_filewatch, _event );

                //finally, call the handler
            val_call1( system_event_handler->get(), _system_event );

        } //io event_handler

        inline void dispatch_event( const FileWatchEvent &event ) {

            snow::io::event_handler( event );

        } //dispatch_event

//file handling

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