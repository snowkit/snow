package snow.systems.audio;

import snow.types.Types;
import snow.systems.assets.Asset;
import snow.systems.audio.AudioInstance;
import snow.api.Promise;
import snow.api.Debug.*;
import snow.api.Emitter;


@:allow(snow.Snow)
class Audio {

        /** access to snow from subsystems */
    public var app : Snow;
        /** access to module specific implementation */
    public var module : ModuleAudio;
        /** Set to false to stop any and all processing in the audio system */
    public var active : Bool = false;

    var emitter : Emitter<AudioEvent>;

        /** constructed internally, use `app.audio` */
    function new(_app:Snow) {

        app = _app;
        module = new ModuleAudio(app);
        emitter = new Emitter();
        active = true;

    } //new

//Public API

    public function on(_event:AudioEvent, _handler:AudioHandle->Void) {
    
        emitter.on(_event, _handler);
    
    } //on
    
    public function off(_event:AudioEvent, _handler:AudioHandle->Void) {
    
        return emitter.off(_event, _handler);
    
    } //off
    
    public function emit(_event:AudioEvent, _handle:AudioHandle) {
    
        emitter.emit(_event, _handle);
    
    } //emit
    
    public function play(_source:AudioSource, ?_volume:Float=1.0, ?_paused:Bool=false) : AudioHandle {

        if(!active) {
            return -1;
        }

        return module.play(_source, _volume, _paused);

    } //play

        /** play and loop a sound source, indefinitely. Use stop to end it. */
    public function loop(_source:AudioSource, ?_volume:Float=1.0, ?_paused:Bool=false) : AudioHandle {
        
        if(!active) {
            return -1;
        }

        return module.loop(_source, _volume, _paused);

    } //loop

    public function pause(_handle:AudioHandle) : Void {
        if(!active) return;
        module.pause(_handle);
    } //pause

    public function unpause(_handle:AudioHandle) : Void {
        if(!active) return;
        module.unpause(_handle);
    } //unpause

    public function stop(_handle:AudioHandle) : Void {
        if(!active) return;
        module.stop(_handle);
    } //stop

    public function volume(_handle:AudioHandle, _volume:Float) : Void {
        if(!active) return;
        module.volume(_handle, _volume);
    } //volume

    public function pan(_handle:AudioHandle, _pan:Float) : Void {
        if(!active) return;
        module.pan(_handle, _pan);
    } //pan

    public function pitch(_handle:AudioHandle, _pitch:Float) : Void {
        if(!active) return;
        module.pitch(_handle, _pitch);
    } //pitch

    public function position(_handle:AudioHandle, _position:Float) : Void {
        if(!active) return;
        module.position(_handle, _position);
    } //position

    public function state_of(_handle:AudioHandle) : AudioState {
        return module.state_of(_handle);
    } //state_of

    public function loop_of(_handle:AudioHandle) : Bool {
        assert(active, 'audio is suspended, queries are invalid');
        return module.loop_of(_handle);
    } //loop_of

    public function instance_of(_handle:AudioHandle) : AudioInstance {
        assert(active, 'audio is suspended, queries are invalid');
        return module.instance_of(_handle); 
    } //instance_of

    public function volume_of(_handle:AudioHandle) : Float {
        assert(active, 'audio is suspended, queries are invalid');
        return module.volume_of(_handle); 
    } //volume_of

    public function pan_of(_handle:AudioHandle) : Float {
        assert(active, 'audio is suspended, queries are invalid');
        return module.pan_of(_handle); 
    } //pan_of

    public function pitch_of(_handle:AudioHandle) : Float {
        assert(active, 'audio is suspended, queries are invalid');
        return module.pitch_of(_handle); 
    } //pitch_of

    public function position_of(_handle:AudioHandle) : Float {
        assert(active, 'audio is suspended, queries are invalid');
        return module.position_of(_handle); 
    } //position_of

    @:noCompletion public function suspend() {

        if(!active) {
            return;
        }

        log("suspending sound context");
        active = false;
        module.suspend();

    } //suspend

    @:noCompletion public function resume() {

        if(active) {
            return;
        }

        log("resuming sound context");
        active = true;
        module.resume();

    } //resume

        /** Called by Snow when a system event is dispatched */
    function onevent( _event:SystemEvent ) {

        module.onevent(_event);

        if(_event.type == se_app_willenterbackground) {
            suspend();
        } else if(_event.type == se_app_willenterforeground) {
            resume();
        }

    } //onevent

        /** Called by Snow, cleans up sounds/system */
    function shutdown() {

        active = false;
        module.shutdown();

    } //shutdown

} //Audio
