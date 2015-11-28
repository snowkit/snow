package snow.modules.soloud;

import snow.api.Debug.*;
import snow.types.Types;
import snow.api.Promise;
import snow.api.buffers.Uint8Array;
import snow.api.buffers.Float32Array;
import snow.systems.audio.AudioSource;

@:log_as('soloud')
@:allow(snow.modules.openal)
@:allow(snow.systems.audio.Audio)
class Audio {

    var app: snow.Snow;


    function new(_app:snow.Snow) {
        app = _app;
        log('init');
    }
    
    function onevent(event:SystemEvent):Void {

    }

    function shutdown():Void {

    }

    function loop(_source:AudioSource, _volume:Float, _paused:Bool) : AudioHandle {
        return 0;
    }

    function play(_source:AudioSource, _volume:Float, _paused:Bool) : AudioHandle {
        return 0;
    }

    function pause(_handle:AudioHandle) : Void {

    }

    function unpause(_handle:AudioHandle) : Void {

    }

    function stop(_handle:AudioHandle) : Void {

    }

    function state(_handle:AudioHandle) : AudioState {
        return as_invalid;
    }


    function volume(_handle:AudioHandle, _volume:Float) : Void {

    }

    function pan(_handle:AudioHandle, _pan:Float) : Void {

    }

    function pitch(_handle:AudioHandle, _pitch:Float) : Void {

    }

    function position(_handle:AudioHandle, _time:Float) : Void {

    }


    function volume_of(_handle:AudioHandle) : Float {
        return 0.0;
    }

    function pan_of(_handle:AudioHandle) : Float {
        return 0.0;
    }

    function pitch_of(_handle:AudioHandle) : Float {
        return 0.0;
    }

    function position_of(_handle:AudioHandle) : Float {
        return 0.0;
    }


    function suspend():Void {

    }

    function resume():Void {

    }

} //Audio