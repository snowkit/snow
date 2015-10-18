package snow.modules.sdl;

import sdl.SDL;

class IO extends snow.core.native.io.IO {

    override public function app_path() : String {

        return SDL.getBasePath();

    } //app_path

    override public function app_path_prefs() {

        var _parts = snow.Set.app_ident.split('.');
        var _appname = _parts.pop();
        var _org = _parts.join('.');

        return SDL.getPrefPath(_org, _appname);
    
    } //app_path_prefs

} //IO