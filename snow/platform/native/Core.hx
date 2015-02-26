package snow.platform.native;

import snow.types.Types;
import snow.Log.log;

#if (hxcpp_static_std && cpp)

    //These use hxcpp magic to
    //import the std/zlib/regex modules

    import hxcpp.StaticRegexp;
    import hxcpp.StaticStd;
    import hxcpp.StaticZlib;

#end //hxcpp_static_std

#if !snow_dynamic_link
    import snow.platform.native.StaticSnow;
#end //snow_dynamic_link

/** Implemented in the platform specific concrete versions of this class */
@:noCompletion class Core extends snow.Core.CoreBinding {

    var start_timestamp : Float = 0.0;

        public function new( _app:Snow ) {
            app = _app;
        } //new

            /** Called by the snow internals to intiialize the core and subsystems of the framework, with the event handler passed in for where to deliver system events */
        override public function init( _event_handler : SystemEvent->Void ) : Void {

            start_timestamp = timestamp();

            snow_init( _event_handler, {
                has_loop:app.snow_config.has_loop,
                log_level:snow.Log.get_level()
            });

        } //init

            /** Called to explicitly shutdown the framework cleanly. Called by `quit` and `app_terminated` type events by the core, for example. */
        override public function shutdown() : Void {

            snow_shutdown();

        } //shutdown

            /** Get the most precise timestamp available on the platform, in seconds (time is always in seconds in snow) */
        override public function timestamp() : Float {

            var now : Float = snow_timestamp();
            return now - start_timestamp;

        } //timestamp


    //Path utilities

            /** Return the full path that the application is located */
        override public function app_path() : String {

            return snow_app_path();

        } //app_path

             /** On platforms where this makes sense, get the application specific writeable data path.
                 Uses the package from `SnowConfig`, passed through from flow projects or boot config. */
        override public function app_path_prefs() : String {

            var _parts = app.snow_config.app_package.split('.');
            var _appname = _parts.pop();
            var _org = _parts.join('.');

            return snow_pref_path( _org, _appname );

        } //app_path_prefs


    //lib functions


        static var snow_app_path   = snow.utils.Libs.load( "snow", "snow_app_path", 0 );
        static var snow_pref_path  = snow.utils.Libs.load( "snow", "snow_pref_path", 2 );

        static var snow_init       = snow.utils.Libs.load( "snow", "snow_init", 2 );
        static var snow_shutdown   = snow.utils.Libs.load( "snow", "snow_shutdown", 0 );
        static var snow_timestamp  = snow.utils.Libs.load( "snow", "snow_timestamp", 0 );

} //CoreNative
