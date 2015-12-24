package snow.core.web;

import snow.types.Types;
import snow.api.Debug.*;

@:allow(snow.Snow)
class Runtime implements snow.runtime.Runtime {

    public var app:snow.Snow;
    public var window : WindowHandle;
    public var name: String = 'web';

        /** internal start time for 0 based time values */
    static var timestamp_start : Float = 0.0;
        /** internal: a pre allocated window event */
    var _window_event_ : WindowEvent;

    function new(_app:snow.Snow) {

        app = _app;
        app.platform = Platform.platform_web;
        app.os = guess_os();

        timestamp_start = timestamp();

        app.config.runtime = {
            no_context_menu : true,
            true_fullscreen : false,
            prevent_default_mouse_wheel : true,
            prevent_default_keys : [
                Key.left, Key.right, Key.up, Key.down,
                Key.backspace, Key.tab, Key.delete, Key.space
            ]
        };

        _window_event_ = new WindowEvent();

        log('web / init ok');

    } //new

//Public API

    public inline function window_device_pixel_ratio() {

        return js.Browser.window.devicePixelRatio == null ? 1.0 : js.Browser.window.devicePixelRatio;

    } //window_device_pixel_ratio

    public inline function window_width() : Int {

        return window.width;

    } //window_width

    public inline function window_height() : Int {

        return window.height;

    } //window_height

    public function window_grab(enable:Bool) : Bool {

        log('runtime / web / window_grab');

        return false;

    } //window_grab

    public function window_fullscreen(enable:Bool, ?true_fullscreen:Bool=false) : Bool {

        log('runtime / web / window_fullscreen');

        return false;

    } //window_fullscreen

//Public static API

    inline public static function timestamp() : Float {

        return (js.Browser.window.performance.now()/1000.0) - timestamp_start;

    }

//Internal runtime API

    function shutdown(?_immediate:Bool=false) {

        log('runtime / web / shutdown');

    } //shutdown

    function run() : Bool {

        log('web / run');

        request_frame();

        return false;

    } //run

    function ready() {

        log('web / ready');

        create_window();

    } //ready

//internal
    
    inline function dispatch_window_ev(_type:WindowEventType) {
        _window_event_.set(_type, timestamp(), 0, null, null);
        app.dispatch_event(se_window, _window_event_);
    }

    function setup_window_events() {

        window.addEventListener('mouseleave', function(ev:js.html.MouseEvent) {
            dispatch_window_ev(leave);
        });

        window.addEventListener('mouseenter', function(ev:js.html.MouseEvent) {
           dispatch_window_ev(enter);
        });

        js.Browser.document.addEventListener('visibilitychange', function(ev){
            if(js.Browser.document.hidden) {
                dispatch_window_ev(hidden);                
                dispatch_window_ev(minimized);                
                dispatch_window_ev(focus_lost);
            } else {
                dispatch_window_ev(shown);
                dispatch_window_ev(restored);
                dispatch_window_ev(focus_gained);
            }
        });

    } //setup_window_events
    
    function create_window() {

        var config = app.config.window;
        var _dpr = window_device_pixel_ratio();

        window = js.Browser.document.createCanvasElement();

            //For High DPI, we scale the config sizes
        window.width = Math.floor(config.width * _dpr);
        window.height = Math.floor(config.height * _dpr);
            //But keep them for the css pixels
        window.style.width = config.width+'px';
        window.style.height = config.height+'px';
            //This is typically required for our WebGL and blending
        window.style.background = '#000';

        if(config.title != null && config.title != '') {
            js.Browser.document.title = config.title;
        }

        var _parent = app.config.runtime.window_parent;
        if(_parent == null) {
            _parent = js.Browser.document.body;
        }

        _parent.appendChild(window);

        if(!create_render_context(window)) {
            create_render_context_failed();
            return;
        }

        setup_window_events();

    } //create_window

    function create_render_context(_window:WindowHandle) : Bool {

        var config = app.config.render;
        var attr : js.html.webgl.ContextAttributes = config.webgl;

        attr = apply_GL_attr(config, attr);

        var _gl = null;
        
        if(config.webgl.version != 1) {
            _gl = window.getContext('webgl${config.webgl.version}');
            if(_gl == null) _gl = window.getContext('experimental-webgl${config.webgl.version}');
        } else {
            _gl = window.getContextWebGL(attr);
        }

        snow.modules.opengl.GL.gl = _gl;

        log('web / GL / context($_gl)');

        return _gl != null;

    } //create_render_context

    function apply_GL_attr(render:RenderConfig, attr:js.html.webgl.ContextAttributes) {

        attr.alpha = def(attr.alpha, false);
        attr.premultipliedAlpha = def(attr.premultipliedAlpha, false);
        attr.antialias = def(attr.antialias, app.config.render.antialiasing > 0);
        attr.depth = def(attr.depth, app.config.render.depth > 0);
        attr.stencil = def(attr.stencil, app.config.render.stencil > 0);

        return attr;

    } //apply_GL_attr

    function create_render_context_failed() {

        var msg =  'WebGL is required to run this!<br/><br/>';
            msg += 'visit <a style="color:#06b4fb; text-decoration:none;" href="http://get.webgl.org/">get.webgl.com</a> for info<br/>';
            msg += 'and contact the developer of this app';

        var text_el : js.html.Element;
        var overlay_el : js.html.Element;

        text_el = js.Browser.document.createDivElement();
        overlay_el = js.Browser.document.createDivElement();

        text_el.style.marginLeft = 'auto';
        text_el.style.marginRight = 'auto';
        text_el.style.color = '#d3d3d3';
        text_el.style.marginTop = '5em';
        text_el.style.fontSize = '1.4em';
        text_el.style.fontFamily = 'helvetica,sans-serif';
        text_el.innerHTML = msg;

        overlay_el.style.top = '0';
        overlay_el.style.left = '0';
        overlay_el.style.width = '100%';
        overlay_el.style.height = '100%';
        overlay_el.style.display = 'block';
        overlay_el.style.minWidth = '100%';
        overlay_el.style.minHeight = '100%';
        overlay_el.style.textAlign = 'center';
        overlay_el.style.position = 'absolute';
        overlay_el.style.background = 'rgba(1,1,1,0.90)';

        overlay_el.appendChild(text_el);
        js.Browser.document.body.appendChild(overlay_el);

        throw Error.error('runtime / web / failed to create render context, unable to recover');

    } //failed_render_context

    inline function request_frame() {

        js.Browser.window.requestAnimationFrame(loop);

    } //request_frame

    function loop(?_t:Float = 0.016) : Bool {

        app.dispatch_event(se_tick);

        if(!app.shutting_down) {
            request_frame();
        }

        return true;

    } //loop

    function guess_os() {

        var _ver = js.Browser.navigator.appVersion;
        var _agent = js.Browser.navigator.userAgent;

        inline function has(_val:String, _test:String) {
            var r = new EReg(_val,'gi');
            return r.match(_test);
        }

        if(has('mac', _ver))        return OS.os_mac;
        if(has('win', _ver))        return OS.os_windows;
            //I know it's not linux technically (should be unix)
        if(has('x11', _ver))        return OS.os_linux;
        if(has('linux', _ver))      return OS.os_linux;
        if(has('android', _ver))    return OS.os_android;
        if(has('ipad', _agent))     return OS.os_ios;
        if(has('iphone', _agent))   return OS.os_ios;
        if(has('ipod', _agent))     return OS.os_ios;

        return OS.os_unknown;

    } //guess_os

}


typedef WindowHandle = js.html.CanvasElement;
typedef RuntimeConfig = {

        /** The js element to put the window canvas into. If null, <body> is used */
    @:optional var window_parent : js.html.Element;

        /** If true, right clicking will consume the event on the canvas. `event.preventDefault` is used. default: true*/
    @:optional var no_context_menu : Bool;

        /** Any Key.* values stored in this array sent to the page will be consumed by snow. `event.preventDefault` is used.
            Keys can be removed or added to the array at runtime. default:left,up,down,right,backspace,tab,delete */
    @:optional var prevent_default_keys : Array<Int>;
        /** If true, mouse wheel events sent to the page will be consumed by snow. `event.preventDefault` is used. default: true*/
    @:optional var prevent_default_mouse_wheel : Bool;

        /** If true, native fullscreen will be requested from the user.
            If not, the canvas will fill the window size instead.
            Take note : true fullscreen requests only work when driven by a user event (click/keys).
            You cannot force fullscreen on web. default: false */
    @:optional var true_fullscreen : Bool;

} //RuntimeConfig
