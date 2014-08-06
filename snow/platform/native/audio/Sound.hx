package snow.platform.native.audio;

import snow.audio.Audio;
import snow.types.Types;

    //This is not needlessly empty, it binds an empty platform binding where no implementation exists

class Sound extends snow.audio.Sound.SoundBinding {


        /** The length of this sound in `bytes` */
    @:isVar public var length_bytes   (get,never) : Int = 0;
        /** The current playback position of this sound in `bytes` */
    @:isVar public var position_bytes (get,set) : Int = 0;


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

    function get_position_bytes() : Int {
        return position_bytes;
    } //get_position_bytes

    function set_position_bytes(_position_bytes) : Int {
        return position_bytes = _position_bytes;
    } //set_position_bytes

    function get_length_bytes() : Int {
        return info.data.length_pcm;
    } //get_length_bytes

    override function get_duration() : Float {
        return bytes_to_seconds(length_bytes);
    } //get_duration

} //Sound