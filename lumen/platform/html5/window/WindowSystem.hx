package lumen.platform.html5.window;

import lumen.Lumen;
import lumen.types.Types;
import lumen.window.Window;
import lumen.window.Windowing;
import lumen.window.WindowSystem;

#if lumen_html5

        //Internal class handled by Windowing, a less concrete implementation of the window system
    @:noCompletion class WindowSystem extends WindowSystemBinding {

        public var gl_contexts : Map<Int, js.html.webgl.RenderingContext>;
        var seq_window : Int = 1;

        public function new( _manager:Windowing, _lib:Lumen ) {

            manager = _manager;
            lib = _lib;
            gl_contexts = new Map();

        } //new

        override public function init() {
        } //init

        override public function process() {
        } //process

        override public function destroy() {
        } //destroy

        override public function create( config:WindowConfig, on_created: WindowHandle->Int->WindowConfig->Void ) {

            var _window_id = seq_window;
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
            var _gl_context = _handle.getContextWebGL({ alpha:false, premultipliedAlpha:false });
                //early out on no possible context
            if(_gl_context == null) {
                throw "WebGL is required to run this!";
            }

                //make sure there is one early
            if(lumen.render.opengl.GL.current_context == null) {
                lumen.render.opengl.GL.current_context = _gl_context;
            }

                //store it for activating later
            gl_contexts.set(_window_id, _gl_context);

                //get the real canvas position and give it to the config
            var _window_pos = get_real_window_position( _handle );

                config.x = _window_pos.x;
                config.y = _window_pos.y;

                //tell them and give the handle for later.
            on_created(_handle, _window_id, config);
            _handle.setAttribute('id', 'window${_window_id}');

            seq_window++;

        } //window_create

        override public function close( _window:Window ) {

            js.Browser.document.body.removeChild( _window.handle );

        } //window_close

        override public function update( _window:Window ) {

            var _rect = _window.handle.getBoundingClientRect();

                if(_rect.left != _window.x || _rect.top != _window.y) {
                    lib.dispatch_system_event({
                        type : SystemEventType.window,
                        window : {
                            type : WindowEventType.window_moved,
                            timestamp : lib.time,
                            window_id : _window.id,
                            event : { x:_rect.left, y:_rect.top }
                        }
                    });
                }else if(_rect.width != _window.width || _rect.height != _window.height) {

                    lib.dispatch_system_event({
                        type : SystemEventType.window,
                        window : {
                            type : WindowEventType.window_size_changed,
                            timestamp : lib.time,
                            window_id : _window.id,
                            event : { x:_rect.width, y:_rect.height }
                        }
                    });

                    // _window.handle.width = _rect.width;
                    // _window.handle.height = _rect.height;

                }

            _rect = null;

        } //window_update

        override public function render( _window:Window ) {

            var _window_gl_context = gl_contexts.get(_window.id);
            if(lumen.render.opengl.GL.current_context != _window_gl_context) {
                lumen.render.opengl.GL.current_context = _window_gl_context;
            }

        } //window_render

        override public function swap( _window:Window ) {

            //empty because this concept is not possible in browser

        } //window_swap

        override public function simple_message( _window:Window, message:String, ?title:String="" ) {

            js.Browser.window.alert( message );

        } //window_simple_message

        override public function set_size( _window:Window, w:Int, h:Int ) {

            _window.handle.style.width = '${w}px';
            _window.handle.style.height = '${h}px';

        } //window_set_size

        override public function set_position( _window:Window, x:Int, y:Int ) {

            _window.handle.style.left = '${x}px';
            _window.handle.style.top = '${y}px';

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

        override public function set_title( _window:Window, title:String ) {

            js.Browser.document.title = title;

        } //window_set_title

        override public function set_max_size( _window:Window, w:Int, h:Int ) {

            _window.handle.style.maxWidth = '${w}px';
            _window.handle.style.maxHeight = '${h}px';

        } //window_set_max_size

        override public function set_min_size( _window:Window, w:Int, h:Int ) {

            _window.handle.style.minWidth = '${w}px';
            _window.handle.style.minHeight = '${h}px';

        } //window_set_min_size

            //:todo:
        override public function grab( _window:Window, grabbed:Bool ) {

            if(grabbed) {
                    //official api's first
                if(_window.handle.requestPointerLock == null) {
                        if(untyped _window.handle.webkitRequestPointerLock == null) {
                            if(untyped _window.handle.mozRequestPointerLock == null) {

                            } else { untyped _window.handle.mozRequestPointerLock(); }
                        } else { untyped _window.handle.webkitRequestPointerLock(); }
                } else { _window.handle.requestPointerLock(); }

            } else {

                //pointer lock cancel api not yet in browsers,
                //user must press escape

            }

        } //window_grab

        var _pre_fs_padding : String = '0';
        var _pre_fs_margin : String = '0';
        var _pre_fs_s_width : String = '';
        var _pre_fs_s_height : String = '';
        var _pre_fs_width : Int = 0;
        var _pre_fs_height : Int = 0;

        override public function fullscreen( _window:Window, fullscreen:Bool, windowed_fullscreen:Bool = true ) {

                //as always browser support for newer features will be
                //sporadic. Tested fullscreen against firefox/chrome/opera/safari latest
                //all appear to work as expected, but have no cancel (user must press escape)
            if(fullscreen) {

                if(!windowed_fullscreen) {

                        //official api's first
                    if(_window.handle.requestFullscreen == null) {
                        if(_window.handle.requestFullScreen == null) {
                            if(untyped _window.handle.webkitRequestFullscreen == null) {
                                if(untyped _window.handle.mozRequestFullScreen == null) {

                                } else { untyped _window.handle.mozRequestFullScreen(); }
                            } else { untyped _window.handle.webkitRequestFullscreen(); }
                        } else { _window.handle.requestFullScreen(0); }
                    } else { _window.handle.requestFullscreen(); }

                } else {

                    _pre_fs_padding = _window.handle.style.padding;
                    _pre_fs_margin = _window.handle.style.margin;
                    _pre_fs_s_width = _window.handle.style.width;
                    _pre_fs_s_height = _window.handle.style.height;
                    _pre_fs_width = _window.handle.width;
                    _pre_fs_height = _window.handle.height;

                    _window.handle.style.margin = '0';
                    _window.handle.style.padding = '0';
                    _window.handle.style.width = js.Browser.window.innerWidth + 'px';
                    _window.handle.style.height = js.Browser.window.innerHeight + 'px';
                    _window.handle.width = js.Browser.window.innerWidth;
                    _window.handle.height = js.Browser.window.innerHeight;
                }

            } else {

                if(!windowed_fullscreen) {
                    //currently no cancel full screen in fullscreen mode
                } else {

                    _window.handle.style.padding = _pre_fs_padding;
                    _window.handle.style.margin = _pre_fs_margin;
                    _window.handle.style.width = _pre_fs_s_width;
                    _window.handle.style.height = _pre_fs_s_height;
                    _window.handle.width = _pre_fs_width;
                    _window.handle.height = _pre_fs_height;

                }

            }

        } //window_fullscreen

        override public function bordered( _window:Window, bordered:Bool ) {

            //empty, window border has no such concept on browser

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
        override public function listen( _window:Window ) {

            _window.handle.addEventListener('mouseleave', on_internal_leave);
            _window.handle.addEventListener('mouseenter', on_internal_enter);

        } //listen

            /** Called to remove any listeners on the given window  */
        override public function unlisten( _window:Window ) {

            _window.handle.removeEventListener('mouseleave', on_internal_leave);
            _window.handle.removeEventListener('mouseenter', on_internal_enter);

        } //unlisten


        function on_internal_leave( _mouse_event:js.html.MouseEvent ) {

            var _window : Window = lib.windowing.window_from_handle(cast _mouse_event.target);

                //tell the system
            lib.dispatch_system_event({
                type : SystemEventType.window,
                window : {
                    type : WindowEventType.window_leave,
                    timestamp : _mouse_event.timeStamp,
                    window_id : _window.id,
                    event : _mouse_event
                }
            });

        } //on_internal_leave

        function on_internal_enter( _mouse_event:js.html.MouseEvent ) {

            var _window : Window = lib.windowing.window_from_handle(cast _mouse_event.target);

                //tell the system
            lib.dispatch_system_event({
                type : SystemEventType.window,
                window : {
                    type : WindowEventType.window_enter,
                    timestamp : _mouse_event.timeStamp,
                    window_id : _window.id,
                    event : _mouse_event
                }
            });

        } //on_internal_enter

    } //WindowSystemHTML5

#end //lumen_html5
