
#include "snow_core.h"
#include "snow_io.h"

#include <string>

#ifndef SNOW_NO_GTK
    #include <gtk/gtk.h>
#endif //SNOW_NO_GTK

namespace snow {

    namespace io {

            static bool gtk_inited = false;

        #ifndef SNOW_NO_GTK

            std::string open_gtk_dialog(const GtkFileChooserAction &action, const std::string &title, const std::vector<file_filter> &filters) {

                if(!gtk_inited) {
                    gtk_init(NULL, NULL);
                    gtk_inited = true;
                }

                std::string result;

                GtkWidget *dialog;

                dialog = gtk_file_chooser_dialog_new(
                    title.c_str(),
                    NULL,       //parent window
                    action,
                    "Cancel", GTK_RESPONSE_CANCEL,
                    "Select", GTK_RESPONSE_ACCEPT,
                    NULL 
                );

                if(action != GTK_FILE_CHOOSER_ACTION_SELECT_FOLDER && filters.size() > 0) {

                        //loop through the given filters adding them
                    std::vector<file_filter>::const_iterator it = filters.begin();

                        for( ; it != filters.end(); ++it ) {

                            GtkFileFilter *a_filter = gtk_file_filter_new();

                                std::string _pattern("*." + (*it).extension);
                                std::string _desc((*it).desc + " (" + _pattern + ")");
                                gtk_file_filter_add_pattern(a_filter, _pattern.c_str());
                                gtk_file_filter_set_name(a_filter, _desc.c_str());

                                //add to the dialog
                            gtk_file_chooser_add_filter( GTK_FILE_CHOOSER( dialog ), a_filter );

                        } //each filter

               } //not folder select && has filters

                if( gtk_dialog_run( GTK_DIALOG(dialog) ) == GTK_RESPONSE_ACCEPT ) {
                    char *filename;
                    filename = gtk_file_chooser_get_filename( GTK_FILE_CHOOSER( dialog ) );
                    result = std::string( filename );
                    g_free( filename );
                }

                gtk_widget_destroy( dialog );

                    //poll until events are done
                while( gtk_events_pending() ) gtk_main_iteration();

                    //return the path or ""
                return result;

            } //open_gtk_dialog

        #endif //SNOW_NO_GTK

        std::string dialog_open(const std::string &title, const std::vector<file_filter> &filters) {
            #ifndef SNOW_NO_GTK
                return open_gtk_dialog(GTK_FILE_CHOOSER_ACTION_OPEN, title, filters);
            #else
                return std::string();
            #endif
        } //dialog_open

        std::string dialog_save(const std::string &title, const std::vector<file_filter> &filters) {
            #ifndef SNOW_NO_GTK
                return open_gtk_dialog(GTK_FILE_CHOOSER_ACTION_SAVE, title, filters);
            #else
                return std::string();
            #endif
        } //dialog_save

        std::string dialog_folder(const std::string &title) {

            #ifndef SNOW_NO_GTK
                std::vector<file_filter> filters;
                return open_gtk_dialog(GTK_FILE_CHOOSER_ACTION_SELECT_FOLDER, title, filters);
            #else
                return std::string();
            #endif
        } //dialog_folder

    } //io namespace

} //snow namespace
