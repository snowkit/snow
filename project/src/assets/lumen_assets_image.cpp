
#include "stb_image.h"
#include "common/ByteArray.h"

#include "lumen_core.h"
#include "lumen_io.h"

#include "assets/lumen_assets_image.h"


namespace lumen {
    namespace assets {
        namespace image {

            int lumen_stbi_read(void *user, char *data, int size) {

                lumen::io::iosrc* src = (lumen::io::iosrc*)user;

                    //to tell how much we have read, we tell before and after
                int before = lumen::io::tell(src);

                lumen::io::read(src, data, size, 1);

                int readtotal = lumen::io::tell(src) - before;

                // lumen::log("stbi read  %d / %d", size, readtotal );

                return readtotal;

            } //lumen_stbi_read


            void lumen_stbi_skip(void *user, unsigned n) {

                lumen::io::iosrc* src = (lumen::io::iosrc*)user;

                // lumen::log("stbi skip %d ", n);

                lumen::io::seek(src, n, lumen_seek_cur);

            } //lumen_stbi_skip


            int lumen_stbi_eof(void *user) {

                lumen::io::iosrc* src = (lumen::io::iosrc*)user;

                    //get this first
                int current = lumen::io::tell(src);
                    //then fetch the end to get the size
                lumen::io::seek(src, 0, lumen_seek_end);
                    //get the size
                long int size = lumen::io::tell(src);
                    //reset the seek
                lumen::io::seek(src, current, lumen_seek_set);

                // lumen::log("stbi eof? %d / %d / %d", current, size, current > size);

                if(current >= size) {
                    return 1;
                }

                return 0;

            } //lumen_stbi_eof

                //bpp == the resulting bits per pixel
                //bpp == the source image bits per pixel
                //req_bpp == use this instead of the source
            bool load_info( QuickVec<unsigned char> &out_buffer, const char* _id, int* w, int* h, int* bpp, int* bpp_source, int req_bpp = 4 ) {

                    //get a io file pointer to the image
                lumen::io::iosrc* src = lumen::io::iosrc_fromfile(_id, "rb");

                if(!src) {
                    lumen::log("/ lumen / cannot open image file from %s", _id);
                    return false;
                }

                    //always use callbacks because we use lumen abstracted IO
                stbi_io_callbacks stbi_lumen_callbacks = {
                   lumen_stbi_read,
                   lumen_stbi_skip,
                   lumen_stbi_eof
                };

                unsigned char *data = stbi_load_from_callbacks(&stbi_lumen_callbacks, src, w, h, bpp_source, req_bpp);

                lumen::io::close(src);

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

                return true;

            } //load_info

        } //assets::image namespace
    } //assets namespace
} //lumen namespace
