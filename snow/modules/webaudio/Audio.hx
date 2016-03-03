package snow.modules.webaudio;

#if js

import snow.api.Debug.*;
import snow.types.Types;
import snow.api.Promise;
import snow.api.buffers.Uint8Array;
import snow.api.buffers.Float32Array;
import snow.systems.audio.AudioSource;
import snow.systems.audio.AudioInstance;

private typedef WebSound = {
    source: AudioSource,
    handle: AudioHandle,
    instance: AudioInstance,

    buffer_node: js.html.audio.AudioBufferSourceNode,
    media_node: js.html.audio.MediaElementAudioSourceNode,
    media_elem: js.html.Audio,

    gain_node: js.html.audio.GainNode,
    pan_node: js.html.audio.PannerNode,

    state: AudioState,
    loop: Bool,
    pan: Float,
    time_start: Float,
    ?time_pause: Float,
}

@:allow(snow.modules.webaudio)
@:allow(snow.systems.audio.Audio)
class Audio implements snow.modules.interfaces.Audio {

    var handle_seq = 0;

    var instances: Map<AudioHandle, WebSound>;
    var buffers: Map<AudioSource, js.html.audio.AudioBuffer>;

    var context: js.html.audio.AudioContext;

    static inline var half_pi : Float = 1.5707;

    var app: snow.Snow;
    var active: Bool = false;

    function new(_app:snow.Snow) {

        app = _app;
        instances = new Map();
        try {
            context = new js.html.audio.AudioContext();
        } catch(err:Dynamic) {
            context = untyped __js__('new window.webkitAudioContext()');
        }

        assertnull(context, 'Audio / webaudio / no AudioContext could be created, is the Web Audio API supported?');

        var info =
            'channelCount: ${context.destination.channelCount}, ' +
            'channelCountMode: "${context.destination.channelCountMode}", ' +
            'channelInterpretation: "${context.destination.channelInterpretation}", ' +
            'maxChannelCount: ${context.destination.maxChannelCount}, ' +
            'numberOfInputs: ${context.destination.numberOfInputs}, ' +
            'numberOfOutputs: ${context.destination.numberOfOutputs}';

        log('webaudio: $context / sampleRate: ${context.sampleRate} / destination: $info');

        active = true;

    } //new

    function shutdown():Void {

            //:todo: haxe js.html.audio.AudioContext api lacks suspend property
        untyped context.close();

    } //shutdown

    function onevent(event:SystemEvent):Void {

    } //onevent

    inline function snd_of(_handle:AudioHandle) : WebSound {

        return instances.get(_handle);

    } //snd_of

    function play_buffer(_data:AudioDataWebAudio) : js.html.audio.AudioBufferSourceNode {

        var _node = context.createBufferSource();
            _node.buffer = _data.buffer;

        return _node;

    } //play_buffer

    function play_buffer_again(_handle:AudioHandle, _snd:WebSound, _start_time:Float) {

        _snd.buffer_node = play_buffer(cast _snd.source.data);
        _snd.buffer_node.connect(_snd.pan_node);
        _snd.buffer_node.loop = _snd.loop;
        _snd.pan_node.connect(_snd.gain_node);
        _snd.gain_node.connect(context.destination);
        _snd.buffer_node.start(0, _start_time);
        _snd.buffer_node.onended = destroy_snd.bind(_snd);

    } //play_buffer_again

    function play_instance(
        _handle:AudioHandle,
        _source:AudioSource,
        _inst:AudioInstance,
        _data:AudioDataWebAudio,
        _buffer_node:js.html.audio.AudioBufferSourceNode,
        _volume:Float,
        _loop:Bool
    ) {

        var _gain = context.createGain();
        var _pan = context.createPanner();
        var _node: js.html.audio.AudioNode = null;
        var _pan_val = 0;

        _gain.gain.value = _volume;
        _pan.panningModel = js.html.audio.PanningModelType.EQUALPOWER;
        _pan.setPosition(Math.cos(-1 * half_pi), 0, Math.sin(1 * half_pi));

        if(_buffer_node != null) {
            _node = _buffer_node;
            _buffer_node.loop = _loop;
        }

        if(_data.media_node != null) {
            _node = _data.media_node;
            _data.media_elem.loop = _loop;
        }

            //source -> pan -> gain -> output
        _node.connect(_pan);
        _pan.connect(_gain);
        _gain.connect(context.destination);

        var _snd : WebSound = {
            handle      : _handle,
            source      : _source,
            instance    : _inst,

            buffer_node : _buffer_node,
            media_node  : _data.media_node,
            media_elem  : _data.media_elem,
            gain_node   : _gain,
            pan_node    : _pan,

            state       : as_playing,
            time_start  : app.time,
            loop        : _loop,
            pan         : 0
        };

        instances.set(_handle, _snd);

        //:todo: handle _paused flag, also why is there a paused flag? 
        //when do you ever want to call play with paused as true?

        if(_buffer_node != null) {
            _buffer_node.start(0);
            _buffer_node.onended = destroy_snd.bind(_snd);
        }

        if(_data.media_node != null) {

            _data.media_elem.play();
                //:todo: looping audio element ended event
            _data.media_node.addEventListener('ended', function() {
                app.audio.emit(ae_end, _handle);
                _snd.state = as_stopped;
            });

        } //media node

    }

    public function play(_source:AudioSource, _volume:Float, _paused:Bool) : AudioHandle {

        var _data:AudioDataWebAudio = cast _source.data;
        var _handle = handle_seq;
        var _inst = _source.instance(_handle);

        if(_source.data.is_stream) {
            _data.media_elem.play();
            _data.media_elem.volume = 1.0;
            play_instance(_handle, _source, _inst, _data, null, _volume, false);
        } else {
            play_instance(_handle, _source, _inst, _data, play_buffer(_data), _volume, false);
        }

        handle_seq++;

        return _handle;

    } //play

    public function loop(_source:AudioSource, _volume:Float, _paused:Bool) : AudioHandle {

        var _data:AudioDataWebAudio = cast _source.data;
        var _handle = handle_seq;
        var _inst = _source.instance(_handle);

        if(_source.data.is_stream) {
            _data.media_elem.play();
            _data.media_elem.volume = 1.0;
            play_instance(_handle, _source, _inst, _data, null, _volume, true);
        } else {
            play_instance(_handle, _source, _inst, _data, play_buffer(_data), _volume, true);
        }

        handle_seq++;

        return _handle;

    } //loop

    function stop_buffer(_snd:WebSound) {
        _snd.buffer_node.stop();
        _snd.buffer_node.disconnect();
        _snd.gain_node.disconnect();
        _snd.pan_node.disconnect();
        _snd.buffer_node = null;
    }

    public function pause(_handle:AudioHandle) : Void {

        var _snd = snd_of(_handle);
        if(_snd == null) return;

        _debug('pause handle=$_handle, ' + _snd.source.data.id);

        _snd.time_pause = app.time - _snd.time_start;
        _snd.state = as_paused;

        if(_snd.buffer_node != null) {
            stop_buffer(_snd);
        } else if(_snd.media_node != null) {
            _snd.media_elem.pause();
        }

    } //pause

    public function unpause(_handle:AudioHandle) : Void {

        var _snd = snd_of(_handle);
        if(_snd == null) return;
        if(_snd.state != as_paused) return;

        _debug('unpause handle=$_handle, ' + _snd.source.data.id);

        if(_snd.media_node == null) {
            play_buffer_again(_handle, _snd, _snd.time_pause);
        } else {
            _snd.media_elem.play();
        }

        _snd.state = as_playing;

    } //unpause

    inline function destroy_snd(_snd:WebSound) {

        if(_snd.buffer_node != null) {
            _snd.buffer_node.stop();
            _snd.buffer_node.disconnect();
            _snd.buffer_node = null;
        }

        if(_snd.media_node != null) {
            _snd.media_elem.pause();
            _snd.media_elem.currentTime = 0;
            _snd.media_node.disconnect();
            _snd.media_elem = null;
            _snd.media_node = null;
        }

        if(_snd.gain_node != null) {
            _snd.gain_node.disconnect();
            _snd.gain_node = null;
        } 

        if(_snd.pan_node != null) {
            _snd.pan_node.disconnect();
            _snd.pan_node = null;
        }

        instances.remove(_snd.handle);
        _snd = null;

    } //destroy_snd

    public function stop(_handle:AudioHandle) : Void {

        var _snd = snd_of(_handle);
        if(_snd == null) return;

        _debug('stop handle=$_handle, ' + _snd.source.data.id);

        destroy_snd(_snd);

        _snd.state = as_stopped;

    } //stop


    public function volume(_handle:AudioHandle, _volume:Float) : Void {

        var _snd = snd_of(_handle);
        if(_snd == null) return;

        _debug('volume=$_volume handle=$_handle, ' + _snd.source.data.id);

        _snd.gain_node.gain.value = _volume;

    } //volume

    public function pan(_handle:AudioHandle, _pan:Float) : Void {

        var _snd = snd_of(_handle);
        if(_snd == null) return;

        _debug('pan=$_pan handle=$_handle, ' + _snd.source.data.id);

        _snd.pan = _pan;
        _snd.pan_node.setPosition( Math.cos( (_pan-1)*half_pi ),   0,   Math.sin( (_pan+1)*half_pi ) );

    } //pan

    public function pitch(_handle:AudioHandle, _pitch:Float) : Void {

        var _snd = snd_of(_handle);
        if(_snd == null) return;

        _debug('pitch=$_pitch handle=$_handle, ' + _snd.source.data.id);

        if(_snd.buffer_node != null) {
            _snd.buffer_node.playbackRate.value = _pitch;
        } else if(_snd.media_node != null) {
            _snd.media_elem.playbackRate = _pitch;
        }

    } //pitch

    public function position(_handle:AudioHandle, _time:Float) : Void {

        var _snd = snd_of(_handle);
        if(_snd == null) return;

        _debug('position=_time handle=$_handle, ' + _snd.source.data.id);

        if(_snd.buffer_node != null) {
            stop_buffer(_snd);
            play_buffer_again(_handle, _snd, _time);
        } else {
            _snd.media_elem.currentTime = _time;
        }

    } //position


    public function volume_of(_handle:AudioHandle) : Float {

        var _snd = snd_of(_handle);
        if(_snd == null) return 0.0;

        return _snd.gain_node.gain.value;

    } //volume_of

    public function pan_of(_handle:AudioHandle) : Float {

        var _snd = snd_of(_handle);
        if(_snd == null) return 0.0;

        return _snd.pan;

    } //pan_of

    public function pitch_of(_handle:AudioHandle) : Float {

        var _snd = snd_of(_handle);
        if(_snd == null) return 0.0;

        var _result = 1.0;

        if(_snd.buffer_node != null) {
            _result = _snd.buffer_node.playbackRate.value;
        } else if(_snd.media_node != null) {
            _result = _snd.media_elem.playbackRate;
        }

        return _result;

    } //pitch_of

    public function position_of(_handle:AudioHandle) : Float {

        var _snd = snd_of(_handle);
        if(_snd == null) return 0.0;

        //:todo: web audio position_of

        return 0.0;

    } //position_of

    public function state_of(_handle:AudioHandle) : AudioState {

        var _snd = snd_of(_handle);
        if(_snd == null) return as_invalid;

        return _snd.state;

    } //state_of

    public function loop_of(_handle:AudioHandle) : Bool {

        var _snd = snd_of(_handle);
        if(_snd == null) return false;

        return _snd.loop;

    } //loop_of

    public function instance_of(_handle:AudioHandle) : AudioInstance {

        var _snd = snd_of(_handle);
        if(_snd == null) return null;

        return _snd.instance;

    } //instance_of


    public function suspend():Void {

            //:todo: haxe js.html.audio.AudioContext api lacks suspend property
        untyped context.suspend();

    } //suspend

    public function resume():Void {

            //:todo: haxe js.html.audio.AudioContext api lacks resume property
        untyped context.resume();

    } //resume

//Data API

    public function data_from_load(_path:String, ?_is_stream:Bool=false, ?_format:AudioFormatType) : Promise {

        if(_format == null) _format = snow.core.Audio.audio_format_from_path(_path);

        if(_is_stream) {
            return data_from_load_stream(_path, _format);
        }

        return data_from_load_sound(_path, _format);

    } //data_from_load

    public function data_from_bytes(_id:String, _bytes:Uint8Array, ?_format:AudioFormatType) : Promise {

        return new Promise(function(resolve, reject) {

            data_from_bytes_direct(_id, _bytes, _format, resolve, reject);

        }); //Promise

    } //data_from_bytes

    //Internal helpers

        function data_from_bytes_direct(_id:String, _bytes:Uint8Array, _format:AudioFormatType, resolve:AudioDataWebAudio->Void, reject:Dynamic->Void) {

            context.decodeAudioData(_bytes.buffer, function(_buffer:js.html.audio.AudioBuffer) {

                var _data = new AudioDataWebAudio(app, _buffer, {
                    id         : _id,
                    is_stream  : false,
                    format     : _format,
                    samples    : null,
                    length     : _buffer.length,
                    channels   : _buffer.numberOfChannels,
                    rate       : Std.int(_buffer.sampleRate)
                });

                return resolve(_data);

            }, function() {

                return reject('failed to decode audio for `$_id`');

            }); //error

        } //data_from_bytes_direct

        function data_from_load_sound(_path:String, _format:AudioFormatType) {

            return new Promise(function(resolve,reject) {

                var _load = app.io.data_load(_path);

                _load.then(function(_bytes:Uint8Array) {

                    data_from_bytes_direct(_path, _bytes, _format, resolve, reject);

                }); //load

            }); //Promise

        } //data_from_load_sound

        function data_from_load_stream(_path:String, _format:AudioFormatType) : Promise {

            return new Promise(function(resolve, reject) {

                //create audio element
                var _element = new js.html.Audio(_path);
                    _element.autoplay = false;
                    _element.controls = false;
                    _element.preload = 'auto';

                _element.onerror = function(err) {

                    var _error = switch(_element.error.code) {
                        case 1: 'MEDIA_ERR_ABORTED';
                        case 2: 'MEDIA_ERR_NETWORK';
                        case 3: 'MEDIA_ERR_DECODE';
                        case 4: 'MEDIA_ERR_SRC_NOT_SUPPORTED';
                        case 5: 'MEDIA_ERR_ENCRYPTED';
                        case _: 'unknown error';
                    }

                    return reject('failed to load `$_path` as stream : `$_error`');

                } //onerror

                _element.onloadedmetadata = function(_) {

                    var _node = context.createMediaElementSource(_element);

                        //Web Audio works with 32 bit IEEE float samples
                    var _bytes_per_sample = 2; //this is for 16, though
                    var _rate = Std.int(context.sampleRate);
                    var _channels = _node.channelCount;

                    var _sample_frames = _rate * _channels * _bytes_per_sample;
                    var _length = Std.int(_element.duration * _sample_frames);

                    var _data = new AudioDataWebAudio(app, _node, _element, {
                            id         : _path,
                            is_stream  : true,
                            format     : _format,
                            samples    : null,
                            length     : _length,
                            channels   : _channels,
                            rate       : _rate
                        });

                    return resolve(_data);

                } //onloadedmetadata

            }); //promise

        } //data_from_load_stream


} //Audio

private class AudioDataWebAudio extends AudioData {

    public var buffer: js.html.audio.AudioBuffer;
    public var media_node: js.html.audio.MediaElementAudioSourceNode;
    public var media_elem: js.html.Audio;

    inline public function new(
        _app:snow.Snow,
        ?_buffer:js.html.audio.AudioBuffer,
        ?_media_node:js.html.audio.MediaElementAudioSourceNode,
        ?_media_elem:js.html.Audio,
        _opt:AudioDataOptions
    ) {

        buffer = _buffer;
        media_node = _media_node;
        media_elem = _media_elem;

        super(_app, _opt);

    } //new

    override public function destroy() {

        buffer = null;
        media_node = null;
        media_elem = null;

    } //destroy

} //AudioDataWebAudio

#end