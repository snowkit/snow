package snow.platform.native.audio;

import snow.audio.Audio;
import snow.types.Types;

    //This is not needlessly empty, it binds an empty platform binding where no implementation exists

class Sound extends snow.audio.Sound.SoundBinding {


        /** The length of this sound in `seconds` */
    @:isVar public var length   (get,never) : Int = 0;
        /** The current playback position of this sound in `bytes` */
    @:isVar public var position (get,set) : Int = 0;


    /** A helper for converting bytes to seconds for this sound source, using the format settings specific to this sound */
    public function bytes_to_seconds( _bytes:Int ) : Float {

        var word = info.data.bits_per_sample == 16 ? 2 : 1;
        var sample_frames = (info.data.rate * info.data.channels * word);

        return _bytes / sample_frames;

    } //bytes_to_seconds

        /** A helper for converting seconds to bytes for this sound source, using the format settings specific to this sound */
    public function seconds_to_bytes( _seconds:Float ) : Int {

        var word = info.data.bits_per_sample == 16 ? 2 : 1;
        var sample_frames = (info.data.rate * info.data.channels * word);

        return Std.int(_seconds * sample_frames);

    } //seconds_to_bytes

    function get_position() : Int {
        return position;
    } //get_position

    function set_position(_pos) : Int {
        return position = _pos;
    } //set_position

    function get_length() : Int {
        return info.data.length_pcm;
    } //get_length

    override function get_duration() : Float {
        return bytes_to_seconds(length);
    } //get_duration

} //Sound