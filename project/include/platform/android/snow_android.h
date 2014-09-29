/*
    Copyright Sven Bergström 2014
    created for snow https://github.com/underscorediscovery/snow
    MIT license
*/

#ifndef _SNOW_ANDROID_H_
#define _SNOW_ANDROID_H_

#include <jni.h>
#include <pthread.h>
#include <android/log.h>
#include <hx/CFFI.h>


namespace snow {

    namespace core {

        JNIEnv *GetEnv();

    } //core namespace

} //snow namespace

#endif //_SNOW_ANDROID_H_