package lumen.window;

import lumen.LumenTypes;
import lumen.window.WindowManager;

import lumen.gl.GL;
    
typedef WindowPosition = {
    var x : Int;
    var y : Int;
}

typedef WindowSize = {
    var w : Int;
    var h : Int;
}

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
    public var window_render_handler : Window->Void;

    @:isVar public var position (get,set) : WindowPosition;
    @:isVar public var size (get,set) : WindowSize;

    public function new( _manager:WindowManager, _config:WindowConfig ) {

        position = { x:0, y:0 };
        size = { w:0, h:0 };        

        manager = _manager;
        asked_config = _config;
        config = _config;

        lumen_window_create( _config, on_window_created );

    } //new

    function on_window_created( _handle:Dynamic, _id:Int, _config:WindowConfig ) {

        id = _id;
        handle = _handle;
        config = _config;

            //update the position and size 
            //because it updates in the config
        position.x = _config.x;
        position.y = _config.y;

        size.w = _config.width;
        size.h = _config.height;

        r = Math.random();

        on_event({ 
            type:WindowEventType.window_created,
            window_id : _id,
            timestamp : 0, 
            event : {}
        });

        // trace("/ lumen / created window with id: " + id);
        // trace('/ lumen / updating real window config for $id is ' + _config);

    } //on_window_created

    @:noCompletion public function on_event( _event:WindowEvent ) {

        // trace("/ lumen / window event " + id + " / " + _event.type + " / " + _event.event );

        switch(_event.type) {
            
            case window_moved : { position = { x:_event.event.data1, y:_event.event.data2 }; }
            case window_resized : { position = { x:_event.event.data1, y:_event.event.data2 }; }
            case window_size_changed : { size = { w:_event.event.data1, h:_event.event.data2 }; }

            default: {}

        } //switch

        if(window_event_handler != null) {
            window_event_handler( _event );
        }

    } //on_event

    public function update() {

        lumen_window_update( handle );

    } //update

    var r = 0.0; var rdir = -1;
    public function render() {

        lumen_window_render( handle );

        if(window_render_handler != null) {
            window_render_handler(this);
            return;
        }

        GL.clearColor( r, 0.5, 0.1, 1.0);
        GL.clear( GL.COLOR_BUFFER_BIT );

        r += 0.005 * rdir;

        if(r >= 1) { rdir = -1; }
        if(r <= 0.8) { rdir = 1; }

        swap();

    } //render

    public function swap() {

        lumen_window_swap( handle );

    }

    public function simple_message( message:String, title:String="" ) {

        lumen_window_simple_message( handle, message, title );

    } //simple_message

    function get_position() : WindowPosition {
        return position;
    }

    function get_size() : WindowSize {
        return size;
    }

    function set_position( _pos:WindowPosition ) : WindowPosition {
        return position = _pos;
    }

    function set_size( _size:WindowSize ) : WindowSize {
        return size = _size;
    }

    private static var lumen_window_create = Lumen.load( "lumen", "lumen_window_create", 2 );
    private static var lumen_window_update = Lumen.load( "lumen", "lumen_window_update", 1 );
    private static var lumen_window_render = Lumen.load( "lumen", "lumen_window_render", 1 );
    private static var lumen_window_swap = Lumen.load( "lumen", "lumen_window_swap", 1 );
    private static var lumen_window_simple_message = Lumen.load( "lumen", "lumen_window_simple_message", 3 );

} //Window
