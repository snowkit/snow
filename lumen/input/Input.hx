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
            
        if(_event.state == PressedState.up) {
            lib.host.onkeyup(_event);
        } else {
            lib.host.onkeydown(_event);
        }

    } //dispatch_key_event

    public function dispatch_text_event( _event:TextEvent ) {
            
        lib.host.ontextinput(_event);

    } //dispatch_text_event

    public function dispatch_mouse_event( _event:MouseEvent ) {

        if(_event.state == MouseState.down) {
            lib.host.onmousedown(_event);
        } else if(_event.state == MouseState.up) {
            lib.host.onmouseup(_event);
        } else if(_event.state == MouseState.move) {
            lib.host.onmousemove(_event);
        } else if(_event.state == MouseState.wheel) {
            lib.host.onmousewheel(_event);
        }

    } //dispatch_mouse_event

    public function dispatch_touch_event( _event:TouchEvent ) {

        if(_event.state == TouchState.down) {
            lib.host.ontouchdown(_event);
        } else if(_event.state == TouchState.up) {
            lib.host.ontouchup(_event);
        } else if(_event.state == TouchState.move) {
            lib.host.ontouchmove(_event);
        }

    } //dispatch_touch_event

    public function dispatch_gamepad_event( _event:GamepadEvent ) {

        if(_event.type == GamepadEventType.axis) {
            lib.host.ongamepadaxis(_event);
        } else if(_event.type == GamepadEventType.button) {
            if(_event.state == PressedState.down) {
                lib.host.ongamepadbuttondown(_event);
            } else if(_event.state == PressedState.up) {
                lib.host.ongamepadbuttonup(_event);
            }
        } else 
        if( _event.type == GamepadEventType.device_added || 
            _event.type == GamepadEventType.device_removed ||
            _event.type == GamepadEventType.device_remapped
        ) {
            lib.host.ongamepaddevice(_event);
        }

    } //dispatch_gamepad_event

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

enum PressedState {
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

enum GamepadEventType {
    unknown;
    axis;
    button;
    device_added;
    device_removed;
    device_remapped;
}

enum TouchState {
    unknown;
    down;
    up;
    move; 
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
} //ModState

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
} //MouseEvent

typedef KeyEvent = {
    raw : InputEvent,
    scancode : Int,
    keycode : Int,
    state : PressedState,
    mod : ModState,
    repeat : Bool,
    timestamp : Float,
    window_id : Int
} //KeyEvent

typedef TextEvent = {
    raw : InputEvent,
    text : String,
    type : TextEventType,
    timestamp : Float,
    window_id : Int,
    start : Int,
    length : Int
} //TextEvent

typedef GamepadEvent = {
    raw : InputEvent,
    timestamp : Float,
    type : GamepadEventType,
    state : PressedState,
    which : Int,
    button : Int,
    axis : Int,
    value : Int
} //GamepadEvent

typedef TouchEvent = {
    raw : InputEvent,
    state : TouchState,
    timestamp : Float,
    touch_id : Int,
    device_id : Int,
    x : Float,
    y : Float,
    dx : Float, 
    dy : Float,
    pressure : Float
}


