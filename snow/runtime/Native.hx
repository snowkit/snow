package snow.runtime;

import snow.api.Debug.*;
import snow.types.Types;
import timestamp.Timestamp;

#if (hxcpp_static_std && cpp && !scriptable)

    //These use hxcpp magic to
    //import the std/zlib/regex modules

    import hxcpp.StaticRegexp;
    import hxcpp.StaticStd;
    import hxcpp.StaticZlib;

#end //hxcpp_static_std

@:allow(snow.Snow)
class Native implements Runtime {

    public var name: String = 'native';
    public var app: snow.Snow;

    function new(_app:snow.Snow) {

        app = _app;

        trace('runtime / native / new');

        #if ios      app.os = os_ios;     app.platform = platform_ios;     #end
        #if mac      app.os = os_mac;     app.platform = platform_mac;     #end
        #if linux    app.os = os_linux;   app.platform = platform_linux;   #end
        #if android  app.os = os_android; app.platform = platform_android; #end
        #if windows  app.os = os_windows; app.platform = platform_windows; #end

        timestamp_start = timestamp();

        //ensure the correct running path

            var _app_path = app.io.app_path();

            log('init / app path / `$_app_path`');
            log('init / pref path / `${app.io.app_path_prefs()}`');

            Sys.setCwd( _app_path );

        //move on
            
            app.onevent({ type:SystemEventType.init });

    } //new

    function run() {

        trace('runtime / native / run');
        Sys.sleep(0.1);

    } //run

    function shutdown() {

        trace('runtime / native / shutdown');

    } //shutdown

    var timestamp_start : Float = 0.0;
    inline function timestamp() : Float {
    
        return Timestamp.now() - timestamp_start;

    } //timestamp

} //Native

