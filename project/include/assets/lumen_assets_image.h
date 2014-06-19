#ifndef _LUMEN_ASSETS_IMAGE_
#define _LUMEN_ASSETS_IMAGE_

#include <string>

#include "common/Object.h"
#include "common/QuickVec.h"

#include "lumen_io.h"


namespace lumen {

    namespace assets {

        namespace image {

            bool load_info( QuickVec<unsigned char> &out_buffer, const char* _id, int* w, int* h, int* bpp, int* bpp_source, int req_bpp );

        } //assets::image namespace

    } //assets namespace

} //lumen namespace


#endif //_LUMEN_ASSETS_IMAGE_