package snow.audio;

import snow.audio.Audio;
import snow.types.Types;

import snow.utils.AbstractClass;

#if snow_web

    #if snow_audio_howlerjs
        typedef Sound = snow.platform.web.audio.howlerjs.Sound;
        typedef SoundStream = snow.platform.web.audio.howlerjs.SoundStream;
    #else
        typedef Sound = snow.platform.web.audio.Sound;
        typedef SoundStream = snow.platform.web.audio.SoundStream;
    #end

#else

    #if snow_audio_openal
        typedef Sound = snow.platform.native.audio.openal.Sound;
        typedef SoundStream = snow.platform.native.audio.openal.SoundStream;
    #else
        typedef Sound = snow.platform.native.audio.Sound;
        typedef SoundStream = snow.platform.native.audio.SoundStream;
    #end

#end



//The base class for a sound or sound stream instance.
//This can't be abstract like the other bindings due to so much shared code,
//it's cleaner to keep this all in here instead

@:noCompletion class SoundBinding {

        /** The `Audio` system handling this sound */
    public var manager : Audio;
        /** The name of this sound */
    public var name : String = '';

        /** If the sound is playing */
    public var playing : Bool = false;
        /** If the sound is paused */
    public var paused : Bool = false;
        /** If the sound is a stream source */
    public var is_stream : Bool = false;

        /** The `AudioInfo` this sound is created from. When assigning this it will clean up and set itself to this info instead. */
    @:isVar public var info     (get,set) : AudioInfo;
        /** The pitch of this sound */
    @:isVar public var pitch    (get,set) : Float = 1.0;
        /** The volume of this sound */
    @:isVar public var volume   (get,set) : Float = 1.0;
        /** The pan of this sound. Pan only logically works on mono sounds, and is by default 2D sounds  */
    @:isVar public var pan      (get,set) : Float = 0.0;
        /** If the sound is looping or not */
    @:isVar public var looping  (get,set) : Bool = false;
        /** The current playback time of this sound in `seconds` */
    @:isVar public var time     (get,set) : Float = 0.0;
        /** The duration of this sound, in `bytes` */
    @:isVar public var duration (get,never) : Float = 0.0;

//Construct

    public function new( _manager:Audio, _name:String ) {

        name = _name;
        manager = _manager;

    } //new

//Abstract functions implemented in concrete platform level

        /** Play this sound */
    public function play() {}
        /** Loop this sound */
    public function loop() {}
        /** Stop this sound */
    public function stop() {}
        /** Pause this sound */
    public function pause() {}
        /** Destroy this sound and it's data */
    public function destroy() {}

// Internal system events

    @:noCompletion public function internal_update() {}
    @:noCompletion public function internal_play()  {}
    @:noCompletion public function internal_loop() {}
    @:noCompletion public function internal_stop() {}
    @:noCompletion public function internal_pause() {}

//Shared implementations

        /** Toggle this sound */
    public function toggle() {

        playing = !playing;

        if(playing) {
            if(looping) {
                loop();
            } else {
                play();
            }
        } else {
            pause();
        }

    } //toggle

    function get_info() : AudioInfo {
        return info;
    }

    function set_info( _info:AudioInfo ) : AudioInfo {
        return info = _info;
    }

    function get_pan() : Float {
        return pan;
    } //get_pan

    function get_pitch() : Float {
        return pitch;
    } //get_pitch

    function get_volume() : Float {
        return volume;
    } //get_volume

    function get_looping() : Bool {
        return looping;
    } //get_looping

    function get_time() : Float {
        return time;
    } //get_time

        //overridden in platform concrete
    function get_duration() : Float {
        return 0;
    } //get_duration

    function set_pan( _pan:Float ) : Float {
        return pan = _pan;
    } //set_pan

    function set_pitch( _pitch:Float ) : Float {
        return pitch = _pitch;
    } //set_pitch

    function set_volume( _volume:Float ) : Float {
        return volume = _volume;
    } //set_volume

    function set_time( _time:Float ) : Float {
        return time = _time;
    } //set_time

    function set_looping( _looping:Bool ) : Bool {
        return looping = _looping;
    } //set_looping


} //Sound
