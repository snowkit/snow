package lumen.audio;

import lumen.LumenTypes;

    //the generic versions of the sound info
import lumen.audio.system.Sound;
import lumen.audio.system.SoundStream;
import lumen.audio.system.AudioSystem;
    //the specific adapter of the sound types
import lumen.audio.system.AudioSystem.LumenAudioSystem;
import lumen.audio.system.AudioSystem.LumenSound;
import lumen.audio.system.AudioSystem.LumenSoundStream;

import lumen.assets.Assets;
import lumen.utils.ByteArray;

class Audio {

    public var lib : Lumen;
    public var system : LumenAudioSystem;

    var sound_list : Map<String, Sound>;
    var stream_list : Map<String, SoundStream>;

    public var active : Bool = false;

    public function new( _lib:Lumen ) {

        lib = _lib;

        system = new LumenAudioSystem(this, lib);

        system.init();

        sound_list = new Map();
        stream_list = new Map();

        active = true;

    } //new

    public function create( _id:String, ?_name:String = '', ?streaming:Bool = false ) : Sound {

        if(_name == '') {
            _name = lib.uniqueid;
        } //_name

            //try loading the sound asset, only reading the entire file if its not streaming
        var asset : AssetAudio = lib.assets.get_audio( _id, { load:!streaming } );
        var info : AudioInfo = null;

        if(asset != null) {
            info = asset.data;
        }

            //We always return a valid sound object, so code will be reliable
            //even if the sound is unable to play etc.

        var sound : Sound;

        if(!streaming) {

            sound = new LumenSound(this, _name, info);

        } else {

            var sound_stream = new LumenSoundStream(this, _name, info);
                //we store the sounds in a separate list
                //so that streams don't get bogged down by
                //lots of sound effects. This means you have
                //to remove it if not using the audio wrapper routes to cleanup
            stream_list.set(_name, sound_stream);
            sound = sound_stream;

        } //streaming

            //store for later
        sound_list.set(_name, sound);

        return sound;

    } //create

    public function get( _name:String ) : Sound {

        var _sound = sound_list.get(_name);

        if(_sound == null) {
            trace('/ lumen / sound not found, use create first: ${_name}');
        } //_sound

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

        if(!active) {
            return;
        }

        var sound = get(_name);
        if(sound != null) {
            sound.play();
        }
    } //play

    public function pause(_name:String) {

        if(!active) {
            return;
        }

        var sound = get(_name);
        if(sound != null) {
            sound.pause();
        }
    } //pause

    public function stop(_name:String) {

        if(!active) {
            return;
        }

        var sound = get(_name);
        if(sound != null) {
            sound.stop();
        }
    } //stop

    public function toggle(_name:String) {

        if(!active) {
            return;
        }

        var sound = get(_name);
        if(sound != null) {
            sound.toggle();
        }
    } //toggle

    public function destroy() {
        active = false;
        system.destroy();
    } //destroy

    public function update() {

        if(!active) {
            return;
        }

            //update the streaming sounds
            //they may or may not do anything
        for(_sound in stream_list) {
            if(_sound.playing) {
                _sound.internal_update();
            }
        }

        system.update();

    } //update

} //Audio