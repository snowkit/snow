package lumen.audio.system;

import lumen.audio.Audio;
import lumen.LumenTypes;

//The base class for a sound instance

class Sound {
    
    public var manager : Audio;
    public var info : AudioInfo;
    public var name : String = '';

    @:isVar public var pitch    (get,set) : Float = 1.0;
    @:isVar public var volume   (get,set) : Float = 1.0;
    @:isVar public var pan      (get,set) : Float = 0.0;

    public function new( _manager:Audio, _name:String, _audio_info : AudioInfo ) {

        name = _name;
        manager = _manager;
        info = _audio_info;

    } //new

    public function play() {}
    public function stop() {}
    public function pause() {}
    public function toggle() {}

    function get_pitch() : Float {
        return pitch;
    } //get_pitch

    function get_volume() : Float {
        return volume;
    } //get_volume

    function get_pan() : Float {
        return pan;
    } //get_pan

    function set_pan( _pan:Float ) : Float {
        return pan = _pan;
    } //set_pan

    function set_pitch( _pitch:Float ) : Float {
        return pitch = _pitch;
    } //set_pitch

    function set_volume( _volume:Float ) : Float {
        return volume = _volume;
    } //set_volume

}