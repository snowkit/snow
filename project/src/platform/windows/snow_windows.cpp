#ifdef HX_WINDOWS


#include "snow_core.h"
#include "snow_platform.h"

#include <string>

#include <windows.h>
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

    namespace platform {
            
        std::string open_select_file(int type, const std::string &title) {

            OPENFILENAME ofn;
            char path[MAX_PATH] = "";

            ZeroMemory(&ofn, sizeof(ofn));

            ofn.lStructSize = sizeof(ofn);

            ofn.lpstrFile = path;
            ofn.lpstrTitle = title.c_str();
            ofn.nMaxFile = MAX_PATH;
            ofn.Flags = 0;
           
                //:todo:
            // ofn.lpstrDefExt = "*";
            ofn.lpstrFilter = "All Files (*.*)\0*.*\0";

            if(type == 0) {
                
                ofn.Flags |= OFN_HIDEREADONLY;
                ofn.Flags |= OFN_FILEMUSTEXIST;

                if(GetOpenFileName(&ofn)) {
                    return std::string( ofn.lpstrFile ); 
                }

            } else if(type == 1) {

                ofn.Flags |= OFN_OVERWRITEPROMPT;

                if(GetSaveFileName(&ofn)) {
                    return std::string( ofn.lpstrFile ); 
                }

            }

            return std::string();

        } //open_select_file

        std::string dialog_folder(const std::string &title) {
            
            char path[MAX_PATH];
            
            BROWSEINFO bi = { 0 };
                bi.lpszTitle = title.c_str();

            LPITEMIDLIST path_id_list = SHBrowseForFolder( &bi );

            if ( path_id_list ) {

                SHGetPathFromIDList ( path_id_list, path );

                IMalloc * imalloc = 0;
                if ( SUCCEEDED( SHGetMalloc( &imalloc )) ) {
                    imalloc->Free( path_id_list );
                    imalloc->Release();
                }

                return std::string(path);
            }

            return std::string();

        } //dialog_folder

        std::string dialog_open(const std::string &title) {
            
            return open_select_file(0, title);

        } //dialog_open

        std::string dialog_save(const std::string &title) {
            
            return open_select_file(1, title);

        } //dialog_save
    }

} //snow namespace


#endif //HX_WINDOWS
