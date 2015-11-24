package snow.modules.interfaces;

import snow.api.buffers.Uint8Array;
import snow.api.Promise;
import snow.systems.audio.Sound;
import snow.types.Types;

@:noCompletion
@:allow(snow.systems.audio.Audio)
interface Audio {

    private var app: snow.Snow;
    private function onevent(event:SystemEvent):Void;
    private function shutdown():Void;

    function create_sound( _id:String, _name:String, _streaming:Bool=false, ?_format:AudioFormatType ) : Promise;
    function create_sound_from_bytes( _name:String, _bytes:Uint8Array, _format:AudioFormatType ):Sound;

    function suspend():Void;
    function resume():Void;

} //Input
