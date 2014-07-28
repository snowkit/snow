#ifndef _SNOW_CORE_H_
#define _SNOW_CORE_H_

#include <hx/CFFI.h>

#include "snow_hx_bindings.h"

namespace snow {

        //externs
    extern int id_type;
    namespace io {
        bool init_filewatch();
        void update_filewatch();
        void shutdown_filewatch();
    }

//snow systems

    void log(const char *fmt, ...);

//snow core systems

    namespace core {

            //implemented in snow
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
            se_app_didenterforeground       = 13,

            se_filewatch                    = 14

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
            //as the core systems required to run snow
        inline void init() {

                //call subsystem inits
            int res = snow::core::init_aux();

                //if no success, quit now
            if(res != 0) {
                snow::log("/ snow / unrecoverable error. exit!");
                exit(1);
            }

                //call platform inits
            snow::io::init_filewatch();
            snow::core::init_platform();

        } //init

        inline void shutdown() {

                //tell everything we are shutting down
            snow::core::dispatch_event( se_shutdown );

                //shutdown subsystems
            snow::core::shutdown_aux();

                //shutdown platform
            snow::io::shutdown_filewatch();
            snow::core::shutdown_platform();

        } //shutdown


        inline void update() {

            snow::core::update_aux();
            snow::io::update_filewatch();
            snow::core::update_platform();

        } //update_core

        inline void loop(void*) {

            snow::core::update();
                //tell the system/haxe
            snow::core::dispatch_event( se_update );

        } //loop

    //external access interface functions

            //this will start a main loop and start pumping events
        inline void snow_init( bool run_loop = true ) {

                //init low level systems
            snow::core::init();

                //allow haxe side to do any pre-ready init
            snow::core::dispatch_event( se_init );

                //tell haxe side we are ready
            snow::core::dispatch_event( se_ready );

                //on iOS the main loop
                //is deferred until later
            #ifdef IPHONE
                run_loop = false;
            #endif

                //run the main loop, if requested
            if(run_loop) {

                while( !shutting_down ) {
                    snow::core::loop(NULL);
                } //!shutdown

                snow::core::shutdown();

            } else {

                snow::log("/ snow / no main loop requested");

                #ifndef IPHONE
                    snow::log("/ snow / shutting down ");
                    snow::core::shutdown();
                #endif //IPHONE

            }

        } //snow_core_init

        inline void snow_shutdown() {

            shutting_down = true;

        } //snow_shutdown

        inline void dispatch_event( const SystemEventType event ) {

                //tell the platform
            on_system_event_platform(event);

            event_handler(event);

        } //dispatch_system_event

    } //core namespace

} //snow namespace

#endif //_SNOW_CORE_H_
