package lumen.audio.system.openal;

import lumen.audio.Audio;
import lumen.audio.system.SoundStream;
import lumen.audio.system.openal.OpenALHelper;

import lumen.LumenTypes;
import lumen.utils.ByteArray;
import lumen.utils.Float32Array;

#if lumen_audio_openal

import lumen.audio.al.AL;


    //The openal specific implementation of SoundStream
class SoundStreamOpenAL extends SoundStream {


        //the sound source name
    public var source : Int;
        //the sound buffer names
    public var buffers : Array<Int>;
        //mono8? stereo16?
    public var format : Int;
        //the length of bytes for a single buffer
        //:todo: making it a bit bigger to slow down debug printing
    public static var buffer_length : Int = 48000*4; //:todo: optionize.
        //buffer count
    public var buffer_count : Int = 4; //:todo: optionize.


    public function new( _manager:Audio, _name:String, _audio_info : AudioInfo ) {

        super(_manager, _name, _audio_info);

        is_stream = true;

        if(info == null) {

            trace("/ lumen / not creating sound, _audio_info was null");

            return;

        } else {

            trace('/ lumen / creating sound / ${name} / ${info.id} / ${info.format}');

            trace("/ lumen /\t > rate : " + info.rate);
            trace("/ lumen /\t > channels : " + info.channels);
            trace("/ lumen /\t > bitrate : " + info.bitrate);
            trace("/ lumen /\t > bits_per_sample : " + info.bits_per_sample);
            trace("/ lumen /\t > length : " + info.length);
            trace("/ lumen /\t > length uncompressed: " + info.length_pcm);

        }

            //generate a source
        source = AL.genSource();

            //default source properties
        OpenALHelper.default_source_setup( source );

            trace('/ lumen / audio / ${name} generating source for sound / ${AL.getErrorMeaning(AL.getError())} ');

            //four streaming buffers to cycle.
        buffers = AL.genBuffers(buffer_count);

            trace('/ lumen / audio / ${name} generating ${buffer_count} buffers for sound / ${AL.getErrorMeaning(AL.getError())} ');

        for(b in buffers) {
            trace('/ lumen /    > buffer id ${b}');
        }

        format = OpenALHelper.determine_format( info );

            //fill the first set of buffers up
        start_queue();

        trace('/ lumen / audio / ${name} buffered data / ${AL.getErrorMeaning(AL.getError())} ');

    } //new

//Internal API

        //will try and fill the buffer, will return false if there
        //was no data to get (i.e end of file )
    function fill_buffer(_buffer:Int) : Bool {

            //try to read the data into the buffer, the -1 means "from current"
        var _data : ByteArray = manager.lib.assets.load_audio_portion( info, -1, buffer_length );

            //checks
        if(_data != null) {

            trace('    > data for buffer:${_buffer} / length was ${_data.byteLength}');

            if(_data.byteLength != 0) {

                AL.bufferData( _buffer, format, new Float32Array(_data), _data.byteLength, info.rate );

                trace('    > errors? ${AL.getErrorMeaning(AL.getError())}');

                return true;

            } else {

                trace('    > data length was null');
                return false;
            }
        } else {
            trace('    > data was null');
        }

            //default to "done playing"
        return false;

    }

        //this function takes the start of a buffer to allow streaming a section of a buffer
        //but it has to submit the first buffer separately, which handles the seeking to the first slot
        //and subsequent fill_buffers continue from that point onward.
    function start_queue( ?_buffer_start:Int=0 ) {

            //when setting up a stream we buffer the first bit ahead
        var _first_buffer : ByteArray = manager.lib.assets.load_audio_portion( info, _buffer_start, buffer_length );

        if(_first_buffer != null) {

            AL.bufferData( buffers[0], format, new Float32Array(_first_buffer), _first_buffer.byteLength, info.rate );
                //give the first buffer to the source only
            AL.sourceQueueBuffer(source, buffers[0]);

                //now lets queue the others as well
            for(i in 1 ... buffer_count) {
                fill_buffer( buffers[i] );
                AL.sourceQueueBuffer(source, buffers[i]);
            }

        } //first_buffer != null

    } //start_queue


        //when pausing or stopping the sound you want to flush
        //the buffers sometimes because otherwise the remaining queue will
        //continue to play until it consumes them up.
    function flush_queue() {

        var queued = AL.getSourcei(source, AL.BUFFERS_QUEUED);

        for(i in 0 ... queued) {
            AL.sourceUnqueueBuffer( source );
        }

    } //flush_queue

        //this is to check the stream state and flag any changes
    function update_stream() : Bool {

        var still_busy = true;

            //we disallow queuing buffers for stopped sounds
        var _al_play_state = AL.getSourcei(source, AL.SOURCE_STATE);
        if(_al_play_state != AL.PLAYING) {
            return false;
        }

        var processed_buffers : Int = AL.getSourcei(source, AL.BUFFERS_PROCESSED );

            //disallow large or invalid values since we are using a while loop
        if(processed_buffers > buffer_count) {
            processed_buffers = buffer_count;
        }

            //for each buffer that was already processed, unqueue it
            //which returns the buffer id, so it can be refilled
        while(processed_buffers > 0) {

            var _buffer:Int = AL.sourceUnqueueBuffer( source );

            trace("    > processed_buffers : " + processed_buffers + " buffer was " + _buffer);

                //repopulate this empty buffer,
                //if it succeeds, then throw it back at the end of
                //the queue list to keep playing.
            if(fill_buffer(_buffer)) {
                trace("    > fill is ok");
                AL.sourceQueueBuffer(source, _buffer);

            } else {
                    //the buffer said it was done,
                    //so we can mark the stream as done
                still_busy = false;
                trace("    > fill was done");
            }

            processed_buffers--;
        }

        return still_busy;

    } //should_update

    override function internal_update() {

        if(!playing) {
            return;
        }

        //check if we are still playing by asking openal
        var _still_busy = update_stream();

        if(!_still_busy) {
            trace("streaming sound complete / " + _still_busy);
            stop();
        }

    } //internal_update

    override function internal_pause() {

        AL.sourcePause(source);

        flush_queue();

    } //internal_pause

    override function internal_play() {

        if(playing) {
            AL.sourcePlay(source);
        }

    } //internal_play

//API

    override public function play() {

        playing = true;
        paused = false;

            //play() is explicitly not looping
        if(looping) {
            looping = false;
        }

        AL.sourcePlay(source);

        trace('/ lumen / audio / ${name} playing sound / ${AL.getErrorMeaning(AL.getError())} ');

    } //play

    override public function loop() {

        playing = true;
        paused = false;

        if(!looping) {
            // looping = true;
        }

        AL.sourcePlay(source);

        trace('/ lumen / audio / ${name} looping sound / ${AL.getErrorMeaning(AL.getError())} ');

    } //loop

    override public function pause() {

        playing = false;
        paused = true;

        AL.sourcePause(source);

        flush_queue();

    } //pause

    override public function stop() {

        playing = false;

        AL.sourceStop(source);

        flush_queue();

    } //stop

    override public function toggle() {

        playing = !playing;

        if(playing) {
            play();
        } else {
            pause();
        }

    } //toggle

    
    override function destroy() {

            //calls flush for us
        stop();

        AL.deleteBuffers(buffers);
        AL.deleteSource(source);

    } //destroy

//getters / setters

    static var half_pi : Float = 1.5707;

    override function set_pan( _pan:Float ) : Float {

        AL.source3f(source, AL.POSITION, Math.cos((_pan - 1) * (half_pi)), 0, Math.sin((_pan + 1) * (half_pi)));

        return pan = _pan;

    } //set_pan

    override function set_pitch( _pitch:Float ) : Float {

        AL.sourcef( source, AL.PITCH, _pitch );

        return pitch = _pitch;

    } //set_pitch

    override function set_volume( _volume:Float ) : Float {

        AL.sourcef( source, AL.GAIN, _volume );

        return volume = _volume;

    } //set_volume

    override function set_looping( _looping:Bool ) : Bool {

        trace(name + " / set looping " + _looping);

        AL.sourcei( source, AL.LOOPING, _looping ? AL.TRUE : AL.FALSE );

        return looping = _looping;

    } //set_looping


} //SoundStreamOpenAL


#end //lumen_audio_openal
