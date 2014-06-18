package lumen.platform.native.input.sdl;

import lumen.types.Types;
import lumen.input.Input;


/** Internal input system, concrete SDL implementation. Accessed through `app.input`, not directly */
@:noCompletion class InputSystem extends lumen.platform.native.input.InputSystem {


    override public function init() {
    } //init

    override public function update() {
    } //update

    override public function destroy() {
    } //destroy

        /** Helper to return a `ModState` (shift, ctrl etc) from a given `InputEvent` */
    override public function mod_state_from_event( event:InputEvent ) : ModState {

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
            return super.mod_state_from_event( event );

        } //!up && !down

    } //mod_state_from_event

    override public function on_event( _event : InputEvent ) {

        super.on_event( _event );

        if(Std.is(_event.type, Int)) {
            _event.type = InputEvents.typed( cast _event.type );
        }

    //Key events

        if(_event.type == key) {

            if(Std.is(_event.event.type, Int)) {
                _event.event.type = KeyEventTypes.typed(_event.event.type);
            }

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
                    (_event.event.type == textedit) ? TextEventType.edit : TextEventType.input,
                    _event.timestamp, _event.window_id
                );

            } //

    //Touch events

        } else if(_event.type == touch) {

            if(Std.is(_event.event.type, Int)) {
                _event.event.type = TouchEventTypes.typed(_event.event.type);
            }

            var _state = _event.event.type;

                //currently unused, but is available for future use
            // var _pressure = _event.event.pressure;
            // var _device_id = _event.event.touch_id;

            //:todo: touch coordinates from SDL come through as NDC [-1..1] range
            //so here we convert them back to the window scale, should we?
            //maybe there is value in NDC?

            if(_state == TouchState.down) {

                manager.dispatch_touch_down_event(
                    _event.event.x, _event.event.y,
                    _event.event.finger_id, _event.timestamp
                );

            } else if(_state == TouchState.up) {

                manager.dispatch_touch_up_event(
                    _event.event.x, _event.event.y,
                    _event.event.finger_id, _event.timestamp
                );

            } else if(_state == TouchState.move) {

                manager.dispatch_touch_move_event(
                    _event.event.x, _event.event.y,
                    _event.event.dx, _event.event.dy,
                    _event.event.finger_id, _event.timestamp
                );

            }

    //Gamepad events

        } else if(_event.type == controller) {

            if(Std.is(_event.event.type, Int)) {
                _event.event.type = GamepadEventTypes.typed(_event.event.type);
            }

            var _gamepad_event = _event.event;

        //Buttons

            if(_gamepad_event.type == ControllerEventType.button_up) {

                manager.dispatch_gamepad_button_up_event(
                    _gamepad_event.which, _gamepad_event.button, 0, _event.timestamp
                );

            } else if(_gamepad_event.type == ControllerEventType.button_down ) {

                manager.dispatch_gamepad_button_down_event(
                    _gamepad_event.which, _gamepad_event.button, 1, _event.timestamp
                );

        //Axis

            } else if(_gamepad_event.type == ControllerEventType.axis) {

                manager.dispatch_gamepad_axis_event(
                    _gamepad_event.which, _gamepad_event.axis, _gamepad_event.value, _event.timestamp
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

                manager.dispatch_gamepad_device_event(_gamepad_event.which, _type, _event.timestamp);

            }

    //Mouse events

        } else if(_event.type == mouse) {

            if(Std.is(_event.event.type, Int)) {
                _event.event.type = MouseEventTypes.typed(_event.event.type);
            }

            if(_event.event.type == MouseEventType.move) {

                manager.dispatch_mouse_move_event(
                    _event.event.x, _event.event.y,
                    _event.event.xrel, _event.event.yrel,
                    _event.timestamp, _event.window_id
                );

            } if(_event.event.type == MouseEventType.down) {

                manager.dispatch_mouse_down_event(
                    _event.event.x, _event.event.y,
                    _event.event.button,
                    _event.timestamp, _event.window_id
                );

            } else if(_event.event.type == MouseEventType.up) {

                manager.dispatch_mouse_up_event(
                    _event.event.x, _event.event.y,
                    _event.event.button,
                    _event.timestamp, _event.window_id
                );

            } else if(_event.event.type == MouseEventType.wheel) {

                manager.dispatch_mouse_wheel_event(
                    _event.event.x, _event.event.y,
                    _event.timestamp, _event.window_id
                );

            }

        } //if's

    } //on_event

} //InputSystem


@:noCompletion enum KeyEventType {
    unknown;
    down;
    up;
    textedit;
    textinput;
}

@:noCompletion enum MouseEventType {
    unknown;
    move;
    down;
    up;
    wheel;
}

@:noCompletion enum ControllerEventType {
    unknown;
    button_up;
    button_down;
    axis;
    added;
    removed;
    remapped;
}

@:noCompletion enum TouchState {

    unknown;
    down;
    up;
    move;

} //TouchState

@:noCompletion class KeyEventTypes {

    static var ke_down : Int        = 768;
    static var ke_up : Int          = 769;
    static var ke_textedit : Int    = 770;
    static var ke_textinput : Int   = 771;

    public static function typed(ke_type:Int) : KeyEventType {

        if(ke_type == ke_down)      return KeyEventType.down;
        if(ke_type == ke_up)        return KeyEventType.up;
        if(ke_type == ke_textedit)  return KeyEventType.textedit;
        if(ke_type == ke_textinput) return KeyEventType.textinput;

        return KeyEventType.unknown;

    } //typed

} //KeyEventTypes

@:noCompletion class GamepadEventTypes {

    static var ge_axis : Int            = 1616;
    static var ge_button_down : Int     = 1617;
    static var ge_button_up : Int       = 1618;
    static var ge_added : Int           = 1619;
    static var ge_removed : Int         = 1620;
    static var ge_remapped : Int        = 1621;

    public static function typed(ge_type:Int) : ControllerEventType {

        if(ge_type == ge_axis)          return ControllerEventType.axis;
        if(ge_type == ge_button_down)   return ControllerEventType.button_down;
        if(ge_type == ge_button_up)     return ControllerEventType.button_up;
        if(ge_type == ge_added)         return ControllerEventType.added;
        if(ge_type == ge_removed)       return ControllerEventType.removed;
        if(ge_type == ge_remapped)      return ControllerEventType.remapped;

        return ControllerEventType.unknown;

    } //typed

} //GamepadEventTypes

@:noCompletion class TouchEventTypes {

    static var te_down      : Int = 1792;
    static var te_up        : Int = 1793;
    static var te_move      : Int = 1794;

    public static function typed(te_type:Int) : TouchState {

        if(te_type == te_down)      return TouchState.down;
        if(te_type == te_up)        return TouchState.up;
        if(te_type == te_move)      return TouchState.move;

        return TouchState.unknown;

    } //typed

} //TouchEventTypes

@:noCompletion class MouseEventTypes {

    static var me_move  : Int     = 1024;
    static var me_down  : Int     = 1025;
    static var me_up    : Int     = 1026;
    static var me_wheel : Int     = 1027;

    public static function typed(me_type:Int) : MouseEventType {

        if(me_type == me_move)      return MouseEventType.move;
        if(me_type == me_down)      return MouseEventType.down;
        if(me_type == me_up)        return MouseEventType.up;
        if(me_type == me_wheel)     return MouseEventType.wheel;

        return MouseEventType.unknown;

    } //typed

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