/*
    Copyright Sven Bergström 2014
    created for snow https://github.com/underscorediscovery/snow
    MIT license
*/

#ifndef _SNOW_INPUT_H_
#define _SNOW_INPUT_H_

#include <string>

#include <hx/CFFI.h>

#include "snow_hx_bindings.h"
#include "snow_core.h"

namespace snow {

    namespace input {

        struct InputEvent;

        void dispatch_event( const InputEvent &event );
            //text input
        void snow_text_start();
        void snow_text_stop();
        void snow_text_rect( const int x, const int y, const int w, const int h );

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
                double timestamp;
                value event;


            InputEvent( InputEventType _type = ie_unknown, int _window_id = 1, double _timestamp = 0.0 )
                : type(_type), window_id(_window_id), timestamp(_timestamp)
                    { }

        };


    //Helper dispatch input events through the core event handler, since input events are agnostic and come from main SDL loop

        inline static void event_handler( const InputEvent &event ) {

            value _event = alloc_empty_object();

                alloc_field( _event, id_type,       alloc_int( event.type ) );
                alloc_field( _event, id_window_id,  alloc_int( event.window_id ) );
                alloc_field( _event, id_timestamp,  alloc_float( event.timestamp ) );
                alloc_field( _event, id_event,      event.event );

            value _system_event = alloc_empty_object();

                    //event type is always se_input event
                alloc_field( _system_event, id_type, alloc_int( core::se_input ) );
                    //store the .input value
                alloc_field( _system_event, id_input, _event );

                //finally, call the handler
            val_call1( system_event_handler->get(), _system_event );

        } //core_event_handler

        inline void dispatch_event( const InputEvent &event ) {

            snow::input::event_handler( event );

        } //dispatch_event


    } //input namespace

} //snow namespace


#endif //_SNOW_INPUT_H_