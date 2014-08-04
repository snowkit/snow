#include "snow_core.h"
#include "snow_io.h"

#include <string>

#import <Cocoa/Cocoa.h>

namespace snow {

    namespace io {

            //forward
        std::string open_select_path( int type, const std::string &title, const std::vector<file_filter> &filters );


        std::string dialog_folder(const std::string &title) {

                //dummy filter list, not used by folders
            std::vector<file_filter> filters;

            return open_select_path(1, title, filters);

        } //dialog_folder

        std::string dialog_open(const std::string &title, const std::vector<file_filter> &filters) {

            return open_select_path(0, title, filters);

        } //dialog_open

        std::string dialog_save(const std::string &title, const std::vector<file_filter> &filters) {

            NSSavePanel *panel = [NSSavePanel savePanel];

            [panel setCanCreateDirectories:YES];
            [panel setAllowsOtherFileTypes:YES];
            [panel setExtensionHidden:YES];

                    //only if there are any filters, add them
                if(filters.size()) {

                    NSMutableArray *type_list = [[NSMutableArray alloc] init];

                        std::vector<file_filter>::const_iterator it = filters.begin();

                            for( ; it != filters.end(); ++it ) {

                                [type_list addObject:[NSString stringWithUTF8String:(*it).extension.c_str()]];

                            } //each filter

                        [panel setAllowedFileTypes:type_list];

                    [type_list release];

                } //filters.size

            [panel setTitle: [NSString stringWithUTF8String:title.c_str()] ];

            NSInteger clicked = [panel runModal];

            if (clicked == NSOKButton) {

                NSString *chosen = [[panel URL] path];

                    std::string result = std::string( [chosen UTF8String] );

                [chosen release];

                return result;

            } //OK

            return std::string();

        } //dialog_save

            //common helper,
                //type 0 = open file
                //type 1 = open folder
        std::string open_select_path( int type, const std::string &title, const std::vector<file_filter> &filters ) {

            NSOpenPanel * panel = [NSOpenPanel openPanel];

            [panel setAllowsMultipleSelection:NO];
            [panel setFloatingPanel:YES];

            if(type == 0) {
                [panel setCanChooseDirectories:NO];
                [panel setCanChooseFiles:YES];

                    //only if there are any filters, add them
                if(filters.size()) {

                    NSMutableArray *type_list = [[NSMutableArray alloc] init];

                        std::vector<file_filter>::const_iterator it = filters.begin();

                            for( ; it != filters.end(); ++it ) {

                                [type_list addObject:[NSString stringWithUTF8String:(*it).extension.c_str()]];

                            } //each filter

                        [panel setAllowedFileTypes:type_list];

                    [type_list release];

                } //filters.size

            } else if(type == 1) {
                [panel setCanChooseDirectories:YES];
                [panel setCanChooseFiles:NO];
            }

            [panel setTitle: [NSString stringWithUTF8String:title.c_str()] ];

            NSInteger clicked = [panel runModal];

            if(clicked == NSOKButton) {

                NSString *chosen = [[panel URL] path];

                    std::string result = std::string( [chosen UTF8String] );

                [chosen release];

                return result;

            } //OK

            return std::string();

        } //open_select_path


    } //io namespace

} //snow namespace