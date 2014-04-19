package lumen.input;

import lumen.LumenTypes;

class InputManager {

    var lib : Lumen;

    public function new( _lib:Lumen ) {

        lib = _lib;

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
        
        trace("removed gamepad" + _event.which );

        lumen_gamepad_close( _event.which );

    }

    public function update() {

    } //update

    public function destroy() {
        
    } //destroy

    private static var lumen_gamepad_open = Lumen.load( "lumen", "lumen_gamepad_open", 1 );
    private static var lumen_gamepad_close = Lumen.load( "lumen", "lumen_gamepad_close", 1 );

} //InputManager
