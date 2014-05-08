#ifdef ANDROID


#include <jni.h>
#include <android/log.h>
#include <android/asset_manager.h>
#include <android/asset_manager_jni.h>

#include <map>
#include <string>

#include "common/ByteArray.h"
#include "platform/android/lumen_android.h"

#include "libs/sdl/SDL.h"

#define LOG(...) ((void)__android_log_print(ANDROID_LOG_ERROR, "/ lumen /", __VA_ARGS__))

int SDL_main(int argc, char *argv[]) {
  LOG("/ lumen / SDL MAIN OH NO");
  return 0;
}

namespace lumen {


    std::map<std::string, jclass> jClassCache;

    AAssetManager* androidAssetManager = 0;
    jclass androidAssetManagerRef = 0;

    void init_core_platform() {

      jClassCache = std::map<std::string, jclass>();

    } //init_core_platform

    void shutdown_core_platform() {

    } //shutdown_core_platform

    void update_core_platform() {

    } //update_core_platform

    AAsset *AndroidGetAsset(const char *inResource) {

        if (!androidAssetManager) {

            JNIEnv *env = GetEnv();

            jclass cls = FindClass("org/libsdl/app/SDLActivity");

            jmethodID mid = env->GetStaticMethodID(cls, "getAssetManager", "()Landroid/content/res/AssetManager;");

            if (mid == 0) {
                return 0;
            }

            jobject assetManager = (jobject)env->CallStaticObjectMethod(cls, mid);

            if (assetManager==0) {
                LOG("Could not find assetManager for asset %s", inResource);
                return 0;
            }

            androidAssetManager = AAssetManager_fromJava(env, assetManager);
            if (androidAssetManager==0) {
                LOG("Could not create assetManager for asset %s", inResource);
                return 0;
            }

            androidAssetManagerRef = (jclass)env->NewGlobalRef(assetManager);
            env->DeleteLocalRef(assetManager);
        }

        return AAssetManager_open(androidAssetManager, inResource, AASSET_MODE_UNKNOWN);

    } //AndroidGetAsset

    ByteArray AndroidGetAssetBytes(const char *inResource) {

       AAsset *asset = AndroidGetAsset(inResource);

       if (asset) {
          long size = AAsset_getLength(asset);
          ByteArray result(size);
          AAsset_read(asset, result.Bytes(), size);
          AAsset_close(asset);
          return result;
       }

       return 0;

       /*JNIEnv *env = GetEnv();

       jclass cls = FindClass("lumen/GameActivity");
       jmethodID mid = env->GetStaticMethodID(cls, "getResource", "(Ljava/lang/String;)[B");
       if (mid == 0)
          return 0;

       jstring str = env->NewStringUTF( inResource );
       jbyteArray bytes = (jbyteArray)env->CallStaticObjectMethod(cls, mid, str);
       env->DeleteLocalRef(str);
       if (bytes==0)
       {
          return 0;
       }

       jint len = env->GetArrayLength(bytes);
       ByteArray result(len);
       env->GetByteArrayRegion(bytes, (jint)0, (jint)len, (jbyte*)result.Bytes());
       return result;*/
    }

    FileInfo AndroidGetAssetFD(const char *inResource) {

        FileInfo info;
        info.fd = 0;
        info.offset = 0;
        info.length = 0;

        AAsset *asset = AndroidGetAsset(inResource);

        if( asset ) {
            info.fd = AAsset_openFileDescriptor(asset, &info.offset, &info.length);
            if (info.fd <= 0) {
                LOG("Bad asset : %s", inResource);
            }
            AAsset_close(asset);
        } //if(asset)

       return info;
    }


    JNIEnv *GetEnv() {

        return (JNIEnv*)SDL_AndroidGetJNIEnv();

    } //JNIEnv

    jclass FindClass(const char *className,bool inQuiet) {

        std::string cppClassName(className);
        jclass ret;

        if(jClassCache[cppClassName]!=NULL) {

            ret = jClassCache[cppClassName];

        } else {

            JNIEnv *env = GetEnv();
            jclass tmp = env->FindClass(className);

            if (!tmp) {
                if (inQuiet) {
                    jthrowable exc = env->ExceptionOccurred();
                    if (exc) {
                        env->ExceptionClear();
                    }
                } else {
                    CheckException(env);
                }

                return 0;
            }

            ret = (jclass)env->NewGlobalRef(tmp);
            jClassCache[cppClassName] = ret;
            env->DeleteLocalRef(tmp);
        }

        return ret;

    } //findClass

    void CheckException(JNIEnv *env, bool inThrow) {

        jthrowable exc = env->ExceptionOccurred();
        if (exc) {
            env->ExceptionDescribe();
            env->ExceptionClear();

            if (inThrow) {
                val_throw(alloc_string("JNI Exception"));
            }
        }

    } //CheckException

} //namespace lumen

#endif
