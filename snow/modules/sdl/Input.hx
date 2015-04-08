package snow.modules.sdl;


import snow.types.Types;
import snow.system.input.Input;


@:noCompletion
class Input extends snow.core.native.input.Input {

    override function on_event( event : SystemEvent ) {

        super.on_event( event );

            //only care about input events
        if(event.type != SystemEventType.input) {
            return;
        }

        var _event = event.input;

        //Key events

            if(_event.type == InputEventType.key) {

                var _key_event = _event.event;

                if(_event.event.type == KeyEventType.down) {

                    system.dispatch_key_down_event(
                        _key_event.keysym.sym,
                        _key_event.keysym.scancode,
                        _key_event.repeat,
                        mod_state_from_event(_event),
                        _event.timestamp,
                        _event.window_id
                    );

                } else if(_event.event.type == KeyEventType.up) {

                    system.dispatch_key_up_event(
                        _key_event.keysym.sym,
                        _key_event.keysym.scancode,
                        _key_event.repeat,
                        mod_state_from_event(_event),
                        _event.timestamp,
                        _event.window_id
                    );

                } else if(_event.event.type == KeyEventType.textedit || _event.event.type == KeyEventType.textinput) {

                    system.dispatch_text_event(
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

                    system.dispatch_touch_down_event(
                        _event.event.x,
                        _event.event.y,
                        _event.event.finger_id,
                        _event.timestamp
                    );

                } else if(_state == TouchEventType.up) {

                    system.dispatch_touch_up_event(
                        _event.event.x,
                        _event.event.y,
                        _event.event.finger_id,
                        _event.timestamp
                    );

                } else if(_state == TouchEventType.move) {

                    system.dispatch_touch_move_event(
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
                    system.dispatch_gamepad_button_up_event(
                        _gamepad_event.which,
                        _gamepad_event.button,
                        0,
                        _event.timestamp
                    );

                } else if(_gamepad_event.type == ControllerEventType.button_down ) {

                        //the 1 means fully pressed
                    system.dispatch_gamepad_button_down_event(
                        _gamepad_event.which,
                        _gamepad_event.button,
                        1,
                        _event.timestamp
                    );

            //Axis

                } else if(_gamepad_event.type == ControllerEventType.axis) {

                    system.dispatch_gamepad_axis_event(
                        _gamepad_event.which,
                        _gamepad_event.axis,
                        _gamepad_event.value,
                        _event.timestamp
                    );

                } else {

            //Device events

                    var _type : GamepadDeviceEventType = GamepadDeviceEventType.unknown;

                    if(_gamepad_event.type == ControllerEventType.added) {

                        system.on_gamepad_added( _gamepad_event );
                        _type = GamepadDeviceEventType.device_added;

                    } else if(_gamepad_event.type == ControllerEventType.removed) {

                        system.on_gamepad_removed( _gamepad_event );
                        _type = GamepadDeviceEventType.device_removed;

                    } else if(_gamepad_event.type == ControllerEventType.remapped) {
                        _type = GamepadDeviceEventType.device_remapped;
                    }

                    system.dispatch_gamepad_device_event(
                        _gamepad_event.which,
                        _type,
                        _event.timestamp
                    );

                }

        //Mouse events

            } else if(_event.type == InputEventType.mouse) {

                if(_event.event.type == MouseEventType.move) {

                    system.dispatch_mouse_move_event(
                        _event.event.x,
                        _event.event.y,
                        _event.event.xrel,
                        _event.event.yrel,
                        _event.timestamp,
                        _event.window_id
                    );

                } if(_event.event.type == MouseEventType.down) {

                    system.dispatch_mouse_down_event(
                        _event.event.x,
                        _event.event.y,
                        _event.event.button,
                        _event.timestamp,
                        _event.window_id
                    );

                } else if(_event.event.type == MouseEventType.up) {

                    system.dispatch_mouse_up_event(
                        _event.event.x,
                        _event.event.y,
                        _event.event.button,
                        _event.timestamp,
                        _event.window_id
                    );

                } else if(_event.event.type == MouseEventType.wheel) {

                    system.dispatch_mouse_wheel_event(
                        _event.event.x,
                        _event.event.y,
                        _event.timestamp,
                        _event.window_id
                    );

                }

            } //if's

    } //on_event


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


} //Input

@:noCompletion
@:enum abstract KeyEventType(Int) {

        /** A key down event */
    var down        = 768;
        /** A key up event */
    var up          = 769;
        /** A text input text edit event */
    var textedit    = 770;
        /** A text input typing event */
    var textinput   = 771;

} //KeyEventTypes

@:noCompletion
@:enum abstract ControllerEventType(Int) {

        /** a gamepad axis movement event */
    var axis            = 1616;
        /** a gamepad button pressed event */
    var button_down     = 1617;
        /** a gamepad button released event */
    var button_up       = 1618;
        /** a gamepad connected event */
    var added           = 1619;
        /** a gamepad disconnected event */
    var removed         = 1620;
        /** a gamepad remapped event */
    var remapped        = 1621;

} //ControllerEventType

@:noCompletion
@:enum abstract TouchEventType(Int) {

        /** A touch has begun */
    var down    = 1792;
        /** A touch has ended */
    var up      = 1793;
        /** A touch is moving */
    var move    = 1794;

} //TouchEventType

@:noCompletion
@:enum abstract MouseEventType(Int) {

        /** A mouse moved event */
    var move    = 1024;
        /** A mouse button pressed event */
    var down    = 1025;
        /** A mouse button released event */
    var up      = 1026;
        /** A mouse wheel or scroll event */
    var wheel   = 1027;

} //MouseEventTypes

@:noCompletion
@:enum abstract ModValue(Int) {

    var NONE    = 0x0000;
    var LSHIFT  = 0x0001;
    var RSHIFT  = 0x0002;
    var LCTRL   = 0x0040;
    var RCTRL   = 0x0080;
    var LALT    = 0x0100;
    var RALT    = 0x0200;
    var LMETA   = 0x0400;
    var RMETA   = 0x0800;
    var NUM     = 0x1000;
    var CAPS    = 0x2000;
    var MODE    = 0x4000;

} //ModValue

