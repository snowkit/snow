package snow.platform.native.audio.openal;

import snow.audio.Audio;
import snow.types.Types;
import snow.io.typedarray.Float32Array;

import snow.audio.openal.AL;
import snow.platform.native.audio.openal.OpenALHelper;

import snow.Log.log;
import snow.Log._debug;
import snow.Log._verbose;
import snow.Log._verboser;

/** The openal specific implementation of SoundStream */
@:noCompletion
@:log_as('audio')
class SoundStream extends snow.platform.native.audio.SoundStream {


        /** the sound buffer names */
    public var buffers : Array<Int>;
        /** remaining buffers to play */
    public var buffers_left : Int = 0;


    public function new( _manager:Audio, _name:String ) {

        super(_manager, _name);

        is_stream = true;

    } //new

//Internal API

    override function set_info( _info : AudioInfo ) : AudioInfo {


            //if preexisting,
        if(info != null) {
            destroy();
        }

            //flag as done for gc
        info = null;

            //now
        if(_info == null) {

            log("not creating sound, info was null");

            return info;

        }

            //store the new sound
        info = _info;
        loaded = true;


            _debug('creating sound / ${name} / ${info.id} / ${info.format}');

            _debug('\t > rate : ${info.data.rate}');
            _debug('\t > channels : ${info.data.channels}');
            _debug('\t > bitrate : ${info.data.bitrate}');
            _debug('\t > bits_per_sample : ${info.data.bits_per_sample}');
            _debug('\t > file length : ${info.data.length}');
            _debug('\t > byte length: ${info.data.length_pcm}');
            _debug('\t > duration : $duration');

            //generate a source
        source = AL.genSource();

            //default source properties
        OpenALHelper.default_source_setup( source );

            _debug('${name} generating source for sound / ${AL.getErrorMeaning(AL.getError())} ');

            //four streaming buffers to cycle.
        buffers = AL.genBuffers(buffer_count);

            _debug('${name} generating ${buffer_count} buffers for sound / ${AL.getErrorMeaning(AL.getError())} ');

        for(b in buffers) {
            _debug('/ snow /    > buffer id ${b}');
        }

        format = OpenALHelper.determine_format( info );

            //fill the first set of buffers up
        init_queue();

        _debug('${name} buffered data / ${AL.getErrorMeaning(AL.getError())} ');

            //handle onload handlers
        emit('load');

        return info;

    } //set_info

        //will try and fill the buffer, will return false if there
        //was no data to get (i.e end of file )
    function fill_buffer(_buffer:Int) : AudioDataBlob {

            //try to read the data into the buffer, the -1 means "from current"
        var _blob : AudioDataBlob = data_get( -1, buffer_length );

        if(_blob != null && _blob.bytes != null && _blob.bytes.length != 0) {
            AL.bufferData( _buffer, format, new Float32Array(_blob.bytes.buffer), info.data.rate ); AL.getError();
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

        _debug('${name} flushing queued buffers ' + queued);

        for(i in 0 ... queued) {
            AL.sourceUnqueueBuffer( source );
        }

    } //flush_queue

        //this is to check the stream state and flag any changes
    function update_stream() : Bool {

        var still_busy = true;

        _verboser(' ${position}/${duration} | ${position_bytes}/${length_bytes} | ${buffers_left} ');

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

            _verbose('    > buffer was done / ${_buffer} / size / ${_buffer_size} / current_time / ${current_time} / position / ${position}');

                //repopulate this empty buffer,
                //if it succeeds, then throw it back at the end of
                //the queue list to keep playing.
            var blob = fill_buffer(_buffer);
                //we shouldn't queue if complete and not looping, or if the data length was 0
            var skip_queue = (!looping && blob.complete);

                //make sure the time resets correctly when looping
            if(position >= duration && looping) {
                current_time = 0;
                emit('end');
            }

            if(blob.complete) {

                if(looping) {
                        //if we are looping, we must seek to the beginning again
                    data_seek(0);

                } else {
                    buffers_left--;
                    _verbose('another buffer down ${buffers_left}');
                    if(buffers_left < 0) {
                        still_busy = false;
                    } else {
                        skip_queue = false;
                    }
                }

            } //complete

            if(!skip_queue && blob.bytes.length != 0) {
                AL.sourceQueueBuffer(source, _buffer);
                _verbose("requeue buffer ");
            }

            processed_buffers--;

        } //while

        var _al_play_state = AL.getSourcei(source, AL.SOURCE_STATE);
        if(_al_play_state != AL.PLAYING) {
            _debug('${name} update stream not needed, sound is not playing');
            still_busy = false;
        }

        return still_busy;

    } //update_stream

    override function internal_update() {

        if(!playing) {
            return;
        }

        if(!update_stream()) {
            _debug('${name} streaming sound complete');
            emit('end');
            stop();
        }

    } //internal_update

    override function internal_pause() {

        AL.sourcePause(source);

        flush_queue();

    } //internal_pause

    override function internal_play() {

        if(playing) {
                //make sure the queue is clear and ready
            flush_queue();
            init_queue();
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

        _debug('${name} playing sound / ${AL.getErrorMeaning(AL.getError())} ');

    } //play

    override public function loop() {

        playing = true;
        paused = false;

        if(!looping) {
            looping = true;
        }

        AL.sourcePlay(source);

        _debug('${name} looping sound / ${AL.getErrorMeaning(AL.getError())} ');

    } //loop

    override public function pause() {

        playing = false;
        paused = true;

        AL.sourcePause(source);

        _debug('${name} pausing sound / ${AL.getErrorMeaning(AL.getError())} ');

        flush_queue();

    } //pause

    override public function stop() {

        playing = false;

        AL.sourceStop(source);

        flush_queue();
        position = 0;

        _debug('${name} stopping stream / ${AL.getErrorMeaning(AL.getError())} ');

    } //stop

    override function destroy() {

            //calls flush for us
        stop();

        AL.deleteSource(source);

        _debug('${name} destroying stream source / ${AL.getErrorMeaning(AL.getError())} ');

        AL.deleteBuffers(buffers);

        _debug('${name} destroying stream buffers / ${AL.getErrorMeaning(AL.getError())} ');

        manager.kill(this);

    } //destroy

//getters / setters

    static var half_pi : Float = 1.5707;

    var current_time : Float = 0;

    override function get_position_bytes() : Int {

        return seconds_to_bytes(position);

    } //get_position_bytes

    override function get_position() : Float {

        // return bytes_to_seconds(position_bytes);
        var _pos_sec : Float = AL.getSourcef(source, AL.SEC_OFFSET);

        return current_time + _pos_sec;

    } //get_position

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

    override function set_position_bytes( _position_bytes:Int ) : Int {

        position = bytes_to_seconds(_position_bytes);

        return position_bytes = _position_bytes;

    } //set_position_bytes

    override function set_looping( _looping:Bool ) : Bool {

        return looping = _looping;

    } //set_looping

    override function set_position( _position:Float ) : Float {

            //stop source so it lets go of buffers
        AL.sourceStop(source);
            //clear queue
        flush_queue();

            //sanity checks
        if(_position < 0) { _position = 0; }
        if(_position > duration) { _position = duration; }

        current_time = _position;

            //fill up the first buffers again, seeking there first
        init_queue( seconds_to_bytes(_position) );

            //and, if it was playing, play it
        if(playing) {
            AL.sourcePlay(source);
        }

        return position = _position;

    } //set_position


} //SoundStream
