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

        //state
    @:isVar public var title (get,set) : String;
    @:isVar public var bordered (get,set) : Bool = true;
    @:isVar public var grab (get,set) : Bool = false;
    @:isVar public var fullscreen (get,set) : Bool = false;   
        //spatial
    @:isVar public var position (get,set) : WindowPosition;
    @:isVar public var size (get,set) : WindowSize;
    @:isVar public var max_size (get,set) : WindowSize;
    @:isVar public var min_size (get,set) : WindowSize;

        //set this for fullscreen desktop mode, instead of fullscreen mode
    public var fullscreen_desktop : Bool = true;

    public function new( _manager:WindowManager, _config:WindowConfig ) {

        position = { x:0, y:0 };
        size = { w:0, h:0 };
        max_size = { w:0, h:0 };
        min_size = { w:0, h:0 };

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

    var r = 0.0; 
    var rdir = -1;

    public function render() {

            //:todo: this calls makeCurrent (good) and does fake drawing (bad)
            //either make current should exist here, instead, or render is renamed cos internal does
            //no "rendering" and only sets the window for rendering ready.
        lumen_window_render( handle );

        if(window_render_handler != null) {
            window_render_handler( this );
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

    } //swap

    public function simple_message( message:String, title:String="" ) {

        lumen_window_simple_message( handle, message, title );

    } //simple_message

    public function get_fullscreen() : Bool {

        return fullscreen;

    } //get_fullscreen


    public function set_fullscreen( _enable:Bool ) {
        
        if(handle != null) {
            lumen_window_fullscreen( handle, _enable, fullscreen_desktop ? 0 : 1  );
        }

        return fullscreen = _enable;

    } //set_fullscreen

    public function get_bordered() : Bool {
        
        return bordered;
        
    } //get_bordered

    public function get_grab() : Bool {

        return grab;

    } //get_grab

    function get_position() : WindowPosition {

        return position;

    } //get_position

    function get_size() : WindowSize {

        return size;

    } //get_size

    function get_max_size() : WindowSize {

        return max_size;

    } //get_max_size

    function get_min_size() : WindowSize {

        return min_size;

    } //get_min_size

    function get_title() : String {

        return title;

    } //get_title

    function set_title( _title:String ) {

        if(handle != null) {
            lumen_window_set_title(handle, _title);
        }

        return title = _title;
    }

    function set_position( _pos:WindowPosition ) : WindowPosition {

        if(position != null && handle != null) {
            lumen_window_set_position( handle, _pos.x, _pos.y );
        }

        return position = _pos;

    } //set_position

    function set_size( _size:WindowSize ) : WindowSize {

        if(size != null && handle != null) {
            lumen_window_set_size( handle, _size.w, _size.h );
        }

        return size = _size;

    } //set_size
    
    function set_max_size( _size:WindowSize ) : WindowSize {

        if(max_size != null && handle != null) { 
            lumen_window_set_max_size( handle, _size.w, _size.h );
        }

        return max_size = _size;

    } //set_max_size
     
    function set_min_size( _size:WindowSize ) : WindowSize {

        if(min_size != null && handle != null) {
            lumen_window_set_min_size( handle, _size.w, _size.h );
        }

        return min_size = _size;

    } //set_min_size

    public function set_bordered( _bordered:Bool ) : Bool {
        
        if(handle != null) {
            lumen_window_bordered(handle, _bordered);
        }

        return bordered = _bordered;
        
    } //set_bordered

    public function set_grab( _grab:Bool ) : Bool {

        if(handle != null) {
            lumen_window_grab(handle, _grab);
        }

        return grab = _grab;

    } //set_grab    

    static var lumen_window_create          = Lumen.load( "lumen", "lumen_window_create", 2 );
    static var lumen_window_update          = Lumen.load( "lumen", "lumen_window_update", 1 );
    static var lumen_window_render          = Lumen.load( "lumen", "lumen_window_render", 1 );
    static var lumen_window_swap            = Lumen.load( "lumen", "lumen_window_swap", 1 );
    static var lumen_window_simple_message  = Lumen.load( "lumen", "lumen_window_simple_message", 3 );
    static var lumen_window_set_size        = Lumen.load( "lumen", "lumen_window_set_size", 3 );
    static var lumen_window_set_position    = Lumen.load( "lumen", "lumen_window_set_position", 3 );
    static var lumen_window_set_title       = Lumen.load( "lumen", "lumen_window_set_title", 2 );
    static var lumen_window_set_max_size    = Lumen.load( "lumen", "lumen_window_set_max_size", 3 );
    static var lumen_window_set_min_size    = Lumen.load( "lumen", "lumen_window_set_min_size", 3 );
    static var lumen_window_grab            = Lumen.load( "lumen", "lumen_window_grab", 2 );
    static var lumen_window_fullscreen      = Lumen.load( "lumen", "lumen_window_fullscreen", 3 );
    static var lumen_window_bordered        = Lumen.load( "lumen", "lumen_window_bordered", 2 );

} //Window
