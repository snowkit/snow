package lumen.input;

import lumen.types.Types;
import lumen.input.InputSystem;


    //API usage clarity
typedef Key = lumen.input.Keycodes.Keycodes;
typedef Scan = lumen.input.Keycodes.Scancodes;

/** Internal input system, accessed via `app.input` */
class Input {

    var lib : Lumen;
    var system : InputSystem;

        //this is the enum based flags for keypressed/keyreleased/keydown
    var key_code_down : Map<Int, Bool>;
    var key_code_pressed : Map<Int, Bool>;
    var key_code_released : Map<Int, Bool>;

    @:noCompletion public function new( _lib:Lumen ) {

        lib = _lib;

        system = new InputSystem(this, lib);

        system.init();

        key_code_pressed = new Map();
        key_code_down = new Map();
        key_code_released = new Map();

    } //new


//Public facing API


        /** returns true if the `Key` value was pressed in the latest frame */
    public function keypressed( _code:Int ) {
        return key_code_pressed.exists(_code);
    } //keypressed

        /** returns true if the `Key` value was released in the latest frame */
    public function keyreleased( _code:Int ) {
        return key_code_released.exists(_code);
    } //keyreleased

        /** returns true if the `Key` value is down at the time of calling this */
    public function keydown( _code:Int ) {
       return key_code_down.exists(_code);
    } //keydown

        /** manually dispatch a keyboard event through the system, delivered to the app handlers, internal and external */
    public function dispatch_key_event( _event:KeyEvent ) {

        if(_event.state == PressedState.up) {

                //flag it as released but unprocessed
            key_code_released.set(_event.keycode, false);
                //remove the down flag
            key_code_down.remove(_event.keycode);
                //dispatch the event
            lib.host.onkeyup(_event);

        } else if(_event.state == PressedState.down) {

            //only do the realtime flags if not key repeat
            if(!_event.repeat) {
                    //flag the key as pressed, but unprocessed (false)
                key_code_pressed.set(_event.keycode, false);
                    //flag it as down, because keyup removes it
                key_code_down.set(_event.keycode, true);
            }

                //dispatch the event
            lib.host.onkeydown(_event);
        }

    } //dispatch_key_event

        /** manually dispatch a text event through the system, delivered to the app handlers, internal and external */
    public function dispatch_text_event( _event:TextEvent ) {
            
        lib.host.ontextinput(_event);

    } //dispatch_text_event

        /** manually dispatch a mouse event through the system, delivered to the app handlers, internal and external */
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

        /** manually dispatch a touch event through the system, delivered to the app handlers, internal and external */
    public function dispatch_touch_event( _event:TouchEvent ) {

        if(_event.state == TouchState.down) {
            lib.host.ontouchdown(_event);
        } else if(_event.state == TouchState.up) {
            lib.host.ontouchup(_event);
        } else if(_event.state == TouchState.move) {
            lib.host.ontouchmove(_event);
        }

    } //dispatch_touch_event

        /** manually dispatch a gamepad event through the system, delivered to the app handlers, internal and external */
    public function dispatch_gamepad_event( _event:GamepadEvent ) {

        if(_event.type == GamepadEventType.axis) {
            lib.host.ongamepadaxis(_event);
        } else if(_event.type == GamepadEventType.button) {

            if(_event.state == PressedState.down) {
                lib.host.ongamepadbuttondown(_event);
            } else if(_event.state == PressedState.up) {
                lib.host.ongamepadbuttonup(_event);
            }

        } 
        else if( _event.type == GamepadEventType.device_added || 
                 _event.type == GamepadEventType.device_removed ||
                 _event.type == GamepadEventType.device_remapped
        ) {
            lib.host.ongamepaddevice(_event);
        }

    } //dispatch_gamepad_event

        /** Helper to return a `ModState` (shift, ctrl etc) from a given `InputEvent` */
    public function mod_state_from_event( event:InputEvent ) {

        return system.mod_state_from_event( event );

    } //mod_state_from_event
    
//Interal API


    @:noCompletion public function on_event( _event:SystemEvent ) {

        if(_event.type == SystemEventType.input) {
            system.on_event( _event.input );
        } //only input events

    } //on_event

    @:noCompletion public function on_gamepad_added( _event:Dynamic ) {
        
        system.gamepad_add( _event.which );

    } //on_gamepad_added
    
    @:noCompletion public function on_gamepad_removed( _event:Dynamic ) {
        
        system.gamepad_remove( _event.which );

    } //on_gamepad_removed

    @:noCompletion public function update() {

        system.update();

            //remove any stale key pressed value
            //unless it wasn't alive for a full frame yet,
            //then flag it so that it may be
        for(_code in key_code_pressed.keys()){

            var _flag : Bool = key_code_pressed.get(_code);            
            if(_flag){
                key_code_pressed.remove(_code);
            } else {
                key_code_pressed.set(_code, true);
            }

        } //each pressed_code

            //remove any stale key released value
            //unless it wasn't alive for a full frame yet,
            //then flag it so that it may be
        for(_code in key_code_released.keys()){

            var _flag : Bool = key_code_released.get(_code);            
            if(_flag){
                key_code_released.remove(_code);
            } else {
                key_code_released.set(_code, true);
            }

        } //each pressed_code

    } //update

    @:noCompletion public function destroy() {

        system.destroy();

    } //destroy

} //Input

/** A typed state for buttons or similar */
enum PressedState {

/** An unknown state */
    unknown;
/** In a pressed state */
    down;
/** In a released state */
    up;

} //PressedState

/** A typed mouse state */
enum MouseState {

/** An unknown state */
    unknown;
/** In a pressed state */
    down;
/** In a released state */
    up;
/** In a moving state */
    move;
/** A mouse wheel state */
    wheel;

} //MouseState

/** A typed mouse button id */
enum MouseButton {

/** no mouse buttons */
    none;
/** left mouse button */
    left;
/** middle mouse button */
    middle;
/** right mouse button */
    right;
/** extra button pressed (4) */
    extra1;
/** extra button pressed (5) */
    extra2;

} //MouseButton

/** A typed text event type */
enum TextEventType {

/** An unknown event */
    unknown;
/** An edit text typing event */
    edit;
/** An input text typing event */
    input;

} //TextEventType

/** A typed gamepad event type */
enum GamepadEventType {

/** An unknown event */
    unknown;
/** An axis change event */    
    axis;
/** A button event */    
    button;
/** A device added event */    
    device_added;
/** A device removed event */    
    device_removed;
/** A device was remapped */    
    device_remapped;

} //GamepadEventType

/** The states a touch can be in */
enum TouchState {

/** an unknown state */
    unknown;
/** touch is down */
    down;
/** touch is up */
    up;
/** touch is moving */
    move; 

} //TouchState

/** 
Input modifier state 

`none` : no modifiers are down   
`lshift` : left shift key is down   
`rshift` : right shift key is down   
`lctrl` : left ctrl key is down   
`rctrl` : right ctrl key is down   
`lalt` : left alt/option key is down   
`ralt` : right alt/option key is down   
`lmeta` : left windows/command key is down   
`rmeta` : right windows/command key is down   
`num` : numlock is enabled   
`caps` : capslock is enabled   
`mode` : mode key is down   
`ctrl` : left or right ctrl key is down   
`shift` : left or right shift key is down   
`alt` : left or right alt/option key is down   
`meta` : left or right windows/command key is down   

*/
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

/** 
Information about a mouse event 

`raw` : The raw event from the system, unmodified   
`timestamp` : The time in seconds when this touch event occurred, use for deltas   
`window_id` : The window id this event originated from    
`which` : Which mouse this event originated from (usually 0)   
`state` : The state this event is in   
`button` : The button id, if the event `state` is `down` or `up`   
`x` : The x position in the window of the mouse event   
`y` : The y position in the window of the mouse event   
`xrel` : The relative x position if `state` is `move` or a window has grabbed state   
`yrel` : The relative y position if `state` is `move` or a window has grabbed state   

*/
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
    yrel : Int

} //MouseEvent

/** 
Information about a keyboard event

`raw` : The raw event from the system, unmodified   
`scancode` : The `lumen.input.Scan` code value for this event   
`keycode` : The `lumen.input.Key` code value for this event   
`state` : The state of the key in this event   
`mod` : The modifier state of this event   
`repeat` : If this value is bigger than 0 this is a key repeat event of a key held down   
`timestamp` : The time in seconds when this touch event occurred, use for deltas   
`window_id` : The window id this event originated from   

*/
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

/** 
Information about a text input event

`raw` : The raw event from the system, unmodified   
`text` : The text that this event has generated   
`type` : The type of text event   
`timestamp` : The time in seconds when this touch event occurred, use for deltas   
`window_id` : The window id this event originated from   
`start` : The start position, if the `type` is `edit`   
`length` : The length position, if the `type` is `edit`   

*/
typedef TextEvent = {

    raw : InputEvent,
    text : String,
    type : TextEventType,
    timestamp : Float,
    window_id : Int,
    start : Int,
    length : Int

} //TextEvent

/** 
Information about a gamepad event

`raw` : The raw event from the system, unmodified   
`timestamp` : The time in seconds when this touch event occurred, use for deltas   
`type` : The button id, if the event `type` is `button`   
`state` : The state this event is in   
`which` : The id of the gamepad this event comes from   
`button` : The button id, if the event `type` is `button`   
`axis` : The axis id, if the event `type` is `button`   
`value` : The axis value, if the event `type` is `axis`   

*/
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

/** 
Information about a touch event

`raw` : The raw event from the system, unmodified   
`state` : The state this touch event is in   
`timestamp` : The time in seconds when this touch event occurred, use for deltas   
`touch_id` : The id of the touch that this event comes from, a finger id   
`device_id` : The device id this touch comes from   
`x` : The x position in the window of the touch event   
`y` : The x position in the window of the touch event   
`dx` : The delta x value of the touch event, if the state is `moving`   
`dy` : The delta y value of the touch event, if the state is `moving`   
`pressure` : The pressure value of the touch event, where available   

*/
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

} //TouchEvent


