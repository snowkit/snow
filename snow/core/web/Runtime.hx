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
        /** The window id to use for events */
    var web_window_id = 1;
        /** The window x position, this is set by update_window_pos only */
    var window_x : Int = 0;
        /** The window y position, this is set by update_window_pos only */
    var window_y : Int = 0;

    function new(_app:snow.Snow) {

        app = _app;
        app.platform = Platform.platform_web;
        app.os = guess_os();

        timestamp_start = timestamp();

        app.config.runtime = {
            window_id : 'app',
            window_parent : js.Browser.document.body,
            prevent_default_context_menu : true,
            prevent_default_mouse_wheel : true,
            prevent_default_touches : true,
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
        _window_event_.set(_type, timestamp(), web_window_id, null, null);
        app.dispatch_event(se_window, _window_event_);
    }

    function setup_events() {

        //window events

            window.addEventListener('mouseleave', function(_ev:js.html.MouseEvent) {

                dispatch_window_ev(leave);

            }); //mouseleave

            window.addEventListener('mouseenter', function(_ev:js.html.MouseEvent) {

               dispatch_window_ev(enter);

            }); //mouseenter

            js.Browser.document.addEventListener('visibilitychange', function(_) {

                if(js.Browser.document.hidden) {
                    dispatch_window_ev(hidden);
                    dispatch_window_ev(minimized);
                    dispatch_window_ev(focus_lost);
                } else {
                    dispatch_window_ev(shown);
                    dispatch_window_ev(restored);
                    dispatch_window_ev(focus_gained);
                }

            }); //visibilitychange

        //key events

            inline function prevent_defaults(_keycode:Int, _ev:js.html.KeyboardEvent) {
                if(app.config.runtime.prevent_default_keys.indexOf(_keycode) != -1) {
                    _ev.preventDefault();
                }
            }

            js.Browser.document.addEventListener('keydown', function(_ev:js.html.KeyboardEvent) {

                var _keycode = convert_keycode(_ev.keyCode);
                var _scancode = Key.to_scan(_keycode);
                var _mod_state = mod_state_from_event(_ev);

                prevent_defaults(_keycode, _ev);

                app.input.dispatch_key_down_event(
                    _keycode,
                    _scancode,
                    _ev.repeat,
                    _mod_state,
                    timestamp(),
                    web_window_id
                );

            }); //keydown

            js.Browser.document.addEventListener('keyup', function(_ev:js.html.KeyboardEvent) {

                var _keycode = convert_keycode(_ev.keyCode);
                var _scancode = Key.to_scan(_keycode);
                var _mod_state = mod_state_from_event(_ev);

                prevent_defaults(_keycode, _ev);

                app.input.dispatch_key_up_event(
                    _keycode,
                    _scancode,
                    _ev.repeat,
                    _mod_state,
                    timestamp(),
                    web_window_id
                );

            }); //keyup

                //a list of keycodes that should not generate text
                //based typing events, because... browsers.
            var _ignored = [Key.backspace, Key.enter];
            js.Browser.document.addEventListener('keypress', function(_ev:js.html.KeyboardEvent) {

                if(_ev.which != 0 && _ignored.indexOf(_ev.keyCode) == -1) {

                    var _text = String.fromCharCode(_ev.charCode);

                    app.input.dispatch_text_event(
                        _text, 0, _text.length,
                        TextEventType.input,
                        timestamp(),
                        web_window_id
                    );

                }

            }); //keypress

        //mouse events

            window.addEventListener('contextmenu', function(_ev:js.html.MouseEvent){

                if(app.config.runtime.prevent_default_context_menu) {
                    _ev.preventDefault();
                }

            }); //contextmenu

            inline function translate_mouse_x(_dpr:Float, _ev:js.html.MouseEvent) {
                return Math.floor(_dpr * (_ev.pageX - window_x));
            }

            inline function translate_mouse_y(_dpr:Float, _ev:js.html.MouseEvent) {
                return Math.floor(_dpr * (_ev.pageY - window_y));
            }

            window.addEventListener('mousedown', function(_ev:js.html.MouseEvent) {

                var _dpr = window_device_pixel_ratio();
                update_window_pos();

                app.input.dispatch_mouse_down_event(
                    translate_mouse_x(_dpr, _ev),
                    translate_mouse_y(_dpr, _ev),
                    _ev.button + 1, //:parity: native buttons are 1 based
                    timestamp(),
                    web_window_id
                );

            }); //mousedown

            window.addEventListener('mouseup', function(_ev:js.html.MouseEvent){

                var _dpr = window_device_pixel_ratio();
                update_window_pos();

                app.input.dispatch_mouse_up_event(
                    translate_mouse_x(_dpr, _ev),
                    translate_mouse_y(_dpr, _ev),
                    _ev.button + 1, //:parity: native buttons are 1 based
                    timestamp(),
                    web_window_id
                );

            }); //mouseup

            window.addEventListener('mousemove', function(_ev:js.html.MouseEvent){

                var _dpr = window_device_pixel_ratio();
                update_window_pos();

                var _movement_x = _ev.movementX == null ? 0 : _ev.movementX;
                var _movement_y = _ev.movementY == null ? 0 : _ev.movementY;
                    _movement_x = Math.floor(_movement_x * _dpr);
                    _movement_y = Math.floor(_movement_y * _dpr);

                app.input.dispatch_mouse_move_event(
                    translate_mouse_x(_dpr, _ev),
                    translate_mouse_y(_dpr, _ev),
                    _movement_x,
                    _movement_y,
                    timestamp(),
                    web_window_id
                );

            }); //mousemove

            window.addEventListener('wheel', function(_ev:js.html.WheelEvent) {

                if(app.config.runtime.prevent_default_mouse_wheel) {
                    _ev.preventDefault();
                }

                app.input.dispatch_mouse_wheel_event(
                    _ev.deltaX,
                    _ev.deltaY,
                    timestamp(),
                    web_window_id
                );

            });

        //touch events

            window.addEventListener('touchstart', function(_ev:js.html.TouchEvent) {

                if(app.config.runtime.prevent_default_touches) {
                    _ev.preventDefault();
                }

                    //:todo:web:touch: test with update_window_pos values
                var _bound = window.getBoundingClientRect();
                for(touch in _ev.changedTouches) {

                    var _x:Float = (touch.clientX - _bound.left);
                    var _y:Float = (touch.clientY - _bound.top);
                        _x = _x/_bound.width;
                        _y = _y/_bound.height;

                    app.input.dispatch_touch_down_event(
                        _x,
                        _y,
                        0, //:todo:web:touch: dx, dy values
                        0,
                        touch.identifier,
                        timestamp()
                    );
                
                } //each touch

            }); //touchstart

            window.addEventListener('touchend', function(_ev:js.html.TouchEvent) {

                if(app.config.runtime.prevent_default_touches) {
                    _ev.preventDefault();
                }

                    //:todo:web:touch: test with update_window_pos values
                var _bound = window.getBoundingClientRect();
                for(touch in _ev.changedTouches) {

                    var _x:Float = touch.clientX - _bound.left;
                    var _y:Float = touch.clientY - _bound.top;
                        _x = _x/_bound.width;
                        _y = _y/_bound.height;

                    app.input.dispatch_touch_up_event(
                        _x,
                        _y,
                        0, //:todo:web:touch: dx, dy values
                        0,
                        touch.identifier,
                        timestamp()
                    );

                } //each touch

            }); //touchend

            window.addEventListener('touchmove', function(_ev:js.html.TouchEvent) {

                if(app.config.runtime.prevent_default_touches) {
                    _ev.preventDefault();
                }

                    //:todo:web:touch: test with update_window_pos values
                var _bound = window.getBoundingClientRect();
                for(touch in _ev.changedTouches) {

                    var _x:Float = touch.clientX - _bound.left;
                    var _y:Float = touch.clientY - _bound.top;
                        _x = _x/_bound.width;
                        _y = _y/_bound.height;

                    app.input.dispatch_touch_move_event(
                        _x,
                        _y,
                        0, //:todo:web:touch: dx, dy values
                        0,
                        touch.identifier,
                        timestamp()
                    );

                } //each touch

            }); //touchmove

        //:todo:web:gamepad events

        //:todo:web:orientation events

    } //setup_events

    function create_window() {

        var config = app.config.window;
        var _dpr = window_device_pixel_ratio();

        window = js.Browser.document.createCanvasElement();

            //For High DPI, we scale the config sizes
        window.width = Math.floor(config.width * _dpr);
        window.height = Math.floor(config.height * _dpr);
            //These are in css device pixels
        window.style.width = config.width+'px';
        window.style.height = config.height+'px';
            //This is typically required for our WebGL and blending
        window.style.background = '#000';

        window.id = app.config.runtime.window_id;
        app.config.runtime.window_parent.appendChild(window);

        if(config.title != null) {
            js.Browser.document.title = config.title;
        }

        if(!create_render_context(window)) {
            create_render_context_failed();
            return;
        }

        setup_events();

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

//main loop

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

//input

    inline function mod_state_from_event(_key_event:js.html.KeyboardEvent) : ModState {

        var _none : Bool =
            !_key_event.altKey &&
            !_key_event.ctrlKey &&
            !_key_event.metaKey &&
            !_key_event.shiftKey;

        return {
            none    : _none,
            lshift  : _key_event.shiftKey,
            rshift  : _key_event.shiftKey,
            lctrl   : _key_event.ctrlKey,
            rctrl   : _key_event.ctrlKey,
            lalt    : _key_event.altKey,
            ralt    : _key_event.altKey,
            lmeta   : _key_event.metaKey,
            rmeta   : _key_event.metaKey,
            num     : false, //:unsupported:
            caps    : false, //:unsupported:
            mode    : false, //:unsupported:
            ctrl    : _key_event.ctrlKey,
            shift   : _key_event.shiftKey,
            alt     : _key_event.altKey,
            meta    : _key_event.metaKey
        };

    } //mod_state_from_event

        /** This takes a *DOM* keycode and returns a snow Keycodes value */
    inline function convert_keycode(dom_keycode:Int) : Int {

            //this converts the uppercase into lower case,
            //since those are fixed values it doesn't need to be checked
        if (dom_keycode >= 65 && dom_keycode <= 90) {
            return dom_keycode + 32;
        }

            //this will pass back the same value if unmapped
        return DOMKeys.dom_key_to_keycode(dom_keycode);

    } //convert_keycode

//window helpers

    public function update_window_pos() {

        // see the following link for this implementation
        // http://www.quirksmode.org/js/findpos.html

        var _obj : js.html.Element = window;

        var curleft = 0;
        var curtop = 0;
        var _has_parent = true;
        var _max_count = 0;

        while(_has_parent == true) {

            _max_count++;

                //prevent rogue endless loops
            if(_max_count > 100) {
                _has_parent = false;
                break;
            }

            if(_obj.offsetParent != null) {

                    //it still has an offset parent, add it up
                curleft += _obj.offsetLeft;
                curtop += _obj.offsetTop;

                    //then move onto the parent
                _obj = _obj.offsetParent;

            } else {
                _has_parent = false;
            }

        } //while

        window_x = curleft;
        window_y = curtop;

    } //update_window_pos

//helpers

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

        /** The DOM element to put the window canvas into. default: <body> */
    @:optional var window_parent : js.html.Element;
        /** The canvas element id="" attribute. default: 'app' */
    @:optional var window_id : String;

        /** Any Key.* values stored in this array sent to the page will be consumed by snow. `event.preventDefault` is used.
            Keys can be removed or added to the array at runtime. default:left,up,down,right,backspace,tab,delete */
    @:optional var prevent_default_keys : Array<Int>;
        /** If true, mouse wheel events sent to the page will be consumed by snow. `event.preventDefault` is used. default: true*/
    @:optional var prevent_default_mouse_wheel : Bool;
        /** If true, touch events sent to the page will be consumed by snow. `event.preventDefault` is used. default: true*/
    @:optional var prevent_default_touches : Bool;
        /** If true, right clicking will consume the event on the canvas. `event.preventDefault` is used. default: true*/
    @:optional var prevent_default_context_menu : Bool;

} //RuntimeConfig



private class DOMKeys {

    /** This function takes the DOM keycode and translates it into the
        corresponding snow Keycodes value - but only if needed for special cases */
    public static function dom_key_to_keycode(_keycode:Int) {

        switch(_keycode) {

        //
            case dom_shift:         return Key.lshift;     //:todo : this is both left/right but returns left
            case dom_ctrl:          return Key.lctrl;      //:todo : ^
            case dom_alt:           return Key.lalt;       //:todo : ^
            case dom_capslock:      return Key.capslock;
        //
            case dom_pageup:        return Key.pageup;
            case dom_pagedown:      return Key.pagedown;
            case dom_end:           return Key.end;
            case dom_home:          return Key.home;
            case dom_left:          return Key.left;
            case dom_up:            return Key.up;
            case dom_right:         return Key.right;
            case dom_down:          return Key.down;
            case dom_printscr:      return Key.printscreen;
            case dom_insert:        return Key.insert;
            case dom_delete:        return Key.delete;
        //
            case dom_lmeta:         return Key.lmeta;
            case dom_rmeta:         return Key.rmeta;
            case dom_meta:          return Key.lmeta;
        //
            case dom_kp_0:          return Key.kp_0;
            case dom_kp_1:          return Key.kp_1;
            case dom_kp_2:          return Key.kp_2;
            case dom_kp_3:          return Key.kp_3;
            case dom_kp_4:          return Key.kp_4;
            case dom_kp_5:          return Key.kp_5;
            case dom_kp_6:          return Key.kp_6;
            case dom_kp_7:          return Key.kp_7;
            case dom_kp_8:          return Key.kp_8;
            case dom_kp_9:          return Key.kp_9;
            case dom_kp_multiply:   return Key.kp_multiply;
            case dom_kp_plus:       return Key.kp_plus;
            case dom_kp_minus:      return Key.kp_minus;
            case dom_kp_decimal:    return Key.kp_decimal;
            case dom_kp_divide:     return Key.kp_divide;
            case dom_kp_numlock:    return Key.numlockclear;
        //
            case dom_f1:            return Key.f1;
            case dom_f2:            return Key.f2;
            case dom_f3:            return Key.f3;
            case dom_f4:            return Key.f4;
            case dom_f5:            return Key.f5;
            case dom_f6:            return Key.f6;
            case dom_f7:            return Key.f7;
            case dom_f8:            return Key.f8;
            case dom_f9:            return Key.f9;
            case dom_f10:           return Key.f10;
            case dom_f11:           return Key.f11;
            case dom_f12:           return Key.f12;
            case dom_f13:           return Key.f13;
            case dom_f14:           return Key.f14;
            case dom_f15:           return Key.f15;
            case dom_f16:           return Key.f16;
            case dom_f17:           return Key.f17;
            case dom_f18:           return Key.f18;
            case dom_f19:           return Key.f19;
            case dom_f20:           return Key.f20;
            case dom_f21:           return Key.f21;
            case dom_f22:           return Key.f22;
            case dom_f23:           return Key.f23;
            case dom_f24:           return Key.f24;
        //
            case dom_caret:         return Key.caret;
            case dom_exclaim:       return Key.exclaim;
            case dom_quotedbl:      return Key.quotedbl;
            case dom_hash:          return Key.hash;
            case dom_dollar:        return Key.dollar;
            case dom_percent:       return Key.percent;
            case dom_ampersand:     return Key.ampersand;
            case dom_underscore:    return Key.underscore;
            case dom_leftparen:     return Key.leftparen;
            case dom_rightparen:    return Key.rightparen;
            case dom_asterisk:      return Key.asterisk;
            case dom_plus:          return Key.plus;
            case dom_pipe:          return Key.backslash; // pipe
            case dom_minus:         return Key.minus;
            case dom_leftbrace:     return Key.leftbracket; // {, same code as [ on native...
            case dom_rightbrace:    return Key.rightbracket; // }, same code as ] on native...
            case dom_tilde:         return Key.backquote; // tilde
        //
            case dom_audiomute:     return Key.audiomute;
            case dom_volumedown:    return Key.volumedown;
            case dom_volumeup:      return Key.volumeup;
        //
            case dom_comma:         return Key.comma;
            case dom_period:        return Key.period;
            case dom_slash:         return Key.slash;
            case dom_backquote:     return Key.backquote;
            case dom_leftbracket:   return Key.leftbracket;
            case dom_rightbracket:  return Key.rightbracket;
            case dom_backslash:     return Key.backslash;
            case dom_quote:         return Key.quote;

        } //switch(_keycode)

        return _keycode;

    } //dom_key_to_keycode

    // the keycodes below are dom specific keycodes mapped to snow input names
    // these values *come from the browser* dom spec codes only, some info here
    // http://www.w3.org/TR/DOM-Level-3-Events/#determine-keydown-keyup-keyCode

 //
    static inline var dom_shift          = 16;
    static inline var dom_ctrl           = 17;
    static inline var dom_alt            = 18;
    static inline var dom_capslock       = 20;
 //
    static inline var dom_pageup         = 33;
    static inline var dom_pagedown       = 34;
    static inline var dom_end            = 35;
    static inline var dom_home           = 36;
    static inline var dom_left           = 37;
    static inline var dom_up             = 38;
    static inline var dom_right          = 39;
    static inline var dom_down           = 40;
    static inline var dom_printscr       = 44;
    static inline var dom_insert         = 45;
    static inline var dom_delete         = 46;
 //
    static inline var dom_lmeta          = 91;
    static inline var dom_rmeta          = 93;
 //
    static inline var dom_kp_0           = 96;
    static inline var dom_kp_1           = 97;
    static inline var dom_kp_2           = 98;
    static inline var dom_kp_3           = 99;
    static inline var dom_kp_4           = 100;
    static inline var dom_kp_5           = 101;
    static inline var dom_kp_6           = 102;
    static inline var dom_kp_7           = 103;
    static inline var dom_kp_8           = 104;
    static inline var dom_kp_9           = 105;
    static inline var dom_kp_multiply    = 106;
    static inline var dom_kp_plus        = 107;
    static inline var dom_kp_minus       = 109;
    static inline var dom_kp_decimal     = 110;
    static inline var dom_kp_divide      = 111;
    static inline var dom_kp_numlock     = 144;
 //
    static inline var dom_f1             = 112;
    static inline var dom_f2             = 113;
    static inline var dom_f3             = 114;
    static inline var dom_f4             = 115;
    static inline var dom_f5             = 116;
    static inline var dom_f6             = 117;
    static inline var dom_f7             = 118;
    static inline var dom_f8             = 119;
    static inline var dom_f9             = 120;
    static inline var dom_f10            = 121;
    static inline var dom_f11            = 122;
    static inline var dom_f12            = 123;
    static inline var dom_f13            = 124;
    static inline var dom_f14            = 125;
    static inline var dom_f15            = 126;
    static inline var dom_f16            = 127;
    static inline var dom_f17            = 128;
    static inline var dom_f18            = 129;
    static inline var dom_f19            = 130;
    static inline var dom_f20            = 131;
    static inline var dom_f21            = 132;
    static inline var dom_f22            = 133;
    static inline var dom_f23            = 134;
    static inline var dom_f24            = 135;
 //
    static inline var dom_caret          = 160;
    static inline var dom_exclaim        = 161;
    static inline var dom_quotedbl       = 162;
    static inline var dom_hash           = 163;
    static inline var dom_dollar         = 164;
    static inline var dom_percent        = 165;
    static inline var dom_ampersand      = 166;
    static inline var dom_underscore     = 167;
    static inline var dom_leftparen      = 168;
    static inline var dom_rightparen     = 169;
    static inline var dom_asterisk       = 170;
    static inline var dom_plus           = 171;
    static inline var dom_pipe           = 172; //backslash
    static inline var dom_minus          = 173;
    static inline var dom_leftbrace      = 174;
    static inline var dom_rightbrace     = 175;
    static inline var dom_tilde          = 176;
 //
    static inline var dom_audiomute      = 181;
    static inline var dom_volumedown     = 182;
    static inline var dom_volumeup       = 183;
 //
    static inline var dom_comma          = 188;
    static inline var dom_period         = 190;
    static inline var dom_slash          = 191;
    static inline var dom_backquote      = 192;
    static inline var dom_leftbracket    = 219;
    static inline var dom_rightbracket   = 221;
    static inline var dom_backslash      = 220;
    static inline var dom_quote          = 222;
    static inline var dom_meta           = 224;

} //DOMKeys
