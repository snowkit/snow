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

                //Create the window config
        {{#with snow.window~}}

            var _window_config = {

                {{#if fullscreen}}fullscreen : {{fullscreen}}, {{~/if}}
                {{#if resizable}}resizable : {{resizable}}, {{~/if}}
                {{#if borderless}}borderless : {{borderless}}, {{~/if}}
                {{#if antialiasing}}antialiasing : {{antialiasing}}, {{~/if}}
                {{#if stencil}}stencil_buffer : {{stencil}}, {{~/if}}
                {{#if depth}}depth_buffer : {{depth}}, {{~/if}}
                {{#if vsync}}vsync : {{vsync}}, {{~/if}}
                {{#if fps}}fps : {{fps}}, {{~/if}}

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
