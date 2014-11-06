package snow.platform.native.window;


import snow.Snow;
import snow.types.Types;
import snow.window.Window;
import snow.window.Windowing;
import snow.window.WindowSystem;

import snow.utils.Libs;

 //Internal class handled by Windowing, the window system gives access to window features and functions
 //allowing the abstraction to exist between platform and implementation, so the system can be swapped out and the implementation remains unchanged.

@:noCompletion class WindowSystem extends WindowSystemBinding {

    public function new( _manager:Windowing, _lib:Snow ) {

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
    	snow_window_create( config, on_created );
    } //window_create

    override public function close( window:Window ) {
        snow_window_close( window.handle );
    } //close

    override public function show( window:Window ) {
        snow_window_show( window.handle );
    } //show

    override public function destroy_window( window:Window ) {
		snow_window_destroy_window( window.handle );
    } //destroy_window

    override public function update( window:Window ) {
		snow_window_update( window.handle );
    } //window_update

    override public function render( window:Window ) {
		snow_window_render( window.handle );
    } //window_render

    override public function swap( window:Window ) {
		snow_window_swap( window.handle );
    } //window_swap

    override public function simple_message( window:Window, message:String, ?title:String="" ) {
		snow_window_simple_message( window.handle, message, title );
    } //window_simple_message

    override public function set_size( window:Window, w:Int, h:Int ) {
    	snow_window_set_size( window.handle, w, h );
    } //window_set_size

    override public function set_position( window:Window, x:Int, y:Int ) {
    	snow_window_set_position( window.handle, x, y );
    } //window_set_position

    override public function set_title( window:Window, title:String ) {
    	snow_window_set_title( window.handle, title );
    } //window_set_title

    override public function set_max_size( window:Window, w:Int, h:Int ) {
    	snow_window_set_max_size( window.handle, w, h );
    } //window_set_max_size

    override public function set_min_size( window:Window, w:Int, h:Int ) {
    	snow_window_set_min_size( window.handle, w, h );
    } //window_set_min_size

    override public function fullscreen( window:Window, fullscreen:Bool ) {
    	snow_window_fullscreen( window.handle, fullscreen, ( lib.config.native.desktop_fullscreen ) ? 0 : 1 );
    } //window_fullscreen

    override public function bordered( window:Window, bordered:Bool ) {
    	snow_window_bordered( window.handle, bordered );
    } //window_bordered

    override public function grab( window:Window, grabbed:Bool ) {
        snow_window_grab( window.handle, grabbed );
    } //window_grab

    override public function set_cursor_position( window:Window, x:Int, y:Int ) {
        snow_window_set_cursor_position( window.handle, x, y );
    } //set_cursor_position


//General

        /** Lock the OS cursor to the foreground window. This hides the cursor and prevents it from leaving, reporting relative coordinates. */
    override function system_lock_cursor( enable:Bool ) {
        snow_system_lock_cursor( enable );
    } //system_lock_cursor

        /** Toggle the OS cursor. This is not window specific but system wide */
    override function system_enable_cursor( enable:Bool ) {
        snow_system_show_cursor( enable );
    } //system_enable_cursor

        /** Toggle vertical refresh. This is not window specific but context wide */
    override function system_enable_vsync( enable:Bool ) : Int {
        return snow_system_enable_vsync( enable );
    } //system_enable_vsync


//Desktop only functions


    override public function display_count() : Int {
        return snow_desktop_get_display_count();
    } //desktop_get_display_count

    override public function display_mode_count( display:Int ) : Int {
        return snow_desktop_get_display_mode_count( display );
    } //desktop_get_display_mode_count

    override public function display_native_mode( display:Int ) : DisplayMode {
        return snow_desktop_get_display_native_mode( display );
    } //desktop_get_display_native_mode

    override public function display_current_mode( display:Int ) : DisplayMode {
        return snow_desktop_get_display_current_mode( display );
    } //desktop_get_display_current_mode

    override public function display_mode( display:Int, mode_index:Int ) : DisplayMode {
        return snow_desktop_get_display_mode( display, mode_index );
    } //desktop_get_display_mode

    override public function display_bounds( display:Int ) : { x:Int, y:Int, width:Int, height:Int } {
        return snow_desktop_get_display_bounds( display );
    } //desktop_get_display_bounds

    override public function display_name( display:Int ) : String {
        return snow_desktop_get_display_name( display );
    } //desktop_get_display_name


//Native bindings


    static var snow_window_create                   = Snow.load( "snow", "snow_window_create", 2 );
    static var snow_window_close                    = Snow.load( "snow", "snow_window_close", 1 );
    static var snow_window_show                     = Snow.load( "snow", "snow_window_show", 1 );
    static var snow_window_destroy_window           = Snow.load( "snow", "snow_window_destroy_window", 1 );
    static var snow_window_update                   = Snow.load( "snow", "snow_window_update", 1 );
    static var snow_window_render                   = Snow.load( "snow", "snow_window_render", 1 );
    static var snow_window_swap                     = Snow.load( "snow", "snow_window_swap", 1 );
    static var snow_window_simple_message           = Snow.load( "snow", "snow_window_simple_message", 3 );
    static var snow_window_set_size                 = Snow.load( "snow", "snow_window_set_size", 3 );
    static var snow_window_set_position             = Snow.load( "snow", "snow_window_set_position", 3 );
    static var snow_window_set_title                = Snow.load( "snow", "snow_window_set_title", 2 );
    static var snow_window_set_max_size             = Snow.load( "snow", "snow_window_set_max_size", 3 );
    static var snow_window_set_min_size             = Snow.load( "snow", "snow_window_set_min_size", 3 );
    static var snow_window_fullscreen               = Snow.load( "snow", "snow_window_fullscreen", 3 );
    static var snow_window_bordered                 = Snow.load( "snow", "snow_window_bordered", 2 );
    static var snow_window_grab                     = Snow.load( "snow", "snow_window_grab", 2 );
    static var snow_window_set_cursor_position      = Snow.load( "snow", "snow_window_set_cursor_position", 3 );

//system helpers

    static var snow_system_show_cursor              = Snow.load("snow", "snow_system_show_cursor", 1);
    static var snow_system_lock_cursor              = Snow.load("snow", "snow_system_lock_cursor", 1);
    static var snow_system_enable_vsync             = Snow.load("snow", "snow_system_enable_vsync", 1);

//desktop only native bindings

    static var snow_desktop_get_display_count         = Snow.load("snow", "snow_desktop_get_display_count", 0);
    static var snow_desktop_get_display_mode_count    = Snow.load("snow", "snow_desktop_get_display_mode_count", 1);
    static var snow_desktop_get_display_native_mode   = Snow.load("snow", "snow_desktop_get_display_native_mode", 1);
    static var snow_desktop_get_display_current_mode  = Snow.load("snow", "snow_desktop_get_display_current_mode", 1);
    static var snow_desktop_get_display_mode          = Snow.load("snow", "snow_desktop_get_display_mode", 2);
    static var snow_desktop_get_display_bounds        = Snow.load("snow", "snow_desktop_get_display_bounds", 1);
    static var snow_desktop_get_display_name          = Snow.load("snow", "snow_desktop_get_display_name", 1);

} //WindowSystemNative




