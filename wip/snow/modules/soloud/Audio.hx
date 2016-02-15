package snow.modules.soloud;

import snow.api.Debug.*;
import snow.types.Types;
import snow.api.Promise;
import snow.api.buffers.Uint8Array;
import snow.api.buffers.Float32Array;
import snow.systems.audio.AudioSource;

import soloud.Soloud;

@:log_as('soloud')
@:allow(snow.modules.soloud)
@:allow(snow.systems.audio.Audio)
class Audio {

    var app: snow.Snow;
    var soloud: cpp.Pointer<Soloud>;

    function new(_app:snow.Snow) {

        app = _app;
        log('init');

        soloud = Soloud.create();
        var res = soloud.ptr.init();
        if(res != 0) {
            app.audio.active = false;
            log('failed / didn\'t create device!');
            return;
        }

        log('init $res ${soloud.ptr.getErrorString(res)}');
        
        log('version ${Std.int(soloud.ptr.getVersion())}');
        log('backend');
        log('    id ${Std.int(soloud.ptr.getBackendId())}');
        log('    string ${soloud.ptr.getBackendString()}');
        log('    channels ${Std.int(soloud.ptr.getBackendChannels())}');
        log('    buffersize ${Std.int(soloud.ptr.getBackendBufferSize())}');
        log('    samplerate ${Std.int(soloud.ptr.getBackendSamplerate())}\n');

    }
    
    function onevent(event:SystemEvent):Void {

    }

    function shutdown():Void {
        
        soloud.ptr.deinit();

    }

    function loop(_source:snow.systems.audio.AudioSource, _volume:Float, _paused:Bool) : AudioHandle {

        var w = Wav.create();
        w.ptr.load(_source.asset.id);

        var s = soloud.ptr.play(w.ptr.AudioSource(),_volume,0.0,((_paused)?1:0));
        soloud.ptr.setLooping(s,true);
        return s;

    }

    function play(_source:snow.systems.audio.AudioSource, _volume:Float, _paused:Bool) : AudioHandle {

        var w = Wav.create();
        w.ptr.load(_source.asset.id);

        return soloud.ptr.play(w.ptr.AudioSource(),_volume,0.0,((_paused)?1:0));

    }

    function pause(_handle:AudioHandle) : Void {
        
        soloud.ptr.setPause(_handle, true);

    }

    function unpause(_handle:AudioHandle) : Void {

        soloud.ptr.setPause(_handle, false);

    }

    function stop(_handle:AudioHandle) : Void {

        soloud.ptr.stop(_handle);

    }

    function state(_handle:AudioHandle) : AudioState {
            
            //:todo: isValidVoiceHandle a valid "stopped" query
        if(!soloud.ptr.isValidVoiceHandle(_handle)) {
            return as_stopped;
        } else if(soloud.ptr.getPause(_handle)) {
            return as_paused;
        } 

        return as_playing;

    } //state


    function volume(_handle:AudioHandle, _volume:Float) : Void {

        soloud.ptr.setVolume(_handle, _volume);

    }

    function pan(_handle:AudioHandle, _pan:Float) : Void {

        soloud.ptr.setPan(_handle, _pan);

    }

    function pitch(_handle:AudioHandle, _pitch:Float) : Void {

        soloud.ptr.setRelativePlaySpeed(_handle, _pitch);

    }

    function position(_handle:AudioHandle, _time:Float) : Void {

        soloud.ptr.seek(_handle, _time);

    }


    function volume_of(_handle:AudioHandle) : Float {

        return soloud.ptr.getVolume(_handle);

    }

    function pan_of(_handle:AudioHandle) : Float {
        
        return soloud.ptr.getPan(_handle);

    }

    function pitch_of(_handle:AudioHandle) : Float {
        
        return soloud.ptr.getRelativePlaySpeed(_handle);

    }

    function position_of(_handle:AudioHandle) : Float {
        
        return soloud.ptr.getStreamTime(_handle);

    }


    function suspend():Void {
        //:todo: soloud doesn't have suspend yet
    }

    function resume():Void {
        //:todo: soloud doesn't have resume yet
    }

} //Audio