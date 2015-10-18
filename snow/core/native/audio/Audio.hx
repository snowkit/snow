package snow.core.native.audio;

import snow.types.Types;
import snow.api.buffers.Uint8Array;
import snow.api.Promise;
import snow.api.Debug.*;

@:allow(snow.system.audio.Audio)
class Audio implements snow.modules.interfaces.Audio {

    var app : snow.Snow;

    function new( _app:snow.Snow ) app = _app;
    function onevent(event:SystemEvent) {}
    function shutdown() {}

    public function create_sound( _id:String, _name:String, _streaming:Bool=false, ?_format:AudioFormatType ) : Promise {
        log('create_sound in core module does nothing.');
        return null;
    }

    public function create_sound_from_bytes( _name:String, _bytes:Uint8Array, _format:AudioFormatType ) : Sound {
        log('create_sound_from_bytes in core module does nothing.');
        return null;
    }

    public function suspend() {

        log('suspend in core module does nothing.');

    } //suspend

    public function resume() {

        log('resume in core module does nothing.');

    } //resume

} //Audio

typedef Sound = snow.system.audio.Sound;
