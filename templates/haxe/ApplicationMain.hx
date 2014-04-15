import ::APP_MAIN::;

import lumen.Lumen;
import lumen.LumenTypes;

class ApplicationMain {

    public static var _host : ::APP_MAIN::;
    public static var _lumen : Lumen;

    public static function main () {

            //Create the runtime
        _lumen = new Lumen();
            //Create the app class, give it to the bootstrapper
        _host = new ::APP_MAIN::();

            //This is temporary because x/y are not passed in from lime-tools atm
        var _params : Dynamic = ::WIN_PARAMETERS::;

        //SDL_WINDOWPOS_UNDEFINED
            _params.x = (_params.x != null) ? _params.x : 0x1FFF0000;
            _params.y = (_params.y != null) ? _params.y : 0x1FFF0000;

        //SDL_WINDOWPOS_CENTERED
            // _params.x = 0x2FFF0000;
            // _params.y = 0x2FFF0000;

            //Create the window config 
        var _window_config = {

            fullscreen      : ::WIN_FULLSCREEN::,
            resizable       : ::WIN_RESIZABLE::,
            borderless      : ::WIN_BORDERLESS::,
            antialiasing    : Std.int(::WIN_ANTIALIASING::),
            stencil_buffer  : ::WIN_STENCIL_BUFFER::,
            depth_buffer    : ::WIN_DEPTH_BUFFER::,
            vsync           : ::WIN_VSYNC::,
            fps             : Std.int(::WIN_FPS::),
            x               : Std.int(_params.x), 
            y               : Std.int(_params.y), 
            width           : Std.int(::WIN_WIDTH::), 
            height          : Std.int(::WIN_HEIGHT::), 
            title           : "::APP_TITLE::",

            orientation     : "::WIN_ORIENTATION::"

        } //_window_config

            //Create the main config
        var _config : LumenConfig = {

            host            : _host,
            window_config   : _window_config

        };

            //Start up
        _lumen.init( _host, _config );

    } //main
    
} //ApplicationMain
