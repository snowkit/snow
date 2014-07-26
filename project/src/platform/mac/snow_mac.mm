#ifdef HX_MACOS


#include "snow_core.h"

#include <string>

    //openUrl
#import <AppKit/NSWorkspace.h>
#import <Cocoa/Cocoa.h>


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
            [[NSWorkspace sharedWorkspace] openURL:[NSURL URLWithString:str]];
            [str release];

        } //url_open

    } //io

} //namespace snow


#endif //HX_MACOS
