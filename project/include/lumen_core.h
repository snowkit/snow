#ifndef LUMEN_LUMEN_CORE_H
#define LUMEN_LUMEN_CORE_H

#include <hx/CFFI.h>

#include "hx_bindings.h"

namespace lumen {

//core init systems

    void init_core();
    void shutdown_core();
        //implemented in subsystems
    int init_core_aux();
    int shutdown_core_aux();

    extern int id_type;

//core event handling

    enum SystemEventType {

        se_unknown                 = 0,
        se_ready                   = 1,
        se_update                  = 2,
        se_shutdown                = 3,

    }; //SystemEvent

    struct SystemEvent {

        public:
            SystemEventType type;

        SystemEvent( SystemEventType _type = se_unknown ) 
            : type(_type)
                {}

    };

    typedef void (*SystemEventHandler)( SystemEvent &event );

        //core event haxe callback handler
    static AutoGCRoot *system_event_handler = 0;
    static void core_event_handler( SystemEvent &event ) {

        value _event = alloc_empty_object();

           alloc_field( _event, id_type, alloc_int( event.type ) );
            
        val_call1( system_event_handler->get(), _event );

    } //core_event_handler

    static bool shutdown = false;

    void dispatch_events();
    void dispatch_system_event( SystemEventType _type );

        //this will initiate auxilary systems as well
        //as the core systems required to run lumen
    inline void init_core() {

            //call subsystem inits
        init_core_aux();

    }

    inline void shutdown_core() {

            //tell everything we are shutting down
        dispatch_system_event( se_shutdown );

            //shutdown subsystems
        shutdown_core_aux();

    } //

    inline void lumen_core_shutdown() {

        shutdown = true;

    }

        //this will start a main loop and start pumping events
    inline void lumen_core_init() {

            //init low level systems 
        init_core();

            //tell haxe side we are ready
        dispatch_system_event( se_ready );

            //run the main loop
        while( !shutdown ) {
            
            dispatch_system_event( se_update );

        }

        shutdown_core();

    } //lumen_core_init

    inline void dispatch_system_event( SystemEventType _type = se_unknown ) {
            
        SystemEvent event(_type);
        core_event_handler(event);

    } //dispatch_events

} //namespace lumen

#endif //LUMEN_LUMEN_CORE_H