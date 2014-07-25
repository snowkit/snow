#ifdef IPHONE


#include "snow_core.h"
#include "snow_platform.h"

#include <string>
#include <vector>

namespace snow {

        //not supported
    namespace io {
        std::vector<std::string> watched_paths;
        bool init_filewatch(){ return false; }
        void shutdown_filewatch(){}
        void update_filewatch(){}
        void refresh_filewatch(){}
    }

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


#endif //IPHONE
