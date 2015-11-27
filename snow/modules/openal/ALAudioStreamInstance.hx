package snow.modules.openal;

import snow.api.Debug.*;
import snow.modules.openal.Audio;
import snow.systems.audio.AudioInstance;
import snow.types.Types.AudioHandle;
import snow.api.buffers.Uint8Array;
import snow.modules.openal.AL;

@:log_as('AL stream')
@:allow(snow.modules.openal.Audio)
class ALAudioStreamInstance extends ALAudioInstance {

        /** the sound buffer names */
    public var buffers : Array<Int>;
        /** the sound buffer data  */
    public var buffer_data : Uint8Array;
        /** */
    public var buffer_size : Int = 176400; //default:176400, This is ~1 sec in 16 bit mono. 4096 

        /** remaining buffers to play */
    public var buffers_left : Int = 0;
        /** the number of buffers total, don't change post creation */
    public var buffer_count : Int = 2;

        //internal reference to the bytesdata to avoid converting each time
    var buffer_bytes : haxe.io.BytesData;
    var still_streaming = true;
    var current_time = 0.0;
    var duration = 0.0;

    public function new(_module:Audio, _handle:AudioHandle, _source:snow.systems.audio.AudioSource, _volume:Float) {

        super(_module, _handle, _source, _volume);
        
        duration = source.duration();

    } //new

    override function init() {

        _debug('ALSOURCE $alsource');

        buffers = [for (i in 0...buffer_count) -1];
        buffers = AL.genBuffers(buffer_count, buffers);
        buffer_data = new Uint8Array(buffer_size);
        buffer_bytes = buffer_data.toBytes().getData();

        err('generated $buffer_count buffers');

        data_seek(0);

        init_queue();

        still_streaming = true;

    } //init


    override function has_ended() {

        return !still_streaming && !state_is(AL.PLAYING);

    } //has_ended

    function state(_state:Int) {
        return switch(_state) {
            case AL.INITIAL: 'INITIAL';
            case AL.PLAYING: 'PLAYING';
            case AL.PAUSED: 'PAUSED';
            case AL.STOPPED: 'STOPPED';
            case _: 'UNKNOWN';
        }
    }

    function state_now() {
        return AL.getSourcei(alsource, AL.SOURCE_STATE);
    }

    function init_queue( ?_buffer_start:Int=-1 ) {

        if(_buffer_start != -1) data_seek(_buffer_start);

        for(i in 0...buffer_count) {
            fill_buffer(buffers[i]);
            AL.sourceQueueBuffer(alsource, buffers[i]);
            err('queue buffer ' + buffers[i]);
        }

        err('init_queue');

        _debug(state(state_now()));

        buffers_left = buffer_count;

    } //init_queue

    function flush_queue() {

        var queued = AL.getSourcei(alsource, AL.BUFFERS_QUEUED);

        log('flushing queued buffers ' + queued);

        for(i in 0 ... queued) {
            AL.sourceUnqueueBuffer(alsource);
        }

        err('flush_queue');

    } //flush_queue

    var data_get_result = [0,0];
    function fill_buffer(_buffer:Int) : Bool {

            //try to read the data into the buffer, the -1 means "from current"
        var _read = data_get(buffer_data, -1, buffer_size, data_get_result);

        AL.bufferData(_buffer, alformat, source.asset.audio.data.rate, buffer_bytes, buffer_data.byteOffset, _read[0]);

        err('fill buffer ${_buffer} read: $_read');

        return _read[1] == 1;

    } //fill_buffer
    
    override function position_of() {

        return current_time + AL.getSourcef(alsource, AL.SEC_OFFSET);

    } //position_of

    override function position(_time:Float) : Void {

        var _playing = state_is(AL.PLAYING);

            //stop lets go of buffers
        AL.sourceStop(alsource);
        flush_queue();

            //sanity checks :todo:
        if(_time < 0) { _time = 0; }
        if(_time > duration) { _time = duration; }

        current_time = _time;
            //fill up the first buffers again, seeking there first
        // init_queue( owner.system.seconds_to_bytes(owner.info, _time) );

        if(_playing) AL.sourcePlay(alsource);

    } //set_position

    override function tick() : Void {

        if(!state_is(AL.PLAYING)) return;

        still_streaming = true;

        // log('${state(state_now())} ${position_of()}/$duration | ${source.seconds_to_bytes(position_of())}/${source.asset.audio.data.length_pcm} | ${buffers_left} ');

        var processed_buffers = AL.getSourcei(alsource, AL.BUFFERS_PROCESSED);

            //disallow large or invalid values since we are using a while loop
        if(processed_buffers > buffer_count) processed_buffers = buffer_count;
        while(processed_buffers > 0) {

            // err('tick $processed_buffers');

            var _buffer = AL.sourceUnqueueBuffer(alsource);

            // err('sourceUnqueueBuffer $_buffer');

            var _buffer_size = AL.getBufferi(_buffer, AL.SIZE);

            current_time += source.bytes_to_seconds(_buffer_size);

            // log('    > buffer was done / ${_buffer} / size(${_buffer_size}) / current_time(${current_time}) / pos(${position_of()})');

                //repopulate this empty buffer,
                //if it succeeds, then throw it back at the end of
                //the queue list to keep playing.
            var _complete = fill_buffer(_buffer);
                //we shouldn't queue if complete and not looping, or if the data length was 0
            var skip_queue = (!looping && _complete);

                //make sure the time resets correctly when looping
            var at_end = position_of() >= duration;
            if(at_end && looping) {
                current_time = 0;
                module.app.audio.emit(ae_end, handle);
            }

            if(_complete) {

                if(looping) {

                    data_seek(0);

                } else {
                    buffers_left--;
                    // log('another buffer down ${buffers_left}');
                    if(buffers_left < 0) {
                        still_streaming = false;
                    } else {
                        skip_queue = false;
                    }
                }

            } //complete

            if(!skip_queue) {
                AL.sourceQueueBuffer(alsource, _buffer);
                // log("requeue buffer " + _buffer);
            }

            processed_buffers--;

        } //while


    }

    function state_is(_state:Int) {
        return _state == state_now();
    }

    function err(reason:String) {
        var _err = AL.getError();
        if(_err != AL.NO_ERROR) {
            throw '$reason: failed with ' + ALError.desc(_err);
        } else {
            _debug('$reason / no error');
        }
    }




}