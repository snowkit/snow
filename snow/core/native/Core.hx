package snow.core.native;

import snow.types.Types;
import snow.api.Debug.*;

#if (hxcpp_static_std && cpp && !scriptable)

    //These use hxcpp magic to
    //import the std/zlib/regex modules

    import hxcpp.StaticRegexp;
    import hxcpp.StaticStd;
    import hxcpp.StaticZlib;

#end //hxcpp_static_std

/** The native snow core implementation details.
    See snow.Core class code for doc details */
@:allow(snow.Snow)
@:noCompletion
class Core {

    var app:snow.Snow;
    var start_timestamp : Float = 0.0;

        function new( _app:Snow ) {

            app = _app;

            set_os();

        }

        function init( _event_handler : SystemEvent->Void ) : Void {

            start_timestamp = timestamp();

            snow_init( _event_handler, {
                has_loop:true, //:todo:
                log_level:snow.api.Debug.get_level()
            });

        } //init

        function shutdown() : Void {

            snow_shutdown();

        } //shutdown

        function timestamp() : Float {

            var now : Float = snow_timestamp();
            return now - start_timestamp;

        } //timestamp

        function set_os() {

            #if ios      app.os = OS.os_ios;       #end
            #if mac      app.os = OS.os_mac;       #end
            #if linux    app.os = OS.os_linux;     #end
            #if android  app.os = OS.os_android;   #end
            #if windows  app.os = OS.os_windows;   #end

        } //set_os

    //lib functions

        static var snow_init       = snow.api.Libs.load( "snow", "snow_init", 2 );
        static var snow_shutdown   = snow.api.Libs.load( "snow", "snow_shutdown", 0 );
        static var snow_timestamp  = snow.api.Libs.load( "snow", "snow_timestamp", 0 );

} //Core
