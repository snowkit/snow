package lumen.window;

import lumen.LumenTypes;
import lumen.window.Window;

class WindowManager {

    var lib : Lumen;

    public var window_list : Map<Int, Window>;
    public var window_count : Int = 0;

    public function new( _lib:Lumen ) {

        lib = _lib;
        window_list = new Map();

    } //new

    public function create( _config:WindowConfig ) : Window {

        var _window = new Window( this, _config );

            window_list.set( _window.id, _window );
            window_count++;

        return _window;

    } //create

    public function on_event( _event:SystemEvent ) {

        var _window_event = _event.window;
        _window_event.type = WindowEvents.typed( cast _window_event.type );

        if(_window_event.window_id <= window_count) {
            var _window = window_list.get(_window_event.window_id);
            if(_window != null) {
                _window.on_event( _window_event );
            }
        }

    } //on_event

    public function update( alpha_time:Float ) {

        for(window in window_list) {
            window.update();
        }

        for(window in window_list) {
            window.render( alpha_time );
        }
        
    } //update

    public function destroy() {
        //clean up windows etc.
    } //destroy

} //WindowManager
