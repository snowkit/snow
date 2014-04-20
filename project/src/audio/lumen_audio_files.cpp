
#include "common/ByteArray.h"
#include "common/QuickVec.h"
#include "common/Object.h"

#include <vorbis/vorbisfile.h>

#include <string>


namespace lumen {


        static size_t ogg_read_func(void* ptr, size_t size, size_t nmemb, void* datasource);
        static int ogg_seek_func(void* datasource, ogg_int64_t offset, int whence);
        static int ogg_close_func(void* datasource);
        static long ogg_tell_func(void* datasource);

        class OGG_file_source : public Object {
            public:
                FILE*               file_source;
                std::string         source_name;
                OggVorbis_File*     ogg_file;
                vorbis_info*        info;
                vorbis_comment*     comments;
                off_t               offset;
                off_t               length;

            OGG_file_source() : offset(0), length(0) {

                ogg_file = new OggVorbis_File();

            } //OGG_file_source

            ~OGG_file_source() {

                ov_clear(ogg_file);

            } //~
        };

        std::string ogg_error_string(int code) {
            switch(code)
            {
                case OV_EREAD:
                    return std::string("failed to read from media");
                case OV_ENOTVORBIS:
                    return std::string("not vorbis data");
                case OV_EVERSION:
                    return std::string("vorbis version mismatch");
                case OV_EBADHEADER:
                    return std::string("invalid vorbis header");
                case OV_EFAULT:
                    return std::string("internal logic fault (bug or heap/stack corruption.");
                default:
                    return std::string("unknown ogg error");
            }
        }

        #define OGG_BUFFER_LENGTH 4096
        // 0 for Little-Endian, 1 for Big-Endian
        #ifdef HXCPP_BIG_ENDIAN
            #define OGG_BUFFER_READ_TYPE 1
        #else
            #define OGG_BUFFER_READ_TYPE 0
        #endif

        void audio_load_ogg_bytes(
            QuickVec<unsigned char> &out_buffer, const char* _id, 
            int* channels, long* rate, long* bitrate_upper, long* bitrate_nominal, 
            long* bitrate_lower, long* bitrate_window 
        ) {

            ov_callbacks open_callbacks;
            OGG_file_source* ogg_source = new OGG_file_source();
            ogg_source->source_name = std::string(_id);

            #ifdef ANDROID
        
                //mInfo = AndroidGetAssetFD(path.c_str());
                //oggFile = fdopen(mInfo.fd, "rb");
                //fseek(oggFile, mInfo.offset, 0);

            #endif

            open_callbacks.read_func =  &lumen::ogg_read_func;
            open_callbacks.seek_func =  &lumen::ogg_seek_func;
            open_callbacks.close_func = &lumen::ogg_close_func;
            open_callbacks.tell_func =  &lumen::ogg_tell_func;

            ogg_source->file_source = fopen(_id, "rb");
            if(!ogg_source->file_source) {
                printf("%s %s\n", "error opening file:", _id);
                return;
            }
            
            fseek(ogg_source->file_source, 0, SEEK_END);
            ogg_source->length = ftell(ogg_source->file_source);
            fseek(ogg_source->file_source, 0, SEEK_SET);

            int result = ov_open_callbacks(ogg_source, ogg_source->ogg_file, NULL, 0, open_callbacks);

            if(result < 0) {
            
                fclose(ogg_source->file_source);
                delete ogg_source;
                
                std::string s = ogg_error_string(result);
                printf("%s result:%d   code:%s \n", "ogg stream failed to open!?", result, s.c_str());
                
                return;

            } //result < 0

            ogg_source->info = ov_info(ogg_source->ogg_file, -1);
            ogg_source->comments = ov_comment(ogg_source->ogg_file, -1);

            ogg_int64_t total_length = ov_pcm_total( ogg_source->ogg_file, -1 ) * ogg_source->info->channels * (2);

                printf("version         %d \n",     ogg_source->info->version);
                printf("channels        %d \n",     ogg_source->info->channels);
                printf("rate (hz)       %lu \n",    ogg_source->info->rate);
                printf("bitrate upper   %lu \n",    ogg_source->info->bitrate_upper);
                printf("bitrate nominal %lu \n",    ogg_source->info->bitrate_nominal);
                printf("bitrate lower   %lu \n",    ogg_source->info->bitrate_lower);
                printf("bitrate window  %lu \n",    ogg_source->info->bitrate_window);
                printf("vendor          %s \n",     ogg_source->comments->vendor);
                printf("length          %ld \n",    ogg_source->length);
                printf("uncompressed    %lld \n",   (long long)total_length);
                
            for(int i = 0; i < ogg_source->comments->comments; i++) {
                printf("\t%s\n",  ogg_source->comments->user_comments[i]);
            }

            *channels           = ogg_source->info->channels;
            *rate               = ogg_source->info->rate;
            *bitrate_upper      = ogg_source->info->bitrate_upper;
            *bitrate_nominal    = ogg_source->info->bitrate_nominal;
            *bitrate_lower      = ogg_source->info->bitrate_lower;
            *bitrate_window     = ogg_source->info->bitrate_window;

                //(2) here is bytes per sample in file
            
            long bytes_read = -1;
            long total_bytes = 0;
            int bit_stream = 1;

            out_buffer.resize(total_length);

            while (bytes_read != 0) {

                    // Read up to a buffer's worth of decoded sound data
                bytes_read = ov_read( ogg_source->ogg_file, (char*)out_buffer.begin() + total_bytes, OGG_BUFFER_LENGTH, OGG_BUFFER_READ_TYPE, 2, 1, &bit_stream);

                total_bytes += bytes_read;

            } //while

                //clean up
            delete ogg_source;

        }

        static size_t ogg_read_func(void* ptr, size_t size, size_t nmemb, void* datasource) {

            OGG_file_source *source = (OGG_file_source*)datasource;

            // printf("\t read  : %s, filelen:%lld amount:%lu\n", source->source_name.c_str(),source->length, size * nmemb);

            return fread(ptr, size, nmemb, source->file_source);;

        } //read_func

        static int ogg_seek_func(void* datasource, ogg_int64_t offset, int whence) {

            OGG_file_source *source = (OGG_file_source*)datasource;

            // printf("\t seek  : %s, offset:%lld whence:%d \n", source->source_name.c_str(), offset, whence);

            long pos = 0;
           
            if (whence == SEEK_SET) {
               pos = source->offset + (unsigned int)offset;
            } else if (whence == SEEK_CUR) {
               pos = ftell(source->file_source) + (unsigned int)offset;
            } else if (whence == SEEK_END) {
               pos = source->offset + source->length;
            }
            
            if (pos > source->offset + source->length) {
                pos = source->offset + source->length;
            } else if(pos < 0) {
                pos = 0;
            }

            return fseek(source->file_source, pos, 0);

        } //seek_func

        static int ogg_close_func(void* datasource) {

            OGG_file_source *source = (OGG_file_source*)datasource;

            return fclose(source->file_source);

        } //close_func

        static long ogg_tell_func(void* datasource) {

            OGG_file_source *source = (OGG_file_source*)datasource;

            return (long)ftell(source->file_source) - source->offset;

        } //tell_func

} //namespace lumen

