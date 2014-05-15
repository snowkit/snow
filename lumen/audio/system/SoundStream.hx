package lumen.audio.system;

import lumen.audio.Audio;
import lumen.LumenTypes;

import lumen.audio.system.Sound;
import lumen.utils.ByteArray;

//The base class for a streaming sound instance

class SoundStream extends Sound {

        //the length of bytes for a single buffer
        //:todo: making it a bit bigger to slow down debug printing
    public var buffer_length : Int = 48000*8; //:todo: optionize.

        //assign this to handle streaming bytes yourself
    public var data_get : Int->Int->ByteArray;
    public var data_seek : Int->Bool;

    public function new( _manager:Audio, _name:String, _audio_info : AudioInfo ) {
        
        super(_manager, _name, _audio_info);

        data_get = default_data_get;
        data_seek = default_data_seek;

    } //new

    public function default_data_seek( _to:Int ) : Bool {

        trace('data_seek ( ${_to} )');
        manager.lib.assets.audio_seek_source( info, _to );

        return true;

    } //default_data_seek

    public function default_data_get( _start:Int, _length:Int ) : ByteArray {

        return manager.lib.assets.audio_load_portion( info, _start, _length, looping );

    } //default_data_get


}