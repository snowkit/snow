import {{project.app.main}};

import snow.Snow;
import snow.types.Types;

class SnowApp {

    public static var _host : {{project.app.main}};
    public static var _snow : Snow;

    public static function main () {

            //Create the runtime
        _snow = new Snow();
            //Create the app class, give it to the bootstrapper
        _host = new {{project.app.main}}();

            //Create the main config
        var _config : SnowConfig = {

            host            : _host,
            run_loop        : true

        };

            //Start up
        _snow.init( _host, _config );

    } //main

} //SnowApp
