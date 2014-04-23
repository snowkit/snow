
package lumen.input.system.sdl;

import lumen.LumenTypes;
import lumen.input.system.InputSystem;

#if lumen_input_sdl

        //event types that SDL submits through native are specific to SDL2
    enum SDLKeyEventType {
        keydown;
        keyup;
    } //SDLKeyEventType

    enum SDLKeyState {
        pressed;
        released;
    } //SDLKeyState

    typedef SDLModstate = {
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
    }

    typedef SDLKeysym = {
        scancode : Int,
        sym : Int,
        mod : SDLModstate
    }

    typedef SDL_KeyboardEvent = {
        type : SDLKeyEventType,
        timestamp : Int,
        window_id : Int,
        state : SDLKeyState,
        keysym : SDLKeysym
    }


    class InputSystemSDL extends InputSystem {

        override public function init() {
        } //init

        override public function update() {
        } //update

        override public function destroy() {
        } //destroy

        override public function on_event( _event : InputEvent ) {
            
            _event.type = InputEvents.typed( cast _event.type );

            if(_event.type == key) {       
                if(_event.event.keysym != null) {

                    if(_event.event.keysym.sym == 32 && _event.event.state == 0) {
                        lib.audio.toggle();                
                    }

                    if(_event.event.keysym.sym == 13 && _event.event.state == 0) {
                        if(_event.event.keysym.mod == 256) {
                            lib.main_window.fullscreen = !lib.main_window.fullscreen;
                        }
                    }

                } //keysym
            } //key

            if(_event.type == controller) {

                if(_event.event.type == 1619) {
                    manager.on_gamepad_added( _event.event );
                }

                if(_event.event.type == 1620) {
                    manager.on_gamepad_removed( _event.event );
                }

            } //controller            
        }

    } //InputSystemSDL

#end //lumen_input_sdl