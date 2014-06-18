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
    public function dispatch_key_up_event( keycode:Int, scancode:Int, repeat:Bool, mod:ModState, timestamp:Float, window_id:Int ) {

            //flag it as released but unprocessed
        key_code_released.set(keycode, false);
            //remove the down flag
        key_code_down.remove(keycode);
            //dispatch the event
        lib.host.onkeyup(keycode, scancode, repeat, mod, timestamp, window_id);

    } //dispatch_key_up_event

    public function dispatch_key_down_event( keycode:Int, scancode:Int, repeat:Bool, mod:ModState, timestamp:Float, window_id:Int ) {

            //only do the realtime flags if not key repeat
        if(!repeat) {
                //flag the key as pressed, but unprocessed (false)
            key_code_pressed.set(keycode, false);
                //flag it as down, because keyup removes it
            key_code_down.set(keycode, true);
        }

            //forward the event
        lib.host.onkeydown(keycode, scancode, repeat, mod, timestamp, window_id);

    } //dispatch_key_down_event

        /** manually dispatch a text event through the system, delivered to the app handlers, internal and external */
    public function dispatch_text_event( text:String, start:Int, length:Int, type:TextEventType, timestamp:Float, window_id:Int ) {

        lib.host.ontextinput( text, start, length, type, timestamp, window_id );

    } //dispatch_text_event

    public function dispatch_mouse_move_event( x:Int, y:Int, xrel:Int, yrel:Int, timestamp:Float, window_id:Int ) {

        lib.host.onmousemove( x, y, xrel, yrel, timestamp, window_id );

    } //dispatch_mouse_move_event

    public function dispatch_mouse_down_event( x:Int, y:Int, button:Int, timestamp:Float, window_id:Int ) {

        lib.host.onmousedown( x, y, button, timestamp, window_id );

    } //dispatch_mouse_down_event

    public function dispatch_mouse_up_event( x:Int, y:Int, button:Int, timestamp:Float, window_id:Int ) {

        lib.host.onmouseup( x, y, button, timestamp, window_id );

    } //dispatch_mouse_up_event

    public function dispatch_mouse_wheel_event( x:Int, y:Int, timestamp:Float, window_id:Int ) {

        lib.host.onmousewheel( x, y, timestamp, window_id );

    } //dispatch_mouse_wheel_event

        /** manually dispatch a touch event through the system, delivered to the app handlers, internal and external */
    public function dispatch_touch_down_event( x:Float, y:Float, touch_id:Int, timestamp:Float ) {

        lib.host.ontouchdown( x, y, touch_id, timestamp );

    } //dispatch_touch_down_event

    public function dispatch_touch_up_event( x:Float, y:Float, touch_id:Int, timestamp:Float ) {

        lib.host.ontouchup( x, y, touch_id, timestamp );

    } //dispatch_touch_up_event

    public function dispatch_touch_move_event( x:Float, y:Float, dx:Float, dy:Float, touch_id:Int, timestamp:Float ) {

        lib.host.ontouchmove( x, y, dx, dy, touch_id, timestamp );

    } //dispatch_touch_move_event

        /** manually dispatch a gamepad event through the system, delivered to the app handlers, internal and external */
    public function dispatch_gamepad_axis_event( gamepad:Int, axis:Int, value:Float, timestamp:Float ) {

        lib.host.ongamepadaxis( gamepad, axis, value, timestamp );

    } //dispatch_gamepad_axis_event

    public function dispatch_gamepad_button_down_event( gamepad:Int, button:Int, value:Float, timestamp:Float ) {

        lib.host.ongamepadbuttondown( gamepad, button, value, timestamp );

    } //dispatch_gamepad_button_down_event

    public function dispatch_gamepad_button_up_event( gamepad:Int, button:Int, value:Float, timestamp:Float ) {

        lib.host.ongamepadbuttonup( gamepad, button, value, timestamp );

    } //dispatch_gamepad_button_up_event

    public function dispatch_gamepad_device_event( gamepad:Int, type:GamepadDeviceEventType, timestamp:Float ) {

        lib.host.ongamepaddevice( gamepad, type, timestamp );

    } //dispatch_gamepad_device_event

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


