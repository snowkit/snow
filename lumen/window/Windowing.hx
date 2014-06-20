package lumen.window;

import lumen.types.Types;
import lumen.window.Window;
import lumen.utils.Libs;

import lumen.window.WindowSystem;

/** A window manager, accessed via `app.window` */
class Windowing {

    public var lib : Lumen;

        /** The list of windows in this manager */
    public var window_list : Map<Int, Window>;
        /** The list of window handles, pointing to id's in the `window_list` */
    public var window_handles : Map<WindowHandle, Int>;
        /** The number of windows in this manager */
    public var window_count : Int = 0;
        /** The concrete implementation of the window system */
    @:noCompletion public var system : WindowSystem;

    @:noCompletion public function new( _lib:Lumen ) {

        lib = _lib;
        window_list = new Map();
        window_handles = new Map();

        system = new WindowSystem(this, lib);

        system.init();

    } //new

//Public facing API

        /** Create a window with the given config */
    public function create( _config:WindowConfig ) : Window {

        var _window = new Window( this, _config );

            window_list.set( _window.id, _window );
            window_handles.set( _window.handle, _window.id );
            window_count++;

            //handle any window system specifics that have to happen
            //to this window when creating it, like enter/leave events
        system.listen( _window );

            //unless requested not to, give this window to the input
            //system to listen for events and dispatch them as needed
        if(_config.no_input == null || _config.no_input == false) {
            lib.input.listen( _window );
        }

        return _window;

    } //create

    public function window_from_handle( _handle:WindowHandle ) : Window {

        if(window_handles.exists(_handle)) {
            var _id = window_handles.get(_handle);
            return window_list.get(_id);
        }

        return null;

    } //window_from_handle

    public function window_from_id( _id:Int ) : Window {

        return window_list.get(_id);

    } //window_from_id


//Internal core API


    @:noCompletion public function on_event( _event:SystemEvent ) {

        if(_event.type == SystemEventType.window) {

            var _window_event = _event.window;

            if(Std.is(_window_event.type, Int)) {
                _window_event.type = WindowEvents.typed( cast _window_event.type );
            }

            var _window = window_list.get( _window_event.window_id );
            if(_window != null) {
                _window.on_event( _window_event );
            }

        } //only window events

    } //on_event

    @:noCompletion public function update() {

        system.process();

        for(window in window_list) {
            window.update();
        }

        for(window in window_list) {
            window.render();
        }

    } //update

    @:noCompletion public function destroy() {

        system.destroy();

    } //destroy


} //Windowing
