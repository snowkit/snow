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
        active = module.active;

    } //new

//Public API

    @:generic
    public function on<T>(_event:AudioEvent, _handler:T->Void) : Void {
    
        emitter.on(_event, _handler);
    
    } //on
    
    @:generic
    public function off<T>(_event:AudioEvent, _handler:T->Void) : Bool {
    
        return emitter.off(_event, _handler);
    
    } //off
        
    @:generic
    public function emit<T>(_event:AudioEvent, _data:T) : Void {
    
        emitter.emit(_event, _data);
    
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

    public function suspend() : Void {

        if(!active) {
            return;
        }

        log("suspending sound context");
        active = false;
        module.suspend();

    } //suspend

    public function resume() : Void {

        if(active || !module.active) {
            return;
        }

        log("resuming sound context");
        active = true;
        module.resume();

    } //resume

//Internal

        /** Called by Snow when a system event is dispatched */
    function onevent( _event:SystemEvent ) {

        module.onevent(_event);

        if(_event.type == se_window) {
            switch(_event.window.type) {
                case WindowEventType.we_minimized:
                    suspend();
                case WindowEventType.we_restored:
                    resume();
                case _: {}
            }
        }

    } //onevent

        /** Called by Snow, cleans up sounds/system */
    function shutdown() {

        active = false;
        module.shutdown();

    } //shutdown

} //Audio
