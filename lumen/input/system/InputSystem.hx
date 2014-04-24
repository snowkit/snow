package lumen.input.system;

import lumen.Lumen;
import lumen.LumenTypes;
import lumen.input.Input;

#if lumen_input_sdl

    typedef LumenInputSystem = lumen.input.system.sdl.InputSystemSDL;

#else
        
    typedef LumenInputSystem = lumen.input.system.InputSystem;

#end //lumen_input_sdl


class InputSystem {

    var manager : Input;
    var lib : Lumen;

    public function new( _manager:Input, _lib:Lumen ) {

        manager = _manager;
        lib = _lib;

    } //new

    public function init() {
    } //init

    public function update() {
    } //update

    public function destroy() {
    } //destroy

    public function on_event( _event : InputEvent ) {
    } //on_event    

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
