package snow.platform.web.input;

import snow.input.Input;
import snow.input.InputSystem;
import snow.types.Types;
import snow.window.Window;

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
        js.Browser.document.addEventListener('keydown', on_keydown);
        js.Browser.document.addEventListener('keyup',   on_keyup);

            //initialize gamepads if they exist
        active_gamepads = new Map();
        gamepads_supported = (get_gamepad_list() != null);

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


    function on_mousedown( _mouse_event:js.html.MouseEvent ) {

        var _window : Window = lib.windowing.window_from_handle(cast _mouse_event.target);

            //buttons are 1 index, on native, so we increase button
        manager.dispatch_mouse_down_event(
            _mouse_event.pageX - _window.x,
            _mouse_event.pageY - _window.y,
            _mouse_event.button+1,
            _mouse_event.timeStamp,
            _window.id
        );

    } //on_mousedown

    function on_mouseup( _mouse_event:js.html.MouseEvent ) {

        var _window : Window = lib.windowing.window_from_handle(cast _mouse_event.target);

        manager.dispatch_mouse_up_event(
            _mouse_event.pageX - _window.x,
            _mouse_event.pageY - _window.y,
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
            _mouse_event.pageX - _window.x,
            _mouse_event.pageY - _window.y,
            _movement_x,
            _movement_y,
            _mouse_event.timeStamp,
            _window.id
        );

    } //on_mousemove


    function on_mousewheel( _wheel_event:js.html.WheelEvent ) {

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

    function on_keydown( _key_event:js.html.KeyboardEvent ) {

        var _keycode : Int = convert_keycode(_key_event.keyCode);
        var _scancode : Int = convert_scancode(_keycode);
        var _mod_state : ModState = mod_state_from_event(_key_event);

            //window id is 1 because keys come from the page, so always the main window
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

        var _keycode : Int = convert_keycode(_key_event.keyCode);
        var _scancode : Int = convert_scancode(_keycode);
        var _mod_state : ModState = mod_state_from_event(_key_event);

            //window id is 1 because keys come from the page, so always the main window
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
                            _gamepad.timestamp
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
                axes : cast _gamepad.axes,
                buttons : [],
                timestamp : _gamepad.timestamp
            };

            var _button_list : Array<WebGamepadButton> = cast _gamepad.buttons;
            for(_button in _button_list) {
                _new_gamepad.buttons.push({ pressed:false, value:0 });
            }

            active_gamepads.set( _gamepad.index, _new_gamepad );

            manager.dispatch_gamepad_device_event(
                _gamepad.index,
                GamepadDeviceEventType.device_added,
                _gamepad.timestamp
            );

        } else {

                //found in the list so we can update it if anything changed
            var gamepad = active_gamepads.get(_gamepad.index);

                //but only if the timestamp differs
            if(gamepad.timestamp != _gamepad.timestamp) {

                    //update the id if it changed
                if(gamepad.id != _gamepad.id) { gamepad.id = _gamepad.id; }

                    //update the timestamp
                gamepad.timestamp = _gamepad.timestamp;

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

            } //timestamp changed

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

    function convert_scancode(_keycode:Int) : Int {

        var scan:Int = Scan.unknown;
        if (_keycode >= 1024) {
            scan = _keycode - 1024;
        } else {
            scan = browser_keycode_to_sdl_scan(_keycode);
        }

        return scan;

    } //convert_scancode

    function convert_keycode(_keycode:Int) : Int {

        if (_keycode >= 65 && _keycode <= 90) {
            _keycode += 32;
        } else {
            _keycode = browser_keycode_to_sdl_key(_keycode);
        }

        return _keycode;

    } //convert_keycode

    function browser_keycode_to_sdl_scan( _scan:Int ) : Int {

        switch(_scan) {

            case 8: return 42;  // backspace
            case 9: return 43;  // tab
            case 13: return 40; // return
            case 27: return 41; // escape
            case 32: return 44; // space
            case 35: return 204; // hash

            case 39: return 53; // grave

            case 44: return 54; // comma
            case 46: return 55; // period
            case 47: return 56; // slash
            case 48: return 39; // 0
            case 49: return 30; // 1
            case 50: return 31; // 2
            case 51: return 32; // 3
            case 52: return 33; // 4
            case 53: return 34; // 5
            case 54: return 35; // 6
            case 55: return 36; // 7
            case 56: return 37; // 8
            case 57: return 38; // 9
            case 58: return 203; // colon
            case 59: return 51; // semicolon

            case 61: return 46; // equals

            case 91: return 47; // left bracket
            case 92: return 49; // backslash
            case 93: return 48; // right bracket

            // case 96: return 52; // apostrophe
            case 96: return 53; // grave
            case 97: return 4; // A
            case 98: return 5; // B
            case 99: return 6; // C
            case 100: return 7; // D
            case 101: return 8; // E
            case 102: return 9; // F
            case 103: return 10; // G
            case 104: return 11; // H
            case 105: return 12; // I
            case 106: return 13; // J
            case 107: return 14; // K
            case 108: return 15; // L
            case 109: return 16; // M
            case 110: return 17; // N
            case 111: return 18; // O
            case 112: return 19; // P
            case 113: return 20; // Q
            case 114: return 21; // R
            case 115: return 22; // S
            case 116: return 23; // T
            case 117: return 24; // U
            case 118: return 25; // V
            case 119: return 26; // W
            case 120: return 27; // X
            case 121: return 28; // Y
            case 122: return 29; // Z

            case 127: return 76; // delete

            case 305: return 224; // ctrl

            case 308: return 226; // alt

            case 316: return 70; // print screen

        } //switch

        return _scan;

    } //browser_scancode_to_snow_scancode

    function browser_keycode_to_sdl_key( _code:Int ) : Int {

        //from : https://github.com/kripken/emscripten/blob/master/src/library_sdl.js
        // For keys that don't have unicode value, we map DOM codes with the corresponding scan codes + 1024 (using "| 1 << 10")

        switch(_code) {

            case 16: return 225 | Scan.MASK;  // shift
            case 17: return 224 | Scan.MASK;  // control (right, or left)
            case 18: return 226 | Scan.MASK;  // alt
            case 20: return 57 | 1<<10;   // caps lock

            case 33: return 75 | 1<<10; // pagedup
            case 34: return 78 | 1<<10; // pagedown
            case 35: return 77 | 1<<10; // end
            case 36: return 74 | 1<<10; // home
            case 37: return 80 | Scan.MASK; // left arrow
            case 38: return 82 | Scan.MASK; // up arrow
            case 39: return 79 | Scan.MASK; // right arrow
            case 40: return 81 | Scan.MASK; // down arrow
            case 44: return 316; // print screen
            case 45: return 73 | 1<<10; // insert
            case 46: return 127; // SDLK_DEL == '\177'

            case 91: return 227 | Scan.MASK; // windows key or super key on linux, left command on Mac
            case 93: return 101 | Scan.MASK; // application, right command on Mac

            case 96: return 98 | 1<<10; // keypad 0
            case 97: return 89 | 1<<10; // keypad 1
            case 98: return 90 | 1<<10; // keypad 2
            case 99: return 91 | 1<<10; // keypad 3
            case 100: return 92 | 1<<10; // keypad 4
            case 101: return 93 | 1<<10; // keypad 5
            case 102: return 94 | 1<<10; // keypad 6
            case 103: return 95 | 1<<10; // keypad 7
            case 104: return 96 | 1<<10; // keypad 8
            case 105: return 97 | 1<<10; // keypad 9
            case 106: return 85 | 1<<10; // keypad multiply
            case 107: return 87 | 1<<10; // keypad plus
            case 109: return 86 | 1<<10; // keypad minus
            case 110: return 99 | 1<<10; // keypad decimal point
            case 111: return 84 | 1<<10; // keypad divide
            case 112: return 58 | 1<<10; // F1
            case 113: return 59 | 1<<10; // F2
            case 114: return 60 | 1<<10; // F3
            case 115: return 61 | 1<<10; // F4
            case 116: return 62 | 1<<10; // F5
            case 117: return 63 | 1<<10; // F6
            case 118: return 64 | 1<<10; // F7
            case 119: return 65 | 1<<10; // F8
            case 120: return 66 | 1<<10; // F9
            case 121: return 67 | 1<<10; // F10
            case 122: return 68 | 1<<10; // F11
            case 123: return 69 | 1<<10; // F12
            case 124: return 104 | 1<<10; // F13
            case 125: return 105 | 1<<10; // F14
            case 126: return 106 | 1<<10; // F15
            case 127: return 107 | 1<<10; // F16
            case 128: return 108 | 1<<10; // F17
            case 129: return 109 | 1<<10; // F18
            case 130: return 110 | 1<<10; // F19
            case 131: return 111 | 1<<10; // F20
            case 132: return 112 | 1<<10; // F21
            case 133: return 113 | 1<<10; // F22
            case 134: return 114 | 1<<10; // F23
            case 135: return 115 | 1<<10; // F24

            case 144: return 83 | 1<<10; // keypad num lock

            case 160: return 94; // caret
            case 161: return 33; // exclaim
            case 162: return 34; // double quote
            case 163: return 35; // hash
            case 164: return 36; // dollar
            case 165: return 37; // percent
            case 166: return 38; // ampersand
            case 167: return 95; // underscore
            case 168: return 40; // open parenthesis
            case 169: return 41; // close parenthesis
            case 170: return 42; // asterix
            case 171: return 43; // plus
            case 172: return 124; // pipe
            case 173: return 45; // minus
            case 174: return 123; // open curly bracket
            case 175: return 125; // close curly bracket
            case 176: return 126; // tilde

            case 181: return 127; // audio mute
            case 182: return 129; // audio volume down
            case 183: return 128; // audio volume up

            case 188: return 44; // comma
            case 190: return 46; // period
            case 191: return 47; // slash (/)
            case 192: return 96; // backtick/backquote (`)
            case 219: return 91; // open square bracket
            case 220: return 92; // back slash
            case 221: return 93; // close square bracket
            case 222: return 39; // quote
        } //switch

        return _code;

    } //browser_keycode_to_sdl

} //InputSystem

#end //snow_web
