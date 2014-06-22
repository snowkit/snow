package snow.platform.native.input;

import snow.input.Input;
import snow.input.InputSystem;
import snow.types.Types;
import snow.window.Window;


@:noCompletion class InputSystem extends InputSystemBinding {


    @:noCompletion public function new( _manager:Input, _lib:Snow ) {

        manager = _manager;
        lib = _lib;

    } //new

    override public function init() {
    } //init

    override public function process() {
    } //process

    override public function destroy() {
    } //destroy

    @:noCompletion override public function listen( window:Window ) {

    } //listen

    @:noCompletion override public function unlisten( window:Window ) {

    } //unlisten

    override public function on_event( _event : InputEvent ) {
    } //on_event

    override public function gamepad_add( id:Int ) {
        snow_gamepad_open(id);
    } //gamepad_add

    override public function gamepad_remove( id:Int ) {
        snow_gamepad_close(id);
    } //gamepad_remove

    static var snow_gamepad_open = Snow.load( "snow", "snow_gamepad_open", 1 );
    static var snow_gamepad_close = Snow.load( "snow", "snow_gamepad_close", 1 );

} //InputSystem
