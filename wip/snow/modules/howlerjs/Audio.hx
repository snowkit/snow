package snow.modules.howlerjs;

import snow.api.Debug.*;
import snow.types.Types;
import snow.api.Promise;
import snow.api.buffers.Uint8Array;
import snow.api.buffers.Float32Array;
import snow.systems.audio.AudioSource;
import snow.systems.audio.AudioInstance;

import snow.modules.howlerjs.Howl;
import snow.modules.howlerjs.Howler;

private typedef HowlSound = {
    instance:AudioInstance,
    source:AudioSource,
    handle:AudioHandle, 
    howl:Howl
}

@:log_as('howler')
@:allow(snow.modules.howlerjs)
@:allow(snow.systems.audio.Audio)
class Audio implements snow.modules.interfaces.Audio {

    var handle_seq = 0;

    var instances: Map<AudioHandle, HowlSound>;

    var app: snow.Snow;
    var active: Bool = false;

    function new(_app:snow.Snow) {

        app = _app;
        instances = new Map();
        active = true;

        log('howlerjs');

    } //new

    function onevent(event:SystemEvent):Void {

    }

    function shutdown():Void {

    }

    inline function howl(_handle:AudioHandle) : HowlSound {

        return instances.get(_handle);

    } //howl

    inline function new_howl(_handle:AudioHandle, _source:AudioSource, _volume:Float, _paused:Bool, _loop:Bool) : Howl {

        var opt:HowlOptions = {};

            opt.urls = [_source.info.id];
            opt.autoplay = !_paused;
            opt.volume = _volume;
            opt.buffer = false;
            opt.loop = _loop;

            opt.onend = function() {
                app.audio.emit(ae_end, _handle);
            }

            opt.onload = function() {
            }

        return new Howl(opt);
    }

    public function play(_source:AudioSource, _volume:Float, _paused:Bool) : AudioHandle {

        var _handle = handle_seq;
        var _inst = _source.instance(_handle);
        var _howl = new_howl(_handle, _source, _volume, _paused, false);

        instances.set(_handle, { source:_source, handle:_handle, howl:_howl, instance:_inst });

        handle_seq++;

        return _handle;

    } //play

    public function loop(_source:AudioSource, _volume:Float, _paused:Bool) : AudioHandle {

        var _handle = handle_seq;
        var _inst = _source.instance(_handle);
        var _howl = new_howl(_handle, _source, _volume, _paused, true);

        instances.set(_handle, { source:_source, handle:_handle, howl:_howl, instance:_inst });

        handle_seq++;

        return _handle;

    } //loop

    public function pause(_handle:AudioHandle) : Void {

        var _snd = howl(_handle);
        if(_snd == null) return;

        _debug('pause handle=$_handle, ' + _snd.source.info.id);

        _snd.howl.pause();

    } //pause

    public function unpause(_handle:AudioHandle) : Void {

        var _snd = howl(_handle);
        if(_snd == null) return;

        _debug('unpause handle=$_handle, ' + _snd.source.info.id);

        _snd.howl.play();

    } //unpause

    public function stop(_handle:AudioHandle) : Void {

        var _snd = howl(_handle);
        if(_snd == null) return;

        _debug('stop handle=$_handle, ' + _snd.source.info.id);

        _snd.howl.stop();

    } //stop


    public function volume(_handle:AudioHandle, _volume:Float) : Void {

        var _snd = howl(_handle);
        if(_snd == null) return;

        _debug('volume handle=$_handle, ' + _snd.source.info.id);

        _snd.howl.volume(_volume);

    } //volume

    public function pan(_handle:AudioHandle, _pan:Float) : Void {

        var _snd = howl(_handle);
        if(_snd == null) return;

        _debug('pan handle=$_handle, ' + _snd.source.info.id);

        _snd.howl.pos3d(_pan, 0.0, 0.0);

    } //pan

    public function pitch(_handle:AudioHandle, _pitch:Float) : Void {

        var _snd = howl(_handle);
        if(_snd == null) return;

        _debug('pitch handle=$_handle, ' + _snd.source.info.id);

        untyped _snd.howl.rate(_pitch);

    } //pitch

    public function position(_handle:AudioHandle, _time:Float) : Void {

        var _snd = howl(_handle);
        if(_snd == null) return;

        _debug('position handle=$_handle, ' + _snd.source.info.id);

        _snd.howl.pos(_time);

    } //position


    public function volume_of(_handle:AudioHandle) : Float {

        var _snd = howl(_handle);
        if(_snd == null) return 0.0;

        return _snd.howl.volume();

    } //volume_of

    public function pan_of(_handle:AudioHandle) : Float {

        var _snd = howl(_handle);
        if(_snd == null) return 0.0;

        var _pos = _snd.howl.pos3d();
        return _pos[0];

    } //pan_of

    public function pitch_of(_handle:AudioHandle) : Float {

        var _snd = howl(_handle);
        if(_snd == null) return 0.0;

        return untyped _snd.howl.rate();

    } //pitch_of

    public function position_of(_handle:AudioHandle) : Float {

        var _snd = howl(_handle);
        if(_snd == null) return 0.0;

        return _snd.howl.pos();

    } //position_of

    public function state_of(_handle:AudioHandle) : AudioState {

        var _snd = howl(_handle);
        if(_snd == null) return as_invalid;

        return as_invalid;

    } //state_of

    public function loop_of(_handle:AudioHandle) : Bool {

        var _snd = howl(_handle);
        if(_snd == null) return false;

        return _snd.howl.loop();

    } //loop_of

    public function instance_of(_handle:AudioHandle) : AudioInstance {

        var _snd = howl(_handle);
        if(_snd == null) return null;

        return _snd.instance;

    } //instance_of


    public function suspend():Void {

        untyped Howler.ctx.suspend();

    } //suspend

    public function resume():Void {

        untyped Howler.ctx.resume();

    } //resume


} //Audio
