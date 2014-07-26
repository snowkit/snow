#ifdef IPHONE


#include "snow_core.h"
#include "snow_io.h"

#include <string>
#include <vector>

#import <UIKit/UIKit.h>

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

            NSString *str = [[NSString alloc] initWithUTF8String:url.c_str()];
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
            [str release];

        } //url_open

            //not supported
        std::vector<std::string> watched_paths;
        bool init_filewatch(){ return false; }
        void shutdown_filewatch(){}
        void update_filewatch(){}
        void refresh_filewatch(){}
        std::string dialog_folder(const std::string &title){}
        std::string dialog_open(const std::string &title){}
        std::string dialog_save(const std::string &title){}

    } //io namespace

} //namespace snow


#endif //IPHONE
