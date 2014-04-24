
package lumen.input.system.sdl;

import lumen.LumenTypes;
import lumen.input.system.InputSystem;
import lumen.input.Input;

#if lumen_input_sdl
    
    enum KeyEventType {
        unknown;
        down;
        up;
        textedit;
        textinput;
    }

    enum GamepadEventType {
        unknown;
        added;
        removed;
    }

    enum MouseEventType { 
        unknown;
        move;
        down;
        up;
        wheel;
    }

    class KeyEventTypes {

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

    class GamepadEventTypes {

        static var ge_added : Int       = 1619;
        static var ge_removed : Int     = 1620;

        public static function typed(ge_type:Int) : GamepadEventType {

            if(ge_type == ge_added)     return GamepadEventType.added;
            if(ge_type == ge_removed)   return GamepadEventType.removed;

            return GamepadEventType.unknown;

        } //typed

    } //GamepadEventTypes

    class MouseEventTypes {

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

class ModValue {

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

} 


    class InputSystemSDL extends InputSystem {

        override public function init() {
        } //init

        override public function update() {
        } //update

        override public function destroy() {
        } //destroy

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

        function key_state_from_event( type:KeyEventType ) : KeyState {

            switch( type ) {
            
                case KeyEventType.down:
                    return KeyState.down;                    
                case KeyEventType.up:
                    return KeyState.up;
                default:
                    return KeyState.unknown;
            
            } //switch(type)

        } //key_state_from_event

        function mouse_button_from_number( button : Int ) : MouseButton {

            switch(button) {

                case    1 : return MouseButton.left;
                case    2 : return MouseButton.middle;
                case    3 : return MouseButton.right;
                case    4 : return MouseButton.extra1;
                case    5 : return MouseButton.extra2;
                default   : return MouseButton.none;

            }

            return MouseButton.none;

        } //mouse_button_from_number

        override public function on_event( _event : InputEvent ) {

            super.on_event( _event );

            _event.type = InputEvents.typed( cast _event.type );            

        //Key events

            if(_event.type == key) {

                _event.event.type = KeyEventTypes.typed(_event.event.type);

                var _key_event = _event.event;

                if(_event.event.type == KeyEventType.up || _event.event.type == KeyEventType.down) {

                    var _mod_state = mod_state_from_event(_event);
                    var _key_state = key_state_from_event(_key_event.type);

                    var api_event : KeyEvent = {
                        raw : _event,
                        scancode : _key_event.keysym.scancode,
                        keycode : _key_event.keysym.sym,
                        state : _key_state,
                        mod : _mod_state,
                        repeat : _key_event.repeat,    
                        timestamp : _event.timestamp,
                        window_id : _event.window_id
                    };
                        
                    lib.input.dispatch_key_event( api_event );

                } else if(_event.event.type == KeyEventType.textedit || _event.event.type == KeyEventType.textinput) {

                    var api_event : TextEvent = {
                        raw : _event,
                        text : _event.event.text,
                        type : (_event.event.type == textedit) ? TextEventType.edit : TextEventType.input,
                        timestamp : _event.timestamp,
                        window_id : _event.window_id,
                        start : _event.event.start == null ? 0 : _event.event.start, 
                        length : _event.event.length == null ? 0 : _event.event.length
                    }

                    lib.input.dispatch_text_event( api_event );

                } //

        //Gamepad events

            } else if(_event.type == controller) {

                _event.event.type = GamepadEventTypes.typed(_event.event.type);

                if(_event.event.type == GamepadEventType.added) {
                    manager.on_gamepad_added( _event.event );
                }

                if(_event.event.type == GamepadEventType.removed) {
                    manager.on_gamepad_removed( _event.event );
                }

        //Mouse events

            } else if(_event.type == mouse) { 

                _event.event.type = MouseEventTypes.typed(_event.event.type);

                    //defaults to unknown data
                var _mouse_state : MouseState = MouseState.unknown;
                var _mouse_button : MouseButton = mouse_button_from_number(_event.event.button);

                    //relx/y defaults to x/y
                var _xrel : Int = _event.event.x;
                var _yrel : Int = _event.event.y;

                if(_event.event.type == MouseEventType.move) {

                    _mouse_state = move;
                    _xrel = _event.event.xrel;
                    _yrel = _event.event.yrel;

                } else if(_event.event.type == MouseEventType.down) {
                    _mouse_state = down;
                } else if(_event.event.type == MouseEventType.up) {
                    _mouse_state = up;
                } else if(_event.event.type == MouseEventType.wheel) {
                    _mouse_state = wheel;
                }

                var api_event : MouseEvent = {
                    raw : _event,
                    timestamp : _event.timestamp,
                    window_id : _event.window_id,
                    which : _event.event.which,
                    state : _mouse_state,
                    button : _mouse_button,
                    x : _event.event.x,
                    y : _event.event.y,
                    xrel : _xrel,
                    yrel : _yrel,
                };

                lib.input.dispatch_mouse_event( api_event );

        //Touch events

            } else if(_event.type == touch) {


            }

        //Mouse Events
                       
        } //on_event

    } //InputSystemSDL

#end //lumen_input_sdl