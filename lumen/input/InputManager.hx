package lumen.input;

import lumen.LumenTypes;

import lumen.input.system.InputSystem;
import lumen.input.system.InputSystem.LumenInputSystem;


class InputManager {

    var lib : Lumen;
    var system : LumenInputSystem;

    public function new( _lib:Lumen ) {

        lib = _lib;

        system = new LumenInputSystem(this, lib);

        system.init();

    } //new    

    public function on_event( _event:SystemEvent ) {

        var _input_event = _event.input;
        _input_event.type = InputEvents.typed( cast _input_event.type );

            //ignore mouse move for now
        if(_input_event.type == key) {            
            if(_input_event.event.keysym != null) {
                if(_input_event.event.keysym.sym == 32 && _input_event.event.state == 0) {
                    lib.audio.toggle();                
                }
                if(_input_event.event.keysym.sym == 13 && _input_event.event.state == 0) {
                    if(_input_event.event.keysym.mod == 256) {
                        lib.main_window.fullscreen = !lib.main_window.fullscreen;
                    }
                }
            }
        }

        if(_input_event.type == controller) {

            if(_input_event.event.type == 1619) {
                on_gamepad_added( _input_event.event );
            }

            if(_input_event.event.type == 1620) {
                on_gamepad_removed( _input_event.event );
            }

        }

    } //on_event

    function on_gamepad_added( _event:Dynamic ) {
        
        trace("added gamepad : " + _event.which );
        
        lumen_gamepad_open( _event.which );

    }
    
    function on_gamepad_removed( _event:Dynamic ) {
        
        lumen_gamepad_close( _event.which );

    }

    public function update() {

        system.update();

    } //update

    public function destroy() {
        system.destroy();
    } //destroy

    static var lumen_gamepad_open = Lumen.load( "lumen", "lumen_gamepad_open", 1 );
    static var lumen_gamepad_close = Lumen.load( "lumen", "lumen_gamepad_close", 1 );

} //InputManager
