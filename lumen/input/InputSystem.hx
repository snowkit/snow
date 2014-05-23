package lumen.input;

import lumen.Lumen;
import lumen.types.Types;
import lumen.input.Input;



#if lumen_html5
    
        @:noCompletion typedef LumenInputSystem = lumen.platform.html5.input.InputSystemHTML5;

#else 

    #if lumen_input_sdl
        @:noCompletion typedef LumenInputSystem = lumen.platform.native.input.sdl.InputSystemSDL;
    #else
        @:noCompletion typedef LumenInputSystem = lumen.platform.native.input.InputSystemNative;
    #end 

#end 

/** Internal input system, accessed through `lumen.Input`, not directly */
@:noCompletion class InputSystem {

    var manager : Input;
    var lib : Lumen;

    @:noCompletion public function new( _manager:Input, _lib:Lumen ) {

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
