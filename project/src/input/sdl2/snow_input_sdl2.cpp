/*
    Copyright Sven Bergström 2014
    created for snow https://github.com/underscorediscovery/snow
    MIT license
*/

#include "snow_input.h"

#include <hx/CFFI.h>
#include "SDL.h"

#include <map>


namespace snow {

    namespace input {

        static bool sdl_inited = false;

        static const int MAX_GAMEPADS = 16;

        std::map<int, SDL_GameController*> gamepad_list;
        std::map<int, SDL_Joystick*> joystick_list;

        void open_gamepad(int id);
        void close_gamepad(int id);
        void open_joystick(int id);
        void close_joystick(int id);

        value sdl2_keysym_to_hx( SDL_Keysym &keysym ) {

            value _object = alloc_empty_object();

                alloc_field( _object, id_mod, alloc_int(keysym.mod) );
                alloc_field( _object, id_sym, alloc_int(keysym.sym) );
                alloc_field( _object, id_scancode, alloc_int(keysym.scancode) );

            return _object;

        } //sdl2_keysym_to_hx

        value sdl2_key_event_to_hx( InputEvent &new_event, SDL_Event &event ) {

            value _object = alloc_empty_object();

                new_event.timestamp = event.key.timestamp/1000.0;
                new_event.window_id = event.key.windowID;

                alloc_field( _object, id_type, alloc_int(event.key.type) );
                alloc_field( _object, id_timestamp, alloc_float(event.key.timestamp/1000.0) );
                alloc_field( _object, id_window_id, alloc_int(event.key.windowID) );
                alloc_field( _object, id_state, alloc_int(event.key.state) );
                alloc_field( _object, id_repeat, alloc_int(event.key.repeat) );

                alloc_field( _object, id_keysym, sdl2_keysym_to_hx(event.key.keysym) );

            return _object;

        } //sdl2_key_event_to_hx

        value sdl2_touch_event_to_hx( InputEvent &new_event, SDL_Event &event ) {

            value _object = alloc_empty_object();

            new_event.timestamp = event.tfinger.timestamp/1000.0;
                //touch events have no window id because of single screen touch devices
                //right now, but this is where sdl would add this later
            new_event.window_id = 1;

            switch(event.type) {

                case SDL_FINGERDOWN:
                case SDL_FINGERUP:
                case SDL_FINGERMOTION: {

                    alloc_field( _object, id_type, alloc_int(event.tfinger.type) );
                    alloc_field( _object, id_touch_id, alloc_int(event.tfinger.touchId) );
                    alloc_field( _object, id_finger_id, alloc_int(event.tfinger.fingerId) );
                    alloc_field( _object, id_x, alloc_float(event.tfinger.x) );
                    alloc_field( _object, id_y, alloc_float(event.tfinger.y) );
                    alloc_field( _object, id_dx, alloc_float(event.tfinger.dx) );
                    alloc_field( _object, id_dy, alloc_float(event.tfinger.dy) );
                    alloc_field( _object, id_pressure, alloc_float(event.tfinger.pressure) );

                    break;

                } //case

            } //switch type

            return _object;

        } //sdl2_touch_event_to_hx

        value sdl2_mouse_event_to_hx( InputEvent &new_event, SDL_Event &event ) {

            value _object = alloc_empty_object();

            switch(event.type) {

                case SDL_MOUSEMOTION: {

                    new_event.timestamp = event.motion.timestamp/1000.0;
                    new_event.window_id = event.motion.windowID;

                    alloc_field( _object, id_type, alloc_int(event.motion.type) );
                    alloc_field( _object, id_timestamp, alloc_float(event.motion.timestamp/1000.0) );
                    alloc_field( _object, id_window_id, alloc_int(event.motion.windowID) );
                    alloc_field( _object, id_which, alloc_int(event.motion.which) );
                    alloc_field( _object, id_state, alloc_int(event.motion.state) );
                    alloc_field( _object, id_x, alloc_int(event.motion.x) );
                    alloc_field( _object, id_y, alloc_int(event.motion.y) );
                    alloc_field( _object, id_xrel, alloc_int(event.motion.xrel) );
                    alloc_field( _object, id_yrel, alloc_int(event.motion.yrel) );

                    break;

                } //mouse motion

                case SDL_MOUSEBUTTONDOWN:
                case SDL_MOUSEBUTTONUP: {

                    new_event.timestamp = event.button.timestamp/1000.0;
                    new_event.window_id = event.button.windowID;

                    alloc_field( _object, id_type, alloc_int(event.button.type) );
                    alloc_field( _object, id_timestamp, alloc_float(event.button.timestamp/1000.0) );
                    alloc_field( _object, id_window_id, alloc_int(event.button.windowID) );
                    alloc_field( _object, id_which, alloc_int(event.button.which) );
                    alloc_field( _object, id_state, alloc_int(event.button.state) );
                    alloc_field( _object, id_x, alloc_int(event.button.x) );
                    alloc_field( _object, id_y, alloc_int(event.button.y) );
                    alloc_field( _object, id_button, alloc_int(event.button.button) );

                    break;

                } //button up/down

                case SDL_MOUSEWHEEL: {

                    new_event.timestamp = event.wheel.timestamp/1000.0;
                    new_event.window_id = event.wheel.windowID;

                    alloc_field( _object, id_type, alloc_int(event.wheel.type) );
                    alloc_field( _object, id_timestamp, alloc_float(event.wheel.timestamp/1000.0) );
                    alloc_field( _object, id_window_id, alloc_int(event.wheel.windowID) );
                    alloc_field( _object, id_which, alloc_int(event.wheel.which) );
                    alloc_field( _object, id_x, alloc_int(event.wheel.x) );
                    alloc_field( _object, id_y, alloc_int(event.wheel.y) );

                    break;

                } //wheel

            } //switch event.type

            return _object;

        } //sdl2_mouse_event_to_hx

        value sdl2_text_event_to_hx( InputEvent &new_event, SDL_Event &event ) {

            value _object = alloc_empty_object();

            switch(event.type) {

                case SDL_TEXTEDITING:{

                    new_event.timestamp = event.edit.timestamp/1000.0;
                    new_event.window_id = event.edit.windowID;

                    alloc_field( _object, id_type, alloc_int(event.type) );
                    alloc_field( _object, id_timestamp, alloc_float(event.edit.timestamp/1000.0) );
                    alloc_field( _object, id_window_id, alloc_int(event.edit.windowID) );
                    alloc_field( _object, id_text, alloc_string(event.edit.text) );
                    alloc_field( _object, id_start, alloc_int(event.edit.start) );
                    alloc_field( _object, id_length, alloc_int(event.edit.length) );

                    break;

                } //edit

                case SDL_TEXTINPUT:{

                    new_event.timestamp = event.text.timestamp/1000.0;
                    new_event.window_id = event.text.windowID;

                    alloc_field( _object, id_type, alloc_int(event.type) );
                    alloc_field( _object, id_timestamp, alloc_float(event.text.timestamp/1000.0) );
                    alloc_field( _object, id_window_id, alloc_int(event.text.windowID) );
                    alloc_field( _object, id_text, alloc_string(event.text.text) );

                    break;

                } //text

            } //switch event.type

            return _object;

        } //sdl2_text_event_to_hx

        value sdl2_joystick_event_to_hx( InputEvent &new_event, SDL_Event &event ) {

            value _object = alloc_empty_object();

                //joystick events have no window id because joystick is not window based
            new_event.window_id = 0;

            switch(event.type) {

                case SDL_JOYAXISMOTION: {

                    new_event.timestamp = event.jaxis.timestamp/1000.0;

                         //(range: -32768 to 32767)
                    double _val = (event.caxis.value+32768.0)/(32767.0+32768.0);
                    double normalized_axis_value = (-0.5 + _val) * 2.0;

                    alloc_field( _object, id_type, alloc_int(event.jaxis.type) );
                    alloc_field( _object, id_timestamp, alloc_float(event.jaxis.timestamp/1000.0) );
                    alloc_field( _object, id_which, alloc_int(event.jaxis.which) );
                    alloc_field( _object, id_axis, alloc_int(event.jaxis.axis) );
                    alloc_field( _object, id_value, alloc_float(normalized_axis_value) );

                    break;

                } //axis motion

                case SDL_JOYBALLMOTION: {

                    new_event.timestamp = event.jball.timestamp/1000.0;

                    alloc_field( _object, id_type, alloc_int(event.jball.type) );
                    alloc_field( _object, id_timestamp, alloc_float(event.jball.timestamp/1000.0) );
                    alloc_field( _object, id_which, alloc_int(event.jball.which) );
                    alloc_field( _object, id_ball, alloc_int(event.jball.ball) );
                    alloc_field( _object, id_xrel, alloc_int(event.jball.xrel) );
                    alloc_field( _object, id_yrel, alloc_int(event.jball.yrel) );

                    break;

                } //ball motion

                case SDL_JOYHATMOTION: {

                    new_event.timestamp = event.jhat.timestamp/1000.0;

                    alloc_field( _object, id_type, alloc_int(event.jhat.type) );
                    alloc_field( _object, id_timestamp, alloc_float(event.jhat.timestamp/1000.0) );
                    alloc_field( _object, id_which, alloc_int(event.jhat.which) );
                    alloc_field( _object, id_hat, alloc_int(event.jhat.hat) );
                    alloc_field( _object, id_value, alloc_int(event.jhat.value) );

                    break;

                } //hat motion

                case SDL_JOYBUTTONDOWN:
                case SDL_JOYBUTTONUP:
                {

                    new_event.timestamp = event.jbutton.timestamp/1000.0;

                    alloc_field( _object, id_type, alloc_int(event.jbutton.type) );
                    alloc_field( _object, id_timestamp, alloc_float(event.jbutton.timestamp/1000.0) );
                    alloc_field( _object, id_which, alloc_int(event.jbutton.which) );
                    alloc_field( _object, id_button, alloc_int(event.jbutton.button) );
                    alloc_field( _object, id_state, alloc_int(event.jbutton.state) );

                    break;

                } //button up/down

                case SDL_JOYDEVICEADDED:
                case SDL_JOYDEVICEREMOVED:
                {

                    new_event.timestamp = event.jdevice.timestamp/1000.0;

                    alloc_field( _object, id_type, alloc_int(event.jdevice.type) );
                    alloc_field( _object, id_timestamp, alloc_float(event.jdevice.timestamp/1000.0) );
                    alloc_field( _object, id_which, alloc_int(event.jdevice.which) );

                    const char* _name = SDL_JoystickName( joystick_list[event.jdevice.which] );
                    if(_name) {
                        alloc_field( _object, id_id, alloc_string(_name) );
                    } else {
                        alloc_field( _object, id_id, alloc_null() );
                    }

                    break;

                } //joystick added/removed

            } //switch type

            return _object;

        } //sdl2_joystick_event_to_hx


        value sdl2_controller_event_to_hx( InputEvent &new_event, SDL_Event &event ) {

            value _object = alloc_empty_object();

                //controller events have no window id because controllers are not window based
            new_event.window_id = 0;


            switch(event.type) {

                case SDL_CONTROLLERAXISMOTION: {

                    new_event.timestamp = event.caxis.timestamp/1000.0;

                         //(range: -32768 to 32767)
                    double _val = (event.caxis.value+32768.0)/(32767.0+32768.0);
                    double normalized_axis_value = (-0.5 + _val) * 2.0;

                    alloc_field( _object, id_type, alloc_int(event.caxis.type) );
                    alloc_field( _object, id_timestamp, alloc_float(event.caxis.timestamp/1000.0) );
                    alloc_field( _object, id_which, alloc_int(event.caxis.which) );
                    alloc_field( _object, id_axis, alloc_int(event.caxis.axis) );
                    alloc_field( _object, id_value, alloc_float(normalized_axis_value) );

                    break;

                } //axis motion

                case SDL_CONTROLLERBUTTONDOWN:
                case SDL_CONTROLLERBUTTONUP:
                {

                    new_event.timestamp = event.cbutton.timestamp/1000.0;

                    alloc_field( _object, id_type, alloc_int(event.cbutton.type) );
                    alloc_field( _object, id_timestamp, alloc_float(event.cbutton.timestamp/1000.0) );
                    alloc_field( _object, id_which, alloc_int(event.cbutton.which) );
                    alloc_field( _object, id_button, alloc_int(event.cbutton.button) );
                    alloc_field( _object, id_state, alloc_int(event.cbutton.state) );

                    break;

                } //button up/down

                case SDL_CONTROLLERDEVICEADDED:
                case SDL_CONTROLLERDEVICEREMOVED:
                case SDL_CONTROLLERDEVICEREMAPPED:
                {

                    new_event.timestamp = event.cdevice.timestamp/1000.0;

                    alloc_field( _object, id_type, alloc_int(event.cdevice.type) );
                    alloc_field( _object, id_timestamp, alloc_float(event.cdevice.timestamp/1000.0) );
                    alloc_field( _object, id_which, alloc_int(event.cdevice.which) );

                    const char* _name = SDL_GameControllerName( gamepad_list[event.cdevice.which] );
                    if(_name) {
                        alloc_field( _object, id_id, alloc_string(_name) );
                    } else {
                        alloc_field( _object, id_id, alloc_null() );
                    }

                    break;

                } //joystick added/removed

            } //switch type

            return _object;

        } //sdl2_controller_event_to_hx

        void handle_event( SDL_Event &event ) {

            InputEvent new_event;

            switch(event.type) {

                //keys

                    case SDL_KEYDOWN:
                    case SDL_KEYUP:
                    {
                        new_event.type = ie_key;
                        new_event.event = sdl2_key_event_to_hx(new_event, event);
                        break;
                    }

                    case SDL_TEXTEDITING:
                    case SDL_TEXTINPUT:
                    {
                        new_event.type = ie_key;
                        new_event.event = sdl2_text_event_to_hx(new_event, event);
                        break;
                    }

                //mouse

                    case SDL_MOUSEMOTION:
                    case SDL_MOUSEBUTTONDOWN:
                    case SDL_MOUSEBUTTONUP:
                    case SDL_MOUSEWHEEL:
                    {
                        new_event.type = ie_mouse;
                        new_event.event = sdl2_mouse_event_to_hx(new_event, event);
                        break;
                    }

                //touch

                    case SDL_FINGERDOWN:
                    case SDL_FINGERUP:
                    case SDL_FINGERMOTION:
                    {
                        new_event.type = ie_touch;
                        new_event.event = sdl2_touch_event_to_hx(new_event, event);
                        break;
                    }

                //joystick

                    case SDL_JOYAXISMOTION:
                    case SDL_JOYBALLMOTION:
                    case SDL_JOYHATMOTION:
                    case SDL_JOYBUTTONDOWN:
                    case SDL_JOYBUTTONUP:
                    case SDL_JOYDEVICEADDED:
                    case SDL_JOYDEVICEREMOVED:
                    {
                        int joystick_id = event.jdevice.which;
                        if(SDL_IsGameController(joystick_id)) {
                            return;
                        }

                        new_event.type = ie_joystick;
                        new_event.event = sdl2_joystick_event_to_hx(new_event, event);

                        if(event.type == SDL_JOYDEVICEADDED) {
                            open_joystick(joystick_id);
                        } else if(event.type == SDL_JOYDEVICEREMOVED) {
                            close_joystick(joystick_id);
                        }

                        break;
                    }

                //controller

                    case SDL_CONTROLLERAXISMOTION:
                    case SDL_CONTROLLERBUTTONDOWN:
                    case SDL_CONTROLLERBUTTONUP:
                    case SDL_CONTROLLERDEVICEADDED:
                    case SDL_CONTROLLERDEVICEREMOVED:
                    case SDL_CONTROLLERDEVICEREMAPPED:
                    {
                            //must happen before sdl2_controller_event_to_hx
                        if(event.type == SDL_CONTROLLERDEVICEADDED) {
                            open_gamepad(event.cdevice.which);
                        } else if(event.type == SDL_CONTROLLERDEVICEREMOVED) {
                            close_gamepad(event.cdevice.which);
                        }

                        new_event.type = ie_controller;
                        new_event.event = sdl2_controller_event_to_hx(new_event, event);

                        break;
                    }

                default: {
                    return;
                }


            } //switch event.type

            snow::input::dispatch_event( new_event );

        } //handle_input_event


    //Gamepad internal api

        void open_gamepad( int id ) {

            SDL_GameController* _gamepad = SDL_GameControllerOpen( id );

            if(_gamepad) {

                gamepad_list[ id ] = _gamepad;

            } //_gamepad

        } //open_gamepad

        void close_gamepad( int id ) {

            if(gamepad_list.count(id) > 0) {

                SDL_GameControllerClose( gamepad_list[id] );
                gamepad_list.erase( id );

            } //

        } //close_gamepad

    //Joystick internal API

        void open_joystick( int id ) {

            SDL_Joystick* _joystick = SDL_JoystickOpen( id );

            if(_joystick) {

                joystick_list[ id ] = _joystick;

            } //_joystick

        } //open_joystick

        void close_joystick( int id ) {

            if(joystick_list.count(id) > 0) {

                SDL_JoystickClose( joystick_list[id] );
                joystick_list.erase( id );

            } //

        } //close_joystick


    //Text input external api

        void snow_text_start() {

            SDL_StartTextInput();

        } //snow_text_start

        void snow_text_stop() {

            SDL_StopTextInput();

        } //snow_text_stop

        void snow_text_rect( const int x, const int y, const int w, const int h ) {

            SDL_Rect rect;

                rect.x = x;
                rect.y = y;
                rect.w = w;
                rect.h = h;

            SDL_SetTextInputRect( &rect );

        } //snow_text_rect



    //Helpers

        void init_sdl() {

            if(sdl_inited) {
                return;
            }

            sdl_inited = true;

            int err = SDL_InitSubSystem(SDL_INIT_GAMECONTROLLER);
            if (err == -1) {
                snow::log(1, "/ snow / Could not initialize controller for SDL : %s\n", SDL_GetError());
            }

            err = SDL_InitSubSystem(SDL_INIT_JOYSTICK);
            if (err == -1) {
                snow::log(1, "/ snow / Could not initialize joystick for SDL : %s\n", SDL_GetError());
            }

            #ifndef SDL_HAPTIC_DISABLED
                err = SDL_InitSubSystem(SDL_INIT_HAPTIC);
                if (err == -1) {
                    snow::log(2, "/ snow / warning only / Could not initialize haptic feedback for SDL. This is not critical. : %s\n", SDL_GetError());
                }
            #endif //SDL_HAPTIC_DISABLED

        } //init_sdl

        void shutdown_sdl() {

            if(!sdl_inited) {
                return;
            }

            sdl_inited = false;

        } //shutdown_sdl

    } // input namespace

} //snow namespace

