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

            //This should be set via build time configs
            //but they aren't available just yet properly
        var _snow_config : SnowConfig = {
            has_loop : true,
            config_custom_assets : false,
            config_custom_runtime : false,
            config_runtime_path : 'config.json',
            config_assets_path : 'manifest'
        };

            //Start up
        _snow.init( _snow_config, _host );

    } //main

} //ApplicationMain
