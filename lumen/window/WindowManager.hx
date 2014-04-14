package lumen.window;

import lumen.LumenTypes;
import lumen.window.Window;

class WindowManager {

    var lib : Lumen;

    public var window_list : Map<Int, Window>;

    public function new( _lib:Lumen ) {

        lib = _lib;
        window_list = new Map();

    } //new

    public function create( _config:WindowConfig ) : Window {

        var _window = new Window( this, _config );

        window_list.set( _window.id, _window );

        return _window;
        
    } //create

    public function update() {
        for(window in window_list) {
            window.update();
        }
    }

    public function destroy() {
        //clean up windows etc.
    }

}
