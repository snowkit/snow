
#include <hx/CFFI.h>

#include "common/ByteArray.h"


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

        FILE *file = OpenRead(inFilename);

        if (!file) {

            #ifdef ANDROID
                return AndroidGetAssetBytes(inFilename);
            #endif

            return ByteArray();
        }

        fseek(file,0,SEEK_END);
        int len = ftell(file);
        fseek(file,0,SEEK_SET);

        ByteArray result(len);
        int status = fread(result.Bytes(),len,1,file);
        fclose(file);

        return result;
    }


    #ifdef HX_WINDOWS

        ByteArray ByteArray::FromFile(const char *inFilename) {

            FILE *file = fopen(inFilename,"rb");

            if (!file) {
                return ByteArray();
            }

            fseek(file,0,SEEK_END);
            int len = ftell(file);
            fseek(file,0,SEEK_SET);

            ByteArray result(len);

            fread(result.Bytes(),len,1,file);
            fclose(file);

            return result;

        } //FromFile

    #endif //HX_WINDOWS

} //namespace lumen 
