
//This is an empty implementation of the lumen core functions.
//When porting to a new platform,
//      > make a new folder in src/<impl>/<platform>/
//      > implement the required functions as needed

#ifdef LUMEN_USE_EMPTY_PLATFORM

#include "lumen_core.h"
#include <stdarg.h>

namespace lumen {

    void log(const char *fmt, ...) {

        va_list ap;

        va_start(ap, fmt);

        printf(fmt, ap);

        va_end(ap);

    } //log

    namespace core {

        const char* app_path() {

            return "./";

        } //app_path

        const char* pref_path(const char* org, const char* app) {

            return "./";

        } //pref_path

    } //core namespace
} //lumen namespace

#endif //LUMEN_USE_EMPTY_PLATFORM