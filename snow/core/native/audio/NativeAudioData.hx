package snow.core.native.audio;

import snow.types.Types;
import snow.api.Debug.*;
import snow.api.Promise;
import snow.api.buffers.Uint8Array;

import snow.core.Audio.audio_format_from_path;

import snow.core.native.audio.AudioDataOGG;
import snow.core.native.audio.AudioDataPCM;
import snow.core.native.audio.AudioDataWAV;

/** A helper for common native AudioData providers. 
    Audio modules can use this for the implementation of `data_from_load` / `data_from_bytes` */
class NativeAudioData {

    //Implementation details

            /** Promises an AudioData instance from the given path */        
        public static function data_from_load(app:snow.Snow, _path:String, ?_is_stream:Bool=false, ?_format:AudioFormatType) : Promise {
            
            assertnull(_path);

            if(_format == null) _format = audio_format_from_path(_path);

            return new Promise(function(resolve,reject) {

                var _audio = data_from_load_direct(app, _path, _is_stream, _format);

                if(_audio == null) {
                    reject(Error.error('failed to load `$_path` as `$_format` audio.'));
                } else {
                    resolve(_audio);
                }

            }); //promise

        } //data_from_load

            /** Promises an AudioData instance from the given bytes */            
        public static function data_from_bytes(app:snow.Snow, _id:String, _bytes:Uint8Array, ?_format:AudioFormatType) : Promise {

            assertnull(_id);
            assertnull(_bytes);

            return new Promise(function(resolve, reject) {

                var _audio = data_from_bytes_direct(app, _id, _bytes, _format);

                if(_audio == null) {
                    reject(Error.error('failed to load `$_id` from bytes as ${_format}.'));
                } else {
                    resolve(_audio);
                }

            }); //promise

        } //data_from_bytes

    //Direct implementation (without the Promise wrapper)

            /** Returns an AudioData from the given path */
        public static function data_from_load_direct(app:snow.Snow, _path:String, ?_is_stream:Bool=false, ?_format:AudioFormatType) : AudioData {

            assertnull(_path);

            if(_format == null) _format = audio_format_from_path(_path);

            var _info = switch(_format) {
                case af_wav: WAV.from_file(app, _path, _is_stream);
                case af_ogg: OGG.from_file(app, _path, _is_stream);
                case af_pcm: PCM.from_file(app, _path, _is_stream);
                case _: null;
            } //switch _format

            return _info;

        } //data_from_load_direct

            /** Returns an AudioData instance from the given bytes */            
        public static function data_from_bytes_direct(app:snow.Snow, _id:String, _bytes:Uint8Array, ?_format:AudioFormatType) : AudioData {

            assertnull(_id);
            assertnull(_bytes);

            if(_format == null) _format = audio_format_from_path(_id);

            var _info = switch(_format) {
                case af_wav: WAV.from_bytes(app, _id, _bytes);
                case af_ogg: OGG.from_bytes(app, _id, _bytes);
                case af_pcm: PCM.from_bytes(app, _id, _bytes);
                case _ : null;
            } //switch _format

            return _info;

        } //data_from_bytes


} //NativeAudioData
