package snow;

import snow.platform.Platform;
import snow.api.Debug.assertnull;
import snow.api.Debug.log;

class Snowdev {

    //public

            /** The host application */
        public var host : App;
            /** The platform implementation */
        public var platform : Platform;

    //api

            public function new(_host : App) {
            
                log('app / init');
                log('app / ident: ' + snow.Set.app_ident);
                log('app / config: ' + snow.Set.app_config);
                log('app / platform: ' + snow.Set.app_platform);

                if(snow.api.Debug.get_level() > 1) {
                    log('log / level to ${snow.api.Debug.get_level()}' );
                    log('log / filter : ${snow.api.Debug.get_filter()}');
                    log('log / exclude : ${snow.api.Debug.get_exclude()}');
                }

                host = _host;
                host.appdev = this;

                init_platform();

                log('app / platform instance: ' + platform.name);

            } //new

    //internal

        function init_platform() {

            var _platform_class = Type.resolveClass(snow.Set.app_platform);

            assertnull(_platform_class, 'cannot find platform type : ${snow.Set.app_platform}');

            platform = Type.createInstance(_platform_class, [this]);

            assertnull('could not create platform type : ${snow.Set.app_platform}');

        } //init_platform

} //Snowdev
