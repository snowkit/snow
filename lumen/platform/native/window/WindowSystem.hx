package lumen.platform.native.window;


import lumen.Lumen;
import lumen.types.Types;
import lumen.window.Window;
import lumen.window.Windowing;
import lumen.window.WindowSystem;

import lumen.utils.Libs;

 //Internal class handled by Windowing, the window system gives access to window features and functions
 //allowing the abstraction to exist between platform and implementation, so the system can be swapped out and the implementation remains unchanged.

@:noCompletion class WindowSystem extends WindowSystemBinding {

    public function new( _manager:Windowing, _lib:Lumen ) {

        manager = _manager;
        lib = _lib;

    } //new

    override public function init() {
    } //init

    override public function process() {
    } //process

    override public function destroy() {
    } //destroy

    @:noCompletion override public function listen( window:Window ) {
    } //listen

    @:noCompletion override public function unlisten( window:Window ) {
    } //unlisten

    override public function create( config:WindowConfig, on_created: WindowHandle->Int->WindowConfig->Void ) {
    	lumen_window_create( config, on_created );
    } //window_create

    override public function close( window:Window ) {
		lumen_window_close( window.handle );
    } //window_close

    override public function update( window:Window ) {
		lumen_window_update( window.handle );
    } //window_update

    override public function render( window:Window ) {
		lumen_window_render( window.handle );
    } //window_render

    override public function swap( window:Window ) {
		lumen_window_swap( window.handle );
    } //window_swap

    override public function simple_message( window:Window, message:String, ?title:String="" ) {
		lumen_window_simple_message( window.handle, message, title );
    } //window_simple_message

    override public function set_size( window:Window, w:Int, h:Int ) {
    	lumen_window_set_size( window.handle, w, h );
    } //window_set_size

    override public function set_position( window:Window, x:Int, y:Int ) {
    	lumen_window_set_position( window.handle, x, y );
    } //window_set_position

    override public function set_title( window:Window, title:String ) {
    	lumen_window_set_title( window.handle, title );
    } //window_set_title

    override public function set_max_size( window:Window, w:Int, h:Int ) {
    	lumen_window_set_max_size( window.handle, w, h );
    } //window_set_max_size

    override public function set_min_size( window:Window, w:Int, h:Int ) {
    	lumen_window_set_min_size( window.handle, w, h );
    } //window_set_min_size

    override public function grab( window:Window, grabbed:Bool ) {
    	lumen_window_grab( window.handle, grabbed );
    } //window_grab

    override public function fullscreen( window:Window, fullscreen:Bool, windowed_fullscreen:Bool = true ) {
    	lumen_window_fullscreen( window.handle, fullscreen, (windowed_fullscreen) ? 1 : 0 );
    } //window_fullscreen

    override public function bordered( window:Window, bordered:Bool ) {
    	lumen_window_bordered( window.handle, bordered );
    } //window_bordered


//Desktop only functions


    override public function display_count() : Int {
        return lumen_desktop_get_display_count();
    } //desktop_get_display_count

    override public function display_mode_count( display:Int ) : Int {
        return lumen_desktop_get_display_mode_count( display );
    } //desktop_get_display_mode_count

    override public function display_native_mode( display:Int ) : DisplayMode {
        return lumen_desktop_get_display_native_mode( display );
    } //desktop_get_display_native_mode

    override public function display_current_mode( display:Int ) : DisplayMode {
        return lumen_desktop_get_display_current_mode( display );
    } //desktop_get_display_current_mode

    override public function display_mode( display:Int, mode_index:Int ) : DisplayMode {
        return lumen_desktop_get_display_mode( display, mode_index );
    } //desktop_get_display_mode

    override public function display_bounds( display:Int ) : { x:Int, y:Int, width:Int, height:Int } {
        return lumen_desktop_get_display_bounds( display );
    } //desktop_get_display_bounds

    override public function display_name( display:Int ) : String {
        return lumen_desktop_get_display_name( display );
    } //desktop_get_display_name


//Native bindings


    static var lumen_window_create          = Lumen.load( "lumen", "lumen_window_create", 2 );
    static var lumen_window_close           = Lumen.load( "lumen", "lumen_window_close", 1 );
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

//desktop only native bindings

    static var lumen_desktop_get_display_count         = Libs.load("lumen", "lumen_desktop_get_display_count", 0);
    static var lumen_desktop_get_display_mode_count    = Libs.load("lumen", "lumen_desktop_get_display_mode_count", 1);
    static var lumen_desktop_get_display_native_mode   = Libs.load("lumen", "lumen_desktop_get_display_native_mode", 1);
    static var lumen_desktop_get_display_current_mode  = Libs.load("lumen", "lumen_desktop_get_display_current_mode", 1);
    static var lumen_desktop_get_display_mode          = Libs.load("lumen", "lumen_desktop_get_display_mode", 2);
    static var lumen_desktop_get_display_bounds        = Libs.load("lumen", "lumen_desktop_get_display_bounds", 1);
    static var lumen_desktop_get_display_name          = Libs.load("lumen", "lumen_desktop_get_display_name", 1);

} //WindowSystemNative




