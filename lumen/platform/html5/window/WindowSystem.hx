package lumen.platform.html5.window;

import lumen.Lumen;
import lumen.types.Types;
import lumen.window.Window;
import lumen.window.Windowing;
import lumen.window.WindowSystem;

#if lumen_html5

        //Internal class handled by Windowing, a less concrete implementation of the window system
    @:noCompletion class WindowSystem extends WindowSystemBinding {

        var gl_context : js.html.webgl.RenderingContext;

        public function new( _manager:Windowing, _lib:Lumen ) {

            manager = _manager;
            lib = _lib;

        } //new

        override public function init() {
        } //init

        override public function update() {
        } //update

        override public function destroy() {
        } //destroy

        override public function window_create( config:WindowConfig, on_created: WindowHandle->Int->WindowConfig->Void ) {

            var _handle : js.html.CanvasElement = js.Browser.document.createCanvasElement();

                    //assign the sizes
                _handle.width = config.width;
                _handle.height = config.height;

                    //add it to the document
                js.Browser.document.body.appendChild(_handle);

                //:todo: These options, plus this context is singular atm, need to enforce or clarify this somehow
            gl_context = _handle.getContextWebGL({ alpha:false, premultipliedAlpha:false });

            if(gl_context == null) {
                throw "WebGL is required to run this!";
            }

                //assign the context so GL can work
            lumen.render.gl.GL.lumenContext = gl_context;

                //get the real canvas position and give it to the config
            var _window_pos = get_real_window_position( _handle );

                config.x = _window_pos.x;
                config.y = _window_pos.y;

                //tell them and give the handle for later.
                //:todo: work out window id's for multiple canvases
            on_created(_handle, 1, config);

        } //window_create

        override public function window_close( handle:WindowHandle ) {

            js.Browser.document.body.removeChild(handle);

        } //window_close

        override public function window_update( handle:WindowHandle ) {

        } //window_update

        override public function window_render( handle:WindowHandle ) {

        } //window_render

        override public function window_swap( handle:WindowHandle ) {

        } //window_swap

        override public function window_simple_message( handle:WindowHandle, message:String, ?title:String="" ) {

            js.Browser.window.alert( message );

        } //window_simple_message

        override public function window_set_size( handle:WindowHandle, w:Int, h:Int ) {}
        override public function window_set_position( handle:WindowHandle, x:Int, y:Int ) {}

        public function get_real_window_position( handle:WindowHandle ) : WindowPosition {

            // see the following link for this implementation
            // http://www.quirksmode.org/js/findpos.html

            var curleft = 0;
            var curtop = 0;

                //start at the canvas
            var _obj : js.html.Element = cast handle;
            var _has_parent : Bool = true;
            var _max_count = 0;

            while(_has_parent == true) {

                _max_count++;

                if(_max_count > 100) {
                    _has_parent = false;
                    break;
                } //prevent rogue endless loops

                if(_obj.offsetParent != null) {

                        //it still has an offset parent, add it up
                    curleft += _obj.offsetLeft;
                    curtop += _obj.offsetTop;

                        //then move onto the parent
                    _obj = _obj.offsetParent;

                } else {
                        //we are done
                    _has_parent = false;

                }
            } //while

            return { x:curleft, y:curtop };

        } //get_real_window_position

        override public function window_set_title( handle:WindowHandle, title:String ) {

            js.Browser.document.title = title;

        } //window_set_title

            //:todo:
        override public function window_set_max_size( handle:WindowHandle, w:Int, h:Int ) {

        } //window_set_max_size

            //:todo:
        override public function window_set_min_size( handle:WindowHandle, w:Int, h:Int ) {

        } //window_set_min_size

            //:todo:
        override public function window_grab( handle:WindowHandle, grabbed:Bool ) {

        } //window_grab

            //:todo:
        override public function window_fullscreen( handle:WindowHandle, fullscreen:Bool, fullscreen_desktop_mode:Int = 1 ) {

        } //window_fullscreen

            //:todo:
        override public function window_bordered( handle:WindowHandle, bordered:Bool ) {

        } //window_bordered

            //:todo:
        override public function display_count() : Int {
            return 1;
        } //display_count

            //:todo:
        override public function display_mode_count( display:Int ) : Int {
            return 1;
        } //display_mode_count

            //:todo:
        override public function display_native_mode( display:Int ) : DisplayMode {
            return {
                format : 0,
                refresh_rate : 0,
                width : 0,
                height : 0
            };
        } //display_native_mode

            //:todo:
        override public function display_current_mode( display:Int ) : DisplayMode {
            return {
                format : 0,
                refresh_rate : 0,
                width : 0,
                height : 0
            };
        } //display_current_mode

            //:todo:
        override public function display_mode( display:Int, mode_index:Int ) : DisplayMode {
            return {
                format : 0,
                refresh_rate : 0,
                width : 0,
                height : 0
            };
        } //display_mode

            //:todo:
        override public function display_bounds( display:Int ) : { x:Int, y:Int, width:Int, height:Int } {
            return { x:0, y:0, width:0, height:0 };
        } //display_bounds

            //:todo:
        override public function display_name( display:Int ) : String {
            return 'Browser';
        } //display_name

            /** Called to set up any listeners on the given window  */
        override public function listen( window:Window ) {

            window.handle.addEventListener('mouseleave', on_internal_leave);
            window.handle.addEventListener('mouseenter', on_internal_enter);

        } //listen

            /** Called to remove any listeners on the given window  */
        override public function unlisten( window:Window ) {

            window.handle.removeEventListener('mouseleave', on_internal_leave);
            window.handle.removeEventListener('mouseenter', on_internal_enter);

        } //unlisten


        function on_internal_leave( _mouse_event:js.html.MouseEvent ) {

            // var _window : Window = lib.window.from_handle(_mouse_event)

                //tell the window manager a window was left
            var api_event : WindowEvent = {
                type : WindowEventType.window_leave,
                timestamp : _mouse_event.timeStamp,
                window_id : 1,//_window.id,
                event : _mouse_event
            };

            lib.dispatch_system_event({
                type : SystemEventType.window,
                window : api_event
            });

        } //on_internal_leave

        function on_internal_enter( _mouse_event:js.html.MouseEvent ) {

            // var _window : Window = lib.window.from_handle()

                //tell the system a window was entered
            var api_event : WindowEvent = {
                type : WindowEventType.window_enter,
                timestamp : _mouse_event.timeStamp,
                window_id : 1,//_window.id,
                event : _mouse_event
            };

            lib.dispatch_system_event({
                type : SystemEventType.window,
                window : api_event
            });

        } //on_internal_enter

    } //WindowSystemHTML5

#end //lumen_html5
