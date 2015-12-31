package snow.types;

import snow.api.buffers.Uint8Array;


//These types include further types we don't want to
#if !macro
    typedef Asset      = snow.systems.assets.Asset.Asset;
    typedef AssetBytes = snow.systems.assets.Asset.AssetBytes;
    typedef AssetText  = snow.systems.assets.Asset.AssetText;
    typedef AssetJSON  = snow.systems.assets.Asset.AssetJSON;
    typedef AssetImage = snow.systems.assets.Asset.AssetImage;
    typedef AssetAudio = snow.systems.assets.Asset.AssetAudio;
    typedef Key        = snow.systems.input.Keycodes.Keycodes;
    typedef Scan       = snow.systems.input.Keycodes.Scancodes;
#end

enum Error {
    error(value:Dynamic);
    init(value:Dynamic);
    parse(value:Dynamic);
    windowing(value:Dynamic);
}

/** A platform identifier string */
@:enum abstract Platform(String) from String to String {
    var platform_unknown = 'unknown';
    var platform_windows = 'windows';
    var platform_mac     = 'mac';
    var platform_linux   = 'linux';
    var platform_android = 'android';
    var platform_ios     = 'ios';
    var platform_web     = 'web';
}

/** A platform identifier string */
@:enum abstract OS(String) from String to String {
    var os_unknown = 'unknown';
    var os_windows = 'windows';
    var os_mac     = 'mac';
    var os_linux   = 'linux';
    var os_android = 'android';
    var os_ios     = 'ios';
}

/** A type to identify assets when stored as an Asset */
@:enum abstract AssetType(Int) from Int to Int {

    var unknown = 0;
    var bytes   = 1;
    var text    = 2;
    var json    = 3;
    var image   = 4;
    var audio   = 5;

    inline function toString() {
        return switch(this) {
            case unknown: 'unknown';
            case bytes:   'bytes';
            case text:    'text';
            case json:    'json';
            case image:   'image';
            case audio:   'audio';
            case _:       '$this';
        }
    } //toString

} //AssetType

typedef IODataOptions = {
    @:optional var binary:Bool;
}


@:genericBuild(snow.types.TypeCreate.build())
private class ApplyType<Const> {}

private typedef UserConfigInit = ApplyType<"UserConfig">;
typedef UserConfig = UserConfigDef;

private typedef RuntimeConfigInit = ApplyType<"RuntimeConfig">;
typedef RuntimeConfig = RuntimeConfigDef;

//:todo: snow_native define use
#if snow_native
    private typedef FileHandleInit = ApplyType<"FileHandle">;
    typedef FileHandle = FileHandleDef;
#end

private typedef WindowHandleInit = ApplyType<"WindowHandle">;
typedef WindowHandle = WindowHandleDef;

private typedef AppHostInit = ApplyType<"AppHost">;
@:noCompletion typedef AppHost = AppHostDef;

private typedef AppRuntimeInit = ApplyType<"AppRuntime">;
@:noCompletion typedef AppRuntime = AppRuntimeDef;

private typedef ModuleIOInit = ApplyType<"ModuleIO">;
@:noCompletion typedef ModuleIO = ModuleIODef;

private typedef ModuleAudioInit = ApplyType<"ModuleAudio">;
@:noCompletion typedef ModuleAudio = ModuleAudioDef;

private typedef ModuleAssetsInit = ApplyType<"ModuleAssets">;
@:noCompletion typedef ModuleAssets = ModuleAssetsDef;


/** The runtime application config info */
typedef AppConfig = {

        /** the window config for the default window. default: see `WindowConfig` docs*/
    @:optional var window       : WindowConfig;
        /** The render config that specifies rendering and context backend specifics.  */
    @:optional var render       : RenderConfig;
        /** The user specific config, by default, read from a json file at runtime */
    @:optional var user         : UserConfig;
        /** The runtime specific config */
    @:optional var runtime      : RuntimeConfig;

} //AppConfig


typedef FileFilter = {

        /** An extension for the filter. i.e `md`, `txt`, `png` or a special `*` for any file type.  */
    var extension:String;
        /** An optional description for this filter i.e `markdown files`, `text files`, `all files` */
    @:optional var desc:String;

} //FileFilter


/** Information about an image file/data */
typedef ImageInfo = {

        /** source asset id */
    var id : String;
        /** image width from source image */
    var width : Int;
        /** image height from source image */
    var height : Int;
        /** The actual width, used when image is automatically padded to POT */
    var width_actual : Int;
        /** The actual height, used when image is automatically padded to POT */
    var height_actual : Int;
        /** used bits per pixel */
    var bpp : Int;
        /** source bits per pixel */
    var bpp_source : Int;
        /** image pixel data */
    var pixels : Uint8Array;

} //ImageInfo

/** An audio handle for tracking audio instances */
typedef AudioHandle = Int;

/** The type of audio format */
@:enum abstract AudioFormatType(Null<Int>) from Null<Int> to Null<Int> {

    var unknown  = 0;
    var custom   = 1;
    var ogg      = 2;
    var wav      = 3;
    var pcm      = 4;

    inline function toString() {
        return switch(this) {
            case unknown:   'unknown';
            case custom:    'custom';
            case ogg:       'ogg';
            case wav:       'wav';
            case pcm:       'pcm';
            case _:         '$this';
        }
    }

} //AudioFormatType


@:enum abstract AudioEvent(Int)
    from Int to Int {
        var ae_end = 0;
        var ae_destroyed = 1;
        var ae_destroyed_source = 2;
} //AudioEvent

@:enum abstract AudioState(Int)
    from Int to Int {
        var as_invalid  = -1;
        var as_paused   = 0;
        var as_playing  = 1;
        var as_stopped  = 2;

    inline function toString() {
        return switch(this) {
            case as_invalid:    'as_invalid';
            case as_paused:     'as_paused';
            case as_playing:    'as_playing';
            case as_stopped:    'as_stopped';
            case _:             '$this';
        }
    } //toString
} //AudioState

    /** The platform specific implementation detail about the audio data */
typedef AudioData = {

        /** the file length in bytes */
    @:optional var length : Int;
        /** the pcm uncompressed raw length in bytes */
    var length_pcm : Int;
        /** number of channels */
    var channels : Int;
        /** hz rate */
    var rate : Int;
        /** bits per sample, 8 / 16 */
    var bits_per_sample : Int;
        /** sound bitrate */
    @:optional var bitrate : Int;
        /** sound raw data */
    @:optional var samples : Uint8Array;

} //AudioData


typedef AudioInfoOptions = {
    app:snow.Snow,
    data:AudioData,
    ?id:String,
    ?format:AudioFormatType,
    ?is_stream:Bool
};

/** Information about an audio file/data */
@:allow(snow.systems.audio.AudioInstance)
class AudioInfo {

        /** access to the api */
    public var app : snow.Snow;
        /** the platform audio data info */
    public var data : AudioData;
        /** file source id */
    public var id : String;
        /** format. Use AudioFormatType */
    public var format : AudioFormatType;
        /** Whether or not this relates to streaming purposes, this a convenience only from load apis */
    public var is_stream : Bool;

    inline public function new(_opt:AudioInfoOptions) {
        app = _opt.app;
        data = _opt.data;
        id = _opt.id;
        format = _opt.format;
        is_stream = _opt.is_stream;
    }

    inline function toString() return '{ "AudioInfo":true, "id":$id, "format":"$format", "is_stream":$is_stream, data:$data }';

    public function destroy() {

    }

    function seek(_to:Int) : Bool {
        return false;
    }

    function portion(_into:Uint8Array, _start:Int, _len:Int, _into_result:Array<Int>) : Array<Int> {
        return _into_result;
    }

} //AudioInfo


/** Config specific to the rendering context that would be used when creating windows */
typedef RenderConfig = {

        /** Request the number of depth bits for the rendering context.
            A value of 0 will not request a depth buffer. default: 0 */
    @:optional var depth   : Int;
        /** Request the number of stencil bits for the rendering context.
            A value of 0 will not request a stencil buffer. default: 0 */
    @:optional var stencil   : Int;
        /** A value of `0`, `2`, `4`, `8` or other valid system value.
            On WebGL contexts this value is true or false, bigger than 0 being true.
            On native contexts this value sets the MSAA typically.
            default webgl: 1 (enabled)
            default: 0 */
    @:optional var antialiasing : Int;

        /** Request a specific number of red bits for the rendering context.
            Unless you need to change this, don't. default: 8 */
    @:optional var red_bits   : Int;
        /** Request a specific number of green bits for the rendering context.
            Unless you need to change this, don't. default: 8 */
    @:optional var green_bits   : Int;
        /** Request a specific number of blue bits for the rendering context.
            Unless you need to change this, don't. default: 8 */
    @:optional var blue_bits   : Int;
        /** Request a specific number of alpha bits for the rendering context.
            Unless you need to change this, don't. default: 8 */
    @:optional var alpha_bits   : Int;

        /** OpenGL render context specific settings */
    @:optional var opengl : RenderConfigOpenGL;
        /** WebGL render context specific settings */
    @:optional var webgl : RenderConfigWebGL;

} //RenderConfig


/** A type of OpenGL context profile to request. see RenderConfigOpenGL for info */
@:enum abstract OpenGLProfile(Int) from Int to Int {

    var compatibility = 0;
    var core = 1;
    var gles = 2;

    inline function toString() {
        return switch(this) {
            case compatibility: 'compatibility';
            case core:          'core';
            case gles:          'gles';
            case _:             '$this';
        }
    } //toString

} //OpenGLProfile


/** Config specific to an OpenGL rendering context.
    Note that these are hints to the system,
    you must always check the values after initializing
    for what you actually received. The OS/driver decides. */
typedef RenderConfigOpenGL = {

        /** The major OpenGL version to request */
    @:optional var major : Int;
        /** The minor OpenGL version to request */
    @:optional var minor : Int;
        /** The OpenGL context profile to request */
    @:optional var profile : OpenGLProfile;

} //RenderConfigOpenGL

/** Config specific to a WebGL rendering context.
    See: https://www.khronos.org/registry/webgl/specs/latest/1.0/#WEBGLCONTEXTATTRIBUTES */
typedef RenderConfigWebGL = {

        /** The WebGL version to request. default: 1 */
    @:optional var version : Int;
        /** If the value is true, the drawing buffer has an alpha channel for the
            purposes of performing OpenGL destination alpha operations and
            compositing with the page. If the value is false, no alpha buffer is available.
            snow default: false
            webgl default:true */
    @:optional var alpha : Bool;
        /** If the value is true, the drawing buffer has a depth buffer of at least 16 bits.
            If the value is false, no depth buffer is available.
            snow default: uses render config depth flag
            webgl default:true */
    @:optional var depth : Bool;
        /** If the value is true, the drawing buffer has a stencil buffer of at least 8 bits.
            If the value is false, no stencil buffer is available.
            snow default: uses render config stencil flag
            webgl default: false */
    @:optional var stencil : Bool;
        /** If the value is true and the implementation supports antialiasing the drawing buffer
            will perform antialiasing using its choice of technique (multisample/supersample) and quality.
            If the value is false or the implementation does not support
            antialiasing, no antialiasing is performed
            snow default: uses render config antialias flag
            webgl default: true */
    @:optional var antialias : Bool;
        /** If the value is true the page compositor will assume the drawing buffer contains colors with premultiplied alpha.
            If the value is false the page compositor will assume that colors in the drawing buffer are not premultiplied.
            This flag is ignored if the alpha flag is false.
            snow default: false
            webgl default: true */
    @:optional var premultipliedAlpha : Bool;
        /** If false, once the drawing buffer is presented as described in theDrawing Buffer section,
            the contents of the drawing buffer are cleared to their default values. All elements of the
            drawing buffer (color, depth and stencil) are cleared. If the value is true the buffers will
            not be cleared and will preserve their values until cleared or overwritten by the author.
            On some hardware setting the preserveDrawingBuffer flag to true can have significant performance implications.
            snow default: uses webgl default
            webgl default: false */
    @:optional var preserveDrawingBuffer : Bool;
        /** Provides a hint to the implementation suggesting that, if possible, it creates a context
            that optimizes for power consumption over performance. For example, on hardware that has more
            than one GPU, it may be the case that one of them is less powerful but also uses less power.
            An implementation may choose to, and may have to, ignore this hint.
            snow default: uses webgl default
            webgl default: false */
    @:optional var preferLowPowerToHighPerformance : Bool;
        /** If the value is true, context creation will fail if the implementation determines that the
            performance of the created WebGL context would be dramatically lower than that of a native
            application making equivalent OpenGL calls.
            snow default: uses webgl default
            webgl default: false */
    @:optional var failIfMajorPerformanceCaveat : Bool;

} //RenderConfigWebGL

/** Window configuration information for creating windows */
typedef WindowConfig = {

        /** create in fullscreen, default: false, `mobile` true */
    @:optional var fullscreen   : Bool;
        /** If true, the users native desktop resolution will be used for fullscreen instead of the specified window size. default: true */
    @:optional var fullscreen_desktop : Bool;
        /** allow the window to be resized, default: true */
    @:optional var resizable    : Bool;
        /** create as a borderless window, default: false */
    @:optional var borderless   : Bool;
        /** window x at creation. Leave this alone to use the OS default. */
    @:optional var x            : Int;
        /** window y at creation. Leave this alone to use the OS default. */
    @:optional var y            : Int;
        /** window width at creation, default: 960 */
    @:optional var width        : Int;
        /** window height at creation, default: 640 */
    @:optional var height       : Int;
        /** window title, default: 'snow app' */
    @:optional var title        : String;
        /** disables input arriving at/from this window. default: false */
    @:optional var no_input     : Bool;

} //WindowConfig


//Event types

    /** A system event */
    @:allow(snow.Snow)
    class SystemEvent {
     //
            /** The type of system event this event is. SystemEventType */
        public var type (default,null) : SystemEventType;
            /** If type is `window` this will be populated, otherwise null */
        public var window (default,null) : WindowEvent;
            /** If type is `input` this will be populated, otherwise null */
        public var input (default,null) : InputEvent;

        inline function new() {}

        inline function set(_type:SystemEventType, _window:WindowEvent, _input:InputEvent) {
            type = _type;
            window = _window;
            input = _input;
        }

        inline function toString() {
            var _s = '{ "SystemEvent":true, "type":"$type"';
            if(window != null) _s += ', "window":$window';
            if(input != null) _s += ', "input":$input';
            _s += ' }';
            return _s;
        }

    } //SystemEvent

    /** A system window event */
    @:allow(snow.Snow)
    class WindowEvent {
     //
            /** The type of window event this was. */
        public var type (default,null) : WindowEventType = unknown;
            /** The time in seconds that this event occured, useful for deltas */
        public var timestamp (default,null) : Float = 0.0;
            /** The window id from which this event originated */
        public var window_id (default,null) : Int = -1;
            /** Potential window event data */
        public var x (default,null) : Null<Int>;
            /** Potential window event data */
        public var y (default,null) : Null<Int>;

        inline function new() {}

        inline function set(_type:WindowEventType, _timestamp:Float, _window_id:Int, ?_x:Null<Int>, ?_y:Null<Int>) {
            type = _type;
            timestamp = _timestamp;
            window_id = _window_id;
            x = _x;
            y = _y;
        }

        inline function toString() return '{ "WindowEvent":true, "type":"$type", "window":$window_id, "x":$x, "y":$y, "time":$timestamp }';

    } //WindowEvent

    @:allow(snow.systems.input.Input)
    class KeyEvent {

        public var type (default,null): Null<KeyEventType>;
        public var keycode (default,null): Null<Int>;
        public var scancode (default,null): Null<Int>;
        public var repeat (default,null): Null<Bool>;
        public var mod (default,null): ModState;

        inline function new() {}

        inline function set(_type:KeyEventType, _keycode:Int, _scancode:Int, _repeat:Bool, _mod:ModState) {
            type = _type;
            keycode = _keycode;
            scancode = _scancode;
            repeat = _repeat;
            mod = _mod;
        }

        inline function toString() return '{ "KeyEvent":true, "type":"$type", "keycode":$keycode, "scancode":$scancode, "repeat":$repeat, "mod":$mod }';

    } //KeyEvent

    @:allow(snow.systems.input.Input)
    class TextEvent {

        public var type (default, null): Null<TextEventType>;
        public var text (default, null): String;
        public var start (default, null): Null<Int>;
        public var length (default, null): Null<Int>;

        inline function new() {}

        @:allow(snow.core.Runtime)
        inline function set(_type:TextEventType, _text:String, _start:Int, _length:Int) {
            type = _type;
            text = _text;
            start = _start;
            length = _length;
        }

        inline function toString() return '{ "TextEvent":true, "type":"$type", "text":"$text", "start":$start, "length":$length }';

    } //TextEvent

    @:allow(snow.systems.input.Input)
    class MouseEvent {
        public var type (default, null): MouseEventType;
        public var x (default, null): Int;
        public var y (default, null): Int;
        public var x_rel (default, null): Int;
        public var y_rel (default, null): Int;
        public var button (default, null): Int;
        public var wheel_x (default, null): Float;
        public var wheel_y (default, null): Float;

        inline function new() {}

        inline function set(_type:MouseEventType, _x:Int, _y:Int, _x_rel:Int, _y_rel:Int, _button:Int, _wheel_x:Float, _wheel_y:Float) {
            type = _type;
            x = _x;
            y = _y;
            x_rel = _x_rel;
            y_rel = _y_rel;
            button = _button;
            wheel_x = _wheel_x;
            wheel_y = _wheel_y;
        }

        inline function toString() return '{ "MouseEvent":true, "type":"$type", "x":$x, "y":$y, "button":$button, "x_rel":$x_rel, "y_rel":$y_rel, "wheel_x":$wheel_x, "wheel_y":$wheel_y }';

    } //MouseEvent

    @:allow(snow.systems.input.Input)
    class TouchEvent {

        public var type (default,null): TouchEventType;
        public var touch_id (default,null): Int;
        public var x (default,null): Float;
        public var y (default,null): Float;
        public var dx (default,null): Float;
        public var dy (default,null): Float;

        inline function new() {}

        inline function set(_type:TouchEventType, _id:Int, _x:Float, _y:Float, _dx:Float, _dy:Float) {
            type = _type;
            touch_id = _id;
            x = _x;
            y = _y;
            dx = _dx;
            dy = _dy;
        }

        inline function toString() return '{ "TouchEvent":true, "type":"$type", "touch_id":$touch_id, "x":$x, "y":$y, "dx":$dx, "dy":$dy }';

    } //TouchEvent

    @:allow(snow.systems.input.Input)
    class GamepadEvent {

        public var type (default,null): GamepadEventType;
        public var gamepad (default,null): Int;
        public var axis (default,null): Null<Int>;
        public var button (default,null): Null<Int>;
        public var value (default,null): Null<Float>;
        public var device_id (default,null): String;
        public var device_event (default,null): Null<GamepadDeviceEventType>;

        inline function new() {}

        inline function set_axis(_gamepad:Int, _axis:Int, _value:Float) {
            button = null;
            device_id = null;
            device_event = null;

            axis    = _axis;
            value   = _value;
            type    = ge_axis;
            gamepad = _gamepad;
        } //set_axis

        inline function set_button(_type:GamepadEventType, _gamepad:Int, _button:Int, _value:Float) {
            axis = null;
            device_id = null;
            device_event = null;

            type    = _type;
            value   = _value;
            button  = _button;
            gamepad = _gamepad;
        } //set_button

        inline function set_device(_gamepad:Int, _id:String, _event:GamepadDeviceEventType) {
            axis = null;
            value = null;
            button = null;

            device_id    = _id;
            device_event = _event;
            gamepad      = _gamepad;
            type         = ge_device;
        } //set_device

        inline function toString() return '{ "GamepadEvent":true, "type":"$type", "gamepad":$gamepad, "axis":$axis, "button":$button, "value":$value, "device_id":"$device_id", "device_event":"$device_event" }';

    } //GamepadEvent

    @:allow(snow.systems.input.Input)
    class InputEvent {
     //
            /** The type of input event this was. */
        public var type (default,null) : InputEventType;
            /** The time in seconds that this event occured, useful for deltas. 0.0 if not specified */
        public var timestamp (default,null) : Float = 0.0;
            /** The window id from which this event originated, if any. -1 if not specified */
        public var window_id (default,null) : Int = -1;
            /** Populated if the event type is ie_key, otherwise null */
        public var key (default,null) : KeyEvent;
            /** Populated if the event type is ie_text, otherwise null */
        public var text (default,null) : TextEvent;
            /** Populated if the event type is ie_mouse, otherwise null */
        public var mouse (default,null) : MouseEvent;
            /** Populated if the event type is ie_touch, otherwise null */
        public var touch (default,null) : TouchEvent;
            /** Populated if the event type is ie_gamepad, otherwise null */
        public var gamepad (default,null) : GamepadEvent;

        function new() {}

        inline function reset(_type:InputEventType, _window_id:Int, _timestamp:Float) {

            type = _type;
            key = null;
            text = null;
            mouse = null;
            touch = null;
            gamepad = null;
            window_id = _window_id;
            timestamp = _timestamp;

        } //reset

        inline function set_key(_event:KeyEvent, _window_id:Int, _timestamp:Float) {
            reset(ie_key, _window_id, _timestamp);
            key = _event;
        } //set_key

        inline function set_text(_event:TextEvent, _window_id:Int, _timestamp:Float) {
            reset(ie_text, _window_id, _timestamp);
            text = _event;
        } //set_text

        inline function set_mouse(_event:MouseEvent, _window_id:Int, _timestamp:Float) {
            reset(ie_mouse, _window_id, _timestamp);
            mouse = _event;
        } //set_mouse

        inline function set_touch(_event:TouchEvent, _timestamp:Float) {
            reset(ie_touch, 0, _timestamp);
            touch = _event;
        } //set_touch

        inline function set_gamepad(_event:GamepadEvent, _timestamp:Float) {
            reset(ie_gamepad, 0, _timestamp);
            gamepad = _event;
        } //set_gamepad

        inline function toString() {
            var _s = '{ "InputEvent":true, "type":"$type"';

                if(key != null)     _s += ', "key":$key';
                if(text != null)    _s += ', "text":$text';
                if(mouse != null)   _s += ', "mouse":$mouse';
                if(touch != null)   _s += ', "touch":$touch';
                if(gamepad != null) _s += ', "gamepad":$gamepad';

                _s += '"window":$window_id, "time":$timestamp }';

            return _s;
        }

    } //InputEvent

    /** Input modifier state */
    @:publicFields
    class ModState {

        @:allow(snow)
        private inline function new() {}

            /** no modifiers are down */
        var none : Bool = false;
            /** left shift key is down */
        var lshift : Bool = false;
            /** right shift key is down */
        var rshift : Bool = false;
            /** left ctrl key is down */
        var lctrl : Bool = false;
            /** right ctrl key is down */
        var rctrl : Bool = false;
            /** left alt/option key is down */
        var lalt : Bool = false;
            /** right alt/option key is down */
        var ralt : Bool = false;
            /** left windows/command key is down */
        var lmeta : Bool = false;
            /** right windows/command key is down */
        var rmeta : Bool = false;
            /** numlock is enabled */
        var num : Bool = false;
            /** capslock is enabled */
        var caps : Bool = false;
            /** mode key is down */
        var mode : Bool = false;
            /** left or right ctrl key is down */
        var ctrl : Bool = false;
            /** left or right shift key is down */
        var shift : Bool = false;
            /** left or right alt/option key is down */
        var alt : Bool = false;
            /** left or right windows/command key is down */
        var meta : Bool = false;

        inline function toString() {

            var _s = '{ "ModState":true ';

            if(none) return _s + ', "none":true }';

                if(lshift) _s += ', "lshift":true';
                if(rshift) _s += ', "rshift":true';
                if(lctrl)  _s += ', "lctrl":true';
                if(rctrl)  _s += ', "rctrl":true';
                if(lalt)   _s += ', "lalt":true';
                if(ralt)   _s += ', "ralt":true';
                if(lmeta)  _s += ', "lmeta":true';
                if(rmeta)  _s += ', "rmeta":true';
                if(num)    _s += ', "num":true';
                if(caps)   _s += ', "caps":true';
                if(mode)   _s += ', "mode":true';
                if(ctrl)   _s += ', "ctrl":true';
                if(shift)  _s += ', "shift":true';
                if(alt)    _s += ', "alt":true';
                if(meta)   _s += ', "meta":true';

            _s += '}';

            return _s;

        } //toString

    } //ModState

//Event Type enums

    /** A key specific event event type */
    @:enum abstract KeyEventType(Int) from Int to Int {
        var ke_unknown  = 0;
        var ke_down     = 1;
        var ke_up       = 2;

        inline function toString() {
            return switch(this) {
                case ke_unknown: 'ke_unknown';
                case ke_down:    'ke_down';
                case ke_up:      'ke_up';
                case _:          '$this';
            }
        } //toString
    } //KeyEventType

    /** A mouse specific event event type */
    @:enum abstract MouseEventType(Int) from Int to Int {
        var me_unknown  = 0;
        var me_move     = 1;
        var me_down     = 2;
        var me_up       = 3;
        var me_wheel    = 4;

        inline function toString() {
            return switch(this) {
                case me_unknown:    'me_unknown';
                case me_move:       'me_move';
                case me_down:       'me_down';
                case me_up:         'me_up';
                case me_wheel:      'me_wheel';
                case _:             '$this';
            }
        } //toString
    } //MouseEventType

    /** A touch specific event event type */
    @:enum abstract TouchEventType(Int) from Int to Int {
        var te_unknown  = 0;
        var te_move     = 1;
        var te_down     = 2;
        var te_up       = 3;

        inline function toString() {
            return switch(this) {
                case te_unknown:    'te_unknown';
                case te_move:       'te_move';
                case te_down:       'te_down';
                case te_up:         'te_up';
                case _:             '$this';
            }
        } //toString
    } //TouchEventType

    /** A touch specific event event type */
    @:enum abstract GamepadEventType(Int) from Int to Int {
        var ge_unknown  = 0;
        var ge_axis     = 1;
        var ge_down     = 2;
        var ge_up       = 3;
        var ge_device   = 4;

        inline function toString() {
            return switch(this) {
                case ge_unknown:    'ge_unknown';
                case ge_axis:       'ge_axis';
                case ge_down:       'ge_down';
                case ge_up:         'ge_up';
                case ge_device:     'ge_device';
                case _:             '$this';
            }
        } //toString
    } //GamepadEventType

    /** A text specific event event type */
    @:enum abstract TextEventType(Int) from Int to Int {
        //
            /** An unknown text event */
        var te_unknown    = 0;
            /** An edit text typing event */
        var te_edit    = 1;
            /** An input text typing event */
        var te_input   = 2;

        inline function toString() {
            return switch(this) {
                case te_unknown: 'te_unknown';
                case te_edit:    'te_edit';
                case te_input:   'te_input';
                case _:          '$this';
            }
        } //toString
    } //TextEventType

    /** A gamepad device event type */
    @:enum abstract GamepadDeviceEventType(Int) from Int to Int {
        //
            /** A unknown device event */
        var ge_unknown             = 0;
            /** A device added event */
        var ge_device_added        = 1;
            /** A device removed event */
        var ge_device_removed      = 2;
            /** A device was remapped */
        var ge_device_remapped     = 3;

        inline function toString() {
            return switch(this) {
                case ge_unknown:         'ge_unknown';
                case ge_device_added:    'ge_device_added';
                case ge_device_removed:  'ge_device_removed';
                case ge_device_remapped: 'ge_device_remapped';
                case _:                  '$this';
            }
        } //toString
    } //GamepadDeviceEventType

    @:enum abstract SystemEventType(Int) from Int to Int {
        //
            /** An unknown system event */
        var se_unknown                  = 0;
            /** An system init event */
        var se_init                     = 1;
            /** An system ready event */
        var se_ready                    = 2;
            /** An system tick event */
        var se_tick                     = 3;
            /** An system freeze event */
        var se_freeze                   = 4;
            /** An system unfreeze event */
        var se_unfreeze                 = 5;
            /** An system pause event */
        var se_suspend                  = 6;
            /** An system shutdown event */
        var se_shutdown                 = 7;
            /** An system window event */
        var se_window                   = 8;
            /** An system input event */
        var se_input                    = 9;

            //snow application events

            /** An system quit event. Initiated by user, can be cancelled/ignored */
        var se_quit                       = 10;
            /** An system terminating event, called by the OS (mobile specific) */
        var se_app_terminating            = 11;
            /** An system low memory event, clear memory if you can. Called by the OS (mobile specific) */
        var se_app_lowmemory              = 12;
            /** An event for just before the app enters the background, called by the OS (mobile specific) */
        var se_app_willenterbackground    = 13;
            /** An event for when the app enters the background, called by the OS (mobile specific) */
        var se_app_didenterbackground     = 14;
            /** An event for just before the app enters the foreground, called by the OS (mobile specific) */
        var se_app_willenterforeground    = 15;
            /** An event for when the app enters the foreground, called by the OS (mobile specific) */
        var se_app_didenterforeground     = 16;


        inline function toString() {
            return switch(this) {
                case se_unknown:                    'se_unknown';
                case se_init:                       'se_init';
                case se_ready:                      'se_ready';
                case se_tick:                       'se_tick';
                case se_freeze:                     'se_freeze';
                case se_unfreeze:                   'se_unfreeze';
                case se_shutdown:                   'se_shutdown';
                case se_window:                     'se_window';
                case se_input:                      'se_input';
                case se_quit:                       'se_quit';
                case se_app_terminating:            'se_app_terminating';
                case se_app_lowmemory:              'se_app_lowmemory';
                case se_app_willenterbackground:    'se_app_willenterbackground';
                case se_app_didenterbackground:     'se_app_didenterbackground';
                case se_app_willenterforeground:    'se_app_willenterforeground';
                case se_app_didenterforeground:     'se_app_didenterforeground';
                case _:                             '$this';
            }
        } //toString
    } //SystemEventType

    @:enum abstract WindowEventType(Int) from Int to Int {
        //
            /** An unknown window event */
        var unknown          = 0;
            /** A window is created */
        var created          = 1;
            /** A window is shown */
        var shown            = 2;
            /** A window is hidden */
        var hidden           = 3;
            /** A window is exposed */
        var exposed          = 4;
            /** A window is moved */
        var moved            = 5;
            /** A window is resized, by the user or code. */
        var resized          = 6;
            /** A window is resized, by the OS or internals. */
        var size_changed     = 7;
            /** A window is minimized */
        var minimized        = 8;
            /** A window is maximized */
        var maximized        = 9;
            /** A window is restored */
        var restored         = 10;
            /** A window is entered by a mouse */
        var enter            = 11;
            /** A window is left by a mouse */
        var leave            = 12;
            /** A window has gained focus */
        var focus_gained     = 13;
            /** A window has lost focus */
        var focus_lost       = 14;
            /** A window is being closed/hidden */
        var close            = 15;
            /** A window is being destroyed */
        var destroy          = 16;

        inline function toString() {
            return switch(this) {
                case unknown:       'unknown';
                case created:       'created';
                case shown:         'shown';
                case hidden:        'hidden';
                case exposed:       'exposed';
                case moved:         'moved';
                case resized:       'resized';
                case size_changed:  'size_changed';
                case minimized:     'minimized';
                case maximized:     'maximized';
                case restored:      'restored';
                case enter:         'enter';
                case leave:         'leave';
                case focus_gained:  'focus_gained';
                case focus_lost:    'focus_lost';
                case close:         'close';
                case destroy:       'destroy';
                case _:             '$this';
            }
        } //toString
    } //WindowEventType

    @:enum abstract InputEventType(Int) from Int to Int {
        //
            /** An unknown input event */
        var ie_unknown        = 0;
            /** An keyboard input event */
        var ie_key            = 1;
            /** An keyboard text input event */
        var ie_text           = 2;
            /** An mouse input event */
        var ie_mouse          = 3;
            /** An touch input event */
        var ie_touch          = 4;
            /** An gamepad input event. */
        var ie_gamepad        = 5;
            /** An joystick input event. These are for older devices, and on mobile (for now): accellerometer */
        var ie_joystick       = 6;

        inline function toString() {
            return switch(this) {
                case ie_unknown:       'ie_unknown';
                case ie_key:           'ie_key';
                case ie_text:          'ie_text';
                case ie_mouse:         'ie_mouse';
                case ie_touch:         'ie_touch';
                case ie_gamepad:       'ie_gamepad';
                case ie_joystick:      'ie_joystick';
                case _:                '$this';
            }
        } //toString
    } //InputEventType


