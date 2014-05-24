package lumen.platform.native.input;

import lumen.input.Input;
import lumen.input.InputSystem;
import lumen.types.Types;


@:noCompletion class InputSystem extends InputSystemBinding {


    @:noCompletion public function new( _manager:Input, _lib:Lumen ) {

        manager = _manager;
        lib = _lib;

    } //new

    override public function init() {
    } //init

    override public function update() {
    } //update

    override public function destroy() {
    } //destroy

    override public function on_event( _event : InputEvent ) {
    } //on_event

    override public function gamepad_add( id:Int ) {
        lumen_gamepad_open(id);
    } //gamepad_add

    override public function gamepad_remove( id:Int ) {
        lumen_gamepad_close(id);
    } //gamepad_remove

	override public function mod_state_from_event( event:InputEvent ) : ModState {

        return {
            none    : true,
            lshift  : false, 
            rshift  : false,
            lctrl   : false,
            rctrl   : false,
            lalt    : false,
            ralt    : false,
            lmeta   : false,
            rmeta   : false,
            num     : false,
            caps    : false,
            mode    : false,
            ctrl    : false,
            shift   : false,
            alt     : false,
            meta    : false
        };

    } //mod_state_from_event  
    
    static var lumen_gamepad_open = Lumen.load( "lumen", "lumen_gamepad_open", 1 );
    static var lumen_gamepad_close = Lumen.load( "lumen", "lumen_gamepad_close", 1 );

} //InputSystem
