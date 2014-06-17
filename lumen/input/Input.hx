package lumen.input;

import lumen.types.Types;
import lumen.input.InputSystem;
import lumen.window.Window;


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


    @:noCompletion public function listen( _window:Window ) {

        system.listen(_window);

    } //listen

    @:noCompletion public function unlisten( _window:Window ) {

        system.unlisten(_window);

    } //unlisten

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


