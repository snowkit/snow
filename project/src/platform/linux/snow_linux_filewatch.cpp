
#include "snow_core.h"
#include "snow_platform.h"
#include "snow_io.h"


#include <sys/inotify.h>
#include <string>

// remove  IN_DELETE
// create  IN_CREATE
// modify  IN_MODIFY

namespace snow {

    namespace io {

        std::vector<std::string> watched_paths;

        static int inotifyfd = -1;

        bool init_filewatch() {

            #ifndef SNOW_NO_INOTIFY

                inotifyfd = inotify_init1( IN_NONBLOCK );

                if(inotifyfd < 0) {

                    std::string reason;

                    switch(inotifyfd) {
                        case EINVAL: {
                            reason = "An invalid value was specified in flags";
                            break;
                        }

                        case EMFILE: {
                            reason = "The user limit on the total number of inotify instances has been reached.";
                            break;
                        }

                        case ENFILE: {
                            reason = "The system limit on the total number of file descriptors has been reached.";
                            break;
                        }

                        case ENOMEM: {
                            reason = "Insufficient kernel memory is available.";
                            break;
                        }
                    }

                    snow::log("/ snow / could not initialize inotify file watch : %s\n", reason.c_str());

                    return false;

                }

            #endif //SNOW_NO_INOTIFY

            snow::log("/ snow / initialized file watch ok");

            return true;

        } //init_filewatch

        void refresh_filewatch() {

        } //refresh_filewatch

        void shutdown_filewatch() {

            #ifndef SNOW_NO_INOTIFY

                if(inotifyfd > -1) {
                    close( inotifyfd );
                }

            #endif //SNOW_NO_INOTIFY

        } //shutdown_filewatch

    } //io namespace

} //snow namespace

