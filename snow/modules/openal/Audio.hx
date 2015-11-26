package snow.modules.openal;

import snow.types.Types;
import snow.api.Promise;

import snow.modules.openal.AL;
import snow.modules.openal.AL.Context;
import snow.modules.openal.AL.Device;

import snow.api.buffers.Uint8Array;
import snow.api.Debug.*;


@:allow(snow.systems.audio.Audio)
@:log_as('openal')
class Audio implements snow.modules.interfaces.Audio {

    public var device : Device;
    public var context : Context;
    
    var app : snow.Snow;

    function new(_app:snow.Snow) {

        app = _app;

        log('init');
        device = ALC.openDevice();

        if(device == null) {
            log('failed / didn\'t create device!');
            return;
        }

        log('created device / ${device} / ${ ALCError.desc(ALC.getError(device)) }');

        context = ALC.createContext(device, null);
        log('created context / ${context} / ${ ALCError.desc(ALC.getError(device)) }');

        ALC.makeContextCurrent(context);
        log('set current / ${ ALCError.desc(ALC.getError(device)) }');

    } //new

    function shutdown() {

        ALC.makeContextCurrent(cast null);
        log('invalidate context / ${ ALCError.desc(ALC.getError(device)) }');

        ALC.destroyContext(context);
        log('destroyed context / ${ ALCError.desc(ALC.getError(device)) }');

        ALC.closeDevice(device);
        log('closed device / ${ ALCError.desc(ALC.getError(device)) }');

        device = null;
        context = null;

    } //shutdown

    public function suspend() {

        log('suspending context');

        ALC.suspendContext(context);
        ALC.makeContextCurrent(cast null);

    } //suspend

    public function resume() {

        log('resuming context');

        ALC.processContext(context);
        ALC.makeContextCurrent(context);

    } //resume


    function onevent(event:SystemEvent) {}
    
//
        /** Play an instance of the given audio asset, returning a disposable handle */
    public function play(asset:AssetAudio, _volume:Float, _paused:Bool) : AudioHandle {
        
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


} //Audio

