

#include "lumen_io.h"
#include "SDL.h"

namespace lumen {

	lumen_iosrc* iosrc_fromfile(const char *file, const char *mode) {
		return SDL_RWFromFile(file, mode);
	} //iofromfile

	lumen_iosrc* iosrc_frommem(void *mem, int size) {
		return SDL_RWFromMem(mem, size);
	} //iofrommem

	lumen_iosrc* iosrc_fromconstmem(const void *mem, int size) {
		return SDL_RWFromConstMem(mem, size);
	} //iofromconstmem

	lumen_iosrc* iosrc_fromfp(FILE * fp, bool autoclose) {
		return SDL_RWFromFP(fp, autoclose ? SDL_TRUE : SDL_FALSE);
	} //iofromfp


	size_t ioread(lumen_iosrc* src, void* dest, size_t size, size_t maxnum) {
		return SDL_RWread(src, dest, size, maxnum);
	} //ioread

	size_t iowrite(lumen_iosrc* src, const void* data, size_t size, size_t num) {
		return SDL_RWwrite(src, data, size, num);
	} //iowrite

	size_t ioseek(lumen_iosrc* src, long int offset, int whence) {
		return SDL_RWseek(src, offset, whence);
	} //ioseek

	long int iotell(lumen_iosrc* src) {
		return SDL_RWtell(src);
	} //iotell

	long int ioclose(lumen_iosrc* src) {
		return SDL_RWclose(src);
	} //ioclose

} //namespace lumen