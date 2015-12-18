package snow.core;

import snow.types.Types;
import snow.systems.audio.AudioSource;
import snow.systems.audio.AudioInstance;

@:allow(snow.systems.audio.Audio)
class Audio implements snow.modules.interfaces.Audio {

    var app : snow.Snow;
    function new(_app:snow.Snow) app = _app;
    function onevent(event:SystemEvent):Void {}
    function shutdown():Void {}
    public function suspend():Void {}
    public function resume():Void {}

    public function play(_source:AudioSource, _volume:Float, _paused:Bool) : AudioHandle { return null; }
    public function loop(_source:AudioSource, _volume:Float, _paused:Bool) : AudioHandle { return null; }
    public function pause(_handle:AudioHandle) : Void {}
    public function unpause(_handle:AudioHandle) : Void {}
    public function stop(_handle:AudioHandle) : Void {}

    public function volume(_handle:AudioHandle, _volume:Float) : Void {}
    public function pan(_handle:AudioHandle, _pan:Float) : Void {}
    public function pitch(_handle:AudioHandle, _pitch:Float) : Void {}
    public function position(_handle:AudioHandle, _time:Float) : Void {}

    public function volume_of(_handle:AudioHandle) : Float { return 0.0; }
    public function pan_of(_handle:AudioHandle) : Float { return 0.0; }
    public function pitch_of(_handle:AudioHandle) : Float { return 0.0; }
    public function position_of(_handle:AudioHandle) : Float { return 0.0; }
    public function state_of(_handle:AudioHandle) : AudioState { return as_invalid; }
    public function loop_of(_handle:AudioHandle) : Bool { return false; }
    public function instance_of(_handle:AudioHandle) : AudioInstance { return null; }

}