package lumen.audio.system;

import lumen.audio.Audio;
import lumen.types.Types;

import lumen.audio.system.Sound;
import lumen.utils.ByteArray;

//The base class for a streaming sound instance


class SoundStream extends Sound {

        /** The length of bytes for a single buffer to queue up to stream. Default is `176400`, about 1 second in 16 bit mono. `todo` optionize */
    public var buffer_length : Int = 176400; 
        /** The number of buffers to use in the queue for streaming. Default is `4` `todo` optionize */
    public var buffer_count : Int = 4; //:todo: optionize.
        /** The get function, assign a function here if you want to stream data to the source manually, like generative sound. */
    public var data_get : Int->Int->AudioDataBlob;
        /** The seek function, assign a function here if you want to stream data to the source manually, like generative sound. */
    public var data_seek : Int->Bool;

    public function new( _manager:Audio, _name:String, _audio_info : AudioInfo ) {
        
        super(_manager, _name, _audio_info);

        data_get = default_data_get;
        data_seek = default_data_seek;

    } //new

        /** Default data seek implementation uses `assets.audio_seek_source` */
    public function default_data_seek( _to:Int ) : Bool {

        manager.lib.assets.audio_seek_source( info, _to );

        return true;

    } //default_data_seek

        /** Default data get implementation uses `assets.audio_load_portion` */
    public function default_data_get( _start:Int, _length:Int ) : AudioDataBlob {

        return manager.lib.assets.audio_load_portion( info, _start, _length );

    } //default_data_get


} //SoundStream
