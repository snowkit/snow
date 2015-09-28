package snow;

import snow.runtime.Runtime;
import snow.api.Debug.assertnull;
import snow.api.Debug.log;

class Snowdev {

    //public

            /** The host application */
        public var host : App;
            /** The runtime module */
        public var runtime : Runtime;

    //api

        public function new(_host : App) {
        
            log('app / init');
            log('app / ident: ' + snow.Set.app_ident);
            log('app / config: ' + snow.Set.app_config);
            log('app / runtime: ' + snow.Set.app_runtime);

            if(snow.api.Debug.get_level() > 1) {
                log('log / level to ${snow.api.Debug.get_level()}' );
                log('log / filter : ${snow.api.Debug.get_filter()}');
                log('log / exclude : ${snow.api.Debug.get_exclude()}');
            }

            host = _host;
            host.appdev = this;

            runtime = new snow.Set.HostRuntime(this);

            log('app / runtim instance: ' + runtime.name);

        } //new

    //internal


} //Snowdev
