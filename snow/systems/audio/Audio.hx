package snow.systems.audio;

import snow.types.Types;
import snow.systems.audio.Sound;
import snow.systems.assets.Asset;
import snow.api.Promise;
import snow.api.Debug.*;

@:allow(snow.Snow)
class Audio {

        /** access to snow from subsystems */
    public var app : Snow;
        /** access to module specific implementation */
    public var module : ModuleAudio;
        /** Set to false to stop any and all processing in the audio system */
    public var active : Bool = false;

        /** constructed internally, use `app.audio` */
    function new(_app:Snow) {

        app = _app;
        module = new ModuleAudio(app);
        active = true;

    } //new

//Public API

    public function play(asset:snow.systems.assets.Asset.AssetAudio) : AudioHandle {

        if(!active) {
            return -1;
        }

        return module.play(asset);

    } //play

        /** Loop a sound instance by name, indefinitely. Use stop to end it */
    public function loop(_handle:AudioHandle) : Void {
        module.loop(_handle);
    } //loop

        /** Pause a sound instance by name */
    public function pause(_handle:AudioHandle) : Void {
        module.pause(_handle);
    } //pause

        /** Stop a sound instance by name */
    public function stop(_handle:AudioHandle) : Void {
        module.stop(_handle);
    } //stop

        /** Toggle a sound instance by name, pausing or unpausing the sound */
    public function toggle(_handle:AudioHandle) : Void {
        module.toggle(_handle);
    } //toggle

    public function volume(_handle:AudioHandle, _volume:Float) : Void {
        module.volume(_handle, _volume);
    } //volume

    public function pan(_handle:AudioHandle, _pan:Float) : Void {
        module.pan(_handle, _pan);
    } //pan

    public function pitch(_handle:AudioHandle, _pitch:Float) : Void {
        module.pitch(_handle, _pitch);
    } //pitch

    public function position(_handle:AudioHandle, _position:Float) : Void {
        module.position(_handle, _position);
    } //position

    public function volume_of(_handle:AudioHandle) : Float {
        return module.volume_of(_handle); 
    } //volume_of

    public function pan_of(_handle:AudioHandle) : Float {
        return module.pan_of(_handle); 
    } //pan_of

    public function pitch_of(_handle:AudioHandle) : Float {
        return module.pitch_of(_handle); 
    } //pitch_of

    public function position_of(_handle:AudioHandle) : Float {
        return module.position_of(_handle); 
    } //position_of

    public function duration_of(_handle:AudioHandle) {
        return module.duration_of(_handle);
    } //duration_of

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
