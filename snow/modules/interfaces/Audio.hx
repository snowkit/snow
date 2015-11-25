package snow.modules.interfaces;

import snow.api.buffers.Uint8Array;
import snow.api.Promise;
import snow.systems.assets.Asset.AssetAudio;
import snow.systems.audio.Sound;
import snow.types.Types;

@:noCompletion
@:allow(snow.systems.audio.Audio)
interface Audio {

    private var app: snow.Snow;
    private function onevent(event:SystemEvent):Void;
    private function shutdown():Void;

        /** Play an instance of the given audio asset, returning a dispoable handle */
    function play(asset:AssetAudio) : AudioHandle;
        /** Loop a sound instance by name, indefinitely. Use stop to end it */
    function loop(_handle:AudioHandle) : Void;
        /** Pause a sound instance by name */
    function pause(_handle:AudioHandle) : Void;
        /** Stop a sound instance by name */
    function stop(_handle:AudioHandle) : Void;
        /** Toggle a sound instance by name, pausing or unpausing the sound */
    function toggle(_handle:AudioHandle) : Void;
        /** Set the volume of a sound instance */
    function volume(_handle:AudioHandle, _volume:Float) : Void;
        /** Set the pan of a sound instance */
    function pan(_handle:AudioHandle, _pan:Float) : Void;
        /** Set the pitch of a sound instance */
    function pitch(_handle:AudioHandle, _pitch:Float) : Void;
        /** Set the position of a sound instance */
    function position(_handle:AudioHandle, _position:Float) : Void;
        /** Get the volume of a sound instance */
    function volume_of(_handle:AudioHandle) : Float;
        /** Get the pan of a sound instance */
    function pan_of(_handle:AudioHandle) : Float;
        /** Get the pitch of a sound instance */
    function pitch_of(_handle:AudioHandle) : Float;
        /** Get the position of a sound instance */
    function position_of(_handle:AudioHandle) : Int;
        /** Get the duration of a sound instance */
    function duration_of(_handle:AudioHandle) : Float;

    function suspend():Void;
    function resume():Void;

} //Input
