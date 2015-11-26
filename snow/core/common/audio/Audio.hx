package snow.core.common.audio;

import snow.types.Types;
import snow.api.buffers.Uint8Array;
import snow.api.Promise;
import snow.api.Debug.*;

@:allow(snow.systems.audio.Audio)
class Audio implements snow.modules.interfaces.Audio {

    var app : snow.Snow;

    function new( _app:snow.Snow ) app = _app;
    function onevent(event:SystemEvent) {}
    function shutdown() {}

    public function play(_source:AudioSource, _volume:Float, _paused:Bool) : AudioHandle {
        
        log('play in core module does nothing.');
        return -1;
            
    } //play

    public function loop(_handle:AudioHandle) : Void {
        
        log('loop in core module does nothing.');
            
    } //loop

    public function pause(_handle:AudioHandle) : Void {
        
        log('pause in core module does nothing.');
            
    } //pause

    public function stop(_handle:AudioHandle) : Void {
        
        log('stop in core module does nothing.');
            
    } //stop

    public function volume(_handle:AudioHandle, _volume:Float) : Void {
        
        log('volume in core module does nothing.');
            
    } //volume

    public function pan(_handle:AudioHandle, _pan:Float) : Void {
        
        log('pan in core module does nothing.');
            
    } //pan

    public function pitch(_handle:AudioHandle, _pitch:Float) : Void {
        
        log('pitch in core module does nothing.');
            
    } //pitch

    public function position(_handle:AudioHandle, _position:Float) : Void {
        
        log('position in core module does nothing.');
            
    } //position

    public function volume_of(_handle:AudioHandle) : Float {
        
        log('volume_of in core module does nothing.');

        return 0.0;
            
    } //volume_of

    public function pan_of(_handle:AudioHandle) : Float {
        
        log('pan_of in core module does nothing.');

        return 0.0;
            
    } //pan_of

    public function pitch_of(_handle:AudioHandle) : Float {
        
        log('pitch_of in core module does nothing.');

        return 0.0;
            
    } //pitch_of

    public function position_of(_handle:AudioHandle) : Int {
        
        log('position_of in core module does nothing.');

        return 0;
            
    } //position_of

    public function suspend() {

        log('suspend in core module does nothing.');

    } //suspend

    public function resume() {

        log('resume in core module does nothing.');

    } //resume

} //Audio

typedef Sound = snow.systems.audio.Sound;
