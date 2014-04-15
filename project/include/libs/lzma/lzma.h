#ifndef LUMEN_LZMA_H
#define LUMEN_LZMA_H

#include <hx/CFFI.h>

namespace lumen {

	class Lzma {

		public:
		
			static void Encode( buffer input_buffer, buffer output_buffer );
			static void Decode( buffer input_buffer, buffer output_buffer );

	}; //Lzma
	
} //namespace lumen

#endif //LUMEN_LZMA_H
