package lumen.audio;

import lumen.audio.Audio;
import lumen.types.Types;

import lumen.utils.AbstractClass;

#if lumen_html5
    
    #if lumen_audio_howlerjs
        typedef Sound = lumen.platform.html5.audio.howlerjs.Sound;
        typedef SoundStream = lumen.platform.html5.audio.howlerjs.SoundStream;
    #else
        typedef Sound = lumen.platform.html5.audio.Sound;
        typedef SoundStream = lumen.platform.html5.audio.SoundStream;
    #end

#else 

    #if lumen_audio_openal
        typedef Sound = lumen.platform.native.audio.openal.Sound;
        typedef SoundStream = lumen.platform.native.audio.openal.SoundStream;
    #else
        typedef Sound = lumen.platform.native.audio.Sound;
        typedef SoundStream = lumen.platform.native.audio.SoundStream;
    #end 

#end 



//The base class for a sound or sound stream instance.
//This can't be abstract like the other bindings due to so much shared code, 
//it's cleaner to keep this all in here instead

@:noCompletion class SoundBinding {

        /** The `Audio` system handling this sound */
    public var manager : Audio;
        /** The `AudioInfo` this sound is created from */
    public var info : AudioInfo;
        /** The name of this sound */
    public var name : String = '';

        /** If the sound is playing */
    public var playing : Bool = false;
        /** If the sound is paused */
    public var paused : Bool = false;
        /** If the sound is a stream source */
    public var is_stream : Bool = false;

        /** The pitch of this sound */
    @:isVar public var pitch    (get,set) : Float = 1.0;
        /** The volume of this sound */
    @:isVar public var volume   (get,set) : Float = 1.0;
        /** The pan of this sound. Pan only logically works on mono sounds, and is by default 2D sounds  */
    @:isVar public var pan      (get,set) : Float = 0.0;
        /** If the sound is looping or not */
    @:isVar public var looping  (get,set) : Bool = false;
        /** The current playback position of this sound in `bytes` */
    @:isVar public var position (get,set) : Int = 0;
        /** The current playback time of this sound in `seconds` */
    @:isVar public var time     (get,set) : Float = 0.0;
        /** The length of this sound in `seconds` */
    @:isVar public var length   (get,never) : Int = 0;
        /** The duration of this sound, in `bytes` */
    @:isVar public var duration (get,never) : Float = 0.0;

//Construct

    public function new( _manager:Audio, _name:String, _audio_info : AudioInfo ) {

        name = _name;
        manager = _manager;
        info = _audio_info;

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

        /** A helper for converting bytes to seconds for this sound source, using the format settings specific to this sound */
    public function bytes_to_seconds( _bytes:Int ) : Float {

        var word = info.bits_per_sample == 16 ? 2 : 1;
        var sample_frames = (info.rate * info.channels * word);

        return _bytes / sample_frames;

    } //bytes_to_seconds

        /** A helper for converting seconds to bytes for this sound source, using the format settings specific to this sound */
    public function seconds_to_bytes( _seconds:Float ) : Int {
        
        var word = info.bits_per_sample == 16 ? 2 : 1;
        var sample_frames = (info.rate * info.channels * word);

        return Std.int(_seconds * sample_frames);
    
    } //seconds_to_bytes

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

    function get_position() : Int {
        return position;
    } //get_position

    function get_time() : Float {
        return time;
    } //get_time

    function get_length() : Int {
        return info.length_pcm;
    } //get_length

    function get_duration() : Float {
        return bytes_to_seconds(length);
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

    function set_position( _position:Int ) : Int {
        return position = _position;
    } //set_position

    function set_time( _time:Float ) : Float {
        return time = _time;
    } //set_time

    function set_looping( _looping:Bool ) : Bool {
        return looping = _looping;
    } //set_looping


} //Sound
