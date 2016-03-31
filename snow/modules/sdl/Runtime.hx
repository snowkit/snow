package snow.modules.sdl;

import snow.api.Debug.*;
import snow.types.Types;
import sdl.SDL;
import timestamp.Timestamp;

#if !mobile
import glew.GLEW;
#end

@:allow(snow.Snow)
class Runtime extends snow.core.native.Runtime {

        /** The SDL GL context */
    public var gl : sdl.GLContext;
        /** The SDL window handle */
    public var window : sdl.Window;
        /** internal: map of gamepad index to gamepad instance */
    var gamepads : Map<Int, sdl.GameController>;
        /** internal: map of joystick index to joystick instance */
    var joysticks : Map<Int, sdl.Joystick>;

    function new(_app:snow.Snow) {

        super(_app);
        timestamp_start = timestamp();
        name = 'sdl';

        app.config.runtime = {}

        gamepads = new Map();
        joysticks = new Map();

        var status = SDL.init(SDL_INIT_TIMER);
        if(status != 0) {
            throw Error.init('runtime / sdl / failed to init / `${SDL.getError()}`');
        }

        //video

            var status = SDL.initSubSystem(SDL_INIT_VIDEO);
            if(status != 0) {
                throw Error.init('runtime / sdl / failed to init video / `${SDL.getError()}`');
            } else {
                _debug('sdl / init video');
            }

        //input

            #if !snow_sdl_no_controller
                status = SDL.initSubSystem(SDL_INIT_GAMECONTROLLER);
                if(status == -1) {
                    log('sdl / Could not initialize controller : `${SDL.getError()}`');
                } else {
                    _debug('sdl / init game controllers');
                }
            #end

            #if !snow_sdl_no_joystick
                status = SDL.initSubSystem(SDL_INIT_JOYSTICK);
                if(status == -1) {
                    log('sdl / Could not initialize joystick : `${SDL.getError()}`');
                } else {
                    _debug('sdl / init joystick');
                }
            #end

            #if !snow_sdl_no_haptic
                status = SDL.initSubSystem(SDL_INIT_HAPTIC);
                if(status == -1) {
                    log('sdl / Could not initialize haptic : `${SDL.getError()}`');
                } else {
                    _debug('sdl / init haptic');
                }
            #end

        //mobile events

            #if (android || ios)
                SDL.addEventWatch( event_watch, null );
            #end

        _debug('sdl / init ok');

    } //new

    override function ready() {

        create_window();

        _debug('sdl / ready');

    } //ready

    override function run() : Bool {

        _debug('sdl / run');

        return run_loop();

    } //run

    override function shutdown(?_immediate:Bool=false) {

        if(!_immediate) {
            SDL.quit();
            _debug('sdl / shutdown');
        } else {
            _debug('sdl / shutdown immediate');
        }

    } //shutdown

    override function window_grab(enable:Bool) : Bool {

        var res = SDL.setRelativeMouseMode(enable);

        return res == 0;

    } //window_grab

    public inline function window_swap() {

        SDL.GL_SwapWindow(window);

    } //window_swap

    override function window_fullscreen(enable:Bool, ?true_fullscreen:Bool=false) : Bool {

        var flag : SDLWindowFlags = (enable) ? SDL_WINDOW_FULLSCREEN_DESKTOP : 0;

        if(true_fullscreen && enable) {
            flag |= SDL_WINDOW_FULLSCREEN;
        }

        return SDL.setWindowFullscreen(window, flag) == 0;

    } //window_fullscreen

    override inline public function window_width() :Int return window_w;
    override inline public function window_height() :Int return window_h;

    var _size:SDLSize = {w:0, h:0}
    var window_dpr = 1.0;
    override function window_device_pixel_ratio() : Float {

        _size = SDL.GL_GetDrawableSize(window, _size);
        var _pixel_height = _size.w;

        _size = SDL.getWindowSize(window, _size);
        var _device_height = _size.w;

        return _pixel_height / _device_height;

    } //window_device_pixel_ratio



    static var timestamp_start : Float = 0.0;
    inline public static function timestamp() : Float {

        return Timestamp.now() - timestamp_start;

    } //timestamp

    function run_loop() {

        var _done = true;

        #if ios

            _done = false;
            _debug('sdl / attaching iOS CADisplayLink loop');
            SDL.iPhoneSetAnimationCallback(window, 1, loop, null);

         #else

            _debug('sdl / running main loop');

            while(!app.shutting_down) {

                loop(0);

            }

        #end

        return _done;

    } //run_loop

    function loop(_) {

        while(SDL.hasAnEvent()) {

            var e = SDL.pollEvent();

            handle_input_ev(e);
            handle_window_ev(e);

            if(e.type == SDL_QUIT) {
                app.dispatch_event(se_quit);
            }

        } //SDL has event

        app.dispatch_event(se_tick);

        if(!app.has_shutdown) {
            window_swap();
        }

    } //loop


//Mobile

    function event_watch(_, e:sdl.Event) : Int {

        var _type:SystemEventType = se_unknown;

        switch(e.type) {
            case SDL_APP_TERMINATING:
                _type = se_app_terminating;
            case SDL_APP_LOWMEMORY:
                _type = se_app_lowmemory;
            case SDL_APP_WILLENTERBACKGROUND:
                _type = se_app_willenterbackground;
            case SDL_APP_DIDENTERBACKGROUND:
                _type = se_app_didenterbackground;
            case SDL_APP_WILLENTERFOREGROUND:
                _type = se_app_willenterforeground;
            case SDL_APP_DIDENTERFOREGROUND:
                _type = se_app_didenterforeground;
            case _:
                return 0;
        }

        app.dispatch_event(_type);

        return 1;

    } //event_watch

//Window

    function handle_window_ev(e:sdl.Event) {

        var _data1 = e.window.data1;
        var _data2 = e.window.data2;

        if(e.type == SDL_WINDOWEVENT) {
            var _type:WindowEventType = we_unknown;
            switch(e.window.event) {
                case SDL_WINDOWEVENT_SHOWN:
                    _type = we_shown;
                case SDL_WINDOWEVENT_HIDDEN:
                    _type = we_hidden;
                case SDL_WINDOWEVENT_EXPOSED:
                    _type = we_exposed;
                case SDL_WINDOWEVENT_MOVED:
                    _type = we_moved;
                case SDL_WINDOWEVENT_MINIMIZED:
                    _type = we_minimized;
                case SDL_WINDOWEVENT_MAXIMIZED:
                    _type = we_maximized;
                case SDL_WINDOWEVENT_RESTORED:
                    _type = we_restored;
                case SDL_WINDOWEVENT_ENTER:
                    _type = we_enter;
                case SDL_WINDOWEVENT_LEAVE:
                    _type = we_leave;
                case SDL_WINDOWEVENT_FOCUS_GAINED:
                    _type = we_focus_gained;
                case SDL_WINDOWEVENT_FOCUS_LOST:
                    _type = we_focus_lost;
                case SDL_WINDOWEVENT_CLOSE:
                    _type = we_close;
                case SDL_WINDOWEVENT_RESIZED:
                    _type = we_resized;
                    window_dpr = window_device_pixel_ratio();
                        window_w = _data1 = to_pixels(_data1);
                        window_h = _data2 = to_pixels(_data2);
                case SDL_WINDOWEVENT_SIZE_CHANGED:
                    _type = we_size_changed;
                    window_dpr = window_device_pixel_ratio();
                        window_w = _data1 = to_pixels(_data1);
                        window_h = _data2 = to_pixels(_data2);
                case SDL_WINDOWEVENT_NONE:

            } //switch

            if(_type != we_unknown) {
                app.dispatch_window_event(_type, e.window.timestamp/1000.0, cast e.window.windowID, _data1, _data2);
            }
        }

    } //handle_window_ev

    var window_w : Int = 0;
    var window_h : Int = 0;

    inline function to_pixels(_value:Float) : Int {
        return Math.floor(window_dpr * _value);
    }

    function create_window() {

        _debug('sdl / creating window');

        var config = app.config.window;

        apply_GL_attr(app.config.render);

        window_w = config.width;
        window_h = config.height;

        window = SDL.createWindow((cast config.title:String), config.x, config.y, config.width, config.height, window_flags(config));

        if(window == null) {
            throw Error.error('runtime / sdl / failed to create platform window, unable to recover / `${SDL.getError()}`');
        }

        var _id:Int = SDL.getWindowID(window);

        _debug('sdl / created window / id: $_id');
        _debug('sdl / creating render context');

        if(!create_render_context(window)) {
            throw Error.error('runtime / sdl / failed to create render context, unable to recover / `${SDL.getError()}`');
        }

        post_render_context(window);

        //:todo:runtime:sdl: The updated window/render configs aren't accessible anymore
        
            //start with a copy
        var actual_config = app.copy_window_config(config);
        var actual_render = app.copy_render_config(app.config.render);

        actual_config = update_window_config(window, actual_config);
        actual_render = update_render_config(window, actual_render);

    } //create_window

    function create_render_context(_window:sdl.Window) : Bool {

        gl = SDL.GL_CreateContext(_window);

        var _success = gl.isnull() == false;

        _debug('sdl / GL init / $_success');

        return _success;

    } //

    function post_render_context(_window:sdl.Window) {

        SDL.GL_MakeCurrent(_window, gl);

        #if !mobile
            var _result = GLEW.init();
            if(_result != GLEW.OK) {
                throw Error.error('runtime / sdl / failed to setup created render context, unable to recover / `${GLEW.error(_result)}`');
            } else {
                _debug('sdl / GLEW init / ok');
            }
        #end

    } //post_render_context

//Default flags and attributes

    function apply_GL_attr(render:RenderConfig) {

        _debug('sdl / GL / RBGA / ${render.red_bits} ${render.green_bits} ${render.blue_bits} ${render.alpha_bits}');

        SDL.GL_SetAttribute(SDL_GL_RED_SIZE,     render.red_bits);
        SDL.GL_SetAttribute(SDL_GL_GREEN_SIZE,   render.green_bits);
        SDL.GL_SetAttribute(SDL_GL_BLUE_SIZE,    render.blue_bits);
        SDL.GL_SetAttribute(SDL_GL_ALPHA_SIZE,   render.alpha_bits);
        SDL.GL_SetAttribute(SDL_GL_DOUBLEBUFFER, 1);

        if(render.depth > 0) {
            _debug('sdl / GL / depth / ${render.depth}');
            SDL.GL_SetAttribute(SDL_GL_DEPTH_SIZE, render.depth);
        }

        if(render.stencil > 0) {
            _debug('sdl / GL / stencil / ${render.stencil}');
            SDL.GL_SetAttribute(SDL_GL_STENCIL_SIZE, render.stencil);
        }

        if(render.antialiasing > 0) {
            _debug('sdl / GL / MSAA / ${render.antialiasing}');
            SDL.GL_SetAttribute(SDL_GL_MULTISAMPLEBUFFERS, 1);
            SDL.GL_SetAttribute(SDL_GL_MULTISAMPLESAMPLES, render.antialiasing);
        }

        _debug('sdl / GL / profile / ${render.opengl.profile}');

        switch(render.opengl.profile) {

            case compatibility:
               SDL.GL_SetAttribute(SDL_GL_CONTEXT_PROFILE_MASK, SDLGLprofile.SDL_GL_CONTEXT_PROFILE_COMPATIBILITY);

            case core:
                SDL.GL_SetAttribute(SDL_GL_ACCELERATED_VISUAL, 1);
                SDL.GL_SetAttribute(SDL_GL_CONTEXT_PROFILE_MASK, SDLGLprofile.SDL_GL_CONTEXT_PROFILE_CORE);

            case gles:
                SDL.GL_SetAttribute(SDL_GL_ACCELERATED_VISUAL, 1);
                SDL.GL_SetAttribute(SDL_GL_CONTEXT_PROFILE_MASK, SDLGLprofile.SDL_GL_CONTEXT_PROFILE_ES);

                if(render.opengl.major == 0) {
                    render.opengl.major = 2;
                    render.opengl.minor = 0;
                }

        } // profile

        if(render.opengl.major != 0) {
            _debug('sdl / GL / version / ${render.opengl.major}.${render.opengl.minor}');
            SDL.GL_SetAttribute(SDL_GL_CONTEXT_MAJOR_VERSION, render.opengl.major);
            SDL.GL_SetAttribute(SDL_GL_CONTEXT_MINOR_VERSION, render.opengl.minor);
        }

    } //apply_GL_attr

    function window_flags(config:WindowConfig) {

        var flags : SDLWindowFlags = 0;

        flags |= SDL_WINDOW_OPENGL;
        flags |= SDL_WINDOW_ALLOW_HIGHDPI;

        if(config.resizable)  flags |= SDL_WINDOW_RESIZABLE;
        if(config.borderless) flags |= SDL_WINDOW_BORDERLESS;

        if(config.fullscreen) {
            if(!config.true_fullscreen) {
                flags |= SDL_WINDOW_FULLSCREEN_DESKTOP;
            } else {
                #if !mac
                    flags |= SDL_WINDOW_FULLSCREEN;
                #end
            }
        }

        return flags;

    } //window_flags

    function update_window_config(_window:sdl.Window, config:WindowConfig) : WindowConfig {

        if(config.fullscreen) {
            if(config.true_fullscreen) {
                #if mac
                    SDL.setWindowFullscreen(_window, SDL_WINDOW_FULLSCREEN);
                #end
            }
        }

        var size = SDL.GL_GetDrawableSize(_window, { w:config.width, h:config.height });
        var pos = SDL.getWindowPosition(_window, { x:config.x, y:config.y });

        config.x = pos.x;
        config.y = pos.y;
        config.width = window_w = size.w;
        config.height = window_h = size.h;

        window_dpr = window_device_pixel_ratio();
        _debug('sdl / window / x:${config.x} y:${config.y} w:${config.width} h:${config.height} / scale $window_dpr');

        return config;

    } //update_window_config

    function update_render_config(_window:sdl.Window, render:RenderConfig) : RenderConfig {

        render.antialiasing = SDL.GL_GetAttribute(SDL_GL_MULTISAMPLESAMPLES);
        render.red_bits     = SDL.GL_GetAttribute(SDL_GL_RED_SIZE);
        render.green_bits   = SDL.GL_GetAttribute(SDL_GL_GREEN_SIZE);
        render.blue_bits    = SDL.GL_GetAttribute(SDL_GL_BLUE_SIZE);
        render.alpha_bits   = SDL.GL_GetAttribute(SDL_GL_ALPHA_SIZE);
        render.depth        = SDL.GL_GetAttribute(SDL_GL_DEPTH_SIZE);
        render.stencil      = SDL.GL_GetAttribute(SDL_GL_STENCIL_SIZE);

        render.opengl.major = SDL.GL_GetAttribute(SDL_GL_CONTEXT_MAJOR_VERSION);
        render.opengl.minor = SDL.GL_GetAttribute(SDL_GL_CONTEXT_MINOR_VERSION);

        var profile: SDLGLprofile = SDL.GL_GetAttribute(SDL_GL_CONTEXT_PROFILE_MASK);
        switch(profile) {

            case SDL_GL_CONTEXT_PROFILE_COMPATIBILITY:
               render.opengl.profile = compatibility;

            case SDL_GL_CONTEXT_PROFILE_CORE:
               render.opengl.profile = core;

            case SDL_GL_CONTEXT_PROFILE_ES:
               render.opengl.profile = gles;

        } // profile

        return render;

    } //update_render_config

//Input

    function handle_input_ev(e:sdl.Event) {

        switch(e.type) {

            //keys

                case SDL_KEYDOWN:
                    app.input.dispatch_key_down_event(
                        e.key.keysym.sym,
                        e.key.keysym.scancode,
                        e.key.repeat,
                        to_key_mod(e.key.keysym.mod),
                        e.key.timestamp/1000.0,
                        cast e.key.windowID
                    );
                case SDL_KEYUP:
                    app.input.dispatch_key_up_event(
                        e.key.keysym.sym,
                        e.key.keysym.scancode,
                        e.key.repeat,
                        to_key_mod(e.key.keysym.mod),
                        e.key.timestamp/1000.0,
                        cast e.key.windowID
                    );
                case SDL_TEXTEDITING:
                    app.input.dispatch_text_event(
                        e.edit.text,
                        e.edit.start,
                        e.edit.length,
                        TextEventType.te_edit,
                        e.edit.timestamp/1000.0,
                        cast e.edit.windowID
                    );
                case SDL_TEXTINPUT:
                    app.input.dispatch_text_event(
                        e.text.text,
                        0,
                        0,
                        TextEventType.te_input,
                        e.text.timestamp/1000.0,
                        cast e.text.windowID
                    );

            //mouse

                case SDL_MOUSEMOTION:
                    app.input.dispatch_mouse_move_event(
                        to_pixels(e.motion.x),
                        to_pixels(e.motion.y),
                        to_pixels(e.motion.xrel),
                        to_pixels(e.motion.yrel),
                        e.motion.timestamp/1000.0,
                        cast e.motion.windowID
                    );
                case SDL_MOUSEBUTTONDOWN:
                    app.input.dispatch_mouse_down_event(
                        to_pixels(e.button.x),
                        to_pixels(e.button.y),
                        e.button.button,
                        e.button.timestamp/1000.0,
                        cast e.button.windowID
                    );
                case SDL_MOUSEBUTTONUP:
                    app.input.dispatch_mouse_up_event(
                        to_pixels(e.button.x),
                        to_pixels(e.button.y),
                        e.button.button,
                        e.button.timestamp/1000.0,
                        cast e.button.windowID
                    );
                case SDL_MOUSEWHEEL:
                    app.input.dispatch_mouse_wheel_event(
                        e.wheel.x,
                        e.wheel.y,
                        e.wheel.timestamp/1000.0,
                        cast e.wheel.windowID
                    );

            //touch

                case SDL_FINGERDOWN:
                    app.input.dispatch_touch_down_event(
                        e.tfinger.x,
                        e.tfinger.y,
                        e.tfinger.dx,
                        e.tfinger.dy,
                        cast e.tfinger.fingerId,
                        e.tfinger.timestamp/1000.0
                    );
                case SDL_FINGERUP:
                    app.input.dispatch_touch_up_event(
                        e.tfinger.x,
                        e.tfinger.y,
                        e.tfinger.dx,
                        e.tfinger.dy,
                        cast e.tfinger.fingerId,
                        e.tfinger.timestamp/1000.0
                    );
                case SDL_FINGERMOTION:
                    app.input.dispatch_touch_move_event(
                        e.tfinger.x,
                        e.tfinger.y,
                        e.tfinger.dx,
                        e.tfinger.dy,
                        cast e.tfinger.fingerId,
                        e.tfinger.timestamp/1000.0
                    );

            //joystick events

                case SDL_JOYAXISMOTION:

                    if(!SDL.isGameController(e.jaxis.which)) {
                         //(range: -32768 to 32767)
                        var _val:Float = (e.jaxis.value+32768)/(32767+32768);
                        var _normalized_val = (-0.5 + _val) * 2.0;
                        app.input.dispatch_gamepad_axis_event(
                            e.jaxis.which,
                            e.jaxis.axis,
                            _normalized_val,
                            e.jaxis.timestamp/1000.0
                        );
                    }

                case SDL_JOYBUTTONDOWN:

                    if(!SDL.isGameController(e.jbutton.which)) {
                        app.input.dispatch_gamepad_button_down_event(
                            e.jbutton.which,
                            e.jbutton.button,
                            1,
                            e.jbutton.timestamp/1000.0
                        );
                    }

                case SDL_JOYBUTTONUP:

                    if(!SDL.isGameController(e.jbutton.which)) {
                        app.input.dispatch_gamepad_button_up_event(
                            e.jbutton.which,
                            e.jbutton.button,
                            0,
                            e.jbutton.timestamp/1000.0
                        );
                    }

                case SDL_JOYDEVICEADDED:

                    if(!SDL.isGameController(e.jdevice.which)) {
                        var _joystick = SDL.joystickOpen(e.jdevice.which);
                        joysticks.set(e.jdevice.which, _joystick);

                        app.input.dispatch_gamepad_device_event(
                            e.jdevice.which,
                            SDL.joystickNameForIndex(e.jdevice.which),
                            GamepadDeviceEventType.ge_device_added,
                            e.jdevice.timestamp/1000.0
                        );
                    }
                case SDL_JOYDEVICEREMOVED:

                    if(!SDL.isGameController(e.jdevice.which)) {
                        var _joystick = joysticks.get(e.jdevice.which);
                        SDL.joystickClose(_joystick);
                        joysticks.remove(e.jdevice.which);

                        app.input.dispatch_gamepad_device_event(
                            e.jdevice.which,
                            SDL.joystickNameForIndex(e.jdevice.which),
                            GamepadDeviceEventType.ge_device_removed,
                            e.jdevice.timestamp/1000.0
                        );
                    }

            //gamepad

                case SDL_CONTROLLERAXISMOTION:
                     //(range: -32768 to 32767)
                    var _val:Float = (e.caxis.value+32768)/(32767+32768);
                    var _normalized_val = (-0.5 + _val) * 2.0;
                    app.input.dispatch_gamepad_axis_event(
                        e.caxis.which,
                        e.caxis.axis,
                        _normalized_val,
                        e.caxis.timestamp/1000.0
                    );
                case SDL_CONTROLLERBUTTONDOWN:
                    app.input.dispatch_gamepad_button_down_event(
                        e.cbutton.which,
                        e.cbutton.button,
                        1,
                        e.cbutton.timestamp/1000.0
                    );
                case SDL_CONTROLLERBUTTONUP:
                    app.input.dispatch_gamepad_button_up_event(
                        e.cbutton.which,
                        e.cbutton.button,
                        0,
                        e.cbutton.timestamp/1000.0
                    );
                case SDL_CONTROLLERDEVICEADDED:

                    var _gamepad = SDL.gameControllerOpen(e.cdevice.which);
                    gamepads.set(e.cdevice.which, _gamepad);

                    app.input.dispatch_gamepad_device_event(
                        e.cdevice.which,
                        SDL.gameControllerNameForIndex(e.cdevice.which),
                        GamepadDeviceEventType.ge_device_added,
                        e.cdevice.timestamp/1000.0
                    );
                case SDL_CONTROLLERDEVICEREMOVED:

                    var _gamepad = gamepads.get(e.cdevice.which);
                    SDL.gameControllerClose(_gamepad);
                    gamepads.remove(e.cdevice.which);

                    app.input.dispatch_gamepad_device_event(
                        e.cdevice.which,
                        SDL.gameControllerNameForIndex(e.cdevice.which),
                        GamepadDeviceEventType.ge_device_removed,
                        e.cdevice.timestamp/1000.0
                    );
                case SDL_CONTROLLERDEVICEREMAPPED:
                    app.input.dispatch_gamepad_device_event(
                        e.cdevice.which,
                        SDL.gameControllerNameForIndex(e.cdevice.which),
                        GamepadDeviceEventType.ge_device_remapped,
                        e.cdevice.timestamp/1000.0
                    );
                case _:

        } //switch

    } //handle_input_ev

    /** Helper to return a `ModState` (shift, ctrl etc) from a given `InputEvent` */
    function to_key_mod( mod_value:Int ) : ModState {

            app.input.mod_state.none    = mod_value == KMOD_NONE;

            app.input.mod_state.lshift  = mod_value == KMOD_LSHIFT;
            app.input.mod_state.rshift  = mod_value == KMOD_RSHIFT;
            app.input.mod_state.lctrl   = mod_value == KMOD_LCTRL;
            app.input.mod_state.rctrl   = mod_value == KMOD_RCTRL;
            app.input.mod_state.lalt    = mod_value == KMOD_LALT;
            app.input.mod_state.ralt    = mod_value == KMOD_RALT;
            app.input.mod_state.lmeta   = mod_value == KMOD_LGUI;
            app.input.mod_state.rmeta   = mod_value == KMOD_RGUI;

            app.input.mod_state.num     = mod_value == KMOD_NUM;
            app.input.mod_state.caps    = mod_value == KMOD_CAPS;
            app.input.mod_state.mode    = mod_value == KMOD_MODE;

            app.input.mod_state.ctrl    = (mod_value == KMOD_CTRL  || mod_value == KMOD_LCTRL  || mod_value == KMOD_RCTRL);
            app.input.mod_state.shift   = (mod_value == KMOD_SHIFT || mod_value == KMOD_LSHIFT || mod_value == KMOD_RSHIFT);
            app.input.mod_state.alt     = (mod_value == KMOD_ALT   || mod_value == KMOD_LALT   || mod_value == KMOD_RALT);
            app.input.mod_state.meta    = (mod_value == KMOD_GUI   || mod_value == KMOD_LGUI   || mod_value == KMOD_RGUI);

        return app.input.mod_state;

    } //to_key_mod

} //Runtime

typedef WindowHandle = sdl.Window;

typedef RuntimeConfig = {
    
    //:todo: potential sdl runtime config

} //RuntimeConfig