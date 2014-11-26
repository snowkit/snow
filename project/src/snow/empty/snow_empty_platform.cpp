/*
    Copyright Sven Bergström 2014
    created for snow https://github.com/underscorediscovery/snow
    MIT license
*/

//WIP
//This is an empty implementation of the snow core functions.
// possibly work in progress
//When porting to a new platform,
//      > make a new folder in src/<impl>/<platform>/
//      > implement the required functions as needed

#ifdef SNOW_USE_EMPTY_PLATFORM

#include "snow_core.h"
#include "snow_window.h"
#include "snow_io.h"
#include <stdarg.h>
#include <stdio.h>
#include <hx/CFFI.h>

namespace snow {

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

        int init_aux() { return 0; }
        int update_aux() { return 0; }
        int shutdown_aux() { return 0; }

    } //core namespace

    namespace input {
        void snow_gamepad_open(const int id) {}
        void snow_gamepad_close(const int id) {}
        void snow_text_start() {}
        void snow_text_stop() {}
        void snow_text_rect( const int x, const int y, const int w, const int h ) {}
    }

    namespace window {

        Window*         create_window( const render_config &_render_config, const window_config &config, AutoGCRoot* on_created ) { return NULL; }
        int             system_enable_vsync(const bool enable) { return 0; }
        void            system_show_cursor(const bool show) {}
        void            system_lock_cursor(const bool enable) {}
        int             desktop_get_display_count() { return 0; }
        int             desktop_get_display_mode_count(int display) { return 0; }
        value           desktop_get_display_native_mode(int display) { return alloc_null(); }
        value           desktop_get_display_current_mode(int display) { return alloc_null(); }
        value           desktop_get_display_mode(int display, int mode_index) { return alloc_null(); }
        value           desktop_get_display_bounds(int display) { return alloc_null(); }
        const char*     desktop_get_display_name(int display) { return ""; }

    } //window

    namespace io {

        iosrc* iosrc_fromfile(const char *file, const char *mode) {
            return fopen(file, mode);
        } //iofromfile

        iosrc* iosrc_frommem(void *mem, int size) {
            return NULL;
        } //iofrommem

        iosrc* iosrc_fromconstmem(const void *mem, int size) {
            return NULL;
        } //iofromconstmem

        iosrc* iosrc_fromfp(FILE * fp, bool autoclose) {
            return fp;
        } //iofromfp


        size_t read(iosrc* src, void* dest, size_t size, size_t maxnum) {
            return fread(dest, size, maxnum, src);
        } //ioread

        size_t write(iosrc* src, const void* data, size_t size, size_t num) {
            return fwrite(data, size, num, src);
        } //iowrite

        size_t seek(iosrc* src, long int offset, int whence) {
            return fseek(src, offset, whence);
        } //ioseek

        long int tell(iosrc* src) {
            return ftell(src);
        } //iotell

        long int close(iosrc* src) {
            return fclose(src);
        } //ioclose

    }

} //snow namespace

#endif //SNOW_USE_EMPTY_PLATFORM