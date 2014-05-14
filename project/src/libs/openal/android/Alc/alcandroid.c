#ifdef __ANDROID__
#include <jni.h>
#include "alMain.h"
#include "apportable_openal_funcs.h"
#include <android/log.h>

#define LOG_TAG "OpenAL_SLES"
#define LOGV(...) __android_log_print(ANDROID_LOG_ERROR, LOG_TAG, __VA_ARGS__)

static JavaVM *javaVM = NULL;
JavaVM *alcGetJavaVM(void) {
	return javaVM;
}

	//when called as a shared lib, this is automatic
	//but when embedding it that will be an error
#ifdef LUMEN_LIB_OPENAL_ANDROID_SHARED

	JNIEXPORT jint JNICALL JNI_OnLoad(JavaVM *vm, void *reserved) {
		alcandroid_OnLoad(vm);
		return JNI_VERSION_1_4;
	}

	JNIEXPORT void JNICALL JNI_OnUnload (JavaVM *vm, void *reserved) {
		alcandroid_OnUnload(vm);
	}

#endif //LUMEN_LIB_OPENAL_ANDROID_SHARED


void alcandroid_OnLoad( JavaVM *vm ) {
	BackendFuncs func_list;
	if (apportableOpenALFuncs.alc_android_set_java_vm) {
		apportableOpenALFuncs.alc_android_set_java_vm(vm);
	}
	javaVM = vm;
}

void alcandroid_OnUnload( JavaVM *vm ) {
	if (apportableOpenALFuncs.alc_android_set_java_vm) {
		apportableOpenALFuncs.alc_android_set_java_vm(NULL);
	}
}

void alcandroid_Suspend() {
	LOGV("openal suspend");
	if (apportableOpenALFuncs.alc_android_suspend) {
		apportableOpenALFuncs.alc_android_suspend();
	}
}

void alcandroid_Resume() {
	LOGV("openal resume");
	if (apportableOpenALFuncs.alc_android_resume) {
		apportableOpenALFuncs.alc_android_resume();
	}
}

#endif
