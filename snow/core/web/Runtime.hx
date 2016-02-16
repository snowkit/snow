package snow.core.web;

#if js

import snow.types.Types;
import snow.api.Debug.*;

@:allow(snow.Snow)
class Runtime implements snow.core.Runtime {

    public var app:snow.Snow;
        /** The runtime window canvas */
    public var window : WindowHandle;
        /** The name of this runtime */
    public var name (default, null): String = 'web';

        /** The window id to use for events */
    static inline var web_window_id = 1;

        /** The window x position. 
            Internal, set by update_window_bounds */
    var window_x : Int = 0;
        /** The window y position.
            Internal, set by update_window_bounds */
    var window_y : Int = 0;
        /** The window element width
            Internal, set by update_window_bounds */
    var window_w : Int = 0;
        /** The window element height
            Internal, set by update_window_bounds */
    var window_h : Int = 0;
        /** The window device pixel ratio
            Internal, set by update_window_bounds */
    var window_dpr : Float = 1.0;

        /** Whether or not the browser has gamepad API support */
    var gamepads_supported : Bool = false;
        /** internal start time, allowing 0 based time values */
    static var timestamp_start : Float = 0.0;

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

        gamepads_init();

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

        if(enable) {
    
            if(window.requestPointerLock != null) {
                window.requestPointerLock();
            } else if(untyped window.webkitRequestPointerLock != null) {
                untyped window.webkitRequestPointerLock();
            } else if(untyped window.mozRequestPointerLock != null) {
                untyped window.mozRequestPointerLock(); 
            } else {
                return false;
            }

        } else {

            if(js.Browser.document.exitPointerLock != null) {
                js.Browser.document.exitPointerLock();
            } else if(untyped js.Browser.document.webkitExitPointerLock != null) {
                untyped js.Browser.document.webkitExitPointerLock();
            } else if(untyped js.Browser.document.mozExitPointerLock != null) {
                untyped js.Browser.document.mozExitPointerLock();
            } else {
                return false;
            }

        }

        return true;

    } //window_grab

    var p_padding = '0';
    var p_margin = '0';
    var p_s_width = '';
    var p_s_height = '';
    var p_width = 0;
    var p_height = 0;
    var p_body_overflow = '0';
    var p_body_margin = '0';

        //the window.onresize event handler
    inline function onresize_handler(_) {

        window.style.width = '${js.Browser.window.innerWidth}px';
        window.style.height = '${js.Browser.window.innerHeight}px';
    
    } //onresize_handler

    public function window_fullscreen(enable:Bool, ?true_fullscreen:Bool=false) : Bool {

        var _result = true;

        if(enable) {

            p_padding       = window.style.padding;
            p_margin        = window.style.margin;
            p_s_width       = window.style.width;
            p_s_height      = window.style.height;
            p_width         = window.width;
            p_height        = window.height;
            p_body_margin   = js.Browser.document.body.style.margin;
            p_body_overflow = js.Browser.document.body.style.overflow;

            window.style.margin = '0';
            window.style.padding = '0';
            window.style.width = js.Browser.window.innerWidth + 'px';
            window.style.height = js.Browser.window.innerHeight + 'px';
            window.width = js.Browser.window.innerWidth;
            window.height = js.Browser.window.innerHeight;

                //stop the browser page from having scrollbars etc
            js.Browser.document.body.style.margin = '0';
            js.Browser.document.body.style.overflow = 'hidden';

            if(true_fullscreen) {
                if(window.requestFullscreen != null) {
                    window.requestFullscreen();
                } else if(untyped window.requestFullScreen != null) {
                    untyped window.requestFullScreen(null);
                } else if(untyped window.webkitRequestFullscreen != null) {
                    untyped window.webkitRequestFullscreen();
                } else if(untyped window.mozRequestFullScreen != null) {
                    untyped window.mozRequestFullScreen();
                } else {
                    _result = false;
                }
            } //if true_fullscreen

                //listen for changes, this will trigger the right resize
            js.Browser.window.addEventListener("resize", onresize_handler);

        } else {

            js.Browser.window.removeEventListener("resize", onresize_handler);

            window.style.padding = p_padding;
            window.style.margin = p_margin;
            window.style.width = p_s_width;
            window.style.height = p_s_height;
            window.width = p_width;
            window.height = p_height;
            js.Browser.document.body.style.margin = p_body_margin;
            js.Browser.document.body.style.overflow = p_body_overflow;

            if(true_fullscreen) {
                if(js.Browser.document.exitFullscreen != null) {
                    js.Browser.document.exitFullscreen();
                } else if(untyped js.Browser.document.webkitExitFullscreen != null) {
                    untyped js.Browser.document.webkitExitFullscreen();
                } else if(untyped js.Browser.document.mozCancelFullScreen != null) {
                    untyped js.Browser.document.mozCancelFullScreen();
                } else {
                    _result = false;
                }
            } //true_fullscreen

        } //enable

        return _result;

    } //window_fullscreen

//Public static API

    inline public static function timestamp() : Float {

        return (js.Browser.window.performance.now()/1000.0) - timestamp_start;

    } //timestamp

//Internal runtime API

    function shutdown(?_immediate:Bool=false) {

        log('runtime / web / shutdown');

    } //shutdown

    function run() : Bool {

        log('web / run');

        loop_pre_ready();

        return false;

    } //run

    function ready() {

        log('web / ready');

        create_window();

    } //ready

//internal

    inline function dispatch_window_ev(_type:WindowEventType, ?_x:Int, ?_y:Int) {

        app.dispatch_window_event(_type, timestamp(), web_window_id, _x, _y);

    } //dispatch_window_ev

    function setup_events() {

        //window events

            window.addEventListener('mouseleave', function(_ev:js.html.MouseEvent) {

                dispatch_window_ev(we_leave);

            }); //mouseleave

            window.addEventListener('mouseenter', function(_ev:js.html.MouseEvent) {

               dispatch_window_ev(we_enter);

            }); //mouseenter

            js.Browser.document.addEventListener('visibilitychange', function(_) {

                if(js.Browser.document.hidden) {
                    dispatch_window_ev(we_hidden);
                    dispatch_window_ev(we_minimized);
                    dispatch_window_ev(we_focus_lost);
                } else {
                    dispatch_window_ev(we_shown);
                    dispatch_window_ev(we_restored);
                    dispatch_window_ev(we_focus_gained);
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
                        te_input,
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

            inline function translate_mouse_x(_ev:js.html.MouseEvent) {
                return Math.floor(window_dpr * (_ev.pageX - window_x));
            }

            inline function translate_mouse_y(_ev:js.html.MouseEvent) {
                return Math.floor(window_dpr * (_ev.pageY - window_y));
            }

            window.addEventListener('mousedown', function(_ev:js.html.MouseEvent) {

                app.input.dispatch_mouse_down_event(
                    translate_mouse_x(_ev),
                    translate_mouse_y(_ev),
                    _ev.button + 1, //:native buttons are 1 based
                    timestamp(),
                    web_window_id
                );

            }); //mousedown

            window.addEventListener('mouseup', function(_ev:js.html.MouseEvent){

                app.input.dispatch_mouse_up_event(
                    translate_mouse_x(_ev),
                    translate_mouse_y(_ev),
                    _ev.button + 1, //:native buttons are 1 based
                    timestamp(),
                    web_window_id
                );

            }); //mouseup

            window.addEventListener('mousemove', function(_ev:js.html.MouseEvent){

                var _movement_x = _ev.movementX == null ? 0 : _ev.movementX;
                var _movement_y = _ev.movementY == null ? 0 : _ev.movementY;
                    _movement_x = Math.floor(_movement_x * window_dpr);
                    _movement_y = Math.floor(_movement_y * window_dpr);

                app.input.dispatch_mouse_move_event(
                    translate_mouse_x(_ev),
                    translate_mouse_y(_ev),
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

                    //:todo:web:touch: test with window_x/y/w/h
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

                    //:todo:web:touch: test with window_x/y/w/h
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

                    //:todo:web:touch: test with window_x/y/w/h
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

        //gamepad events

            js.Browser.window.addEventListener("gamepadconnected", function(_ev:{ gamepad:js.html.Gamepad }) {

                _debug('gamepad connected at index ${_ev.gamepad.index}: ${_ev.gamepad.id}. ${_ev.gamepad.buttons.length} buttons, ${_ev.gamepad.axes.length} axes');

                gamepads_init_cache(_ev.gamepad);

                app.input.dispatch_gamepad_device_event(
                    _ev.gamepad.index,
                    _ev.gamepad.id,
                    ge_device_added,
                    timestamp()
                );

            }); //gamepadconnected

            js.Browser.window.addEventListener("gamepaddisconnected", function(_ev:{ gamepad:js.html.Gamepad }) {
                
                _debug('gamepad disconnected at index ${_ev.gamepad.index}: ${_ev.gamepad.id}');

                gamepad_btns_cache[_ev.gamepad.index] = null;
                
                app.input.dispatch_gamepad_device_event(
                    _ev.gamepad.index,
                    _ev.gamepad.id,
                    ge_device_removed,
                    timestamp()
                );

            }); //gamepaddisconnected

        //window events

            //:todo:web:orientation events

    } //setup_events

    function create_window() {

        var config = app.config.window;
        window = js.Browser.document.createCanvasElement();

            //For High DPI, we scale the config sizes
        window_dpr = window_device_pixel_ratio();
        window.width = Math.floor(config.width * window_dpr);
        window.height = Math.floor(config.height * window_dpr);

            //These are in css device pixels
        window_w = config.width;
        window_h = config.width;
        window.style.width = config.width+'px';
        window.style.height = config.height+'px';
            //This is typically required for our WebGL blending
        window.style.background = '#000';

        _debug('created window at ${window_x},${window_y} - ${window.width}x${window.height} pixels (${config.width}x${config.width}@${window_dpr}x)');

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

        if(config.fullscreen) {
            window_fullscreen(true, config.true_fullscreen);
        }

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

        if(gamepads_supported) gamepads_poll();

        update_window_bounds();

        app.dispatch_event(se_tick);

        if(!app.shutting_down) {
            request_frame();
        }

        return true;

    } //loop

//internal main loop before ready is fired

    function loop_pre_ready(?_t:Float = 0.016) : Bool {

        app.dispatch_event(se_tick);

        if(!app.shutting_down) {
            if(!app.ready) {
                js.Browser.window.requestAnimationFrame(loop_pre_ready);
            } else {
                js.Browser.window.requestAnimationFrame(loop);
            }
        }

        return true;

    } //loop_pre_ready

//input

    inline function mod_state_from_event(_key_event:js.html.KeyboardEvent) : ModState {

        var _none : Bool =
            !_key_event.altKey &&
            !_key_event.ctrlKey &&
            !_key_event.metaKey &&
            !_key_event.shiftKey;

            app.input.mod_state.none    = _none;
            app.input.mod_state.lshift  = _key_event.shiftKey;
            app.input.mod_state.rshift  = _key_event.shiftKey;
            app.input.mod_state.lctrl   = _key_event.ctrlKey;
            app.input.mod_state.rctrl   = _key_event.ctrlKey;
            app.input.mod_state.lalt    = _key_event.altKey;
            app.input.mod_state.ralt    = _key_event.altKey;
            app.input.mod_state.lmeta   = _key_event.metaKey;
            app.input.mod_state.rmeta   = _key_event.metaKey;
            app.input.mod_state.num     = false;                //:unsupported:
            app.input.mod_state.caps    = false;                //:unsupported:
            app.input.mod_state.mode    = false;                //:unsupported:
            app.input.mod_state.ctrl    = _key_event.ctrlKey;
            app.input.mod_state.shift   = _key_event.shiftKey;
            app.input.mod_state.alt     = _key_event.altKey;
            app.input.mod_state.meta    = _key_event.metaKey;
        
        return app.input.mod_state;

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

    inline function get_window_x(_bounds:js.html.DOMRect) {
        return Math.round(_bounds.left + js.Browser.window.pageXOffset - js.Browser.document.body.clientTop);
    }
    
    inline function get_window_y(_bounds:js.html.DOMRect) {
        return Math.round(_bounds.top + js.Browser.window.pageYOffset - js.Browser.document.body.clientLeft);
    }
        
    inline function update_window_bounds() {

        window_dpr = window_device_pixel_ratio();

        var _bounds = window.getBoundingClientRect();

        var _x = get_window_x(_bounds);
        var _y = get_window_y(_bounds);
        var _w = Math.round(_bounds.width);
        var _h = Math.round(_bounds.height);

        if(_x != window_x || _y != window_y) {
            window_x = _x;
            window_y = _y;
            dispatch_window_ev(we_moved, window_x, window_y);
        }

        if(_w != window_w || _h != window_h) {
            window_w = _w;
            window_h = _h;
            window.width = Math.floor(window_w * window_dpr);
            window.height = Math.floor(window_h * window_dpr);
            dispatch_window_ev(we_size_changed, window.width, window.height);
        }

    } //update_window_bounds

//gamepads
    
    var gamepad_btns_cache : Array<Array<Float>>;

    inline function gamepads_init_cache(_gamepad:js.html.Gamepad) {

        gamepad_btns_cache[_gamepad.index] = [];
        
        for(i in 0 ... _gamepad.buttons.length) {
            gamepad_btns_cache[_gamepad.index].push(0);
        }

    } //gamepads_init_cache

    inline function gamepads_init() {

        var _list = gamepads_get_list();
        if(_list != null) {
            gamepads_supported = true;
            gamepad_btns_cache = [];
            for(_gamepad in _list) {
                if(_gamepad != null) {
                    gamepads_init_cache(_gamepad);
                }
            }
        } else {
            //:todo:web: more assistive gamepad failure
            log("Gamepads are not supported in this browser :(");
        }

    } //gamepads_init

    inline function gamepads_poll() {

        var list = gamepads_get_list();
    
        assertnull(list, 'gamepad list not found, but they were previously?');

        var _count = list.length;
        var _idx = 0;
        
        while(_idx < _count) {

            var _gamepad = list[_idx];
            if(_gamepad == null) {
                _idx++;
                continue;
            }

            for(_axis_idx in 0 ... _gamepad.axes.length) {
                
                var _axis = _gamepad.axes[_axis_idx];
                if(_axis != 0) {
                    app.input.dispatch_gamepad_axis_event(
                        _gamepad.index,
                        _axis_idx,
                        _axis,
                        timestamp()
                    );
                }

            } //each axis

            var _prev_btn = gamepad_btns_cache[_gamepad.index];
            for(_btn_idx in 0 ... _gamepad.buttons.length) {
                
                var _btn = _gamepad.buttons[_btn_idx];

                if(_btn.value != _prev_btn[_btn_idx]) {

                    if(_btn.pressed) {
                        app.input.dispatch_gamepad_button_down_event(
                            _gamepad.index,
                            _btn_idx,
                            _btn.value,
                            timestamp()
                        );
                    } else {
                        app.input.dispatch_gamepad_button_up_event(
                            _gamepad.index,
                            _btn_idx,
                            _btn.value,
                            timestamp()
                        );
                    }

                    _prev_btn[_btn_idx] = _btn.value;

                } //changed

            } //each button

            _idx++;
        } //each gamepad

    } //gamepads_poll

    inline function gamepads_get_list() : Array<js.html.Gamepad> {

        if( js.Browser.navigator.getGamepads != null ) {
            return js.Browser.navigator.getGamepads();
        }

        if( untyped js.Browser.navigator.webkitGetGamepads != null ) {
            return untyped js.Browser.navigator.webkitGetGamepads();
        }

        return null;

    } //get_gamepad_list

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

} //Runtime


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

#end