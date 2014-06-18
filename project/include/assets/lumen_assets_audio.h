#ifndef _LUMEN_ASSETS_AUDIO_
#define _LUMEN_ASSETS_AUDIO_

#include <string>

#include "common/Object.h"
#include "common/QuickVec.h"

#include "lumen_io.h"

#include "vorbis/vorbisfile.h"

namespace lumen {

		//forward
    class OGG_file_source;
    class WAV_file_source;
	class PCM_file_source;

		//function declarations
	bool audio_load_info_ogg( QuickVec<unsigned char> &out_buffer, const char* _id, OGG_file_source*& ogg_source, bool read = true );
    bool audio_read_bytes_ogg( OGG_file_source* ogg_source, QuickVec<unsigned char> &out_buffer, long start, long len );
	bool audio_seek_bytes_ogg( OGG_file_source* ogg_source, long to );

    bool audio_load_info_wav( QuickVec<unsigned char> &out_buffer, const char *_id, WAV_file_source*& wav_source, bool read = true );
    bool audio_read_bytes_wav( WAV_file_source* wav_source, QuickVec<unsigned char> &out_buffer, long start, long len );
    bool audio_seek_bytes_wav( WAV_file_source* wav_source, long to );

    bool audio_load_info_pcm( QuickVec<unsigned char> &out_buffer, const char *_id, PCM_file_source*& pcm_source, bool read = true );
    bool audio_read_bytes_pcm( PCM_file_source* pcm_source, QuickVec<unsigned char> &out_buffer, long start, long len );
    bool audio_seek_bytes_pcm( PCM_file_source* pcm_source, long to );


	std::string ogg_error_string(int code);

		//other defines
    #define OGG_BUFFER_LENGTH 4096
        // 0 for Little-Endian, 1 for Big-Endian
    #ifdef HXCPP_BIG_ENDIAN
        #define OGG_BUFFER_READ_TYPE 1
    #else
        #define OGG_BUFFER_READ_TYPE 0
    #endif


//OGG file source

    class OGG_file_source : public Object {

        public:
            lumen_iosrc*        file_source;
            ov_callbacks        callbacks;
            std::string         source_name;
            OggVorbis_File*     ogg_file;
            vorbis_info*        info;
            vorbis_comment*     comments;
            off_t               offset;
            off_t               length;
            off_t               length_pcm;

        OGG_file_source() : offset(0), length(0), length_pcm(0) {

            ogg_file = new OggVorbis_File();

        } //OGG_file_source

        ~OGG_file_source() {

            ov_clear(ogg_file);
            delete ogg_file;

        } //~

    }; //OGG_file_source

//WAV file source

    class WAV_file_source : public Object {

        public:
            lumen_iosrc*        file_source;
            std::string         source_name;
            int                 channels;
            int                 rate;
            int                 bitrate;
            int                 bits_per_sample;
            off_t               data_start;
            off_t               offset;
            off_t               length;
            off_t               length_pcm;

        WAV_file_source() : offset(0), length(0), length_pcm(0) {

        } //WAV_file_source

        ~WAV_file_source() {

                //ensure the file is closed
            if(file_source) {
                lumen::ioclose( file_source );
            }

            file_source = NULL;

        } //~

    }; //WAV_file_source

//PCM file source

    class PCM_file_source : public Object {

        public:
            lumen_iosrc*        file_source;
            std::string         source_name;
            int                 channels;
            int                 rate;
            int                 bitrate;
            int                 bits_per_sample;
            off_t               offset;
            off_t               length;
            off_t               length_pcm;

        PCM_file_source() : offset(0), length(0), length_pcm(0) {

        } //PCM_file_source

        ~PCM_file_source() {

                //ensure the file is closed
            if(file_source) {
                lumen::ioclose( file_source );
            }

            file_source = NULL;

        } //~

    }; //PCM_file_source



} //namespace lumen

#endif //_LUMEN_ASSETS_AUDIO_