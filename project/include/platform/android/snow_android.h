#ifndef _SNOW_ANDROID_H_
#define _SNOW_ANDROID_H_

#include <jni.h>
#include <pthread.h>
#include <android/log.h>
#include <hx/CFFI.h>

#ifdef __GNUC__
    #define JAVA_EXPORT __attribute__ ((visibility("default"))) JNIEXPORT
#else
    #define JAVA_EXPORT JNIEXPORT
#endif

namespace snow {

    namespace core {

        JNIEnv *GetEnv();

    } //core namespace

} //snow namespace

#endif //_SNOW_ANDROID_H_