import ::APP_MAIN::;

import snow.Snow;
import snow.types.Types;

class ApplicationMain {

    public static var _host : ::APP_MAIN::;
    public static var _snow : Snow;

    public static function main () {

            //Create the runtime
        _snow = new Snow();
            //Create the app class, give it to the bootstrapper
        _host = new ::APP_MAIN::();

            //Create the main config
        var _config : SnowConfig = {

            host            : _host,
            run_loop        : true

        };

            //Start up
        _snow.init( _config );

    } //main

} //ApplicationMain
