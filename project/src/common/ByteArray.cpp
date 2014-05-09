
#include <hx/CFFI.h>

#include "common/ByteArray.h"
#include "lumen_io.h"

namespace lumen {


    // --- ByteArray -----------------------------------------------------

    AutoGCRoot *gByteArrayCreate = 0;
    AutoGCRoot *gByteArrayLen = 0;
    AutoGCRoot *gByteArrayResize = 0;
    AutoGCRoot *gByteArrayBytes = 0;

    value lumen_byte_array_init(value inFactory, value inLen, value inResize, value inBytes) {

        gByteArrayCreate = new AutoGCRoot(inFactory);
        gByteArrayLen = new AutoGCRoot(inLen);
        gByteArrayResize = new AutoGCRoot(inResize);
        gByteArrayBytes = new AutoGCRoot(inBytes);

        return alloc_null();

    } DEFINE_PRIM(lumen_byte_array_init,4);


    ByteArray::ByteArray() : mValue(0) {}
    ByteArray::ByteArray(const ByteArray &inRHS) : mValue(inRHS.mValue) { }
    ByteArray::ByteArray(value inValue) : mValue(inValue) { }

    ByteArray::ByteArray(int inSize) {
        mValue = val_call1(gByteArrayCreate->get(), alloc_int(inSize) );
    }

    ByteArray::ByteArray(const QuickVec<uint8> &inData) {

        mValue = val_call1(gByteArrayCreate->get(), alloc_int(inData.size()) );
        uint8 *bytes = Bytes();

        if (bytes) {
            memcpy(bytes, &inData[0], inData.size() );
        }

    }


    void ByteArray::Resize(int inSize) {
        val_call2(gByteArrayResize->get(), mValue, alloc_int(inSize) );
    }

    int ByteArray::Size() const {
        return val_int( val_call1(gByteArrayLen->get(), mValue ));
    }


    const unsigned char *ByteArray::Bytes() const {

        value bytes = val_call1(gByteArrayBytes->get(),mValue);
        if (val_is_string(bytes)) {
            return (unsigned char *)val_string(bytes);
        }

        buffer buf = val_to_buffer(bytes);

        if (buf==0) {
            val_throw(alloc_string("Bad ByteArray"));
        }

        return (unsigned char *)buffer_data(buf);

    }


    unsigned char *ByteArray::Bytes() {

        value bytes = val_call1(gByteArrayBytes->get(), mValue);

        if (val_is_string(bytes)) {
            return (unsigned char *)val_string(bytes);
        }

        buffer buf = val_to_buffer(bytes);

        if (buf == 0) {
            val_throw(alloc_string("Bad ByteArray"));
        }

        return (unsigned char *)buffer_data(buf);

    }

    // --------------------

    ByteArray ByteArray::FromFile(const OSChar *inFilename) {

        lumen_iosrc* file = lumen::iosrc_fromfile(inFilename, "rb");

            //determine the length
        lumen::ioseek(file, 0, lumen_seek_end);
        int len = lumen::iotell(file);
        lumen::ioseek(file, 0, lumen_seek_set);

            //create a bytearray of the file size
        ByteArray result(len);
            //read the data into the buffer
        int status = lumen::ioread(file, result.Bytes(), len, 1);
            //close the file
        lumen::ioclose(file);

        return result;

    } //FromFile

} //namespace lumen
