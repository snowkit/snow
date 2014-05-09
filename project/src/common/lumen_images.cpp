
#include "libs/stb_image/stb_image.h"
#include "common/ByteArray.h"

#include "lumen_core.h"
#include "lumen_io.h"

namespace lumen {

    int lumen_stbi_read(void *user, char *data, int size) {

        lumen_iosrc* src = (lumen_iosrc*)user;

            //to tell how much we have read, we tell before and after
        int before = lumen::iotell(src);

        lumen::ioread(src, data, size, 1);

        int readtotal = lumen::iotell(src) - before;

        // lumen::log("stbi read  %d / %d", size, readtotal );

        return readtotal;

    } //lumen_stbi_read


    void lumen_stbi_skip(void *user, unsigned n) {

        lumen_iosrc* src = (lumen_iosrc*)user;

        // lumen::log("stbi skip %d ", n);

        lumen::ioseek(src, n, lumen_seek_cur);

    } //lumen_stbi_skip


    int lumen_stbi_eof(void *user) {

        lumen_iosrc* src = (lumen_iosrc*)user;

            //get this first
        int current = lumen::iotell(src);
            //then fetch the end to get the size
        lumen::ioseek(src, 0, lumen_seek_end);
            //get the size
        long int size = lumen::iotell(src);
            //reset the seek
        lumen::ioseek(src, current, lumen_seek_set);

        // lumen::log("stbi eof? %d / %d / %d", current, size, current > size);

        if(current >= size) {
            return 1;
        }

        return 0;

    } //lumen_stbi_eof

        //bpp == the resulting bits per pixel
        //bpp == the source image bits per pixel
        //req_bpp == use this instead of the source
    void image_load_bytes( QuickVec<unsigned char> &out_buffer, const char* _id, int* w, int* h, int* bpp, int* bpp_source, int req_bpp = 4 ) {

            //always use callbacks because we use lumen abstracted IO
        stbi_io_callbacks stbi_lumen_callbacks = {
           lumen_stbi_read,
           lumen_stbi_skip,
           lumen_stbi_eof
        };

            //get a io file pointer to the image
        lumen_iosrc* src = lumen::iosrc_fromfile(_id, "rb");

        unsigned char *data = stbi_load_from_callbacks(&stbi_lumen_callbacks, src, w, h, bpp_source, req_bpp);

        lumen::ioclose(src);

        // lumen::log("lumen / image / w:%d h:%d source bpp:%d bpp:%d\n", *w, *h, *bpp_source, req_bpp);

        if(data != NULL) {

            int _w = *w;
            int _h = *h;
            int _bpp = *bpp_source;

                //if a requested bpp was given, override it
            if(req_bpp != 0) {
                _bpp = req_bpp;
            }

                //actual used bpp
            *bpp = _bpp;
                //work out the total length of the buffer
            unsigned int length = _w * _h * _bpp;
                //store it
            out_buffer.Set(data, length);
                //clean up used memory
            stbi_image_free(data);

        } //data != NULL

    } //derp

}
