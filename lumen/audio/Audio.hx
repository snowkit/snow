package lumen.audio;

import lumen.LumenTypes;
import lumen.audio.system.AudioSystem;
import lumen.audio.system.AudioSystem.LumenAudioSystem;
import lumen.audio.system.AudioSystem.LumenSound;

import lumen.utils.Libs;
import lumen.utils.ByteArray;

class Audio {

    var lib : Lumen;    
    var system : LumenAudioSystem;

    var sound_list : Map<String, LumenSound>;

    public function new( _lib:Lumen ) {

        lib = _lib;

        system = new LumenAudioSystem(this, lib);

        system.init();

        sound_list = new Map();

    } //new

    public function create( _id:String, ?_name:String = '' ) : LumenSound {

        if(_name == '') {
            _name = uniqueid();
        } //_name

            //try loading the sound asset
        var ext : String = haxe.io.Path.extension(_id);
        var path : String = lib.assets.path(_id);

        var info : AudioInfo = null;

        switch(ext) {

            case 'wav' : {
                info = load_audio_wav(path);
            }

            case 'ogg' : {
                info = load_audio_ogg(path);
            }

            case 'pcm' : {
                info = load_audio_pcm(path);
            }

            default : {
                trace('/ lumen / audio file format unknown!? extension:${ext} / ${_id}');
            }
        }

        var sound : LumenSound = new LumenSound(this, info);

            sound.name = _name;

            //store for later
        sound_list.set(_name, sound);

        return sound;

    } //create

    public function get( _name:String ) : LumenSound {

        var _sound = sound_list.get(_name);

        if(_sound == null) {
            trace('/ lumen / sound not found, use create first: ${_name}');
        }

        return _sound;

    } //get

    public function volume( _name:String, _volume:Float ) {
        var sound = get(_name);
        if(sound != null) {
            sound.volume = _volume;
        }
    } //volume 

    public function pan( _name:String, _pan:Float ) {
        var sound = get(_name);
        if(sound != null) {
            sound.pan = _pan;
        }
    } //pan

    public function pitch( _name:String, _pitch:Float ) {
        var sound = get(_name);
        if(sound != null) {
            sound.pitch = _pitch;
        }
    } //pitch

    public function play(_name:String) {
        var sound = get(_name);
        if(sound != null) {
            sound.play();
        }
    } //play

    public function pause(_name:String) {
        var sound = get(_name);
        if(sound != null) {
            sound.pause();
        }
    } //pause

    public function stop(_name:String) {
        var sound = get(_name);
        if(sound != null) {
            sound.stop();
        }
    } //stop

    public function toggle(_name:String) {
        var sound = get(_name);
        if(sound != null) {
            sound.toggle();
        }
    } //toggle

    function uniqueid() : String {
        return haxe.crypto.Md5.encode(Std.string(lib.time*Math.random()));
    } //uniqueid

    public function destroy() {
        system.destroy();
    } //destroy

    public function update() {
        system.update();
    } //update

    public function load_audio_ogg( path:String ) : AudioInfo {
        return lumen_audio_load_ogg_bytes( path );
    } //load_audio_ogg

    public function load_audio_wav( path:String ) : AudioInfo {
        return lumen_audio_load_wav_bytes( path );
    } //load_audio_wav

    public function load_audio_pcm( path:String ) : AudioInfo {

        var data = ByteArray.readFile( path );

        if(data == null) {
            return null;
        }

            //hmm, need to investigate these flags here
        return {

            id : path,                      //file source
            format : AudioFormatType.pcm,   //format
            channels : 1,                   //number of channels
            rate : 44100,                   //hz rate
            bitrate : 88200,                //sound bitrate
            bits_per_sample : 16,           //bits per sample, 8 / 16
            data : data                     //sound raw data

        }; //AudioInfo

    } //load_audio_pcm

#if lumen_native

    static var lumen_audio_load_ogg_bytes = Libs.load( "lumen", "lumen_audio_load_ogg_bytes", 1 );
    static var lumen_audio_load_wav_bytes = Libs.load( "lumen", "lumen_audio_load_wav_bytes", 1 );

#end

} //Audio