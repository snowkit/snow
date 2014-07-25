
#include "snow_core.h"
#include "snow_platform.h"
#include "snow_io.h"

#include <string>


#include <CoreServices/CoreServices.h>

// remove  kFSEventStreamEventFlagItemRemoved
// create  kFSEventStreamEventFlagItemCreated
// modify  kFSEventStreamEventFlagItemModified

namespace snow {

    extern double timestamp();

    namespace io {

        std::vector<std::string> watched_paths;

        static FSEventStreamRef watcher;
        static float latency = 1.0f;

        static void filewatch_callback(
            ConstFSEventStreamRef streamRef,
            void *clientCallBackInfo,
            size_t numEvents,
            void *eventPaths,
            const FSEventStreamEventFlags eventFlags[],
            const FSEventStreamEventId eventIds[]
        );

        bool init_filewatch() {

            snow::log("/ snow / initialized file watch ok");
            return true;

        } //init_filewatch


        void stop_filewatch() {

            if( watcher ) {
                FSEventStreamStop( watcher );
                FSEventStreamInvalidate( watcher );
                FSEventStreamRelease( watcher );
            }

            watcher = NULL;

        } //stop_filewatch

        void start_filewatch() {

                //don't attempt to start twice
            if(watcher) {
                snow::log("/ snow / cannot start filewatch twice, this is less than ideal");
                return;
            }

            if(watched_paths.size() == 0) {
                snow::log("/ snow / not starting filewatch, no paths in list");
                return;
            }


                //make a list that CFArray can use
            std::vector<CFStringRef> list;
            for(std::vector<std::string>::iterator it = watched_paths.begin(); it != watched_paths.end(); ++it) {
                list.push_back(CFStringCreateWithCString(NULL, (*it).c_str(), kCFStringEncodingUTF8));
            }

            CFArrayRef path_list = CFArrayCreate(NULL, (const void **)&list[0], list.size(), &kCFTypeArrayCallBacks);

            watcher = FSEventStreamCreate(NULL, &filewatch_callback, new FSEventStreamContext(), path_list, kFSEventStreamEventIdSinceNow, latency,
                kFSEventStreamEventFlagItemCreated  | //item created
                kFSEventStreamEventFlagItemRemoved  | //item removed (only through rm-like remove it seems)
                kFSEventStreamEventFlagItemRenamed  | //item renamed (also applies to move/move to trash)
                kFSEventStreamEventFlagItemModified | //item modified
                kFSEventStreamCreateFlagFileEvents    //listen for file change events, as well
            );

            if(!watcher) {
                snow::log("/ snow / filewatch failed to start");
                return;
            }

            FSEventStreamScheduleWithRunLoop( watcher, CFRunLoopGetCurrent(), kCFRunLoopDefaultMode );
            FSEventStreamStart( watcher );

            snow::log("/ snow / filewatch started");

        } //start_filewatch

            //updated by runloop, not here
        void update_filewatch() {}

        void refresh_filewatch() {

                //stop the current filewatch,
            stop_filewatch();
                //because we are replacing it
            start_filewatch();

        } //refresh_filewatch

        void shutdown_filewatch() {

            stop_filewatch();

        } //shutdown_filewatch

        static void filewatch_callback(
            ConstFSEventStreamRef streamRef,
            void *clientCallBackInfo,
            size_t numEvents,
            void *eventPaths,
            const FSEventStreamEventFlags eventFlags[],
            const FSEventStreamEventId eventIds[]
        ) {

            for(size_t i = 0; i < numEvents; ++i) {

                const char * path = ((char **) eventPaths)[i];

                FSEventStreamEventFlags flag = eventFlags[i];

                    //only listen for files
                if(flag & kFSEventStreamEventFlagItemIsFile) {

                    FileWatchEventType _event_type = fe_unknown;

                    if( flag & kFSEventStreamEventFlagItemModified ) {
                        // snow::log("/ snow /     filewatch modify on path %s", path);
                        _event_type = fe_modify;
                    } else if( (flag & kFSEventStreamEventFlagItemRemoved) || (flag & kFSEventStreamEventFlagItemRenamed) ) {
                        // snow::log("/ snow /     filewatch remove on path %s", path);
                        _event_type = fe_remove;
                    } else if( flag & kFSEventStreamEventFlagItemCreated ) {
                        // snow::log("/ snow /     filewatch create on path %s", path);
                        _event_type = fe_create;
                    } else {
                        // snow::log("/ snow / filewatch not watching event on path %s id %#010x", path, eventFlags[i]);
                    }

                    if(_event_type != fe_unknown) {
                        FileWatchEvent event( _event_type, snow::timestamp(), std::string(path) );
                        snow::io::dispatch_event( event );
                    }

                } else {

                        //verbose
                    // snow::log("/ snow / filewatch not watching event on path %s id %#010x", path, eventFlags[i]);

                }

            } //each event

        } //filewatch_callback

    } //io namespace

} //snow namespace

