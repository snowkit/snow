

#include "snow_io.h"
#include "SDL.h"

namespace snow {

    namespace io {

        void handle_event( SDL_Event &event ) {

            //for now, we don't want to manage events
            //unless we really need to for allocation sake etc

            if(event.type != SDL_DROPFILE) {
                return;
            }

            FileEvent new_event;

            switch(event.type) {

                case SDL_DROPFILE: {

                    new_event.type = fe_drop;

                    char* dropped_path = event.drop.file;

                        new_event.path = std::string(dropped_path);

                    snow::log(3, "/ snow / file drop event %s", new_event.path.c_str());

                    SDL_free(dropped_path);

                    break;
                } //drop

            } //switch(event.type)

            new_event.timestamp = snow::timestamp();
                //dispatch the event!
            snow::io::dispatch_event( new_event );

        } //handle_event

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

} //snow namespace