
#include "libs/stb_image/stb_image.h"
#include "common/ByteArray.h"

namespace lumen {


        //bpp == the resulting bits per pixel
        //bpp == the source image bits per pixel
        //req_bpp == use this instead of the source
    void image_load_bytes( QuickVec<unsigned char> &out_buffer, const char* _id, int* w, int* h, int* bpp, int* bpp_source, int req_bpp = 4 ) {
        
        unsigned char *data = stbi_load(_id, w, h, bpp_source, req_bpp);

        printf("lumen / image / w:%d h:%d source bpp:%d bpp:%d\n", *w, *h, *bpp_source, req_bpp);

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
