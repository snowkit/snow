package snow.core.web.audio;

#if snow_web

import snow.types.Types;
import snow.api.Promise;
import snow.api.buffers.Uint8Array;

@:allow(snow.system.audio.Audio)
class Audio implements snow.modules.interfaces.Audio {

    var system : snow.system.audio.Audio;

    function new( _system:snow.system.audio.Audio ) system = _system;

    function init() {}
    function update() {}
    function destroy() {}
    function onevent(event:SystemEvent) {}

    public function create_sound( _id:String, _name:String, _streaming:Bool=false, ?_format:AudioFormatType ) : Promise {
        return null;
    }

    public function create_sound_from_bytes( _name:String, _bytes:Uint8Array, _format:AudioFormatType ):Sound {
        return null;
    }

        //:todo:
    public function suspend() {}
        //:todo:
    public function resume() {}

} //AudioSystem

typedef Sound = snow.system.audio.Sound;

#end //snow_web
