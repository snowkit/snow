
#include "snow_core.h"
#include "snow_platform.h"
#include "snow_io.h"


#include <string>
#include <vector>

namespace snow {

    namespace io {

        std::vector<std::string> watched_paths;

        bool init_filewatch() {

            snow::log("/ snow / initialized file watch ok");

            return true;

        } //init_filewatch

        void refresh_filewatch() {

        } //refresh_filewatch

        void update_filewatch() {

        } //update_filewatch

        void shutdown_filewatch() {


        } //shutdown_filewatch

    } //io namespace

} //snow namespace

