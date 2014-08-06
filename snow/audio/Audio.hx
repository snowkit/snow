package snow.audio;

import snow.types.Types;

import snow.audio.Sound;
import snow.audio.AudioSystem;

import snow.assets.Assets;
import snow.assets.AssetAudio;
import snow.utils.ByteArray;

class Audio {

        /** access to platform specific implementation */
    public var platform : AudioSystem;
        /** Set to false to stop any and all processing in the audio system */
    public var active : Bool = false;

        /** for external access to the library by the systems */
    @:noCompletion public var lib : Snow;
        /** for mapping native handles to Sound instances. Use the `app.audio` to manipulate preferably. */
    @:noCompletion public var handles : Map<AudioHandle, Sound>;
        /** for mapping named sounds to Sound instances. Use the `app.audio` to manipulate preferably. */
    @:noCompletion public var sound_list : Map<String, Sound>;
        /** for mapping named streams to SoundStream instances. Use the `app.audio` to manipulate preferably. */
    @:noCompletion public var stream_list : Map<String, SoundStream>;

        /** constructed internally, use `app.audio` */
    @:noCompletion public function new( _lib:Snow ) {

        lib = _lib;

        platform = new AudioSystem(this, lib);

        platform.init();

        sound_list = new Map();
        stream_list = new Map();
        handles = new Map();

        active = true;

    } //new


//Public API


        /** Create a sound for playing. If no name is given, a unique id is assigned. Use the sound instance or the public api by name. */
    public function create( _id:String, ?_name:String = '', ?streaming:Bool = false ) : Sound {

        if(_name == '') {
            _name = lib.uniqueid;
        } //_name

            //We always return a valid sound object, so code will be reliable
            //even if the sound is unable to play etc

        var sound : Sound = null;

            //try loading the sound asset, only reading the entire file if its not streaming
        var _asset = lib.assets.audio( _id, { load:!streaming, onload:function(asset:AssetAudio) {

                    if(asset != null && sound != null) {
                        handles.set(asset.audio.handle, sound);
                        sound.info = asset.audio;
                    }

                } //onload
            } //options
        ); //audio


            if(!streaming) {

                sound = new Sound(this, _name);

            } else {

                var sound_stream = new SoundStream(this, _name);
                    //we store the streams in a separate list
                    //so that they don't get bogged down by
                    //lots of sound effects. This means you have
                    //to remove it if not using the audio wrapper routes to cleanup
                stream_list.set(_name, sound_stream);
                    //set the higher typed one for return
                sound = sound_stream;

            } //streaming

                //store for later
            sound_list.set(_name, sound);

        return sound;

    } //create

        /** Destroy a sound instance by name. Use sound_instance.destroy() if you have an instance already. */
    public function uncreate( _name:String ) {

        var _sound = sound_list.get(_name);

        if(_sound == null) {
            trace('/ snow / can\'t find sound, unable to uncreate, use create first: ${_name}');
        } //_sound

            //kill the sound
        _sound.destroy();

    } //uncreate

        /** Get a sound instance by name */
    public function get( _name:String ) : Sound {

        var _sound = sound_list.get(_name);

        if(_sound == null) {
            trace('/ snow / sound not found, use create first: ${_name}');
        } //_sound

        return _sound;

    } //get

        /** Get/Set the volume of a sound instance by name.
            Leave the second argument blank to return the current value. */
    public function volume( _name:String, ?_volume:Float ) : Float {
        var sound = get(_name);
        if(sound != null) {
            if(_volume != null) {
                return sound.volume = _volume;
            } else {
                return sound.volume;
            }
        }
        return 0;
    } //volume

        /** Get/Set the pan of a sound instance by name
            Leave the second argument blank to return the current value.  */
    public function pan( _name:String, ?_pan:Float ) {
        var sound = get(_name);
        if(sound != null) {
            if(_pan != null) {
                return sound.pan = _pan;
            } else {
                return sound.pan;
            }
        }
        return 0;
    } //pan

        /** Get/Set the pitch of a sound instance by name
            Leave the second argument blank to return the current value.  */
    public function pitch( _name:String, ?_pitch:Float ) {
        var sound = get(_name);
        if(sound != null) {
            if(_pitch != null) {
                return sound.pitch = _pitch;
            } else {
                return sound.pitch;
            }
        }
        return 0;
    } //pitch

        /** Get/Set the position **in seconds** of a sound instance by name.
            Leave the second argument blank to return the current value.  */
    public function position( _name:String, ?_position:Float ) {
        var sound = get(_name);
        if(sound != null) {
            if(_position != null) {
                return sound.position = _position;
            } else {
                return sound.position;
            }
        }
        return 0;
    } //position

        /** Get the duration of a sound instance by name.
            Duration is set from the sound instance, so it is read only. */
    public function duration( _name:String ) {
        var sound = get(_name);
        if(sound != null) {
            return sound.duration;
        }
        return 0;
    } //duration

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

        /** Loop a sound instance by name, indefinitely. Use stop to end it */
    public function loop(_name:String) {

        if(!active) {
            return;
        }

        var sound = get(_name);
        if(sound != null) {
            sound.loop();
        }
    } //loop

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

        /** Stop managing a sound instance */
    @:noCompletion public function kill( _sound:Sound ) {

        handles.remove(_sound.info.handle);
        sound_list.remove(_sound.name);
        stream_list.remove(_sound.name);

    } //kill

        /** Called by Snow when a system event is dispatched */
    @:noCompletion public function on_event( _event:SystemEvent ) {

        if(_event.type == SystemEventType.app_willenterbackground) {

            active = false;

            for(sound in stream_list) {
                sound.internal_pause();
            }

            platform.suspend();

        } else if(_event.type == SystemEventType.app_willenterforeground) {

            active = true;

            platform.resume();

            for(sound in stream_list) {
                sound.internal_play();
            }

        } //willenterforeground

    } //on_event

        /** Called by Snow, cleans up sounds/system */
    @:noCompletion public function destroy() {

        active = false;

        for(sound in sound_list) {
            sound.destroy();
        }

        platform.destroy();

    } //destroy

        /** Called by Snow, update any sounds / streams */
    @:noCompletion public function update() {

        if(!active) {
            return;
        }

        for(_sound in sound_list) {
            if(_sound.playing) {
                _sound.internal_update();
            }
        }

        platform.process();

    } //update


} //Audio
