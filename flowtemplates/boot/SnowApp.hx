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

        //SDL_WINDOWPOS_UNDEFINED 0x1FFF0000;
        //SDL_WINDOWPOS_CENTERED 0x2FFF0000;

        var _window_config = null;

        {{#with snow.window~}}

                //Create the window config
            _window_config = {

                fullscreen : {{toString fullscreen}},
                resizable : {{toString resizable}},
                borderless : {{toString borderless}},
                antialiasing : {{toString antialiasing}},
                stencil_buffer : {{toString stencil}},
                depth_buffer : {{toString depth}},
                vsync : {{toString vsync}},
                fps : {{fps}},

                x               : Std.int(0x1FFF0000),
                y               : Std.int(0x1FFF0000),
                width           : {{width}},
                height          : {{height}},
                title           : "{{title}}",

                orientation     : "{{orientation}}"

            } //_window_config

        {{~/with}}

            //Create the main config
        var _config : SnowConfig = {

            host            : _host,
            window          : _window_config,
            runtime         : {},
            run_loop        : true

        };

            //Start up
        _snow.init( _host, _config );

    } //main

} //SnowApp
