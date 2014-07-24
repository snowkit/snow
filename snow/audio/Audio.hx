package snow.audio;

import snow.types.Types;

import snow.audio.Sound;
import snow.audio.AudioSystem;

import snow.assets.Assets;
import snow.assets.AssetAudio;
import snow.utils.ByteArray;

class Audio {

        /** The implementation of the current audio system */
    public var system : AudioSystem;
        /** Set to false to stop any and all processing in the audio system */
    public var active : Bool = false;
        //for external access to the library by the systems
    @:noCompletion public var lib : Snow;

    var sound_list : Map<String, Sound>;
    var stream_list : Map<String, SoundStream>;

    @:noCompletion public function new( _lib:Snow ) {

        lib = _lib;

        system = new AudioSystem(this, lib);

        system.init();

        sound_list = new Map();
        stream_list = new Map();

        active = true;

    } //new


//Public API


        /** Create a sound for playing. If no name is given, a unique id is assigned. Use the sound instance or the public api by name. */
    public function create( _id:String, ?_name:String = '', ?streaming:Bool = false ) : Sound {

        if(_name == '') {
            _name = lib.uniqueid;
        } //_name

            //try loading the sound asset, only reading the entire file if its not streaming
        var asset : AssetAudio = lib.assets.audio( _id, { load:!streaming } );
        var info : AudioInfo = null;

        if(asset != null) {
            info = asset.data;
        }

            //We always return a valid sound object, so code will be reliable
            //even if the sound is unable to play etc.

        var sound : Sound;

        if(!streaming) {

            sound = new Sound(this, _name, info);

        } else {

            var sound_stream = new SoundStream(this, _name, info);
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

        /** Get a sound instance by name */
    public function get( _name:String ) : Sound {

        var _sound = sound_list.get(_name);

        if(_sound == null) {
            trace('/ snow / sound not found, use create first: ${_name}');
        } //_sound

        return _sound;

    } //get

        /** Set the volume of a sound instance by name */
    public function volume( _name:String, _volume:Float ) {
        var sound = get(_name);
        if(sound != null) {
            sound.volume = _volume;
        }
    } //volume

        /** Set the pan of a sound instance by name */
    public function pan( _name:String, _pan:Float ) {
        var sound = get(_name);
        if(sound != null) {
            sound.pan = _pan;
        }
    } //pan

        /** Set the pitch of a sound instance by name */
    public function pitch( _name:String, _pitch:Float ) {
        var sound = get(_name);
        if(sound != null) {
            sound.pitch = _pitch;
        }
    } //pitch

        /** Play a sound instance by name */
    public function play(_name:String) {

        if(!active) {
            return;
        }

        var sound = get(_name);
        if(sound != null) {
            sound.play();
        }
    } //play

        /** Pause a sound instance by name */
    public function pause(_name:String) {

        if(!active) {
            return;
        }

        var sound = get(_name);
        if(sound != null) {
            sound.pause();
        }
    } //pause

        /** Stop a sound instance by name */
    public function stop(_name:String) {

        if(!active) {
            return;
        }

        var sound = get(_name);
        if(sound != null) {
            sound.stop();
        }
    } //stop

        /** Toggle a sound instance by name, pausing the sound */
    public function toggle(_name:String) {

        if(!active) {
            return;
        }

        var sound = get(_name);
        if(sound != null) {
            sound.toggle();
        }
    } //toggle


//Internal API


        //system events
    @:noCompletion public function on_event( _event:SystemEvent ) {

        if(_event.type == SystemEventType.app_willenterbackground) {

            active = false;

            for(sound in stream_list) {
                sound.internal_pause();
            }

            system.suspend();

        } else if(_event.type == SystemEventType.app_willenterforeground) {

            active = true;

            system.resume();

            for(sound in stream_list) {
                sound.internal_play();
            }

        } //willenterforeground

    } //on_event

    @:noCompletion public function destroy() {

        active = false;

        for(sound in sound_list) {
            sound.destroy();
        }

        system.destroy();

    } //destroy

    @:noCompletion public function update() {

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

        system.process();

    } //update



} //Audio
