#include "snow_core.h"
#include "snow_io.h"

#include <string>

#include <windows.h>
#include <shlobj.h>


namespace snow {

    namespace io {

            //forward
        std::string open_select_file(int type, const std::string &title);

        std::string dialog_open(const std::string &title) {

            return open_select_file(0, title);

        } //dialog_open

        std::string dialog_save(const std::string &title) {

            return open_select_file(1, title);

        } //dialog_save

        std::string dialog_folder(const std::string &title) {

            /*char path[MAX_PATH];

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
            */
            char path[MAX_PATH];
            LPWSTR wpath = NULL;

            IFileDialog *pfd;
            if (SUCCEEDED(CoCreateInstance(CLSID_FileOpenDialog, NULL, CLSCTX_INPROC_SERVER, IID_PPV_ARGS(&pfd))))
            {
                DWORD dwOptions;
                if (SUCCEEDED(pfd->GetOptions(&dwOptions)))
                {
                    pfd->SetOptions(dwOptions | FOS_PICKFOLDERS);
                }
                if (SUCCEEDED(pfd->Show(NULL)))
                {
                    IShellItem *psi;
                    if (SUCCEEDED(pfd->GetResult(&psi)))
                    {
                        if(!SUCCEEDED(psi->GetDisplayName(SIGDN_DESKTOPABSOLUTEPARSING, &wpath)))
                        {
                            MessageBox(NULL, "GetIDListName() failed", NULL, NULL);
                        }
                        psi->Release();
                    }
                }
                pfd->Release();
            }

            wcstombs((char*)&path, (wchar_t*)wpath, MAX_PATH );
            CoTaskMemFree(wpath);

            return std::string(path);

        } //dialog_folder

            //common helper
                //type 0 == file open
                //type 1 == file save
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


    } //io namespace

} //snow namespace