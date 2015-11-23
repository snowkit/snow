package snow.runtime;

import snow.api.Debug.*;
import snow.types.Types;

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
        
        log('runtime / native / new');

            app = _app;

            #if ios      app.os = os_ios;     app.platform = platform_ios;     #end
            #if mac      app.os = os_mac;     app.platform = platform_mac;     #end
            #if linux    app.os = os_linux;   app.platform = platform_linux;   #end
            #if android  app.os = os_android; app.platform = platform_android; #end
            #if windows  app.os = os_windows; app.platform = platform_windows; #end

        //ensure the correct running path

        var _app_path = app.io.app_path();

            log('init / app path / `$_app_path`');
            log('init / pref path / `${app.io.app_path_prefs()}`');

            Sys.setCwd( _app_path );

    } //new

    function run() {

        log('runtime / native / run');
        
        app.dispatch_event(se_tick);

    } //run

    function ready() {

        log('runtime / native / ready');
        
    } //ready

    function shutdown() {

        log('runtime / native / shutdown');

    } //shutdown

    public function window_grab(enable:Bool) : Bool {

        log('runtime / native / window_grab');

        return false;

    } //window_grab

    public function window_fullscreen(enable:Bool, ?true_fullscreen:Bool=false) : Bool {

        log('runtime / native / window_fullscreen');

        return false;

    } //window_fullscreen


} //Native

