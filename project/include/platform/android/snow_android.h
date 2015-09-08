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
#include <SDL.h>


namespace snow {

    namespace android {

            //the global snow activity
        extern DECLSPEC jobject SDLCALL activity();
            //get the global JVM env
        extern DECLSPEC JNIEnv* SDLCALL env();

    } //android namespace

} //snow namespace

#endif //_SNOW_ANDROID_H_