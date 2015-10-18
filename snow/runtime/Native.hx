package snow.runtime;

import snow.types.Types;
import timestamp.Timestamp;

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

    } //new

    function run() {

        trace('runtime / native / run');

    } //run

    function shutdown() {

        trace('runtime / native / shutdown');

    } //shutdown

    var timestamp_start : Float = 0.0;
    inline function timestamp() : Float {
    
        return Timestamp.now() - timestamp_start;

    } //timestamp

} //Native

