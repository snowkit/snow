package lumen.window;

import lumen.types.Types;
import lumen.window.Window;
import lumen.utils.Libs;

import lumen.window.system.WindowSystem;
import lumen.window.system.WindowSystem.LumenWindowSystem;

typedef DisplayMode = {
    format : Int,
    refresh_rate : Int,
    width : Int,
    height : Int
}

typedef DisplayBounds = {
    x : Int,
    y : Int,
    width : Int,
    height : Int
}

/** A window manager, accessed via `app.window` */
class Windowing {

    var lib : Lumen;

        /** The list of windows in this manager */
    public var window_list : Map<Int, Window>;
        /** The number of windows in this manager */
    public var window_count : Int = 0;
        /** The concrete implementation of the window system */
    @:noCompletion public var system : LumenWindowSystem;

    @:noCompletion public function new( _lib:Lumen ) {

        lib = _lib;
        window_list = new Map();

        system = new LumenWindowSystem(this, lib);

        system.init();

    } //new

//Public facing API
    
        /** Create a window with the given config */
    public function create( _config:WindowConfig ) : Window {

        var _window = new Window( this, _config );

            window_list.set( _window.id, _window );
            window_count++;

        return _window;

    } //create

#if lumen_native

        /** `Desktop only` Get the number of displays present */
    public function desktop_get_display_count() : Int {
        return lumen_desktop_get_display_count();
    } //desktop_get_display_count

        /** `Desktop only` Get the number of display modes present */
    public function desktop_get_display_mode_count( display:Int ) : Int {
        return lumen_desktop_get_display_mode_count( display );
    } //desktop_get_display_mode_count

        /** `Desktop only` Get the native mode information of the display by index */
    public function desktop_get_display_native_mode( display:Int ) : DisplayMode {
        return lumen_desktop_get_display_native_mode( display );
    } //desktop_get_display_native_mode

        /** `Desktop only` Get the current mode information of the display by index */
    public function desktop_get_display_current_mode( display:Int ) : DisplayMode {
        return lumen_desktop_get_display_current_mode( display );
    } //desktop_get_display_current_mode

        /** `Desktop only` Get the information from a specific mode index, the index obtrained from iterating with `desktop_get_display_mode_count` value */
    public function desktop_get_display_mode( display:Int, mode_index:Int ) : DisplayMode {
        return lumen_desktop_get_display_mode( display, mode_index );
    } //desktop_get_display_mode

        /** `Desktop only` Get the bounds of the display by index */
    public function desktop_get_display_bounds( display:Int ) : DisplayBounds {
        return lumen_desktop_get_display_bounds( display );
    } //desktop_get_display_bounds

        /** `Desktop only` Get the name of the display by index, where available */
    public function desktop_get_display_name( display:Int ) : String {
        return lumen_desktop_get_display_name( display );
    } //desktop_get_display_name

#end //lumen_native


//Internal core API


    @:noCompletion public function on_event( _event:SystemEvent ) {

        if(_event.type == SystemEventType.window) {

            var _window_event = _event.window;
            _window_event.type = WindowEvents.typed( cast _window_event.type );

            var _window = window_list.get(_window_event.window_id);
            if(_window != null) {
                _window.on_event( _window_event );
            }

        } //only window events

    } //on_event

    @:noCompletion public function update() {

        system.update();

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

#if lumen_native

    static var lumen_desktop_get_display_count         = Libs.load("lumen", "lumen_desktop_get_display_count", 0);
    static var lumen_desktop_get_display_mode_count    = Libs.load("lumen", "lumen_desktop_get_display_mode_count", 1);
    static var lumen_desktop_get_display_native_mode   = Libs.load("lumen", "lumen_desktop_get_display_native_mode", 1);
    static var lumen_desktop_get_display_current_mode  = Libs.load("lumen", "lumen_desktop_get_display_current_mode", 1);
    static var lumen_desktop_get_display_mode          = Libs.load("lumen", "lumen_desktop_get_display_mode", 2);
    static var lumen_desktop_get_display_bounds        = Libs.load("lumen", "lumen_desktop_get_display_bounds", 1);
    static var lumen_desktop_get_display_name          = Libs.load("lumen", "lumen_desktop_get_display_name", 1);

#end //lumen_native

} //Windowing
