
#include "stb_image.h"
#include "common/ByteArray.h"

#include "snow_core.h"
#include "snow_io.h"

#include "assets/snow_assets_image.h"

namespace snow {
    namespace assets {
        namespace image {

            int snow_stbi_read(void *user, char *data, int size) {

                snow::io::iosrc* src = (snow::io::iosrc*)user;

                    //to tell how much we have read, we tell before and after
                int before = snow::io::tell(src);

                snow::io::read(src, data, size, 1);

                int readtotal = snow::io::tell(src) - before;

                // snow::log("stbi read  %d / %d", size, readtotal );

                return readtotal;

            } //snow_stbi_read


            void snow_stbi_skip(void *user, unsigned n) {

                snow::io::iosrc* src = (snow::io::iosrc*)user;

                // snow::log("stbi skip %d ", n);

                snow::io::seek(src, n, snow_seek_cur);

            } //snow_stbi_skip


            int snow_stbi_eof(void *user) {

                snow::io::iosrc* src = (snow::io::iosrc*)user;

                    //get this first
                int current = snow::io::tell(src);
                    //then fetch the end to get the size
                snow::io::seek(src, 0, snow_seek_end);
                    //get the size
                long int size = snow::io::tell(src);
                    //reset the seek
                snow::io::seek(src, current, snow_seek_set);

                // snow::log("stbi eof? %d / %d / %d", current, size, current > size);

                if(current >= size) {
                    return 1;
                }

                return 0;

            } //snow_stbi_eof

                //bpp == the resulting bits per pixel
                //bpp == the source image bits per pixel
                //req_bpp == use this instead of the source
            bool load_info( QuickVec<unsigned char> &out_buffer, const char* _id, int* w, int* h, int* bpp, int* bpp_source, int req_bpp = 4 ) {

                //get a io file pointer to the image
                snow::io::iosrc* src = snow::io::iosrc_fromfile(_id, "rb");

                if(!src) {
                    snow::log("/ snow / cannot open image file from %s", _id);
                    return false;
                }

                    //always use callbacks because we use snow abstracted IO
                stbi_io_callbacks stbi_snow_callbacks = {
                   snow_stbi_read,
                   snow_stbi_skip,
                   snow_stbi_eof
                };

                unsigned char *data = stbi_load_from_callbacks(&stbi_snow_callbacks, src, w, h, bpp_source, req_bpp);

                    //we are done with the src
                snow::io::close(src);

                // snow::log("snow / image / w:%d h:%d source bpp:%d bpp:%d\n", *w, *h, *bpp_source, req_bpp);

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

                } else { //data != NULL

                    snow::log("snow / image unable to be loaded by snow: %s reason: %s", _id, stbi_failure_reason());
                    return false;

                }

                return true;

            } //load_info

                //bpp == the resulting bits per pixel
                //bpp == the source image bits per pixel
                //req_bpp == use this instead of the source
            bool info_from_bytes( QuickVec<unsigned char> &out_buffer, snow::ByteArray bytes, const char* _id, int *w, int *h, int* bpp, int* bpp_source, int req_bpp = 4) {

                //get a io file pointer to the image
                snow::io::iosrc* src = snow::io::iosrc_frommem( bytes.Bytes(), bytes.Size() );

                if(!src) {
                    snow::log("/ snow / cannot open bytes from %s", _id);
                    return false;
                }

                    //always use callbacks because we use snow abstracted IO
                stbi_io_callbacks stbi_snow_callbacks = {
                   snow_stbi_read,
                   snow_stbi_skip,
                   snow_stbi_eof
                };

                unsigned char *data = stbi_load_from_callbacks(&stbi_snow_callbacks, src, w, h, bpp_source, req_bpp);

                    //we are done with the src
                snow::io::close(src);

                // snow::log("snow / image / w:%d h:%d source bpp:%d bpp:%d\n", *w, *h, *bpp_source, req_bpp);

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

            } //info_from_bytes

        } //assets::image namespace
    } //assets namespace
} //snow namespace
