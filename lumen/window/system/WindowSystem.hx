package lumen.window.system;

import lumen.Lumen;
import lumen.window.WindowManager;

#if lumen_window_sdl

    typedef LumenWindowSystem = lumen.window.system.sdl.WindowSystemSDL;

#end //lumen_window_sdl


class WindowSystem {

    var manager : WindowManager;
    var lib : Lumen;

    public function new( _manager:WindowManager, _lib:Lumen ) {

        manager = _manager;
        lib = _lib;

    } //new

    public function init() {
    } //init

    public function update() {
    } //update

    public function destroy() {
    } //destroy


} //WindowSystem
