package lumen.input.system;

import lumen.Lumen;
import lumen.types.Types;
import lumen.input.Input;

#if lumen_input_sdl

    @:noCompletion typedef LumenInputSystem = lumen.input.system.sdl.InputSystemSDL;

#else
        
    @:noCompletion typedef LumenInputSystem = lumen.input.system.InputSystem;

#end //lumen_input_sdl

/** Internal input system, accessed through `lumen.Input`, not directly */
@:noCompletion class InputSystem {

    var manager : Input;
    var lib : Lumen;

    @:noCompletion public function new( _manager:Input, _lib:Lumen ) {

        manager = _manager;
        lib = _lib;

    } //new

    @:noCompletion public function init() {
    } //init

    @:noCompletion public function update() {
    } //update

    @:noCompletion public function destroy() {
    } //destroy

    @:noCompletion public function on_event( _event : InputEvent ) {
    } //on_event    

        /** Helper to return a `ModState` (shift, ctrl etc) from a given `InputEvent` */
    public function mod_state_from_event( event:InputEvent ) : ModState {

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

} //InputSystem
