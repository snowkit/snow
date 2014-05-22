package lumen.window.system;

import lumen.Lumen;
import lumen.window.Windowing;

#if lumen_window_sdl

    @:noCompletion typedef LumenWindowSystem = lumen.window.system.sdl.WindowSystemSDL;

#else

    @:noCompletion typedef LumenWindowSystem = lumen.input.system.WindowSystem;

#end //lumen_window_sdl

    //Internal class handled by Windowing, a less concrete implementation of the window system 
@:noCompletion class WindowSystem {

    var manager : Windowing;
    var lib : Lumen;

    public function new( _manager:Windowing, _lib:Lumen ) {

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
