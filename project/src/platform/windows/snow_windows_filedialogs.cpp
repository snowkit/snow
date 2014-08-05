#include "snow_core.h"
#include "snow_io.h"

#include <string>

#include <windows.h>
#include <shlobj.h>


namespace snow {

    namespace io {

            //forward
        std::string open_select_file(int type, const std::string &title, const std::vector<file_filter> &filters);

        std::string dialog_open(const std::string &title, const std::vector<file_filter> &filters) {

            return open_select_file(0, title, filters);

        } //dialog_open

        std::string dialog_save(const std::string &title, const std::vector<file_filter> &filters) {

            return open_select_file(1, title, filters);

        } //dialog_save

        std::string lpw_to_stdstring(const LPWSTR str, UINT page = CP_ACP) {
            
            std::string result; char* cstr = 0; 
            int len;

            len = WideCharToMultiByte(page, 0, str, -1, 0,  0, 0, 0);
            if (len > 0) {
                cstr = new char[len];
                int res = WideCharToMultiByte(page, 0, str, -1, cstr, len, 0, 0);
                if (res != 0) {
                    cstr[len-1] = 0;
                    result = std::string(cstr);
                }
                delete [] cstr;
            }
            
            return result;

        } //lpw_to_stdstring

        std::string dialog_folder(const std::string &title) {

            std::string path;
            
            HRESULT hr = CoInitializeEx(NULL, COINIT_APARTMENTTHREADED | COINIT_DISABLE_OLE1DDE);

            if(SUCCEEDED(hr)) {

                IFileDialog *folder_dialog;

                hr = CoCreateInstance(CLSID_FileOpenDialog, NULL, CLSCTX_ALL, IID_IFileOpenDialog, reinterpret_cast<void**>(&folder_dialog));

                if(SUCCEEDED(hr)) {

                    DWORD folder_options;
                    if (SUCCEEDED(folder_dialog->GetOptions(&folder_options))) {
                        folder_dialog->SetOptions(folder_options | FOS_PICKFOLDERS);
                    }

                    hr = folder_dialog->Show(NULL);

                    if(SUCCEEDED(hr)) {

                        IShellItem *_item;
                        hr = folder_dialog->GetResult(&_item);

                        if(SUCCEEDED(hr)) {
                            
                            LPWSTR selected_path = NULL;
                            hr = _item->GetDisplayName(SIGDN_DESKTOPABSOLUTEPARSING, &selected_path);

                            if(SUCCEEDED(hr)) {
                                path = lpw_to_stdstring(selected_path);
                                CoTaskMemFree(selected_path);
                            }

                            _item->Release();

                        } //get result

                    } //show

                    folder_dialog->Release();

                } //create folder dialog

                CoUninitialize();

            } //coinitialize

            return path;

        } //dialog_folder

            //common helper
                //type 0 == file open
                //type 1 == file save
        std::string open_select_file(int type, const std::string &title, const std::vector<file_filter> &filters) {

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
            if(filters.size()) {

                std::vector<file_filter>::const_iterator it = filters.begin();
                std::string final = "";
                for( ; it != filters.end(); ++it) {

                    file_filter filter = (*it);

                        final += filter.desc + " (*." + filter.extension + ")";
                        final.push_back('\0');
                        final += "*." + filter.extension;
                        final.push_back('\0');

                } //each filter

                    //implicit extra \0 here from c_str
                ofn.lpstrFilter = final.c_str();

            } else {
                ofn.lpstrFilter = "All Files (*.*)\0*.*\0";    
            }
            

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


    } //io namespace

} //snow namespace