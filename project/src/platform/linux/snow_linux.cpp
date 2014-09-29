/*
    Copyright Sven Bergström 2014
    created for snow https://github.com/underscorediscovery/snow
    MIT license
*/

#ifdef HX_LINUX


#include "snow_core.h"

#include <string>

#ifndef SNOW_NO_GTK
    #include <gtk/gtk.h>
#endif //SNOW_NO_GTK

namespace snow {

    namespace core {

        void init_platform() {

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

                //run xdg-open, but forward stderr to stdout, and forward stdout to silent
            std::string cmd = "/usr/bin/xdg-open " + url + " 2>&1 1>/dev/null";
            FILE* res = popen(cmd.c_str(), "r");
                //to be safe/clean
            if(res) {
                fclose(res);
            }

        } //url_open

    } //io namespace

} //snow namespace


#endif //HX_LINUX
