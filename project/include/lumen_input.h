#ifndef LUMEN_LUMEN_INPUT_H
#define LUMEN_LUMEN_INPUT_H
    
#include <string>

#include <hx/CFFI.h>

#include "common/Object.h"
#include "hx_bindings.h"
#include "lumen_core.h"

namespace lumen {

    struct InputEvent;

    void dispatch_input_event( const InputEvent &event );
    void input_gamepad_open( const int id );
    void input_gamepad_close( const int id );

        //plausible input events
    enum InputEventType {

        ie_unknown                      = 0,

        ie_key                          = 1,
        ie_mouse                        = 2,
        ie_touch                        = 3,
        ie_joystick                     = 4,
        ie_controller                   = 5

    }; //InputEventType

    struct InputEvent {

        public:
            InputEventType type;
            int window_id;
            int timestamp;
            value event;


        InputEvent( InputEventType _type = ie_unknown, int _window_id = 1, int _timestamp = 0 ) 
            : type(_type), window_id(_window_id), timestamp(_timestamp)
                { }

    };


//Helper dispatch input events through the core event handler, since input events are agnostic and come from main SDL loop

    inline static void input_event_handler( const InputEvent &event ) {

        value _input_event = alloc_empty_object();

            alloc_field( _input_event, id_type, alloc_int( event.type ) );
            alloc_field( _input_event, id_window_id, alloc_int( event.window_id ) );
            alloc_field( _input_event, id_timestamp, alloc_int( event.timestamp ) );
            alloc_field( _input_event, id_event, event.event );

        value _system_event = alloc_empty_object();

                //event type is always se_input event
            alloc_field( _system_event, id_type, alloc_int( se_input ) );
                //store the .input value
            alloc_field( _system_event, id_input, _input_event );
            
            //finally, call the handler
        val_call1( system_event_handler->get(), _system_event );

    } //core_event_handler

    inline void dispatch_input_event( const InputEvent &event ) {

        input_event_handler( event );

    } //dispatch_input_event

} //lumen 


#endif //LUMEN_LUMEN_INPUT_H