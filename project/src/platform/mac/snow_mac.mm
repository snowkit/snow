#ifdef HX_MACOS


#include "snow_core.h"
#include "snow_platform.h"

#include <string>

    //file dialogs
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

    namespace platform {

            //common helper,
                //type 0 = open file
                //type 1 = open folder
        std::string open_select_path( int type, const std::string &title ) {

            NSOpenPanel * panel = [NSOpenPanel openPanel];

            [panel setAllowsMultipleSelection:NO];
            [panel setFloatingPanel:YES];

            if(type == 0) {
                [panel setCanChooseDirectories:NO];
                [panel setCanChooseFiles:YES];
            } else if(type == 1) {
                [panel setCanChooseDirectories:YES];
                [panel setCanChooseFiles:NO];
            }

            [panel setTitle: [NSString stringWithCString:title.c_str() encoding:[NSString defaultCStringEncoding]] ];

            // NSArray *fileTypes = [NSArray arrayWithObjects:@"ext1",@"ext2",nil];

            NSInteger clicked = [ panel runModalForDirectory:NSHomeDirectory() file:nil types:nil ];

            if(clicked == NSOKButton) {

                NSString *chosen = [[panel URL] path];

                    std::string result = std::string( [chosen UTF8String] );

                [chosen release];

                return result;

            } //OK

            return std::string();

        } //open_select_path

        std::string dialog_folder(const std::string &title) {

            return open_select_path(1, title);

        } //dialog_folder

        std::string dialog_open(const std::string &title) {

            return open_select_path(0, title);

        } //dialog_open

        std::string dialog_save(const std::string &title) {

            NSSavePanel *panel = [NSSavePanel savePanel];

            [panel setCanCreateDirectories:YES];
            [panel setAllowsOtherFileTypes:YES];
            [panel setExtensionHidden:YES];

            [panel setTitle: [NSString stringWithCString:title.c_str() encoding:[NSString defaultCStringEncoding]] ];

            NSInteger clicked = [panel runModal];

            if (clicked == NSOKButton) {

                NSString *chosen = [[panel URL] path];

                    std::string result = std::string( [chosen UTF8String] );

                [chosen release];

                return result;

            } //OK

            return std::string();

        } //dialog_save

    }

} //namespace snow


#endif //HX_MACOS
