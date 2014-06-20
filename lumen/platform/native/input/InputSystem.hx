package lumen.platform.native.input;

import lumen.input.Input;
import lumen.input.InputSystem;
import lumen.types.Types;
import lumen.window.Window;


@:noCompletion class InputSystem extends InputSystemBinding {


    @:noCompletion public function new( _manager:Input, _lib:Lumen ) {

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
        lumen_gamepad_open(id);
    } //gamepad_add

    override public function gamepad_remove( id:Int ) {
        lumen_gamepad_close(id);
    } //gamepad_remove

    static var lumen_gamepad_open = Lumen.load( "lumen", "lumen_gamepad_open", 1 );
    static var lumen_gamepad_close = Lumen.load( "lumen", "lumen_gamepad_close", 1 );

} //InputSystem
