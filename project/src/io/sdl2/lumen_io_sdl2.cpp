

#include "lumen_io.h"
#include "SDL.h"

namespace lumen {

    namespace io {

        iosrc* iosrc_fromfile(const char *file, const char *mode) {
            return SDL_RWFromFile(file, mode);
        } //iofromfile

        iosrc* iosrc_frommem(void *mem, int size) {
            return SDL_RWFromMem(mem, size);
        } //iofrommem

        iosrc* iosrc_fromconstmem(const void *mem, int size) {
            return SDL_RWFromConstMem(mem, size);
        } //iofromconstmem

        iosrc* iosrc_fromfp(FILE * fp, bool autoclose) {
            return SDL_RWFromFP(fp, autoclose ? SDL_TRUE : SDL_FALSE);
        } //iofromfp

        size_t read(iosrc* src, void* dest, size_t size, size_t maxnum) {
            return SDL_RWread(src, dest, size, maxnum);
        } //ioread

        size_t write(iosrc* src, const void* data, size_t size, size_t num) {
            return SDL_RWwrite(src, data, size, num);
        } //iowrite

        size_t seek(iosrc* src, long int offset, int whence) {
            return SDL_RWseek(src, offset, whence);
        } //ioseek

        long int tell(iosrc* src) {
            return SDL_RWtell(src);
        } //iotell

        long int close(iosrc* src) {
            return SDL_RWclose(src);
        } //ioclose

    } //io namespace

} //lumen namespace