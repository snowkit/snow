package snow.modules.interfaces;

import snow.api.buffers.Uint8Array;
import snow.api.Promise;
import snow.systems.assets.Asset.AssetAudio;
import snow.systems.audio.AudioSource;
import snow.systems.audio.AudioInstance;
import snow.types.Types;

@:noCompletion
@:allow(snow.systems.audio.Audio)
interface Audio {

    private var app: snow.Snow;
    private var active: Bool;
    private function onevent(event:SystemEvent):Void;
    private function shutdown():Void;

    function data_from_load(_path:String, ?_is_stream:Bool=false, ?_format:AudioFormatType) : Promise;
    function data_from_bytes(_id:String, _bytes:Uint8Array, ?_format:AudioFormatType) : Promise;

    function play(_source:AudioSource, _volume:Float, _paused:Bool) : AudioHandle;
    function loop(_source:AudioSource, _volume:Float, _paused:Bool) : AudioHandle;
    function pause(_handle:AudioHandle) : Void;
    function unpause(_handle:AudioHandle) : Void;
    function stop(_handle:AudioHandle) : Void;

    function volume(_handle:AudioHandle, _volume:Float) : Void;
    function pan(_handle:AudioHandle, _pan:Float) : Void;
    function pitch(_handle:AudioHandle, _pitch:Float) : Void;
    function position(_handle:AudioHandle, _time:Float) : Void;

    function volume_of(_handle:AudioHandle) : Float;
    function pan_of(_handle:AudioHandle) : Float;
    function pitch_of(_handle:AudioHandle) : Float;
    function position_of(_handle:AudioHandle) : Float;
    function state_of(_handle:AudioHandle) : AudioState;
    function loop_of(_handle:AudioHandle) : Bool;
    function instance_of(_handle:AudioHandle) : AudioInstance;

    function suspend():Void;
    function resume():Void;

} //Audio
