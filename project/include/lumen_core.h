#ifndef LUMEN_LUMEN_CORE_H
#define LUMEN_LUMEN_CORE_H

#include <hx/CFFI.h>

#include "hx_bindings.h"

namespace lumen {

//core init systems

    void init_core();
    void shutdown_core();
    void log(const char *fmt, ...);

    const char* core_app_path();
    const char* core_pref_path(const char* org, const char* app);

        //implemented in subsystems
    int init_core_aux();
    int shutdown_core_aux();
    int update_core_aux();

        //implemented in platform files
    void init_core_platform();
    void shutdown_core_platform();
    void update_core_platform();


    extern int id_type;

//core event handling

    enum SystemEventType {

            //lumen core events

        se_unknown                      = 0,
        se_init                         = 1,
        se_ready                        = 2,
        se_update                       = 3,
        se_shutdown                     = 4,
        se_window                       = 5,
        se_input                        = 6,

            //lumen application events

        se_quit                         = 7,
        se_app_terminating              = 8,
        se_app_lowmemory                = 9,
        se_app_willenterbackground      = 10,
        se_app_didenterbackground       = 11,
        se_app_willenterforeground      = 12,
        se_app_didenterforeground       = 13

    }; //SystemEvent

    struct SystemEvent {

        public:
            SystemEventType type;

        SystemEvent( SystemEventType _type = se_unknown )
            : type(_type)
                {}

    };

    typedef void (*SystemEventHandler)( SystemEvent &event );

    inline static void core_event_handler( const SystemEvent &event ) {

        value _event = alloc_empty_object();

           alloc_field( _event, id_type, alloc_int( event.type ) );

        val_call1( system_event_handler->get(), _event );

    } //core_event_handler

    static bool shutdown = false;

    void dispatch_events();
    void dispatch_system_event( SystemEventType _type );
    void dispatch_system_event_type( SystemEventType _type );

        //this will initiate auxilary systems as well
        //as the core systems required to run lumen
    inline void init_core() {

            //call subsystem inits
        int res = init_core_aux();

            //if no success, quit now
        if(res != 0) {
            lumen::log("/ lumen / unrecoverable error. exit!");
            exit(1);
        }

            //call platform inits
        init_core_platform();

    } //init_core

    inline void shutdown_core() {

            //tell everything we are shutting down
        dispatch_system_event_type( se_shutdown );

            //shutdown subsystems
        shutdown_core_aux();

            //shutdown platform
        shutdown_core_platform();

    } //shutdown_core


    inline void update_core() {

        update_core_aux();
        update_core_platform();

    } //update_core

    inline void lumen_core_shutdown() {

        shutdown = true;

    } //lumen_core_shutdown

        //this will start a main loop and start pumping events
    inline void lumen_core_init() {

            //init low level systems
        init_core();

            //allow haxe side to do any pre-ready init
        dispatch_system_event_type( se_init );

            //tell haxe side we are ready
        dispatch_system_event_type( se_ready );

            //run the main loop
        while( !shutdown ) {

            update_core();

            dispatch_system_event_type( se_update );

        } //!shutdown

        shutdown_core();

    } //lumen_core_init

        //a convenience helper for dispatching a unadorned event in place
    inline void dispatch_system_event_type( SystemEventType _type = se_unknown ) {

        SystemEvent event(_type);
        core_event_handler(event);

    } //dispatch_system_event_type

    inline void dispatch_system_event( const SystemEvent &event ) {

        core_event_handler(event);

    } //dispatch_events

} //namespace lumen

#endif //LUMEN_LUMEN_CORE_H
