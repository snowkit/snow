package lumen.window;

import lumen.types.Types;
import lumen.window.Windowing;

import lumen.render.opengl.GL;

    //A window has it's own event loop
    //and allows opening and closing windows
// @:buildXml('
//    <files id="haxe">,
//         <compilerflag value="-I${haxelib:lumen}/project/include/"/>
//    </files>
//    <target id="haxe">
//         <vflag name="-framework" value="OpenGL" />
//    </target>
// ')
class Window {

        /** the window id, for tracking events to each window */
    public var id : Int;
        /** the manager this window belongs to */
    public var manager : Windowing;
        /** the requested window config */
    public var asked_config : WindowConfig;
        /** the actual returned window config */
    public var config : WindowConfig;
        /** the native window handle */
    public var handle : WindowHandle;
        /** the window event handler callback */
    public var event_handler : WindowEvent->Void;
        /** the window render handler callback */
    public var render_handler : Window->Void;

        /** The window title `(read/write)` */
    @:isVar public var title (get,set) : String = 'lumen window';
        /** The window bordered state `(read/write)` */
    @:isVar public var bordered (get,set) : Bool = true;
        /** The window grab state `(read/write)` */
    @:isVar public var grab (get,set) : Bool = false;
        /** The window fullscreen state `(read/write)` */
    @:isVar public var fullscreen (get,set) : Bool = false;

        /** The window position `(read/write)` */
    @:isVar public var x (default,set) : Int = 0;
    @:isVar public var y (default,set) : Int = 0;
    @:isVar public var width (default,set) : Int = 0;
    @:isVar public var height (default,set) : Int = 0;

        /** The window maximum size `(read/write)` */
    @:isVar public var max_size (get,set) : { x:Int, y:Int };
        /** The window minimum size `(read/write)` */
    @:isVar public var min_size (get,set) : { x:Int, y:Int };

        /** set this for fullscreen desktop mode, instead of fullscreen mode */
    public var fullscreen_desktop : Bool = true;
        /** set this if you want to control when a window swaps() where applicable */
    public var auto_swap : Bool = true;

        //internal minimized flag to avoid rendering when minimized
    var minimized : Bool = false;
    var internal_position : Bool = false;
    var internal_resize : Bool = false;

    public function new( _manager:Windowing, _config:WindowConfig ) {

        max_size    = { x:0, y:0 };
        min_size    = { x:0, y:0 };

        manager = _manager;
        asked_config = _config;
        config = _config;

        manager.system.window_create( _config, on_window_created );

    } //new

    function on_window_created( _handle:WindowHandle, _id:Int, _config:WindowConfig ) : Void {

        id = _id;
        handle = _handle;
        config = _config;

            //update the position and size
            //because it updates in the config
            internal_position = true;
        x = _config.x;
        y = _config.y;
            internal_position = false;

            internal_resize = true;
        width = _config.width;
        height = _config.height;
            internal_resize = false;

        on_event({
            type:WindowEventType.window_created,
            window_id : _id,
            timestamp : manager.lib.time,
            event : {}
        });

        trace("/ lumen / created window with id: " + id);
        trace('/ lumen / updating real window config for $id is ' + _config);

    } //on_window_created

    @:noCompletion public function on_event( _event:WindowEvent ) {

        trace("/ lumen / window event " + id + " / " + _event.type + " / " + _event.event );

        switch(_event.type) {

            case window_moved : {

                    internal_position = true;
                set_position(_event.event.x, _event.event.y);
                    internal_position = false;

            } //moved

            case window_resized : {

                    internal_resize = true;
                set_size(_event.event.x, _event.event.y);
                    internal_resize = false;

            } //resized

            case window_size_changed : {

                    internal_resize = true;
                set_size(_event.event.x, _event.event.y);
                    internal_resize = false;

            } //size_changed

            case window_minimized : {

                minimized = true;

            } //minimized

            case window_restored : {

                minimized = false;

            } //restored

            default: {}

        } //switch

        if(event_handler != null) {
            event_handler( _event );
        }

    } //on_event

    @:noCompletion public function update() {

        manager.system.window_update( this );

    } //update


    @:noCompletion public function render() {

        if(minimized) {
            return;
        }

        manager.system.window_render( this );

        if(render_handler != null) {

            render_handler( this );

            if(auto_swap) {
                swap();
            }

            return;

        } //has render handler

        GL.clearColor( Math.random(), 0.12, 0.12, 1.0 );
        GL.clear(GL.COLOR_BUFFER_BIT);

        // lumen.platform.native.render.opengl.GLN.clear( GL.COLOR_BUFFER_BIT );

        if(auto_swap) {
            swap();
        }

    } //render

        /** Swap the back buffer of the window, call after rendering to update the window view */
    public function swap() {

        manager.system.window_swap( this );

    } //swap

        /** Close the window */
    public function close() {

        manager.system.window_close( this );

    } //close

        /** Display a cross platform message on this window */
    public function simple_message( message:String, title:String="" ) {

        manager.system.window_simple_message( this, message, title );

    } //simple_message

    function get_fullscreen() : Bool {

        return fullscreen;

    } //get_fullscreen


    function set_fullscreen( _enable:Bool ) {

        if(handle != null) {
            manager.system.window_fullscreen( this, _enable, fullscreen_desktop ? 0 : 1  );
        }

        return fullscreen = _enable;

    } //set_fullscreen

    function get_bordered() : Bool {

        return bordered;

    } //get_bordered

    function get_grab() : Bool {

        return grab;

    } //get_grab

    function get_max_size() : { x:Int, y:Int } {

        return max_size;

    } //get_max_size

    function get_min_size() : { x:Int, y:Int } {

        return min_size;

    } //get_min_size

    function get_title() : String {

        return title;

    } //get_title

    function set_title( _title:String ) {

        if(handle != null) {
            manager.system.window_set_title( this, _title );
        }

        return title = _title;

    } //set_title

    function set_x( _x:Int ) : Int {

        x = _x;

        if(handle != null && !internal_position) {
            manager.system.window_set_position( this, x, y );
        }

        return x;

    } //set_x

    function set_y( _y:Int ) : Int {

        y = _y;

        if(handle != null && !internal_position) {
            manager.system.window_set_position( this, x, y );
        }

        return y;

    } //set_y

    function set_width( _width:Int ) : Int {

        width = _width;

        if(handle != null && !internal_resize) {
            manager.system.window_set_size( this, width, height );
        }

        return width;

    } //set_width

    function set_height( _height:Int ) : Int {

        height = _height;

        if(handle != null && !internal_resize) {
            manager.system.window_set_size( this, width, height );
        }

        return height;

    } //set_height

    public function set_position( _x:Int, _y:Int ) {

            //keep the flag
        var last_internal_position_flag = internal_position;

            //force true
        internal_position = true;
            x = _x;
            y = _y;
        internal_position = last_internal_position_flag;

            //this is never called
        if(handle != null && !internal_position) {
            manager.system.window_set_position( this, x, y );
        }

    } //set_position

    function set_size( _width:Int, _height:Int ) {

            //keep the flag
        var last_internal_resize_flag = internal_resize;

            //force true
        internal_resize = true;
            width = _width;
            height = _height;
        internal_resize = last_internal_resize_flag;

        if(handle != null && !internal_resize) {
            manager.system.window_set_size( this, _width, _height );
        }

    } //set_size

    function set_max_size( _size:{ x:Int, y:Int } ) : { x:Int, y:Int } {

        if(max_size != null && handle != null) {
            manager.system.window_set_max_size( this, _size.x, _size.y );
        }

        return max_size = _size;

    } //set_max_size

    function set_min_size( _size: { x:Int, y:Int } ) : { x:Int, y:Int } {

        if(min_size != null && handle != null) {
            manager.system.window_set_min_size( this, _size.x, _size.y );
        }

        return min_size = _size;

    } //set_min_size

    function set_bordered( _bordered:Bool ) : Bool {

        if(handle != null) {
            manager.system.window_bordered( this, _bordered );
        }

        return bordered = _bordered;

    } //set_bordered

    function set_grab( _grab:Bool ) : Bool {

        if(handle != null) {
            manager.system.window_grab( this, _grab );
        }

        return grab = _grab;

    } //set_grab

} //Window
