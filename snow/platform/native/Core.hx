package snow.platform.native;

import snow.types.Types;

/** Implemented in the platform specific concrete versions of this class */
@:noCompletion class Core extends snow.Core.CoreBinding {


    public function new( _app:Snow ) {
        app = _app;
    } //new

        /** Called by the snow internals to intiialize the core and subsystems of the framework, with the event handler passed in for where to deliver system events */
    override public function init( _event_handler : SystemEvent->Void ) : Void {
        snow_init( _event_handler, app.config.run_loop );
    } //init

        /** Called to explicitly shutdown the framework cleanly. Called by `quit` and `app_terminated` type events by the core, for example. */
    override public function shutdown() : Void {
        snow_shutdown();
    } //shutdown

        /** Get the most precise timestamp available on the platform, in seconds (time is always in seconds in snow) */
    override public function timestamp() : Float {
        return snow_timestamp();
    } //timestamp

        /** Return the full path that the application is located */
    override public function app_path() : String {
        return snow_app_path();
    } //app_path

         /** On platforms where this makes sense, get the application specific writeable data path */
    override public function pref_path( _appname:String, _package:String ) : String {
        return snow_pref_path( _appname, _package );
    } //pref_path

    static var snow_init       = snow.utils.Libs.load( "snow", "snow_init", 2 );
    static var snow_shutdown   = snow.utils.Libs.load( "snow", "snow_shutdown", 0 );
    static var snow_timestamp  = snow.utils.Libs.load( "snow", "snow_timestamp", 0 );

    static var snow_app_path   = snow.utils.Libs.load( "snow", "snow_app_path", 0 );
    static var snow_pref_path  = snow.utils.Libs.load( "snow", "snow_pref_path", 2 );


} //CoreNative
