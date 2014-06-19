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

                    //make sure it displays nicely
                _handle.style.display = 'block';
                _handle.style.position = 'relative';
                _handle.style.margin = '2em auto 0 auto';
                _handle.style.background = '#000';

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
            var _id = 1;
            on_created(_handle, _id, config);
                    //todo: hardcoded window id
            _handle.setAttribute('id', 'window${_id}');

        } //window_create

        override public function window_close( handle:WindowHandle ) {

            js.Browser.document.body.removeChild(handle);

        } //window_close

        override public function window_update( handle:WindowHandle ) {

            var _rect = handle.getBoundingClientRect();
            var _window : Window = lib.windowing.window_from_handle(handle);

            if(_window != null) {
                if(_rect.left != _window.x || _rect.top != _window.y) {
                    lib.dispatch_system_event({
                        type : SystemEventType.window,
                        window : {
                            type : WindowEventType.window_moved,
                            timestamp : lib.time,
                            window_id : 1,//_window.id,
                            event : { x:_rect.left, y:_rect.top }
                        }
                    });
                }else if(_rect.width != _window.width || _rect.height != _window.height) {

                    lib.dispatch_system_event({
                        type : SystemEventType.window,
                        window : {
                            type : WindowEventType.window_size_changed,
                            timestamp : lib.time,
                            window_id : 1,//_window.id,
                            event : { x:_rect.width, y:_rect.height }
                        }
                    });

                }
            }

            _rect = null;

        } //window_update

        override public function window_render( handle:WindowHandle ) {

        } //window_render

        override public function window_swap( handle:WindowHandle ) {

            //empty because this concept is not possible in browser

        } //window_swap

        override public function window_simple_message( handle:WindowHandle, message:String, ?title:String="" ) {

            js.Browser.window.alert( message );

        } //window_simple_message

        override public function window_set_size( handle:WindowHandle, w:Int, h:Int ) {

            handle.style.width = '${w}px';
            handle.style.height = '${h}px';

        } //window_set_size

        override public function window_set_position( handle:WindowHandle, x:Int, y:Int ) {

            handle.style.left = '${x}px';
            handle.style.top = '${y}px';

        } //window_set_position

        public function get_real_window_position( handle:WindowHandle ) : { x:Int, y:Int } {

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

        override public function window_set_max_size( handle:WindowHandle, w:Int, h:Int ) {

            handle.style.maxWidth = '${w}px';
            handle.style.maxHeight = '${h}px';

        } //window_set_max_size

        override public function window_set_min_size( handle:WindowHandle, w:Int, h:Int ) {

            handle.style.minWidth = '${w}px';
            handle.style.minHeight = '${h}px';

        } //window_set_min_size

            //:todo:
        override public function window_grab( handle:WindowHandle, grabbed:Bool ) {

        } //window_grab

        var _pre_fs_padding : String = '0';
        var _pre_fs_margin : String = '0';
        var _pre_fs_s_width : String = '';
        var _pre_fs_s_height : String = '';
        var _pre_fs_width : Int = 0;
        var _pre_fs_height : Int = 0;

        override public function window_fullscreen( handle:WindowHandle, fullscreen:Bool, fullscreen_desktop_mode:Int = 1 ) {

                //as always browser support for newer features will be
                //sporadic. Tested fullscreen against firefox/chrome/opera/safari latest
                //all appear to work as expected, but have no cancel (user must press escape)
            if(fullscreen) {

                if(fullscreen_desktop_mode == 1) {

                        //official api's first
                    if(handle.requestFullscreen == null) {
                        if(handle.requestFullScreen == null) {
                            if(untyped handle.webkitRequestFullscreen == null) {
                                if(untyped handle.mozRequestFullScreen == null) {

                                } else { untyped handle.mozRequestFullScreen(); }
                            } else { untyped handle.webkitRequestFullscreen(); }
                        } else { handle.requestFullScreen(0); }
                    } else { handle.requestFullscreen(); }

                } else {

                    _pre_fs_padding = handle.style.padding;
                    _pre_fs_margin = handle.style.margin;
                    _pre_fs_s_width = handle.style.width;
                    _pre_fs_s_height = handle.style.height;
                    _pre_fs_width = handle.width;
                    _pre_fs_height = handle.height;

                    handle.style.margin = '0';
                    handle.style.padding = '0';
                    handle.style.width = js.Browser.window.innerWidth + 'px';
                    handle.style.height = js.Browser.window.innerHeight + 'px';
                    handle.width = js.Browser.window.innerWidth;
                    handle.height = js.Browser.window.innerHeight;
                }

            } else {

                if(fullscreen_desktop_mode == 1) {
                    //currently no cancel full screen in fullscreen mode
                } else {

                    handle.style.padding = _pre_fs_padding;
                    handle.style.margin = _pre_fs_margin;
                    handle.style.width = _pre_fs_s_width;
                    handle.style.height = _pre_fs_s_height;
                    handle.width = _pre_fs_width;
                    handle.height = _pre_fs_height;

                }

            }

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

                //tell the system
            lib.dispatch_system_event({
                type : SystemEventType.window,
                window : {
                    type : WindowEventType.window_leave,
                    timestamp : _mouse_event.timeStamp,
                    window_id : 1,//_window.id,
                    event : _mouse_event
                }
            });

        } //on_internal_leave

        function on_internal_enter( _mouse_event:js.html.MouseEvent ) {

            // var _window : Window = lib.window.from_handle()

                //tell the system
            lib.dispatch_system_event({
                type : SystemEventType.window,
                window : {
                    type : WindowEventType.window_enter,
                    timestamp : _mouse_event.timeStamp,
                    window_id : 1,//_window.id,
                    event : _mouse_event
                }
            });

        } //on_internal_enter

    } //WindowSystemHTML5

#end //lumen_html5
