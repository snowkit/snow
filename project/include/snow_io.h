/*
    Copyright Sven Bergström 2014
    created for snow https://github.com/underscorediscovery/snow
    MIT license
*/

#ifndef _SNOW_IO_H_
#define _SNOW_IO_H_

#include <stdio.h>
#include <string>
#include <vector>
#include <algorithm> //std::find


#ifdef SNOW_USE_SDL
    #include "SDL.h"
#endif //SNOW_USE_SDL

#include "snow_core.h"
#include "snow_hx_bindings.h"

namespace snow {

    namespace io {

//url helper

        void url_open(const std::string &url);

//file dialogs

        struct file_filter;

        std::string dialog_folder(const std::string &title);
        std::string dialog_open(const std::string &title, const std::vector<file_filter> &filters);
        std::string dialog_save(const std::string &title, const std::vector<file_filter> &filters);

//file watching

        struct FileEvent;
        void dispatch_event( const FileEvent &event );

            //plausible file watch events
        enum FileEventType {

            fe_unknown                      = 0,

            fe_modify                       = 1,
            fe_remove                       = 2,
            fe_create                       = 3,
            fe_drop                         = 4

        }; //FileEventType


            //a description of a filter for file dialogs, or other use
        struct file_filter {

            std::string extension;
            std::string desc;

        }; //file_filter

        struct FileEvent {

            public:
                FileEventType type;
                double timestamp;
                std::string path;

            FileEvent( FileEventType _type = fe_unknown, double _timestamp = 0.0, const std::string &_path = std::string() )
                : type(_type), timestamp(_timestamp), path(_path)
                    { }

        }; //FileEvent

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

        inline static void event_handler( const FileEvent &event ) {

            value _event = alloc_empty_object();

                alloc_field( _event, id_type,       alloc_int( event.type ) );
                alloc_field( _event, id_timestamp,  alloc_float( event.timestamp ) );
                alloc_field( _event, id_path,       alloc_string( event.path.c_str() ) );

            value _system_event = alloc_empty_object();

                    //event type is always se_input event
                alloc_field( _system_event, id_type, alloc_int( core::se_file ) );
                    //store the .filewatch value
                alloc_field( _system_event, id_file, _event );

                //finally, call the handler
            val_call1( system_event_handler->get(), _system_event );

        } //io event_handler

        inline void dispatch_event( const FileEvent &event ) {

            snow::io::event_handler( event );

        } //dispatch_event

        inline std::vector<snow::io::file_filter> file_filter_list_from_hx(value _list) {

            if(val_is_null(_list)) {
                return std::vector<snow::io::file_filter>();
            }

            std::vector<snow::io::file_filter> result;
            int count = val_array_size(_list);

            for(int i = 0; i < count; ++i) {

                value _item = val_array_i(_list, i);

                //_item is now an object with .extension and .desc

                snow::io::file_filter filter;

                    filter.extension = std::string(property_string(_item, id_extension, "*"));
                    filter.desc = std::string(property_string(_item, id_desc, ""));

                result.push_back(filter);

            } //each item

            return result;

        } //file_filter_list_from_hx

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


        iosrc* iosrc_from_file(const char *file, const char *mode);
        iosrc* iosrc_from_mem(void *mem, int size);
        iosrc* iosrc_from_const_mem(const void *mem, int size);
        iosrc* iosrc_from_fp(FILE * fp, bool autoclose);


        size_t   read(iosrc* src, void* dest, size_t size, size_t maxnum);
        size_t   write(iosrc* dest, const void* data, size_t size, size_t num);
        size_t   seek(iosrc* src, long int offset, int whence);
        long int tell(iosrc* src);
        long int close(iosrc* src);


        class iosrc_file {

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
