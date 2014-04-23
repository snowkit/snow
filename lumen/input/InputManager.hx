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

        system.on_event( _event.input );

    } //on_event

    public function on_gamepad_added( _event:Dynamic ) {
        
        lumen_gamepad_open( _event.which );

    } //on_gamepad_added
    
    public function on_gamepad_removed( _event:Dynamic ) {
        
        lumen_gamepad_close( _event.which );

    } //on_gamepad_removed

    public function update() {

        system.update();

    } //update

    public function destroy() {
        system.destroy();
    } //destroy

    static var lumen_gamepad_open = Lumen.load( "lumen", "lumen_gamepad_open", 1 );
    static var lumen_gamepad_close = Lumen.load( "lumen", "lumen_gamepad_close", 1 );

} //InputManager
