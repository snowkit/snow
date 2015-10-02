package snow.runtime;

import snow.types.Types;

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

    } //new

    function run() {

        trace('runtime / native / run');

    } //run

    function shutdown() {

        trace('runtime / native / shutdown');

    } //shutdown

    function timestamp() : Float {

        return 0.0;

    } //timestamp

} //Native

