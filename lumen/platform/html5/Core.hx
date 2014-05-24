package lumen.platform.html5;

import lumen.types.Types;

/** Implemented in the platform specific concrete versions of this class */ 
@:noCompletion class Core extends lumen.Core.CoreBinding {

    public function new( _app:Lumen ) {
        
        app = _app;

    } //new

        /** Called by the lumen internals to intiialize the core and subsystems of the framework, with the event handler passed in for where to deliver system events */
    override public function init( _event_handler : SystemEvent->Void ) : Void {

    } //init

        /** Called to explicitly shutdown the framework cleanly. Called by `quit` and `app_terminated` type events by the core, for example. */
    override public function shutdown() : Void {

    } //shutdown

        /** Get the most precise timestamp available on the platform, in seconds (time is always in seconds in lumen) */
    override public function timestamp() : Float {
        return 0;
    } //timestamp

        /** Return the full path that the application is located */
    override public function app_path() : String {
        return '';
    } //app_path

    //     /** On platforms where this makes sense, get the application specific writeable data path */
    override public function pref_path( _name:String, _package:String ) : String {
        return '';
    } //pref_path


} //Core
