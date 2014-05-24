package lumen.platform.html5;

import lumen.types.Types;

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

    } //init

        /** Called to explicitly shutdown the framework cleanly. Called by `quit` and `app_terminated` type events by the core, for example. */
    override public function shutdown() : Void {

    } //shutdown

        /** Get the most precise timestamp available on the platform, in seconds (time is always in seconds in lumen). */
    override public function timestamp() : Float {
        if(js.Browser.window.performance != null) {
            return js.Browser.window.performance.now();
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


} //Core
