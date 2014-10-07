package snow.platform.native.input.sdl;

import snow.types.Types;
import snow.input.Input;


/** Internal input system, concrete SDL implementation. Accessed through `app.input`, not directly */
@:noCompletion class InputSystem extends snow.platform.native.input.InputSystem {


    override public function init() {
    } //init

    override public function process() {
    } //process

    override public function destroy() {
    } //destroy

        /** Helper to return a `ModState` (shift, ctrl etc) from a given `InputEvent` */
    function mod_state_from_event( event:InputEvent ) : ModState {

        //event comes through as event.event.keysym.mod

        if( event.event.type == KeyEventType.up || event.event.type == KeyEventType.down ) {

            var mod_value = event.event.keysym.mod;

            return {

                none    : mod_value == ModValue.NONE,

                lshift  : mod_value == ModValue.LSHIFT,
                rshift  : mod_value == ModValue.RSHIFT,
                lctrl   : mod_value == ModValue.LCTRL,
                rctrl   : mod_value == ModValue.RCTRL,
                lalt    : mod_value == ModValue.LALT,
                ralt    : mod_value == ModValue.RALT,
                lmeta   : mod_value == ModValue.LMETA,
                rmeta   : mod_value == ModValue.RMETA,

                num     : mod_value == ModValue.NUM,
                caps    : mod_value == ModValue.CAPS,
                mode    : mod_value == ModValue.MODE,

                ctrl    : mod_value == ModValue.LCTRL   || mod_value == ModValue.RCTRL,
                shift   : mod_value == ModValue.LSHIFT  || mod_value == ModValue.RSHIFT,
                alt     : mod_value == ModValue.LALT    || mod_value == ModValue.RALT,
                meta    : mod_value == ModValue.LMETA   || mod_value == ModValue.RMETA

            };

        } else {

                //no mod state for text events etc
            return {
                none:true,
                lshift:false,   rshift:false,
                lctrl:false,    rctrl:false,
                lalt:false,     ralt:false,
                lmeta:false,    rmeta:false,
                num:false,      caps:false,     mode:false,
                ctrl:false,     shift:false,    alt:false,  meta:false
            };

        } //!up && !down

    } //mod_state_from_event

    override public function on_event( _event : InputEvent ) {

        super.on_event( _event );

    //Key events

        if(_event.type == InputEventType.key) {

            var _key_event = _event.event;

            if(_event.event.type == KeyEventType.down) {

                manager.dispatch_key_down_event(
                    _key_event.keysym.sym,
                    _key_event.keysym.scancode,
                    _key_event.repeat,
                    mod_state_from_event(_event),
                    _event.timestamp,
                    _event.window_id
                );

            } else if(_event.event.type == KeyEventType.up) {

                manager.dispatch_key_up_event(
                    _key_event.keysym.sym,
                    _key_event.keysym.scancode,
                    _key_event.repeat,
                    mod_state_from_event(_event),
                    _event.timestamp,
                    _event.window_id
                );

            } else if(_event.event.type == KeyEventType.textedit || _event.event.type == KeyEventType.textinput) {

                manager.dispatch_text_event(
                    _event.event.text,
                    (_event.event.start == null) ? 0 : _event.event.start,
                    (_event.event.length == null) ? 0 : _event.event.length,
                    (_event.event.type == KeyEventType.textedit) ? TextEventType.edit : TextEventType.input,
                    _event.timestamp,
                    _event.window_id
                );

            } //

    //Touch events

        } else if(_event.type == InputEventType.touch) {

            var _state = _event.event.type;

                //currently unused, but is available for future use
            // var _pressure = _event.event.pressure;
            // var _device_id = _event.event.touch_id;

            if(_state == TouchEventType.down) {

                manager.dispatch_touch_down_event(
                    _event.event.x,
                    _event.event.y,
                    _event.event.finger_id,
                    _event.timestamp
                );

            } else if(_state == TouchEventType.up) {

                manager.dispatch_touch_up_event(
                    _event.event.x,
                    _event.event.y,
                    _event.event.finger_id,
                    _event.timestamp
                );

            } else if(_state == TouchEventType.move) {

                manager.dispatch_touch_move_event(
                    _event.event.x,
                    _event.event.y,
                    _event.event.dx,
                    _event.event.dy,
                    _event.event.finger_id,
                    _event.timestamp
                );

            }

    //Gamepad events

        } else if(_event.type == InputEventType.controller) {

            var _gamepad_event = _event.event;

        //Buttons

            if(_gamepad_event.type == ControllerEventType.button_up) {

                    //the 0 means fully pressed
                manager.dispatch_gamepad_button_up_event(
                    _gamepad_event.which,
                    _gamepad_event.button,
                    0,
                    _event.timestamp
                );

            } else if(_gamepad_event.type == ControllerEventType.button_down ) {

                    //the 1 means fully pressed
                manager.dispatch_gamepad_button_down_event(
                    _gamepad_event.which,
                    _gamepad_event.button,
                    1,
                    _event.timestamp
                );

        //Axis

            } else if(_gamepad_event.type == ControllerEventType.axis) {

                manager.dispatch_gamepad_axis_event(
                    _gamepad_event.which,
                    _gamepad_event.axis,
                    _gamepad_event.value,
                    _event.timestamp
                );

            } else {

        //Device events

                var _type : GamepadDeviceEventType = null;

                if(_gamepad_event.type == ControllerEventType.added) {

                    manager.on_gamepad_added( _gamepad_event );
                    _type = GamepadDeviceEventType.device_added;

                } else if(_gamepad_event.type == ControllerEventType.removed) {

                    manager.on_gamepad_removed( _gamepad_event );
                    _type = GamepadDeviceEventType.device_removed;

                } else if(_gamepad_event.type == ControllerEventType.remapped) {
                    _type = GamepadDeviceEventType.device_remapped;
                }

                manager.dispatch_gamepad_device_event(
                    _gamepad_event.which,
                    _type,
                    _event.timestamp
                );

            }

    //Mouse events

        } else if(_event.type == InputEventType.mouse) {

            if(_event.event.type == MouseEventType.move) {

                manager.dispatch_mouse_move_event(
                    _event.event.x,
                    _event.event.y,
                    _event.event.xrel,
                    _event.event.yrel,
                    _event.timestamp,
                    _event.window_id
                );

            } if(_event.event.type == MouseEventType.down) {

                manager.dispatch_mouse_down_event(
                    _event.event.x,
                    _event.event.y,
                    _event.event.button,
                    _event.timestamp,
                    _event.window_id
                );

            } else if(_event.event.type == MouseEventType.up) {

                manager.dispatch_mouse_up_event(
                    _event.event.x,
                    _event.event.y,
                    _event.event.button,
                    _event.timestamp,
                    _event.window_id
                );

            } else if(_event.event.type == MouseEventType.wheel) {

                manager.dispatch_mouse_wheel_event(
                    _event.event.x,
                    _event.event.y,
                    _event.timestamp,
                    _event.window_id
                );

            }

        } //if's

    } //on_event

} //InputSystem


@:noCompletion class KeyEventType {

        /** A key down event */
    public static inline var down : Int        = 768;
        /** A key up event */
    public static inline var up : Int          = 769;
        /** A text input text edit event */
    public static inline var textedit : Int    = 770;
        /** A text input typing event */
    public static inline var textinput : Int   = 771;

    static var names = [
        'down', 'up', 'textedit', 'textinput'
    ];

    public static function to_string( _type:Int ) {
        return names[ _type ];
    }

} //KeyEventTypes

@:noCompletion class ControllerEventType {

        /** a gamepad axis movement event */
    public static inline var axis : Int            = 1616;
        /** a gamepad button pressed event */
    public static inline var button_down : Int     = 1617;
        /** a gamepad button released event */
    public static inline var button_up : Int       = 1618;
        /** a gamepad connected event */
    public static inline var added : Int           = 1619;
        /** a gamepad disconnected event */
    public static inline var removed : Int         = 1620;
        /** a gamepad remapped event */
    public static inline var remapped : Int        = 1621;

    static var names = [
        'axis', 'button_down', 'button_up', 'added', 'removed', 'remapped'
    ];

    public static function to_string( _type:Int ) {
        return names[ _type ];
    }

} //ControllerEventType

@:noCompletion class TouchEventType {

        /** A touch has begun */
    public static inline var down      : Int = 1792;
        /** A touch has ended */
    public static inline var up        : Int = 1793;
        /** A touch is moving */
    public static inline var move      : Int = 1794;

    static var names = [
        'down', 'up', 'move'
    ];

    public static function to_string( _type:Int ) {
        return names[ _type ];
    }

} //TouchEventTypes

@:noCompletion class MouseEventType {

        /** A mouse moved event */
    public static inline var move  : Int     = 1024;
        /** A mouse button pressed event */
    public static inline var down  : Int     = 1025;
        /** A mouse button released event */
    public static inline var up    : Int     = 1026;
        /** A mouse wheel or scroll event */
    public static inline var wheel : Int     = 1027;

    static var names = [
        'move', 'down', 'up', 'wheel'
    ];

    public static function to_string( _type:Int ) {
        return names[ _type ];
    }

} //MouseEventTypes

@:noCompletion class ModValue {

    public static var NONE         = 0x0000;
    public static var LSHIFT       = 0x0001;
    public static var RSHIFT       = 0x0002;
    public static var LCTRL        = 0x0040;
    public static var RCTRL        = 0x0080;
    public static var LALT         = 0x0100;
    public static var RALT         = 0x0200;
    public static var LMETA        = 0x0400;
    public static var RMETA        = 0x0800;
    public static var NUM          = 0x1000;
    public static var CAPS         = 0x2000;
    public static var MODE         = 0x4000;

} //ModValue