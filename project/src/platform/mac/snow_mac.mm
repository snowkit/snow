#ifdef HX_MACOS


#include "snow_core.h"
#include "snow_platform.h"

#include <string>

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

    namespace platform {

            //:todo:
        std::string dialog_folder(const std::string &title) {
            return std::string("");
        }

        std::string dialog_open(const std::string &title) {
            return std::string("");
        }

        std::string dialog_save(const std::string &title) {
            return std::string("");
        }

    }

} //namespace snow


#endif //HX_MACOS
