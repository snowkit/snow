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
        //buffer count
    public var buffer_count : Int = 4; //:todo: optionize.
        //remaining buffers to play
    public var buffers_left : Int = 0;

    public function new( _manager:Audio, _name:String, _audio_info : AudioInfo ) {

        super(_manager, _name, _audio_info);

        is_stream = true;

        if(info == null) {

            trace('/ lumen / not creating sound, _audio_info was null');

            return;

        } else {

            trace('/ lumen / creating sound / ${name} / ${info.id} / ${info.format}');

            trace('/ lumen /\t > rate : ${info.rate}');
            trace('/ lumen /\t > channels : ${info.channels}');
            trace('/ lumen /\t > bitrate : ${info.bitrate}');
            trace('/ lumen /\t > bits_per_sample : ${info.bits_per_sample}');
            trace('/ lumen /\t > file length : ${info.length}');
            trace('/ lumen /\t > byte length: ${info.length_pcm}');
            trace('/ lumen /\t > duration : $duration');

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
        init_queue();

        trace('/ lumen / audio / ${name} buffered data / ${AL.getErrorMeaning(AL.getError())} ');

    } //new

//Internal API

        //will try and fill the buffer, will return false if there
        //was no data to get (i.e end of file )
    function fill_buffer(_buffer:Int) : AudioDataBlob {

            //try to read the data into the buffer, the -1 means "from current"
        var _blob : AudioDataBlob = data_get( -1, buffer_length );

        if(_blob != null && _blob.data != null && _blob.data.length != 0) {
            AL.bufferData( _buffer, format, new Float32Array(_blob.data), _blob.data.length, info.rate ); AL.getError();
        } 

        return _blob;

    } //fill_buffer

        //this function takes the start of a buffer to allow streaming a section of a buffer
        //but it has to submit the first buffer separately, which handles the seeking to the first slot
        //and subsequent fill_buffers continue from that point onward.
    function init_queue( ?_buffer_start:Int=-1 ) {

        if(_buffer_start != -1) {
            data_seek(_buffer_start);
        }

        for(i in 0...buffer_count) {
            fill_buffer(buffers[i]);
            AL.sourceQueueBuffer(source, buffers[i]);
        }

        buffers_left = buffer_count;

    } //init_queue


        //when pausing or stopping the sound you want to flush
        //the buffers sometimes because otherwise the remaining queue will
        //continue to play until it consumes them up.
    function flush_queue() {

        var queued = AL.getSourcei(source, AL.BUFFERS_QUEUED);

        trace('/ lumen / audio / ${name} flushing queued buffers ' + queued);

        for(i in 0 ... queued) {
            AL.sourceUnqueueBuffer( source );
        }

    } //flush_queue

        //this is to check the stream state and flag any changes
    function update_stream() : Bool {

        var still_busy = true;

        trace(' ${time}/${duration} | ${position}/${length} | ${buffers_left} ');


        var processed_buffers : Int = AL.getSourcei(source, AL.BUFFERS_PROCESSED );

            //disallow large or invalid values since we are using a while loop
        if(processed_buffers > buffer_count) {
            processed_buffers = buffer_count;
        }

            //for each buffer that was already processed, unqueue it
            //which returns the buffer id, so it can be refilled
        while(processed_buffers > 0) {

            var _buffer:Int = AL.sourceUnqueueBuffer( source );
            var _buffer_size = AL.getBufferi(_buffer, AL.SIZE);

            current_time += bytes_to_seconds( _buffer_size );

            trace('    > buffer was done / ${_buffer} / size / ${_buffer_size} / current_time / ${current_time} / time / ${time}');

                //repopulate this empty buffer,
                //if it succeeds, then throw it back at the end of
                //the queue list to keep playing.
            var blob = fill_buffer(_buffer);
                //we shouldn't queue if complete and not looping, or if the data length was 0
            var skip_queue = (!looping && blob.complete);

                //make sure the time resets correctly when looping
            if(time >= duration && looping) {
                current_time = 0;
            }

            if(blob.complete) {

                if(looping) {
                        //if we are looping, we must seek to the beginning again
                    data_seek(0);
                   
                } else {
                    buffers_left--;
                    trace('another buffer down ${buffers_left}');
                    if(buffers_left < 0) {
                        still_busy = false;
                    } else {
                        skip_queue = false;
                    }
                }

            } //complete

            if(!skip_queue && blob.data.length != 0) {
                AL.sourceQueueBuffer(source, _buffer);
                trace("requeue buffer ");
            }

            processed_buffers--;
        
        } //while

        var _al_play_state = AL.getSourcei(source, AL.SOURCE_STATE);
        if(_al_play_state != AL.PLAYING) {
            trace("/ lumen / ${name} update stream not needed, sound is not playing");
            still_busy = false;
        }        

        return still_busy;

    } //should_update

    override function internal_update() {

        if(!playing) {
            return;
        }

        if(!update_stream()) {
            trace('/ lumen / audio / ${name} streaming sound complete');
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
            looping = true;
        }

        AL.sourcePlay(source);

        trace('/ lumen / audio / ${name} looping sound / ${AL.getErrorMeaning(AL.getError())} ');

    } //loop

    override public function pause() {

        playing = false;
        paused = true;

        AL.sourcePause(source);

        trace('/ lumen / audio / ${name} pausing sound / ${AL.getErrorMeaning(AL.getError())} ');

        flush_queue();

    } //pause

    override public function stop() {

        playing = false;

        AL.sourceStop(source);

        flush_queue();

        trace('/ lumen / audio / ${name} stopping stream / ${AL.getErrorMeaning(AL.getError())} ');

    } //stop
    
    override function destroy() {

            //calls flush for us
        stop();

        AL.deleteSource(source);

        trace('/ lumen / audio / ${name} destroying stream source / ${AL.getErrorMeaning(AL.getError())} ');

        AL.deleteBuffers(buffers);

        trace('/ lumen / audio / ${name} destroying stream buffers / ${AL.getErrorMeaning(AL.getError())} ');


    } //destroy

//getters / setters

    static var half_pi : Float = 1.5707;

    var current_time : Float = 0;

    override function get_position() : Int {

        return seconds_to_bytes(time);

    } //get_position

    override function get_time() : Float {

        // return bytes_to_seconds(position);
        var _pos_sec : Float = AL.getSourcef(source, AL.SEC_OFFSET);

        return current_time + _pos_sec;

    } //get_time

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

    override function set_position( _position:Int ) : Int {

        time = bytes_to_seconds(_position);

        return position = _position;

    } //set_position

    override function set_looping( _looping:Bool ) : Bool {

        return looping = _looping;

    } //set_looping

    override function set_time( _time:Float ) : Float {

            //stop source so it lets go of buffers
        AL.sourceStop(source);
            //clear queue
        flush_queue();

            //sanity checks
        if(_time < 0) { _time = 0; }
        if(_time > duration) { _time = duration; }

        current_time = _time;

            //fill up the first buffers again, seeking there first
        init_queue( seconds_to_bytes(_time) );

            //and, if it was playing, play it
        if(playing) {
            AL.sourcePlay(source);
        }

        return time = _time;

    } //set_time


} //SoundStreamOpenAL


#end //lumen_audio_openal
