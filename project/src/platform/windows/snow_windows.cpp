#ifdef HX_WINDOWS


#include "snow_core.h"
#include "snow_window.h"

#include <string>

#include <shlobj.h>

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

            ShellExecute(NULL, "open", url.c_str(), NULL, NULL, SW_SHOWNORMAL);

        } //url_open

    } //io namespace

} //snow namespace


#endif //HX_WINDOWS
