package lumen.audio;

import lumen.LumenTypes;
import lumen.audio.system.AudioSystem;
import lumen.audio.system.AudioSystem.LumenAudioSystem;
import lumen.audio.system.AudioSystem.LumenSound;

import lumen.assets.Assets;
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
        var asset : AssetAudio = lib.assets.get_audio(_id);
            //but we always return a valid sound object, so code will be reliable
            //even if the sound is unable to play etc.
        var info : AudioInfo = null;

        if(asset != null) {
            info = asset.data;
        }

            //create and reeturn the sound object
        var sound : LumenSound = new LumenSound(this, info);
                //update name
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

} //Audio