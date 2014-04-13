import ::APP_MAIN::;

import lumen.Lumen;

class ApplicationMain {

    public static var _host : ::APP_MAIN::;
    public static var _lumen : Lumen<::APP_MAIN::>;

    public static function main () {

            //Create the runtime
        _lumen = new Lumen<::APP_MAIN::>();
            //Create the app class, give it to the bootstrapper
        _host = new ::APP_MAIN::();
            //Create the config
        var _config : LumenConfig<::APP_MAIN::> = {

            host            : _host,
            fullscreen      : ::WIN_FULLSCREEN::,
            resizable       : ::WIN_RESIZABLE::,
            borderless      : ::WIN_BORDERLESS::,
            antialiasing    : Std.int(::WIN_ANTIALIASING::),
            stencil_buffer  : ::WIN_STENCIL_BUFFER::,
            depth_buffer    : ::WIN_DEPTH_BUFFER::,
            vsync           : ::WIN_VSYNC::,
            fps             : Std.int(::WIN_FPS::),
            width           : Std.int(::WIN_WIDTH::), 
            height          : Std.int(::WIN_HEIGHT::), 
            title           : "::APP_TITLE::",

            orientation     : "::WIN_ORIENTATION::",

        };

            //Start up
        _lumen.init( _host, _config );

    } //main
    
} //ApplicationMain
