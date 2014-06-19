#ifndef LUMEN_LUMEN_CORE_H
#define LUMEN_LUMEN_CORE_H

#include <hx/CFFI.h>

#include "hx_bindings.h"

namespace lumen {

        //externs
    extern int id_type;

//lumen systems

    void log(const char *fmt, ...);

//lumen core systems

    namespace core {

            //implemented in lumen
        void init();
        void shutdown();
            //implemented in subsystems
        int init_aux();
        int shutdown_aux();
        int update_aux();
            //implemented in core
        const char* app_path();
        const char* pref_path(const char* org, const char* app);

            //implemented in platform files
        void init_platform();
        void shutdown_platform();
        void update_platform();

    //local values

        static bool shutting_down = false;

    //core event handling

            //event types
        enum SystemEventType {

                //system events

            se_unknown                      = 0,
            se_init                         = 1,
            se_ready                        = 2,
            se_update                       = 3,
            se_shutdown                     = 4,
            se_window                       = 5,
            se_input                        = 6,

                //application events

            se_quit                         = 7,
            se_app_terminating              = 8,
            se_app_lowmemory                = 9,
            se_app_willenterbackground      = 10,
            se_app_didenterbackground       = 11,
            se_app_willenterforeground      = 12,
            se_app_didenterforeground       = 13

        }; //SystemEventType

            //forward declarations
        void dispatch_event( const SystemEventType _type );
        void on_system_event_platform( const SystemEventType event );
            //convenience naming for a callback
        typedef void (*SystemEventHandler)( const SystemEventType event );


        inline static void event_handler( const SystemEventType _type ) {

            value _event = alloc_empty_object();

               alloc_field( _event, id_type, alloc_int( _type ) );

            val_call1( system_event_handler->get(), _event );

        } //core_event_handler

            //this will initiate auxilary systems as well
            //as the core systems required to run lumen
        inline void init() {

                //call subsystem inits
            int res = lumen::core::init_aux();

                //if no success, quit now
            if(res != 0) {
                lumen::log("/ lumen / unrecoverable error. exit!");
                exit(1);
            }

                //call platform inits
            lumen::core::init_platform();

        } //init

        inline void shutdown() {

                //tell everything we are shutting down
            lumen::core::dispatch_event( se_shutdown );

                //shutdown subsystems
            lumen::core::shutdown_aux();

                //shutdown platform
            lumen::core::shutdown_platform();

        } //shutdown


        inline void update() {

            lumen::core::update_aux();
            lumen::core::update_platform();

        } //update_core

        inline void loop(void*) {

            lumen::core::update();
                //tell the system/haxe
            lumen::core::dispatch_event( se_update );

        } //loop

    //external access interface functions

            //this will start a main loop and start pumping events
        inline void lumen_init() {

                //init low level systems
            lumen::core::init();

                //allow haxe side to do any pre-ready init
            lumen::core::dispatch_event( se_init );

                //tell haxe side we are ready
            lumen::core::dispatch_event( se_ready );

                //run the main loop, if requested (should come from config, but that requires tools)
            #ifdef LUMEN_CORE_LOOP

                while( !shutting_down ) {
                    lumen::core::loop(NULL);
                } //!shutdown

                lumen::core::shutdown();

            #else
                lumen::log("/ lumen / no main loop requested");
            #endif

        } //lumen_core_init

        inline void lumen_shutdown() {

            shutting_down = true;

        } //lumen_shutdown

        inline void dispatch_event( const SystemEventType event ) {

                //tell the platform
            on_system_event_platform(event);

            event_handler(event);

        } //dispatch_system_event

    } //core namespace

} //lumen namespace

#endif //LUMEN_LUMEN_CORE_H
