#ifdef ANDROID


#include <jni.h>
#include <android/log.h>

#include <map>
#include <string>
#include <vector>

#include "snow_core.h"
#include "common/ByteArray.h"
#include "platform/android/snow_android.h"
#include "snow_io.h"
#include "SDL.h"

#define LOG(...) ((void)__android_log_print(ANDROID_LOG_ERROR, "/ snow /", __VA_ARGS__))


static JavaVM* java_vm;

#ifdef SNOW_USE_OPENAL
    extern "C" {
        void alcandroid_OnLoad( JavaVM *vm );
        void alcandroid_OnUnload( JavaVM *vm );
        void alcandroid_Resume();
        void alcandroid_Suspend();
    }
#endif //SNOW_USE_OPENAL

  //This is called after SDL gets inited and passes
#ifdef SNOW_USE_SDL

    int SDL_main(int argc, char *argv[]) {
        LOG("/ snow / android post init SDL_main");
        return 0;
    }

#endif //SNOW_USE_SDL

namespace snow {


    namespace core {


        void init_platform() {

            snow::log("/ snow / android core platform init");

            JNIEnv *env = GetEnv();
            env->GetJavaVM( &java_vm );

            #ifdef SNOW_USE_OPENAL
                alcandroid_OnLoad( java_vm );
            #endif

        } //init_platform

        void shutdown_platform() {

            #ifdef SNOW_USE_OPENAL
                alcandroid_OnUnload( java_vm );
            #endif

        } //shutdown_platform

        void update_platform() {

        } //update_platform

        void on_system_event_platform( const SystemEventType event ) {

            switch( event ) {

                case se_app_didenterbackground: {
                    alcandroid_Suspend();
                    break;
                }

                case se_app_didenterforeground: {
                    alcandroid_Resume();
                    break;
                }

                default :{
                    return;
                }
            }

        } //on_system_event_platform

        JNIEnv *GetEnv() {

            return (JNIEnv*)SDL_AndroidGetJNIEnv();

        } //JNIEnv

    } //core namespace

    namespace io {

        void url_open(const std::string &url) {

            // :todo:

        } //url_open

            //:unsupported:
        std::vector<std::string> watched_paths;
        bool init_filewatch(){ return false; }
        void shutdown_filewatch(){}
        void update_filewatch(){}
        void refresh_filewatch(){}
        std::string dialog_folder(const std::string &title){}
        std::string dialog_open(const std::string &title){}
        std::string dialog_save(const std::string &title){}

    } //io namespace

} //snow namespace

#endif
