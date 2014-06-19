
#include "assets/lumen_assets_audio.h"

#include "lumen_core.h"

#include <string>


namespace lumen {
    namespace assets {
        namespace audio {


        //OGG files

                //forward
            static size_t   ogg_read_func(void* ptr, size_t size, size_t nmemb, void* datasource);
            static int      ogg_seek_func(void* datasource, ogg_int64_t offset, int whence);
            static int      ogg_close_func(void* datasource);
            static long     ogg_tell_func(void* datasource);


                //load an ogg info object, if read is false it will not read any data from the file, just open and setup the info/comments
            bool load_info_ogg( QuickVec<unsigned char> &out_buffer, const char* _id, OGG_file_source*& ogg_source, bool read ) {

                ogg_source = new OGG_file_source();
                ogg_source->source_name = std::string(_id);

                ogg_source->callbacks = ov_callbacks();

                    ogg_source->callbacks.read_func = &ogg_read_func;
                    ogg_source->callbacks.seek_func = &ogg_seek_func;
                    ogg_source->callbacks.close_func = &ogg_close_func;
                    ogg_source->callbacks.tell_func = &ogg_tell_func;

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

                seek_bytes_ogg(ogg_source, 0);

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
                    read_bytes_ogg( ogg_source, out_buffer, 0, total_length );
                }

                    //yay.
                return true;

            } //load_info_ogg


            bool seek_bytes_ogg( OGG_file_source* ogg_source, long to ) {

                if(ogg_source) {

                    // lumen::log("seeking in %s ogg source to %d/%d (%f)", ogg_source->source_name.c_str(), to, ogg_source->length_pcm, (float)to / (float)ogg_source->length_pcm);

                        //:todo: ogg is always 16?
                    long to_samples = to/16;

                        //pcm seek is in samples, not bytes
                    int res = ov_pcm_seek( ogg_source->ogg_file, to_samples );

                    if(res != 0) {

                        if(res == OV_ENOSEEK) {
                            lumen::log("/ lumen / audio / ogg seek error %s", "OV_ENOSEEK");
                        }
                        if(res == OV_EINVAL) {
                            lumen::log("/ lumen / audio / ogg seek error %s", "OV_EINVAL");
                        }
                        if(res == OV_EREAD) {
                            lumen::log("/ lumen / audio / ogg seek error %s", "OV_EREAD");
                        }
                        if(res == OV_EFAULT) {
                            lumen::log("/ lumen / audio / ogg seek error %s", "OV_EFAULT");
                        }
                        if(res == OV_EBADLINK) {
                            lumen::log("/ lumen / audio / ogg seek error %s", "OV_EBADLINK");
                        }

                        return false;
                    }

                    // lumen::log("seeking ogg_source %d res:%d", to, res);

                    return true;
                }

                return false;

            } //seek_bytes_ogg


                //this reads a portion of an already opened ogg source into the buffer from start, for len
            bool read_bytes_ogg( OGG_file_source* ogg_source, QuickVec<unsigned char> &out_buffer, long start, long len ) {

                //it is assumed here that ogg_source is opened. Maybe we can ask the file if it is open and if not reopen it?

                bool complete = false;
                int word = 2; //1 for 8 bit, 2 for 16 bit. 2 is typical
                int sgned = 1; //0 for unsigned, 1 is typical
                int bit_stream = 1;

                long _read_len = len;

                if(start != -1) {
                    // lumen::log("start was %d, skipping there first", start);
                    seek_bytes_ogg( ogg_source, start );
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
                        complete = true;
                    }

                    if(total_read >= _read_len) {
                        reading = false;
                    }

                } //while

                    //we need the buffer length to reflect the real size,
                    //just in case it read shorter than requested
                if(total_read != _read_len) {
                    out_buffer.resize(total_read);
                }

                return complete;

            } //read_bytes_ogg


            static size_t ogg_read_func(void* ptr, size_t size, size_t nmemb, void* datasource) {

                OGG_file_source *source = (OGG_file_source*)datasource;

                // lumen::log("\t read  : %s, filelen:%lld amount:%lu\n", source->source_name.c_str(),source->length, size * nmemb);

                return lumen::ioread(source->file_source, ptr, size, nmemb);

            } //read_func

            static int ogg_seek_func(void* datasource, ogg_int64_t offset, int whence) {

                OGG_file_source *source = (OGG_file_source*)datasource;

                int _type = whence;

                switch (whence) {

                    case SEEK_SET: {
                        _type = lumen_seek_set;
                        break;
                    }
                    case SEEK_CUR: {
                        _type = lumen_seek_cur;
                        break;
                    }
                    case SEEK_END: {
                        _type = lumen_seek_end;
                        break;
                    }

                } //switch(whence)

                // lumen::log("\t seek  : %s, offset:%lld whence:%d \n", source->source_name.c_str(), offset, _type);

                return lumen::ioseek(source->file_source, offset, _type);

            } //seek_func

            static int ogg_close_func(void* datasource) {

                OGG_file_source *source = (OGG_file_source*)datasource;

                // lumen::log("ogg closing the file source for %s", source->source_name.c_str());

                return lumen::ioclose(source->file_source);

            } //close_func

            static long ogg_tell_func(void* datasource) {

                OGG_file_source *source = (OGG_file_source*)datasource;

                return (long)lumen::iotell(source->file_source) - source->offset;

            } //tell_func

            std::string ogg_error_string(int code) {

                switch(code) {

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

            } //ogg_error_string




        //WAV files




            struct RIFF_Header {
                char ID[4];
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



            bool wav_confirm_header(RIFF_Header &header) {

                //ID should be == "RIFF"
                //format should == "WAVE"

                if( (header.ID[0] != 'R' || header.ID[1] != 'I' || header.ID[2] != 'F' || header.ID[3] != 'F')   ||
                    (header.format[0] != 'W' || header.format[1] != 'A' || header.format[2] != 'V' || header.format[3] != 'E' ) ) {
                    return false;
                }

                return true;

            } //wav_confirm_header


            bool load_info_wav( QuickVec<unsigned char> &out_buffer, const char *_id, WAV_file_source*& wav_source, bool read ) {

                // http://www.dunsanyinteractive.com/blogs/oliver/?p=72

                wav_source = new WAV_file_source();
                wav_source->source_name = std::string(_id);
                wav_source->file_source = lumen::iosrc_fromfile(_id, "rb");

                if (!wav_source->file_source) {
                    lumen::log("/ lumen / cannot open wav file from %s", _id);
                    return false;
                }

                    //for checking validity of the header
                RIFF_Header riff_header;

                    // Read in the first chunk into the struct
                int result = lumen::ioread(wav_source->file_source, &riff_header, sizeof(RIFF_Header), 1);

                    //check for RIFF and WAVE tag in memory
                if( !wav_confirm_header(riff_header) ) {
                    lumen::log("%s : %s\n", _id, "RIFF or WAVE header not found, is this a WAV file?");
                    return false;
                } //!wav header


                long int current_head = 0;
                bool found_format = false;
                WAVE_Format wave_format;

                while (!found_format) {

                        // Save the current position indicator of the stream
                    current_head = lumen::iotell(wav_source->file_source);

                        //Read in the 2nd chunk for the wave info
                    result = lumen::ioread(wav_source->file_source, &wave_format, sizeof(WAVE_Format), 1);

                    if (result != 1) {
                        lumen::log("%s : %s\n", _id, "Invalid WAV format!");
                        return false;
                    }

                    //check for fmt tag in memory
                    if( wave_format.subChunkID[0] != 'f' ||
                        wave_format.subChunkID[1] != 'm' ||
                        wave_format.subChunkID[2] != 't' ||
                        wave_format.subChunkID[3] != ' '
                    ) {
                        lumen::ioseek(wav_source->file_source, wave_format.subChunkSize, lumen_seek_cur);
                    } else {
                        found_format = true;
                    }

                } //while !found_format

                    //check for extra parameters;
                if (wave_format.subChunkSize > 16) {
                    lumen::ioseek(wav_source->file_source, sizeof(short), lumen_seek_cur);
                }

                bool found_data = false;
                WAVE_Data wave_data;

                while (!found_data) {

                    //Read in the the last byte of data before the sound file
                    result = lumen::ioread(wav_source->file_source, &wave_data, sizeof(WAVE_Data), 1);

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
                        lumen::ioseek(wav_source->file_source, current_head + sizeof(WAVE_Data) + wave_format.subChunkSize, lumen_seek_set);
                    } else {
                        found_data = true;
                    }

                } //!found_data

                    //we need to store the start of the data for when we want to rewind to the
                    //beginning, for example, when doing a stream from the file and looping
                wav_source->data_start = lumen::iotell(wav_source->file_source);
                    //store the size of the wav data
                wav_source->length = wave_data.subChunkSize;
                    //since wav is uncompressed, it's size matches
                wav_source->length_pcm = wav_source->length;
                    //assign the sound format values
                wav_source->rate = wave_format.sampleRate;
                wav_source->bitrate = (int)wave_format.byteRate;
                wav_source->channels = wave_format.numChannels;
                wav_source->bits_per_sample = wave_format.bitsPerSample;

                if(read) {
                    read_bytes_wav( wav_source, out_buffer, -1, wav_source->length_pcm );
                }

                return true;

            } // load_info_wav


            bool seek_bytes_wav( WAV_file_source* wav_source, long to ) {

                if(wav_source) {

                        //start at the wav data for seeking, ignoring the header stuff now
                    lumen::log("jumping to %d+%d/%d", wav_source->data_start, to, wav_source->length_pcm);
                    lumen::ioseek(wav_source->file_source, wav_source->data_start + to, lumen_seek_set);

                    return true;

                }

                return false;

            } //seek_bytes_wav


            bool read_bytes_wav( WAV_file_source* wav_source, QuickVec<unsigned char> &out_buffer, long start, long len ) {

                long _read_len = len;
                bool complete = false;

                if(start != -1) {
                    lumen::log("/ lumen / wav / start was %d, skipping there first", start);
                    seek_bytes_wav( wav_source, start );
                }

                    //read the data into the given buffer
                int n_elements = 1;
                long current_pos = (lumen::iotell( wav_source->file_source ) - wav_source->data_start);
                long distance_to_end = wav_source->length_pcm - current_pos;

                    //if we are reading near the end of the file,
                    //mark complete as true because there is no more data
                if(distance_to_end <= _read_len) {
                    _read_len = distance_to_end;
                    complete = true;
                }


                if(_read_len > 0) {

                    lumen::log("/ lumen / wav / reading %d bytes from %d", _read_len, start);

                        //resize to fit the requested/remaining length
                    out_buffer.resize(_read_len);

                        //read from the wav source
                    long elements_read = lumen::ioread( wav_source->file_source, (char*)out_buffer.begin(), _read_len, n_elements);

                        //if no elements were read, it was an error
                        //or end of file so either way it's complete.
                    if(elements_read == 0) {
                        complete = true;
                    } //elements_read == 0

                    lumen::log("/ lumen / wav / total read %d bytes, complete? %d", _read_len, complete);

                } //_read_len > 0

                return complete;

            } //read_bytes_wav




        //PCM files




            bool load_info_pcm( QuickVec<unsigned char> &out_buffer, const char *_id, PCM_file_source*& pcm_source, bool read ) {

                pcm_source = new PCM_file_source();
                pcm_source->source_name = std::string(_id);
                pcm_source->file_source = lumen::iosrc_fromfile(_id, "rb");

                if (!pcm_source->file_source) {
                    lumen::log("/ lumen / cannot open pcm file from %s", _id);
                    return false;
                }

                lumen::ioseek(pcm_source->file_source, 0, lumen_seek_end);

                    pcm_source->length = lumen::iotell(pcm_source->file_source);
                    pcm_source->length_pcm = pcm_source->length;

                lumen::ioseek(pcm_source->file_source, 0, lumen_seek_set);

                    //assign the sound format values, these are defaults
                    //and need to be assigned on the haxe side if you want different values,
                    //right before creating the sound itself...
                pcm_source->rate = 44100;
                pcm_source->bitrate = 88200;
                pcm_source->channels = 1;
                pcm_source->bits_per_sample = 16;

                if(read) {
                    read_bytes_pcm( pcm_source, out_buffer, -1, pcm_source->length_pcm );
                }

                return true;

            } //load_info_pcm


            bool seek_bytes_pcm( PCM_file_source* pcm_source, long to ) {

                if(pcm_source) {

                        //start at the pcm data for seeking, ignoring the header stuff now
                    lumen::ioseek(pcm_source->file_source, to, lumen_seek_set);

                    return true;

                } //pcm_source

                return false;

            } //seek_bytes_pcm


            bool read_bytes_pcm( PCM_file_source* pcm_source, QuickVec<unsigned char> &out_buffer, long start, long len ) {

                long _read_len = len;
                bool complete = false;

                if(start != -1) {
                    lumen::log("/ lumen / pcm / start was %d, skipping there first", start);
                    seek_bytes_pcm( pcm_source, start );
                }

                    //read the data into the given buffer
                int n_elements = 1;
                long current_pos = lumen::iotell( pcm_source->file_source );
                long distance_to_end = pcm_source->length_pcm - current_pos;

                    //if we are reading near the end of the file,
                    //mark complete as true because there is no more data
                if(distance_to_end <= _read_len) {
                    _read_len = distance_to_end;
                    complete = true;
                }

                if(_read_len > 0) {

                    lumen::log("/ lumen / pcm / reading %d bytes from %d", _read_len, start);

                        //resize to fit the requested/remaining length
                    out_buffer.resize(_read_len);

                        //read from the pcm source
                    long elements_read = lumen::ioread( pcm_source->file_source, (char*)out_buffer.begin(), _read_len, n_elements);

                        //if no elements were read, it was an error
                        //or end of file so either way it's complete.
                    if(elements_read == 0) {
                        complete = true;
                    } //elements_read == 0

                    lumen::log("/ lumen / pcm / total read %d bytes, complete? %d", _read_len, complete);

                } //_read_len > 0

                return complete;

            } //read_bytes_pcm


        } //assets::audio namespace
    } //assets namespace
} //lumen namespace
