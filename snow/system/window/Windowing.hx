package snow.system.window;

import snow.types.Types;
import snow.system.window.Window;


/** The window manager, accessed via `app.window` */
@:allow(snow.Snow)
@:allow(snow.system.window.Window)
class Windowing {

        /** access to snow for subsystems/windows */
    @:noCompletion public var app : Snow;
        /** The concrete implementation of the window system */
    @:noCompletion public var module : snow.modules.interfaces.Windowing;

        /** constructed internally, use `app.windowing` */
    function new( _app:Snow ) {

        app = _app;
        module = new snow.Set.ModuleWindow(app);

    } //new

//Public facing API

        /** Create a window with the given config. */
    // function create( _config:WindowConfig ) : Window {

    //     // var _window = new Window( this, _config );

    //     module.listen( _window );

    //     if(_config.no_input == null || _config.no_input == false) {
    //         app.input.listen( _window );
    //     }

    //     return _window;

    // } //create

        /** Remove a window from the system, stopping events, etc.
            Called from window.destroy()! Don't use manually unless manually controlling the list. */
    function remove( _window:Window ) {

        // module.unlisten( _window );

        // if(_window.config.no_input == null || _window.config.no_input == false) {
        //     app.input.unlisten( _window );
        // }

    } //remove

//System helpers

        /** Toggle vertical refresh. This is not window specific but context wide */
    public function enable_vsync( _enable:Bool ) : Int {

        return module.system_enable_vsync(_enable);

    } //enable_vsync

        /** Toggle the OS cursor. This is not window specific but application wide, when inside a window, the OS cursor is hidden. */
    public function enable_cursor( _enable:Bool ) : Void {

        module.system_enable_cursor(_enable);

    } //enable_cursor

        /** Lock the OS cursor to the foreground window. This hides the cursor and prevents it from leaving, reporting relative coordinates. */
    public function enable_cursor_lock( _enable:Bool ) : Void {

        module.system_lock_cursor(_enable);

    } //enable_cursor

//Internal core API

        /** Called by Snow when a system event is dispatched */
    function on_event( _event:SystemEvent ) {

        if(_event.type == SystemEventType.window) {

            // var _window_event = _event.window;
            // var is_this_window = id == _window_event.window_id;

        } //only window events

    } //on_event

        /** Called by Snow, process any window handling */
    // function update() {
    //     //window.update();
    //     // if(window.auto_render) {
    //     //    window.render();
    //     //}
    // } //update

        /** Destroy and clean up etc. */
    function shutdown() {

        module.shutdown();

    } //shutdown



} //Windowing

