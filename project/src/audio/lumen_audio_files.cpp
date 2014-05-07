
#include "common/ByteArray.h"
#include "common/QuickVec.h"
#include "common/Object.h"

#include "libs/vorbis/vorbisfile.h"

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

        }; //OGG_file_source



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

        bool audio_load_ogg_bytes(
            QuickVec<unsigned char> &out_buffer, const char* _id, 
            int* channels, long* rate, long* bitrate_upper, long* bitrate, 
            long* bitrate_lower, long* bitrate_window, int *bits_per_sample 
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
                return false;
            }
            
            fseek(ogg_source->file_source, 0, SEEK_END);
            ogg_source->length = ftell(ogg_source->file_source);
            fseek(ogg_source->file_source, 0, SEEK_SET);

            int result = ov_open_callbacks(ogg_source, ogg_source->ogg_file, NULL, 0, open_callbacks);

            if(result < 0) {
            
                fclose(ogg_source->file_source);
                delete ogg_source;
                
                std::string s = ogg_error_string(result);
                printf("%s result:%d   code:%s \n", "ogg file failed to open!?", result, s.c_str());
                
                return false;

            } //result < 0

            ogg_source->info = ov_info(ogg_source->ogg_file, -1);
            ogg_source->comments = ov_comment(ogg_source->ogg_file, -1);

            ogg_int64_t total_length = ov_pcm_total( ogg_source->ogg_file, -1 ) * ogg_source->info->channels * (2);

                // printf("version         %d \n",     ogg_source->info->version);
                // printf("channels        %d \n",     ogg_source->info->channels);
                // printf("rate (hz)       %lu \n",    ogg_source->info->rate);
                // printf("bitrate         %lu \n",    ogg_source->info->bitrate_nominal);
                // printf("bitrate upper   %lu \n",    ogg_source->info->bitrate_upper);
                // printf("bitrate lower   %lu \n",    ogg_source->info->bitrate_lower);
                // printf("bitrate window  %lu \n",    ogg_source->info->bitrate_window);
                // printf("vendor          %s \n",     ogg_source->comments->vendor);
                // printf("length          %lld \n",   (long long)ogg_source->length);
                // printf("uncompressed    %lld \n",   (long long)total_length);
                
            // for(int i = 0; i < ogg_source->comments->comments; i++) {
            //     printf("\t%s\n",  ogg_source->comments->user_comments[i]);
            // }

            *rate               = ogg_source->info->rate;
            *channels           = ogg_source->info->channels;
            *bitrate            = ogg_source->info->bitrate_nominal;
            *bits_per_sample    = 16;

            *bitrate_upper      = ogg_source->info->bitrate_upper;
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

                //yay.
            return true;

        } //audio_load_ogg_bytes

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




//WAV files

        struct RIFF_Header {
            char chunkID[4];
            unsigned int chunkSize; //size not including chunkSize or chunkID
            char format[4];
        };
        
        struct WAVE_Format {
            char subChunkID[4];
            unsigned int subChunkSize;
            short audioFormat;
            short numChannels;
            unsigned int sampleRate;
            unsigned int byteRate;
            short blockAlign;
            short bitsPerSample;
        };
        
        struct WAVE_Data {
            char subChunkID[4]; //should contain the word data
            unsigned int subChunkSize; //Stores the size of the data block
        };


        bool audio_load_wav_bytes( QuickVec<unsigned char> &out_buffer, const char *_id,  int *channels, int* rate, int *bitrate, int *bits_per_sample) {
            
            //http://www.dunsanyinteractive.com/blogs/oliver/?p=72

            WAVE_Format wave_format;
            RIFF_Header riff_header;
            WAVE_Data wave_data;

            FILE* f = NULL;
            unsigned char* data;
            
            // #ifdef ANDROID
                // FileInfo info = AndroidGetAssetFD(_id);
                // f = fdopen(info.fd, "rb");
                // fseek(f, info.offset, 0);
            // #else
                f = fopen(_id, "rb");
            // #endif
            
            if (!f) {
                printf("%s : %s\n", _id, "failed to open sound file, does this file exist?\n");
                return false;
            }
            
            // Read in the first chunk into the struct
            int result = fread(&riff_header, sizeof(RIFF_Header), 1, f);

            //check for RIFF and WAVE tag in memory

            if(
                (riff_header.chunkID[0] != 'R'  ||
                riff_header.chunkID[1]  != 'I'  ||
                riff_header.chunkID[2]  != 'F'  ||
                riff_header.chunkID[3]  != 'F') ||
                
                (riff_header.format[0]  != 'W'  ||
                riff_header.format[1]   != 'A'  ||
                riff_header.format[2]   != 'V'  ||
                riff_header.format[3]   != 'E'  )
            ) {
                printf("%s : %s\n", _id, "Invalid RIFF or WAVE header");
                return false;
            }
            
            long int current_head = 0;
            bool found_format = false;

            while (!found_format) {

                // Save the current position indicator of the stream
                current_head = ftell(f);
                
                    //Read in the 2nd chunk for the wave info
                result = fread(&wave_format, sizeof(WAVE_Format), 1, f);
                
                if (result != 1) {
                    printf("%s : %s\n", _id, "Invalid WAV format!");
                    return false;
                }
                
                //check for fmt tag in memory
                if(
                    wave_format.subChunkID[0] != 'f' ||
                    wave_format.subChunkID[1] != 'm' ||
                    wave_format.subChunkID[2] != 't' ||
                    wave_format.subChunkID[3] != ' '
                ) {
                    fseek(f, wave_format.subChunkSize, SEEK_CUR);
                } else {
                    found_format = true;
                }

            } //while !found_format
            
                //check for extra parameters;
            if (wave_format.subChunkSize > 16) {
                fseek(f, sizeof(short), SEEK_CUR);
            }
            
            bool found_data = false;

            while (!found_data) {

                //Read in the the last byte of data before the sound file
                result = fread(&wave_data, sizeof(WAVE_Data), 1, f);
                
                if (result != 1) {
                    printf("%s : %s\n", _id, "Invalid WAV data header");
                    return false;
                }
                
                if(
                    wave_data.subChunkID[0] != 'd' ||
                    wave_data.subChunkID[1] != 'a' ||
                    wave_data.subChunkID[2] != 't' ||
                    wave_data.subChunkID[3] != 'a'
                ) {
                        // Goto next chunk.
                    fseek(f, current_head + sizeof(WAVE_Data) + wave_format.subChunkSize, SEEK_SET);
                } else {
                    found_data = true;
                }

            } //!found_data
            
                //Allocate memory for data
            data = new unsigned char[wave_data.subChunkSize];
            
                // Read in the sound data into the soundData variable
            if (!fread(data, wave_data.subChunkSize, 1, f)) {
                printf("%s : %s\n", _id, "Error loading WAV data into struct");
                return false;
            }   
            
                //Store in the out_buffer
            out_buffer.Set(data, wave_data.subChunkSize);
            
                //Now we set the variables that we passed in with the data from the structs
            *rate = wave_format.sampleRate;
            *bitrate = (int)wave_format.byteRate;
            *channels = wave_format.numChannels;
            *bits_per_sample = wave_format.bitsPerSample;
            
                //clean up and return true if successful
            fclose(f);
            delete[] data;
            
            return true;

        } // audio_load_wav_bytes    

} //namespace lumen

