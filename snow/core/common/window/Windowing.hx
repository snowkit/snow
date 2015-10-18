package snow.core.common.window;


import snow.Snow;
import snow.types.Types;
import snow.system.window.Window;
import snow.system.window.Windowing;
import snow.api.Debug.*;


@:allow(snow.system.window.Windowing)
class Windowing implements snow.modules.interfaces.Windowing {

    var app: snow.Snow;

    function new(_app:snow.Snow) app = _app;
    function onevent(event:SystemEvent) {}
    function shutdown() {}

    function listen(window:Window) {

        log('listen in core module does nothing');

    } //listen

    function unlisten( window:Window ) {

        log('unlisten in core module does nothing');

    } //unlisten

    public inline function create(render_config:RenderConfig, config:WindowConfig, on_created: WindowHandle->Int->WindowingConfig->Void) {

    	log('create in core module does nothing');

    } //window_create

    public inline function close(window:Window) {

        log('close in core module does nothing');

    } //close

    public inline function show(window:Window) {

        log('show in core module does nothing');

    } //show

    public inline function destroy_window(window:Window) {

		log('destroy_window in core module does nothing');

    } //destroy_window

    public inline function update_window(window:Window) {

		log('update_window in core module does nothing');

    } //update_window

    public inline function render(window:Window) {

		log('render in core module does nothing');

    } //render

    public inline function swap(window:Window) {

		log('swap in core module does nothing');

    } //swap

    public inline function simple_message(window:Window, message:String, ?title:String="") {

		log('simple_message in core module does nothing');

    } //window_simple_message

    public inline function set_size(window:Window, w:Int, h:Int) {

    	log('set_size in core module does nothing');

    } //window_set_size

    public inline function set_position(window:Window, x:Int, y:Int) {

    	log('set_position in core module does nothing');

    } //window_set_position

    public inline function set_title(window:Window, title:String) {

    	log('set_title in core module does nothing');

    } //window_set_title

    public inline function set_max_size(window:Window, w:Int, h:Int) {

    	log('set_max_size in core module does nothing');

    } //window_set_max_size

    public inline function set_min_size(window:Window, w:Int, h:Int) {

    	log('set_min_size in core module does nothing');

    } //window_set_min_size

    public inline function fullscreen(window:Window, fullscreen:Bool) {

    	log('fullscreen in core module does nothing');

    } //window_fullscreen

    public inline function bordered(window:Window, bordered:Bool) {

    	log('bordered in core module does nothing');

    } //window_bordered

    public inline function grab(window:Window, grabbed:Bool) {

        log('grab in core module does nothing');

    } //window_grab

    public inline function set_cursor_position(window:Window, x:Int, y:Int) {

        log('set_cursor_position in core module does nothing');

    } //set_cursor_position

    public inline function system_lock_cursor(enable:Bool) {

        log('system_lock_cursor in core module does nothing');

    } //system_lock_cursor

    public inline function system_enable_cursor(enable:Bool) {

        log('system_enable_cursor in core module does nothing');

    } //system_enable_cursor

    public inline function system_enable_vsync(enable:Bool) : Int {

        log('system_enable_vsync in core module does nothing');
        return -1;

    } //system_enable_vsync

} //Windowing
