package lumen.platform.html5;

import lumen.types.Types;

#if lumen_html5

    /** Implemented in the platform specific concrete versions of this class */ 
    @:noCompletion class Core extends lumen.Core.CoreBinding {

        public function new( _app:Lumen ) {

            app = _app;

        } //new

            /** Called by the lumen internals to intiialize the core and subsystems of the framework, with the event handler passed in for where to deliver system events */
        override public function init( _event_handler : SystemEvent->Void ) : Void {        

                //When we are done in here, start the main init procedure
            app.dispatch_system_event({ type:SystemEventType.init });

                //After it's had time to init, we fire the ready state
            app.dispatch_system_event({ type:SystemEventType.ready });

                //Then if requested, start the main loop
            //if( loop config set ) { :todo:
                request_update();
            // }

        } //init

            /** Called to explicitly shutdown the framework cleanly. Called by `quit` and `app_terminated` type events by the core, for example. */
        override public function shutdown() : Void {

        } //shutdown

            /** Get the most precise timestamp available on the platform, in seconds (time is always in seconds in lumen). */
        override public function timestamp() : Float {
            if(js.Browser.window.performance != null) {
                return js.Browser.window.performance.now()/1000.0;
            } else {
                return haxe.Timer.stamp();
            }
        } //timestamp

            /** Return the full path that the application is located */
        override public function app_path() : String {
            return haxe.io.Path.directory(js.Browser.location.href) + '/';
        } //app_path

        //     /** On platforms where this makes sense, get the application specific writeable data path */
        override public function pref_path( _name:String, _package:String ) : String {
            return './';
        } //pref_path


            //Internal value only, for use ONLY when request animation frame is unavailable.
            //Don't use this value for anything... use the other time constructs in lumen.App
        @:noCompletion var _lf_timestamp : Float = 0.016;
        @:noCompletion var _time_now : Float = 0.0;

        function request_update() {

                //If they support RAF use it, else fallback
            if(js.Browser.window.requestAnimationFrame != null) {
                
                js.Browser.window.requestAnimationFrame(lumen_core_loop);

            } else {            

                    //schedule the callback again
                js.Browser.window.setTimeout(function(){
                        
                        //cache the current time
                    var _now = timestamp();
                        //increase the time value by the time since last frame
                    _time_now += (_now - _lf_timestamp);
                        //call the callback, to match RAF stuff
                    lumen_core_loop( _time_now * 1000.0 );
                        //update the last frame stamp
                    _lf_timestamp = _now;

                }, 15 ); //:todo: this value from timing values in config heh.

            } //no request anim frame

        } //request_update

            //This is the actual main loop code, called by RAF or setTimeout etc.
        function lumen_core_loop( ?_t:Float = 0.016 ) : Bool {
            
                //internal update
            update();
                //dispatch the event to the framework + host
            app.dispatch_system_event({ type:SystemEventType.update });
                //ask for another update
            request_update();
                //
            return true;

        } //lumen_core_loop

        function update() {
            
        }

    } //Core

#end //lumen_html5