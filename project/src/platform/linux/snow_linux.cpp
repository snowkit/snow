#ifdef HX_LINUX


#include "snow_core.h"

#include <string>

#ifndef SNOW_NO_GTK
    #include <gtk/gtk.h>
#endif //SNOW_NO_GTK

namespace snow {

    namespace core {

        void init_platform() {

            #ifndef SNOW_NO_GTK
                gtk_init(NULL, NULL);
            #endif //SNOW_NO_GTK

        } //init_core_platform

        void shutdown_platform() {

        } //shutdown_core_platform

        void update_platform() {

        } //update_core_platform

        void on_system_event_platform( const SystemEventType event ) {

        } //on_system_event_platform


    } //core namespace

    namespace io {

        void url_open(const std::string &url) {

            std::string cmd = "xdg-open " + url;
            popen(cmd.c_str(), "r")

        } //url_open

    } //io namespace

} //snow namespace


#endif //HX_LINUX
