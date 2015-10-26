package snow.modules.sdl;

typedef RuntimeConfig = {

        /** The default length of a single stream buffer in bytes. default:176400, This is ~1 sec in 16 bit mono. */
    @:optional var audio_buffer_length : Int;

        /** The default number of audio buffers to use for a single stream. Set no less than 2, as it's a queue. See `Audio` docs. default:4 */
    @:optional var audio_buffer_count : Int;

}