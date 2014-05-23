package lumen.platform.native;

import lumen.types.Types;

/** Implemented in the platform specific concrete versions of this class */ 
@:noCompletion class CoreNative extends lumen.platform.Core {


    public function new( _app:Lumen ) {
        
        app = _app;

    } //new

        /** Called by the lumen internals to intiialize the core and subsystems of the framework, with the event handler passed in for where to deliver system events */
    override public function init( _event_handler : SystemEvent->Void ) : Void {

        lumen_init( _event_handler );

    } //init

        /** Called to explicitly shutdown the framework cleanly. Called by `quit` and `app_terminated` type events by the core, for example. */
    override public function shutdown() : Void {

        lumen_shutdown();

    } //shutdown

        /** Get the most precise timestamp available on the platform, in seconds (time is always in seconds in lumen) */
    override public function timestamp() : Float {
        
        return lumen_timestamp();

    } //timestamp

        /** Return the full path that the application is located */
    override public function app_path() : String {
        
        return lumen_app_path();

    } //app_path

         /** On platforms where this makes sense, get the application specific writeable data path */
    override public function pref_path( _appname:String, _package:String ) : String {
        
        return lumen_pref_path( _appname, _package );

    } //pref_path

    static var lumen_init = lumen.utils.Libs.load( "lumen", "lumen_init", 1 );
    static var lumen_shutdown = lumen.utils.Libs.load( "lumen", "lumen_shutdown", 0 );
    static var lumen_timestamp = lumen.utils.Libs.load( "lumen", "lumen_timestamp", 0 );

    static var lumen_app_path = lumen.utils.Libs.load( "lumen", "lumen_app_path", 0 );
    static var lumen_pref_path = lumen.utils.Libs.load( "lumen", "lumen_pref_path", 2 );

} //CoreNative
