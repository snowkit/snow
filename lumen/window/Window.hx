package lumen.window;

import lumen.LumenTypes;
import lumen.window.WindowManager;
    
    //A window has it's own event loop
    //and allows opening and closing windows
class Window {

        //the window id, for tracking them
    public var id : Int;
        //the manager this window belongs to
    public var manager : WindowManager;
        //the requested and actual configs
    public var asked_config : WindowConfig;
    public var config : WindowConfig;
        //the native window handle
    public var handle : Dynamic;
    public var window_event_handler : WindowEvent->Void;

    public function new( _manager:WindowManager, _config:WindowConfig ) {

        manager = _manager;
        asked_config = _config;
        config = _config;

        lumen_window_create( _config, on_window_created );

    } //new

    function on_window_created( _handle:Dynamic, _id:Int, _config:WindowConfig ) {

        id = _id;
        handle = _handle;
        config = _config;

        trace("/ lumen / created window with id: " + id);
        trace('/ lumen / updating real window config for $id is ' + _config);

    } //on_window_created

    @:noCompletion public function on_event( _event:WindowEvent ) {

        trace("/ lumen / window event " + id + " / " + _event.type );

        if(window_event_handler != null) {
            window_event_handler( _event );
        }

    } //on_event

    public function update() {

        lumen_window_update( handle );

    } //update
    
    public function render() {

        lumen_window_render( handle );

    } //update

    public function simple_message( message:String, title:String="" ) {

        lumen_window_simple_message( handle, message, title );

    } //simple_message

    private static var lumen_window_create = Lumen.load( "lumen", "lumen_window_create", 2 );
    private static var lumen_window_update = Lumen.load( "lumen", "lumen_window_update", 1 );
    private static var lumen_window_render = Lumen.load( "lumen", "lumen_window_render", 1 );
    private static var lumen_window_simple_message = Lumen.load( "lumen", "lumen_window_simple_message", 3 );

} //Window
