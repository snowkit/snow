#ifdef HX_LINUX


#include "snow_core.h"
#include "snow_platform.h"

#include <string>

#include <gtk/gtk.h>

namespace snow {

    namespace core {


        void init_platform() {

            gtk_init(NULL, NULL);
            
        } //init_core_platform

        void shutdown_platform() {

        } //shutdown_core_platform

        void update_platform() {

        } //update_core_platform

        void on_system_event_platform( const SystemEventType event ) {

        } //on_system_event_platform


    } //core namespace

    namespace platform {

        #ifndef SNOW_NO_GTK

            std::string open_gtk_dialog(const GtkFileChooserAction &action, const std::string &title) {

                std::string result("");

                GtkWidget *dialog;
                gint res;

                dialog = gtk_file_chooser_dialog_new(
                    title.c_str(),
                    NULL,       //parent window
                    action,
                    "Cancel",
                    GTK_RESPONSE_CANCEL,
                    "Select",
                    GTK_RESPONSE_ACCEPT,
                    NULL
                );
                    
                    //:todo: Make these an array of consistent strings 
                    // and add a filter for each one in a loop
                if(action != GTK_FILE_CHOOSER_ACTION_SELECT_FOLDER) {
                        
                        //create a filter
                    GtkFileFilter *all_files_filter = gtk_file_filter_new();
                    gtk_file_filter_add_pattern(all_files_filter, "*");
                    gtk_file_filter_set_name(all_files_filter, "All files (*.*)");

                        //add to the dialog
                    gtk_file_chooser_add_filter( GTK_FILE_CHOOSER( dialog ), all_files_filter );

               } //not folder select

                res = gtk_dialog_run( GTK_DIALOG(dialog) );
                if( res == GTK_RESPONSE_ACCEPT ) {
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

        std::string dialog_open(const std::string &title) {
            #ifndef SNOW_NO_GTK
                return open_gtk_dialog(GTK_FILE_CHOOSER_ACTION_OPEN, title);
            #else
                return std::string("");
            #endif 
        } //dialog_open

        std::string dialog_save(const std::string &title) {
            #ifndef SNOW_NO_GTK
                return open_gtk_dialog(GTK_FILE_CHOOSER_ACTION_SAVE, title);
            #else
                return std::string("");
            #endif 
        } //dialog_save

        std::string dialog_folder(const std::string &title) {
            #ifndef SNOW_NO_GTK
                return open_gtk_dialog(GTK_FILE_CHOOSER_ACTION_SELECT_FOLDER, title);
            #else
                return std::string("");
            #endif 
        } //dialog_folder

    }

} //snow namespace


#endif //HX_LINUX
