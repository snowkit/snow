package lumen.input.system;

import lumen.Lumen;
import lumen.LumenTypes;
import lumen.input.InputManager;

#if lumen_input_sdl

    typedef LumenInputSystem = lumen.input.system.sdl.InputSystemSDL;

#else
        
    typedef LumenInputSystem = lumen.input.system.InputSystem;

#end //lumen_input_sdl


class InputSystem {

    var manager : InputManager;
    var lib : Lumen;

    public function new( _manager:InputManager, _lib:Lumen ) {

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

} //InputSystem
