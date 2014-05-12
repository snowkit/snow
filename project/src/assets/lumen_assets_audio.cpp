
#include "assets/lumen_assets_audio.h"

#include "lumen_core.h"

#include <string>


namespace lumen {

            //forward
        static size_t   ogg_read_func(void* ptr, size_t size, size_t nmemb, void* datasource);
        static int      ogg_seek_func(void* datasource, ogg_int64_t offset, int whence);
        static int      ogg_close_func(void* datasource);
        static long     ogg_tell_func(void* datasource);


            //load an ogg info object, if read is false it will not read any data from the file, just open and setup the info/comments
        bool audio_load_ogg_info( QuickVec<unsigned char> &out_buffer, const char* _id, OGG_file_source*& ogg_source, bool read = true ) {

            ogg_source = new OGG_file_source();
            ogg_source->source_name = std::string(_id);

            ogg_source->callbacks = ov_callbacks();

                ogg_source->callbacks.read_func = &lumen::ogg_read_func;
                ogg_source->callbacks.seek_func = &lumen::ogg_seek_func;
                ogg_source->callbacks.close_func = &lumen::ogg_close_func;
                ogg_source->callbacks.tell_func = &lumen::ogg_tell_func;

            ogg_source->file_source = lumen::iosrc_fromfile(_id, "rb");

            if(!ogg_source->file_source) {

                lumen::log("/ lumen / cannot open ogg file from %s", _id);
                delete ogg_source;
                ogg_source = NULL;

                return false;

            } //file source isn't valid

            lumen::ioseek(ogg_source->file_source, 0, lumen_seek_end);

                ogg_source->length = lumen::iotell(ogg_source->file_source);

            lumen::ioseek(ogg_source->file_source, 0, lumen_seek_set);

                //open the file with the callbacks
            int result = ov_open_callbacks(ogg_source, ogg_source->ogg_file, NULL, 0, ogg_source->callbacks );

            if(result < 0) {

                lumen::ioclose(ogg_source->file_source);
                delete ogg_source;
                ogg_source = NULL;

                std::string s = ogg_error_string(result);
                lumen::log("/ lumen / %s result:%d   code:%s \n", "ogg file failed to open!?", result, s.c_str());

                return false;

            } //result < 0

            ogg_source->info = ov_info(ogg_source->ogg_file, -1);
            ogg_source->comments = ov_comment(ogg_source->ogg_file, -1);

                //(2) here is word size, 16 bit is 2, 8 bit is 1
            ogg_int64_t total_length = ov_pcm_total( ogg_source->ogg_file, -1 ) * ogg_source->info->channels * (2);

            ogg_source->length_pcm = total_length;

                // lumen::log("version         %d \n",     ogg_source->info->version);
                // lumen::log("channels        %d \n",     ogg_source->info->channels);
                // lumen::log("rate (hz)       %lu \n",    ogg_source->info->rate);
                // lumen::log("bitrate         %lu \n",    ogg_source->info->bitrate_nominal);
                // lumen::log("bitrate upper   %lu \n",    ogg_source->info->bitrate_upper);
                // lumen::log("bitrate lower   %lu \n",    ogg_source->info->bitrate_lower);
                // lumen::log("bitrate window  %lu \n",    ogg_source->info->bitrate_window);
                // lumen::log("vendor          %s \n",     ogg_source->comments->vendor);
                // lumen::log("length          %lld \n",   (long long)ogg_source->length);
                // lumen::log("uncompressed    %lld \n",   (long long)total_length);

            // for(int i = 0; i < ogg_source->comments->comments; i++) {
            //     lumen::log("\t%s\n",  ogg_source->comments->user_comments[i]);
            // }

                //use the reader to read it, if requested
            if(read) {
                audio_read_ogg_data( ogg_source, out_buffer, 0, total_length );
            }

                //yay.
            return true;

        } //audio_load_ogg_bytes

            //this reads a portion of an already opened ogg source into the buffer from start, for len
        long audio_read_ogg_data( OGG_file_source* ogg_source, QuickVec<unsigned char> &out_buffer, long start, long len ) {

            //it is assumed here that ogg_source is opened. Maybe we can ask the file if it is open and if not reopen it?

            int word = 2; //1 for 8 bit, 2 for 16 bit. 2 is typical
            int sgned = 1; //0 for unsigned, 1 is typical
            int bit_stream = 1;

                //if the start position is -1, it means to use the current position
            if(start == -1) {

                start = ov_pcm_tell( ogg_source->ogg_file );

            } else {
                    //first seek to the right position
                ov_pcm_seek( ogg_source->ogg_file, start );
            }

            long _read_len = len;

                //the requested size might reach past the size of the data, so we cap it
            if((start + _read_len) > ogg_source->length_pcm) {
                _read_len = (ogg_source->length_pcm - start);
                    //aaand no negative reads either.
                if(_read_len < 0) {
                    _read_len = 0;
                }
            }

                //resize to fit the requested length
            out_buffer.resize(_read_len);

            bool reading = true;
            long bytes_left = _read_len;
            long total_read = 0;
            long bytes_read = 0;

            while(reading) {

                long _read_max = OGG_BUFFER_LENGTH;

                if(bytes_left < _read_max) {
                    _read_max = bytes_left;
                }

                    // Read the decoded sound data
                bytes_read = ov_read( ogg_source->ogg_file, (char*)out_buffer.begin() + total_read, _read_max, OGG_BUFFER_READ_TYPE, word, sgned, &bit_stream);

                total_read += bytes_read;
                bytes_left -= bytes_read;

                    //at the end?
                if(bytes_read == 0) {
                    reading = false;
                }

                if(total_read >= _read_len) {
                    reading = false;
                }

            } //while

                //we need the buffer length to reflect the real size,
                //just in case too
            if(total_read != _read_len) {
                out_buffer.resize(total_read);
            }

            return total_read;

        } //audio_read_ogg_bytes


        static size_t ogg_read_func(void* ptr, size_t size, size_t nmemb, void* datasource) {

            OGG_file_source *source = (OGG_file_source*)datasource;

            // lumen::log("\t read  : %s, filelen:%lld amount:%lu\n", source->source_name.c_str(),source->length, size * nmemb);

            return lumen::ioread(source->file_source, ptr, size, nmemb);

        } //read_func

        static int ogg_seek_func(void* datasource, ogg_int64_t offset, int whence) {

            OGG_file_source *source = (OGG_file_source*)datasource;

            // lumen::log("\t seek  : %s, offset:%lld whence:%d \n", source->source_name.c_str(), offset, whence);

            long pos = 0;

            if (whence == SEEK_SET) {
               pos = source->offset + (unsigned int)offset;
            } else if (whence == SEEK_CUR) {
               pos = lumen::iotell(source->file_source) + (unsigned int)offset;
            } else if (whence == SEEK_END) {
               pos = source->offset + source->length;
            }

            if (pos > source->offset + source->length) {
                pos = source->offset + source->length;
            } else if(pos < 0) {
                pos = 0;
            }

            return lumen::ioseek(source->file_source, pos, lumen_seek_set);

        } //seek_func

        static int ogg_close_func(void* datasource) {

            OGG_file_source *source = (OGG_file_source*)datasource;

            return lumen::ioclose(source->file_source);

        } //close_func

        static long ogg_tell_func(void* datasource) {

            OGG_file_source *source = (OGG_file_source*)datasource;

            return (long)lumen::iotell(source->file_source) - source->offset;

        } //tell_func

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

            lumen_iosrc* f = NULL;
            unsigned char* data;

            f = lumen::iosrc_fromfile(_id, "rb");

            if (!f) {
                lumen::log("/ lumen / cannot open wav file from %s", _id);
                return false;
            }

            // Read in the first chunk into the struct
            int result = lumen::ioread(f, &riff_header, sizeof(RIFF_Header), 1);

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
                lumen::log("%s : %s\n", _id, "Invalid RIFF or WAVE header");
                return false;
            }

            long int current_head = 0;
            bool found_format = false;

            while (!found_format) {

                // Save the current position indicator of the stream
                current_head = lumen::iotell(f);

                    //Read in the 2nd chunk for the wave info
                result = lumen::ioread(f, &wave_format, sizeof(WAVE_Format), 1);

                if (result != 1) {
                    lumen::log("%s : %s\n", _id, "Invalid WAV format!");
                    return false;
                }

                //check for fmt tag in memory
                if(
                    wave_format.subChunkID[0] != 'f' ||
                    wave_format.subChunkID[1] != 'm' ||
                    wave_format.subChunkID[2] != 't' ||
                    wave_format.subChunkID[3] != ' '
                ) {
                    lumen::ioseek(f, wave_format.subChunkSize, lumen_seek_cur);
                } else {
                    found_format = true;
                }

            } //while !found_format

                //check for extra parameters;
            if (wave_format.subChunkSize > 16) {
                lumen::ioseek(f, sizeof(short), lumen_seek_cur);
            }

            bool found_data = false;

            while (!found_data) {

                //Read in the the last byte of data before the sound file
                result = lumen::ioread(f, &wave_data, sizeof(WAVE_Data), 1);

                if (result != 1) {
                    lumen::log("%s : %s\n", _id, "Invalid WAV data header");
                    return false;
                }

                if(
                    wave_data.subChunkID[0] != 'd' ||
                    wave_data.subChunkID[1] != 'a' ||
                    wave_data.subChunkID[2] != 't' ||
                    wave_data.subChunkID[3] != 'a'
                ) {
                        // Goto next chunk.
                    lumen::ioseek(f, current_head + sizeof(WAVE_Data) + wave_format.subChunkSize, lumen_seek_set);
                } else {
                    found_data = true;
                }

            } //!found_data

                //Allocate memory for data
            data = new unsigned char[wave_data.subChunkSize];

                // Read in the sound data into the soundData variable
            if (!lumen::ioread(f, data, wave_data.subChunkSize, 1)) {
                lumen::log("%s : %s\n", _id, "Error loading WAV data into struct");
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
            lumen::ioclose(f);
            delete[] data;

            return true;

        } // audio_load_wav_bytes

} //namespace lumen

