package snow.window;

import snow.types.Types;
import snow.window.Window;
import snow.utils.Libs;

import snow.window.WindowSystem;

/** A window manager, accessed via `app.window` */
class Windowing {

    public var lib : Snow;

        /** The list of windows in this manager */
    public var window_list : Map<Int, Window>;
        /** The list of window handles, pointing to id's in the `window_list` */
    public var window_handles : Map<WindowHandle, Int>;
        /** The number of windows in this manager */
    public var window_count : Int = 0;
        /** The concrete implementation of the window system */
    @:noCompletion public var system : WindowSystem;

    @:noCompletion public function new( _lib:Snow ) {

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

//System helpers

        /** Toggle vertical refresh. This is not window specific but context wide */
    public function enable_vsync( _enable:Bool ) : Int {

        return system.system_enable_vsync(_enable);

    } //enable_vsync

        /** Toggle the OS cursor. This is not window specific but system wide */
    public function enable_cursor( _enable:Bool ) : Void {

        system.system_enable_cursor(_enable);

    } //enable_cursor

//Desktop API
    //note that these only make sense on some platforms but will
    //try and return valid values either way. Use the window itself for info

    /** Get the number of displays present */
    public function display_count() : Int {
        return system.display_count();
    } //display_count

        /** Get the number of display modes present */
    public function display_mode_count( display:Int ) : Int {
        return system.display_mode_count(display);
    } //display_mode_count

        /** Get the native mode information of the display by index */
    public function display_native_mode( display:Int ) : DisplayMode {
        return system.display_native_mode(display);
    } //display_native_mode

        /** Get the current mode information of the display by index */
    public function display_current_mode( display:Int ) : DisplayMode {
        return system.display_current_mode(display);
    } //display_current_mode

        /** Get the information from a specific mode index, the index obtrained from iterating with `display_mode_count` value */
    public function display_mode( display:Int, mode_index:Int ) : DisplayMode {
        return system.display_mode(display, mode_index);
    } //display_mode

        /** Get the bounds of the display by index */
    public function display_bounds( display:Int ) : { x:Int, y:Int, width:Int, height:Int } {
        return system.display_bounds(display);
    } //display_bounds

        /** Get the name of the display by index, where available */
    public function display_name( display:Int ) : String {
        return system.display_name(display);
    } //display_name


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
