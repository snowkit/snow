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

        /** Play an instance of the given audio asset, returning a dispoable handle */
    public function play(asset:AssetAudio) : AudioHandle {
        
        log('play in core module does nothing.');
        return -1;
            
    } //play

        /** Loop a sound instance by name, indefinitely. Use stop to end it */
    public function loop(_handle:AudioHandle) : Void {
        
        log('loop in core module does nothing.');
            
    } //loop

        /** Pause a sound instance by name */
    public function pause(_handle:AudioHandle) : Void {
        
        log('pause in core module does nothing.');
            
    } //pause

        /** Stop a sound instance by name */
    public function stop(_handle:AudioHandle) : Void {
        
        log('stop in core module does nothing.');
            
    } //stop

        /** Toggle a sound instance by name, pausing or unpausing the sound */
    public function toggle(_handle:AudioHandle) : Void {
        
        log('toggle in core module does nothing.');
            
    } //toggle

        /** Set the volume of a sound instance */
    public function volume(_handle:AudioHandle, _volume:Float) : Void {
        
        log('volume in core module does nothing.');
            
    } //volume

        /** Set the pan of a sound instance */
    public function pan(_handle:AudioHandle, _pan:Float) : Void {
        
        log('pan in core module does nothing.');
            
    } //pan

        /** Set the pitch of a sound instance */
    public function pitch(_handle:AudioHandle, _pitch:Float) : Void {
        
        log('pitch in core module does nothing.');
            
    } //pitch

        /** Set the position of a sound instance */
    public function position(_handle:AudioHandle, _position:Float) : Void {
        
        log('position in core module does nothing.');
            
    } //position

        /** Get the volume of a sound instance */
    public function volume_of(_handle:AudioHandle) : Float {
        
        log('volume_of in core module does nothing.');

        return 0.0;
            
    } //volume_of

        /** Get the pan of a sound instance */
    public function pan_of(_handle:AudioHandle) : Float {
        
        log('pan_of in core module does nothing.');

        return 0.0;
            
    } //pan_of

        /** Get the pitch of a sound instance */
    public function pitch_of(_handle:AudioHandle) : Float {
        
        log('pitch_of in core module does nothing.');

        return 0.0;
            
    } //pitch_of

        /** Get the position of a sound instance */
    public function position_of(_handle:AudioHandle) : Int {
        
        log('position_of in core module does nothing.');

        return 0;
            
    } //position_of

        /** Get the duration of a sound instance */
    public function duration_of(_handle:AudioHandle) : Float {
        
        log('duration_of in core module does nothing.');

        return 0.0;
            
    } //duration_of


    public function suspend() {

        log('suspend in core module does nothing.');

    } //suspend

    public function resume() {

        log('resume in core module does nothing.');

    } //resume

} //Audio

typedef Sound = snow.systems.audio.Sound;
