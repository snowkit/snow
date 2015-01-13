package snow.platform.web.input;

import snow.input.Input;
import snow.input.InputSystem;
import snow.types.Types;
import snow.window.Window;

import snow.platform.web.input.DOMKeys;

import snow.Log.log;
import snow.Log._debug;
import snow.Log._verbose;
import snow.Log._verboser;


#if snow_web

typedef WebGamepadButton = {
    value : Float,
    pressed : Bool
}

typedef WebGamepad = {
    axes : Array<Float>,
    index : Int,
    buttons : Array<WebGamepadButton>,
    id : String,
    timestamp : Float
}


@:noCompletion
@:log_as('input')
class InputSystem extends InputSystemBinding {

    var active_gamepads : Map<Int, WebGamepad>;
    var gamepads_supported : Bool = false;

 	@:noCompletion public function new( _manager:Input, _lib:Snow ) {

        manager = _manager;
        lib = _lib;

    } //new

    override public function init() {

            //key input is page wide, not just per canvas
        js.Browser.document.addEventListener('keypress', on_keypress);
        js.Browser.document.addEventListener('keydown',  on_keydown);
        js.Browser.document.addEventListener('keyup',    on_keyup);

            //initialize gamepads if they exist
        active_gamepads = new Map();
        gamepads_supported = (get_gamepad_list() != null);

        log('Gamepads supported: $gamepads_supported');

    } //init

    override public function process() {

        if(gamepads_supported) {
            poll_gamepads();
        }

    } //process

    override public function destroy() {
    } //destroy

    @:noCompletion override public function listen( window:Window ) {

        window.handle.addEventListener('contextmenu', on_contextmenu );

        window.handle.addEventListener('mousedown', on_mousedown);
        window.handle.addEventListener('mouseup',   on_mouseup);
        window.handle.addEventListener('mousemove', on_mousemove);

        window.handle.addEventListener('mousewheel',    on_mousewheel);
        window.handle.addEventListener('wheel',         on_mousewheel);

    } //listen

    @:noCompletion override public function unlisten( window:Window ) {

    } //unlisten

    override public function on_event( _event : InputEvent ) {
    } //on_event


    override public function text_input_start() {
        // :unsupported: :todo:
    } //text_input_start

    override public function text_input_stop() {
        // :unsupported: :todo:
    } //text_input_stop

    override public function text_input_rect(x:Int, y:Int, w:Int, h:Int) {
        // :unsupported: :todo:
    } //text_input_rect

    function on_textinput( _key_event:js.html.KeyboardEvent ) {

            var letter:String = "";

            switch(_key_event.keyCode)
            {
                case 65: letter = "A";
                case 66: letter = "B";
                case 67: letter = "C";
                case 68: letter = "D";
                case 69: letter = "E";
                case 70: letter = "F";
                case 71: letter = "G";
                case 72: letter = "H";
                case 73: letter = "I";
                case 74: letter = "J";
                case 75: letter = "K";
                case 76: letter = "L";
                case 77: letter = "M";
                case 78: letter = "N";
                case 79: letter = "O";
                case 80: letter = "P";
                case 81: letter = "Q";
                case 82: letter = "R";
                case 83: letter = "S";
                case 84: letter = "T";
                case 85: letter = "U";
                case 86: letter = "V";
                case 87: letter = "W";
                case 88: letter = "X";
                case 89: letter = "Y";
                case 90: letter = "Z";
            }

            //window id is 1 because keys come from the page, so always the main window
        manager.dispatch_text_event(
            letter,
            0,
            3,
            TextEventType.input,
            _key_event.timeStamp,
            1
        );
        
    } //on_textinput

//Gamepad
    override public function gamepad_add( id:Int ) {

    } //gamepad_add

    override public function gamepad_remove( id:Int ) {

    } //gamepad_remove

    function poll_gamepads() {

        //just in case
        if(!gamepads_supported) return;

        var list = get_gamepad_list();
        if(list != null) {
            for(i in 0 ... list.length) {
                if( untyped list[i] != null ) {
                    handle_gamepad( untyped list[i] );
                } else {
                    //if an entry in the list was null,
                    //check if it was here already before
                    var _gamepad = active_gamepads.get(i);
                    if(_gamepad != null) {

                        manager.dispatch_gamepad_device_event(
                            _gamepad.index,
                            GamepadDeviceEventType.device_removed,
                            lib.time //:todo:gamepadtimestamp:
                        );

                    } //_gamepad != null

                        //and remove it so it only fires once
                    active_gamepads.remove(i);

                } //list[i] != null
            } //for each in the list
        } //if there is a list

    } //poll_gamepads

    function handle_gamepad( _gamepad : Dynamic ) {

        //disconnected gamepads we don't need
        if(_gamepad == null) return;

            //check if this gamepad exists already
        if( !active_gamepads.exists( _gamepad.index ) ) {

                //if not we add it to the list
            var _new_gamepad : WebGamepad = {
                id : _gamepad.id,
                index : _gamepad.index,
                axes : [],
                buttons : [],
                timestamp : lib.time //:todo:gamepadtimestamp:
            };

            var axes : Array<Float> = cast _gamepad.axes;
            for(value in axes) {
                _new_gamepad.axes.push(value);
            }

            var _button_list : Array<WebGamepadButton> = cast _gamepad.buttons;
            for(_button in _button_list) {
                _new_gamepad.buttons.push({ pressed:false, value:0 });
            }

            active_gamepads.set( _new_gamepad.index, _new_gamepad );

            manager.dispatch_gamepad_device_event(
                _new_gamepad.index,
                GamepadDeviceEventType.device_added,
                _new_gamepad.timestamp
            );

        } else {

                //found in the list so we can update it if anything changed
            var gamepad = active_gamepads.get(_gamepad.index);

                //but only if the timestamp differs :todo:gamepadtimestamp:
                //failfox at least doesn't store timestamp changes -_-
            // if(gamepad.timestamp != _gamepad.timestamp) {

                    //update the id if it changed
                if(gamepad.id != _gamepad.id) { gamepad.id = _gamepad.id; }

                    //:todo: see :gamepadtimestamp:
                // gamepad.timestamp = _gamepad.timestamp;

                    //we store the list of changed indices
                    //so we can call the handler functions with each
                var axes_changed : Array<Int> = [];
                var buttons_changed : Array<Int> = [];
                    //the last known values
                var last_axes : Array<Float> = gamepad.axes;
                var last_buttons : Array<WebGamepadButton> = gamepad.buttons;

                    //the new known values
                var new_axes : Array<Float> = cast _gamepad.axes;
                var new_buttons : Array<WebGamepadButton> = cast _gamepad.buttons;

                    //check for axes changes
                var axis_index : Int = 0;
                for(axis in new_axes) {

                    if(axis != last_axes[axis_index]) {
                        axes_changed.push(axis_index);
                        gamepad.axes[axis_index] = axis;
                    }

                    axis_index++;

                } //axis in new_axes

                    //check for button changes
                var button_index : Int = 0;
                for(button in new_buttons) {

                    if( button.value != last_buttons[button_index].value ) {
                        buttons_changed.push(button_index);
                        gamepad.buttons[button_index].pressed = button.pressed;
                        gamepad.buttons[button_index].value = button.value;
                    }

                    button_index++;

                } //button in new_buttons

                    //now forward any axis changes to the wrapper
                for(index in axes_changed) {

                    manager.dispatch_gamepad_axis_event(
                        gamepad.index,
                        index,
                        new_axes[index],
                        gamepad.timestamp
                    );

                } //for each axis changed

                    //then forward any button changes to the wrapper
                for(index in buttons_changed) {

                    if(new_buttons[index].pressed == true) {

                        manager.dispatch_gamepad_button_down_event(
                            gamepad.index,
                            index,
                            new_buttons[index].value,
                            gamepad.timestamp
                        );

                    } else {

                        manager.dispatch_gamepad_button_up_event(
                            gamepad.index,
                            index,
                            new_buttons[index].value,
                            gamepad.timestamp
                        );

                    } //new_buttons[index].pressed

                } //for each button change

                //:todo: see :gamepadtimestamp:
            // } //timestamp changed

        } //exists

    } //handle_gamepad

    function fail_gamepads() {

        gamepads_supported = false;
        log("Gamepads are not supported in this browser :(");

    } //fail_gamepads

        //It's really early for gamepads in browser
    function get_gamepad_list() : Dynamic {

        //Modernizr is used to detect gamepad support
        var modernizr = untyped js.Browser.window.Modernizr;
        if(modernizr != null) {

            if(modernizr.gamepads == true) {

                    //try official api first
                if( untyped js.Browser.navigator.getGamepads != null ) {
                    return untyped js.Browser.navigator.getGamepads();
                }

                    //try newer webkit GetGamepads() function
                if( untyped js.Browser.navigator.webkitGetGamepads != null ) {
                    return untyped js.Browser.navigator.webkitGetGamepads();
                }

                    //if we make it here we failed support so fail out
                fail_gamepads();

            } else {
                fail_gamepads();
            }

        } //modernizr != null

        return null;

    } //get_gamepad_list

//Mouse
    function on_mousedown( _mouse_event:js.html.MouseEvent ) {

        var _window : Window = lib.windowing.window_from_handle(cast _mouse_event.target);

            //buttons are 1 index, on native, so we increase button
        manager.dispatch_mouse_down_event(
            (_mouse_event.pageX - js.Browser.window.pageXOffset) - _window.x,
            (_mouse_event.pageY - js.Browser.window.pageYOffset) - _window.y,
            _mouse_event.button+1,
            _mouse_event.timeStamp,
            _window.id
        );

    } //on_mousedown

    function on_mouseup( _mouse_event:js.html.MouseEvent ) {

        var _window : Window = lib.windowing.window_from_handle(cast _mouse_event.target);

        manager.dispatch_mouse_up_event(
            (_mouse_event.pageX - js.Browser.window.pageXOffset) - _window.x,
            (_mouse_event.pageY - js.Browser.window.pageYOffset) - _window.y,
            _mouse_event.button+1,
            _mouse_event.timeStamp,
            _window.id
        );

    } //on_mouseup

    function on_mousemove( _mouse_event:js.html.MouseEvent ) {

        var _window : Window = lib.windowing.window_from_handle(cast _mouse_event.target);

        var _movement_x : Int = _mouse_event.movementX;
        var _movement_y : Int = _mouse_event.movementY;

        if(untyped _mouse_event.webkitMovementX != null) {
            _movement_x = untyped _mouse_event.webkitMovementX;
            _movement_y = untyped _mouse_event.webkitMovementY;
        } else if(untyped _mouse_event.mozMovementX != null) {
            _movement_x = untyped _mouse_event.mozMovementX;
            _movement_y = untyped _mouse_event.mozMovementY;
        }

        manager.dispatch_mouse_move_event(
            (_mouse_event.pageX - js.Browser.window.pageXOffset) - _window.x,
            (_mouse_event.pageY - js.Browser.window.pageYOffset) - _window.y,
            _movement_x,
            _movement_y,
            _mouse_event.timeStamp,
            _window.id
        );

    } //on_mousemove


    function on_mousewheel( _wheel_event:js.html.WheelEvent ) {

        if(lib.config.web.prevent_default_keys) {
            // _wheel_event.preventDefault();
        }

        var _window : Window = lib.windowing.window_from_handle(cast _wheel_event.target);

        var _x : Int = 0;
        var _y : Int = 0;

        if(untyped _wheel_event.deltaY != null) {
            _y  = untyped _wheel_event.deltaY;
        } else if(_wheel_event.wheelDeltaY != null) {
            _y = Std.int(-_wheel_event.wheelDeltaY/3);
        }

        if(untyped _wheel_event.deltaX != null) {
            _x  = untyped _wheel_event.deltaX;
        } else if(_wheel_event.wheelDeltaX != null) {
            _x = Std.int(-_wheel_event.wheelDeltaX/3);
        }

            //the /16 here is the default em size of a web page
            //because native scrolls in lines, and web scrolls in pixels,
            //sometimes, fuuu
        manager.dispatch_mouse_wheel_event(
            Math.round(_x/16),
            Math.round(_y/16),
            _wheel_event.timeStamp,
            _window.id
        );

    } //on_mousewheel

    function on_contextmenu( _event:js.html.MouseEvent ) {

        if(lib.config.web.no_context_menu) {
            _event.preventDefault();
        }

    } //on_contextmenu

//Keys

    //window id is 1 for keys as they come from the page, so always the main window

        //keypress gives us typable keys
    function on_keypress( _key_event:js.html.KeyboardEvent ) {

        var _text = String.fromCharCode(_key_event.charCode);

        manager.dispatch_text_event(
            _text, 0, _text.length,     //text, start, length
            TextEventType.input,        //TextEventType
            _key_event.timeStamp,       //timestamp
            1                           //window
        );

    } //on_keypress

    function on_keydown( _key_event:js.html.KeyboardEvent ) {

        if(lib.config.web.prevent_default_keys) {
            // _key_event.preventDefault();
        }

        var _keycode : Int = convert_keycode(_key_event.keyCode);
        var _scancode : Int = Key.to_scan(_keycode);
        var _mod_state : ModState = mod_state_from_event(_key_event);

        manager.dispatch_key_down_event(
            _keycode,
            _scancode,
            untyped _key_event.repeat,
            _mod_state,
            _key_event.timeStamp,
            1
        );

    } //on_keydown

    function on_keyup( _key_event:js.html.KeyboardEvent ) {

        if(lib.config.web.prevent_default_keys) {
            // _key_event.preventDefault();
        }

        var _keycode : Int = convert_keycode(_key_event.keyCode);
        var _scancode : Int = Key.to_scan(_keycode);
        var _mod_state : ModState = mod_state_from_event(_key_event);

        manager.dispatch_key_up_event(
            _keycode,
            _scancode,
            untyped _key_event.repeat,
            _mod_state,
            _key_event.timeStamp,
            1
        );

    } //on_keyup

	function mod_state_from_event( _key_event : js.html.KeyboardEvent ) : ModState {

        var _none : Bool =
            !_key_event.altKey &&
            !_key_event.ctrlKey &&
            !_key_event.metaKey &&
            !_key_event.shiftKey;

        return {
            none    : _none,
            lshift  : _key_event.shiftKey,
            rshift  : _key_event.shiftKey,
            lctrl   : _key_event.ctrlKey,
            rctrl   : _key_event.ctrlKey,
            lalt    : _key_event.altKey,
            ralt    : _key_event.altKey,
            lmeta   : _key_event.metaKey,
            rmeta   : _key_event.metaKey,
            num     : false, //:unsupported:
            caps    : false, //:unsupported:
            mode    : false, //:unsupported:
            ctrl    : _key_event.ctrlKey,
            shift   : _key_event.shiftKey,
            alt     : _key_event.altKey,
            meta    : _key_event.metaKey
        };

    } //mod_state_from_event

        //This takes a *DOM* keycode and returns a snow Keycodes value
    function convert_keycode(dom_keycode:Int) : Int {

            //this converts the uppercase into lower case,
            //since those are fixed values it doesn't need to be checked
        if (dom_keycode >= 65 && dom_keycode <= 90) {
            return dom_keycode + 32;
        }

            //this will pass back the same value if unmapped
        return DOMKeys.dom_key_to_keycode(dom_keycode);

    } //convert_keycode


} //InputSystem


#end //snow_web
