package lumen.platform.html5.input;

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
    
    override public function gamepad_add( id:Int ) {

    } //gamepad_add
    
    override public function gamepad_remove( id:Int ) {
        
    } //gamepad_remove

} //InputSystem
