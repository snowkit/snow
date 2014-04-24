package lumen.input;

import lumen.LumenTypes;

import lumen.input.system.InputSystem;
import lumen.input.system.InputSystem.LumenInputSystem;


// import lumen.input.Keycodes;

    //convenience
typedef Key = lumen.input.Keycodes.Keycodes;
typedef Scan = lumen.input.Keycodes.Scancodes;

class Input {

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

    public function dispatch_key_event( _event:KeyEvent ) {
            
        if(_event.state == KeyState.up) {
            lib.onkeyup(_event);
        } else {
            lib.onkeydown(_event);
        }

    } //dispatch_key_event

    public function dispatch_text_event( _event:TextEvent ) {
            
        lib.ontextinput(_event);

    } //dispatch_key_event

    public function dispatch_mouse_event( _event:MouseEvent ) {

        if(_event.state == down) {
            lib.onmousedown(_event);
        } else if(_event.state == up) {
            lib.onmouseup(_event);
        } else if(_event.state == move) {
            lib.onmousemove(_event);
        } else if(_event.state == wheel) {
            lib.onmousewheel(_event);
        }

    } //dispatch_key_event

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

    public function mod_state_from_event( event:InputEvent ) {

        return system.mod_state_from_event( event );

    } //mod_state_from_event

    static var lumen_gamepad_open = Lumen.load( "lumen", "lumen_gamepad_open", 1 );
    static var lumen_gamepad_close = Lumen.load( "lumen", "lumen_gamepad_close", 1 );

} //Input

enum KeyState {
    unknown;
    down;
    up;
}

enum MouseState {
    unknown;
    down;
    up;
    move;
    wheel;
}

enum MouseButton {
    none;
    left;
    middle;
    right;
    extra1;
    extra2;
}   

enum TextEventType {
    unknown;
    edit;
    input;
}

typedef ModState = {
    none : Bool,
    lshift : Bool,
    rshift : Bool,
    lctrl : Bool,
    rctrl : Bool,
    lalt : Bool,
    ralt : Bool,
    lmeta : Bool,
    rmeta : Bool,
    num : Bool,
    caps : Bool,
    mode : Bool,
    ctrl : Bool,
    shift : Bool,
    alt : Bool,
    meta : Bool
}

typedef MouseEvent = {
    raw : InputEvent,
    timestamp : Float,
    window_id : Int,
    which : Int,
    state : MouseState,
    button : MouseButton,
    x : Int,
    y : Int,
    xrel : Int,
    yrel : Int,
}

typedef KeyEvent = {
    raw : InputEvent,
    scancode : Int,
    keycode : Int,
    state : KeyState,
    mod : ModState,
    repeat : Bool,    
    timestamp : Float,
    window_id : Int
}

typedef TextEvent = {
    raw : InputEvent,
    text : String,
    type : TextEventType,
    timestamp : Float,
    window_id : Int,
    start : Int,
    length : Int
}



