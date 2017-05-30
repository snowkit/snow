package snow.modules.openal;

import snow.api.Debug.*;
import snow.modules.openal.Audio;
import snow.modules.openal.ALSound;
import snow.systems.audio.AudioInstance;
import snow.types.Types.AudioHandle;
import snow.api.buffers.Uint8Array;
import snow.modules.openal.AL;

@:log_as('AL stream')
@:allow(snow.modules.openal.Audio)
class ALStream extends ALSound {

        /** the sound buffer names */
    public var buffers : Array<ALuint>;
        /** the sound buffer data  */
    public var buffer_data : Uint8Array;
        /** remaining buffers to play */
    public var buffers_left : Int = 0;

    var duration = 0.0;

    public function new(_module:Audio, _source:snow.systems.audio.AudioSource, _instance:AudioInstance) {

        super(_module, _source, _instance);
        
        duration = source.duration();

    } //new

    override function init() {

        _debug('al source = $alsource');

        buffers = [for (i in 0...source.stream_buffer_count) 0];
        buffers = AL.genBuffers(source.stream_buffer_count, buffers);
        buffer_data = new Uint8Array(source.stream_buffer_length);

        err('generated ${source.stream_buffer_count} buffers');

        instance.data_seek(0);

        init_queue();

    } //init

//ALSound

    override function destroy() {

        _debug('destroy ' + source.data.id);

        err('pre source stop');

        AL.sourceStop(alsource);

        err('pre flush queue');

        flush_queue();

        err('post flush queue');

            //order is important here, destroy source first
        super.destroy();

        while(buffers.length > 0) {
            var b = buffers.pop();
            AL.deleteBuffer(b);
            err('delete buffer ' + b);
        }

        buffers = null;
        buffer_data.buffer = null;
        buffer_data = null;

    } //destroy

    override function position_of() {

        return current_time + AL.getSourcef(alsource, AL.SEC_OFFSET);

    } //position_of

    override function position(_time:Float) : Void {

        var _playing = state_is(AL.PLAYING);

            //stop lets go of buffers
        AL.sourceStop(alsource);
        flush_queue();

            //clamp between 0 and duration
        _time = (_time < 0) ? 0 : (( _time > duration) ? duration : _time);
        current_time = _time;

        var _samples = source.seconds_to_bytes(_time);

        instance.data_seek(_samples);

        _verbose('position $_time, seek to $_samples');

            //make sure queue is refilled from the new position
        init_queue();

        if(_playing) {
            AL.sourcePlay(alsource);
        }

    } //position

//Internal

    inline function state_str() {
        return switch(state_now()) {
            case AL.INITIAL: 'INITIAL';
            case AL.PLAYING: 'PLAYING';
            case AL.PAUSED: 'PAUSED';
            case AL.STOPPED: 'STOPPED';
            case _: 'UNKNOWN';
        }
    }

    inline function state_now() {
        return AL.getSourcei(alsource, AL.SOURCE_STATE);
    }

    inline function state_is(_state:Int) {
        return _state == state_now();
    }

//queue management

    function init_queue( ?_start:Int=-1 ) {

        if(_start != -1) instance.data_seek(_start);

        for(i in 0...source.stream_buffer_count) {
            fill_buffer(buffers[i]);
            AL.sourceQueueBuffer(alsource, buffers[i]);
            err('queue buffer ' + buffers[i]);
        }

        err('init_queue');

        // _debug(state_str());

        buffers_left = source.stream_buffer_count;

    } //init_queue

    function flush_queue() {

        var queued = AL.getSourcei(alsource, AL.BUFFERS_QUEUED);

        _debug('flushing queued buffers ' + queued);

        for(i in 0 ... queued) {
            AL.sourceUnqueueBuffer(alsource);
        }

        err('flush_queue');

    } //flush_queue

        //returns the result of the data request, which may not get any data,
        //and which may have reached the end of the data source itself.
    var data_get_result = [0,0];
    function fill_buffer(_buffer:ALuint) : Array<Int> {

            //try to read the data into the buffer, the -1 means "from current"
        var _read = instance.data_get(buffer_data, -1, source.stream_buffer_length, data_get_result);
        var _amount = _read[0];

        _verbose('bufferData / $_buffer / format:$alformat / freq:${source.data.rate} / size: ${_read[0]}');
        err('pre fill buffer ${_buffer}');

        if(_amount > 0) {
            AL.bufferData(_buffer, alformat, source.data.rate, buffer_data.buffer, buffer_data.byteOffset, _amount);
        }

        err('post fill buffer ${_buffer} read: $_read');

        return data_get_result;

    } //fill_buffer
    
//ALStream

    override function tick() : Void {

        instance.tick();

        if(!state_is(AL.PLAYING)) {
            return;
        }

        var still_streaming = true;

        _verbose('alsource:$alsource ${state_str()} ${position_of()}/$duration | ${source.seconds_to_bytes(position_of())}/${source.data.length} | ${buffers_left} ');

        var processed_buffers = AL.getSourcei(alsource, AL.BUFFERS_PROCESSED);

        err('query processed buffers $processed_buffers');

            //disallow large or invalid values since we are using a while loop
        if(processed_buffers > source.stream_buffer_count) processed_buffers = source.stream_buffer_count;
        while(processed_buffers > 0) {

            var _buffer:ALuint = AL.sourceUnqueueBuffer(alsource);

            err('sourceUnqueueBuffer $_buffer');

            var _buffer_size = AL.getBufferi(_buffer, AL.SIZE);

            current_time += source.bytes_to_seconds(_buffer_size);

            _verbose('    > buffer was done / ${_buffer} / size(${_buffer_size}) / current_time(${current_time}) / pos(${position_of()})');

                //repopulate this empty buffer,
                //if it succeeds, then throw it back at the end of
                //the queue list to keep playing.
            var _data_state = fill_buffer(_buffer);
            var _data_amount = _data_state[0];
            var _data_ended = _data_state[1] == 1;
                //if not looping, we shouldn't queue up the buffer again
            var skip_queue = (!looping && _data_ended);
                
                //make sure the time resets correctly when looping
            var time_is_at_end = position_of() >= duration;
                //If the time has run over, we reset the timer if looping
            if(time_is_at_end && looping) {
                current_time = 0;
                module.app.audio.emit(ae_end, instance.handle);
            }

            _verbose('    > data has ended? $_data_ended');
            _verbose('    > at end? $time_is_at_end ${position_of()} >= $duration');

                //If the data was complete,
                //we reset the source data to 0, 
                //and try get some more, otherwise 
                //we just wait for our queued buffers to run out
            if(_data_ended) {

                if(looping) {

                    _verbose('    > data ended while looping, seek audio to 0');
                
                    instance.data_seek(0);

                        //if looping, and we just reset the data source,
                        //if the amount we got back was zero, it means this buffer
                        //is empty, and needs to be filled.
                    if(_data_amount == 0) {
                        _verbose('    > buffer was empty due to end of stream, refilling');
                        fill_buffer(_buffer);
                    }
                
                } else {
                
                    buffers_left--;
                    _verbose('    > running down buffers, one more down, ${buffers_left} to go');
                    if(buffers_left < 0) {
                        still_streaming = false;
                    } else {
                        skip_queue = false;
                    }
                
                } //!looping

            } //_data_ended

            if(!skip_queue) {
                AL.sourceQueueBuffer(alsource, _buffer);
                _verbose("    > requeued buffer " + _buffer);
            }

            processed_buffers--;

        } //while

        if(!still_streaming) {
            AL.sourceStop(alsource);
        }

    } //tick


}