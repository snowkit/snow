#ifndef LIME_BYTE_ARRAY_H
#define LIME_BYTE_ARRAY_H

#include "Object.h"
#include "QuickVec.h"
// #include "Utils.h"
#include <stdio.h>


namespace lumen {

   typedef unsigned char uint8;

   #ifdef HX_WINDOWS

      typedef wchar_t OSChar;
      #define val_os_string val_wstring
      #define OpenRead(x) _wfopen(x,L"rb")
      #define OpenOverwrite(x) _wfopen(x,L"wb") // [ddc]

   #else

      typedef char OSChar;
      #define val_os_string val_string

      #ifdef IPHONE

         FILE *OpenRead(const char *inName);
         FILE *OpenOverwrite(const char *inName); // [ddc]

      #elif defined(HX_MACOS)

         } // close namespace lumen

         extern "C" FILE *OpenRead(const char *inName);
         extern "C" bool GetBundleFilename(const char *inName, char *outBuffer,int inBufSize);
         extern "C" FILE *OpenOverwrite(const char *inName);
         
         namespace lumen {

      #endif
         
         #define OpenRead(x) fopen(x,"rb")
         #define OpenOverwrite(x) fopen(x,"wb") // [ddc]
      
   #endif

   // If you put this structure on the stack, then you do not have to worry about GC.
   // If you store this in a heap structure, then you will need to use GC roots for mValue...
   struct ByteArray {

      ByteArray(int inSize);
      ByteArray(const ByteArray &inRHS);
      ByteArray();
      ByteArray(struct _value *Value);
      ByteArray(const QuickVec<unsigned char>  &inValue);

      void          Resize(int inSize);
      int           Size() const;
      unsigned char *Bytes();
      const unsigned char *Bytes() const;
      bool          Ok() { return mValue!=0; }


      struct _value *mValue;

      static ByteArray FromFile(const OSChar *inFilename);
      
      #ifdef HX_WINDOWS
         static ByteArray FromFile(const char *inFilename);
      #endif

   }; //ByteArray

   #ifdef ANDROID
      ByteArray AndroidGetAssetBytes(const char *);

      struct FileInfo
      {
         int fd;
         off_t offset;
         off_t length;
      };

      FileInfo AndroidGetAssetFD(const char *);
   #endif //ANDROID

} //namespace lumen


#endif //LIME_BYTE_ARRAY_H
