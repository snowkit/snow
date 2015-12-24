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
            case unknown:  'unknown';
            case custom:  'custom';
            case ogg:  'ogg';
            case wav:  'wav';
            case pcm:  'pcm';
            case _: '$this';
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

    inline function toString() return 'AudioInfo{ id($id) format($format) is_stream($is_stream) data($data) }';

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

        /** Whether a stencil buffer should be created. default:false */
    @:optional var depth : Bool;
        /** Whether a stencil buffer should be created. default:false */
    @:optional var stencil : Bool;
        /** a value of `0`, `2`, `4`, `8` or other valid antialiasing flags. default: 0 */
    @:optional var antialiasing : Int;

        /** set the number of depth bits for the rendering to use. Unless you need to change this, don't. default: system */
    @:optional var depth_bits   : Int;
        /** set the number of red bits for the rendering to use. Unless you need to change this, don't. default: system */
    @:optional var stencil_bits   : Int;

        /** set the number of red bits for the rendering to use. Unless you need to change this, don't. default: 8 */
    @:optional var red_bits   : Int;
        /** set the number of green bits for the rendering to use. Unless you need to change this, don't. default: 8 */
    @:optional var green_bits   : Int;
        /** set the number of blue bits for the rendering to use. Unless you need to change this, don't. default: 8 */
    @:optional var blue_bits   : Int;
        /** set the number of alpha bits for the rendering to use. Unless you need to change this, don't. default: 8 */
    @:optional var alpha_bits   : Int;

        /** OpenGL render context specific settings */
    @:optional var opengl : RenderConfigOpenGL;

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


@:noCompletion typedef WindowingConfig = {
    config:WindowConfig,
    render_config:RenderConfig
}

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

/** A system event */
class SystemEvent {

        /** The type of system event this event is. SystemEventType */
    public var type (default,null) : SystemEventType;
        /** If type is `window` this will be populated, otherwise null */
    public var window (default,null) : WindowEvent;

    @:allow(snow.Snow)
    function new() {}

    @:allow(snow.Snow)
    inline function set(_type:SystemEventType, _window:WindowEvent) {
        type = _type;
        window = _window;
    }

    function toString() return 'SystemEvent{ type($type) window($window) }';

} //SystemEvent

/** A system window event */
class WindowEvent {

        /** The type of window event this was. */
    public var type (default,null) : WindowEventType = unknown;
        /** The time in seconds that this event occured, useful for deltas */
    public var timestamp (default,null) : Float = 0.0;
        /** The window id from which this event originated */
    public var window_id (default,null) : Int = -1;
        /** Potential window event data */
    public var data1 (default,null) : Null<Int>;
        /** Potential window event data */
    public var data2 (default,null) : Null<Int>;
        /** A convenience getter for data1 */
    public var x (get,never) : Null<Int>; inline function get_x() return data1;
        /** A convenience getter for data2 */
    public var y (get,never) : Null<Int>; inline function get_y() return data2;

    public function new() {}

    @:allow(snow.runtime.Runtime)
    inline function set(_type:WindowEventType, _timestamp:Float, _window_id:Int, ?_data1:Null<Int>, ?_data2:Null<Int>) {
        type = _type;
        timestamp = _timestamp;
        window_id = _window_id;
        data1 = _data1;
        data2 = _data2;
    }

    function toString() return 'WindowEvent{ type($type) window($window_id) data1($data1), data2($data2) time($timestamp) }';

} //WindowEvent

/** A text specific event event type */
@:enum abstract TextEventType(Int) from Int to Int {

        /** An unknown text event */
    var unknown    = 0;
        /** An edit text typing event */
    var edit    = 1;
        /** An input text typing event */
    var input   = 2;

    inline function toString() {
        return switch(this) {
            case unknown: 'unknown';
            case edit:    'edit';
            case input:   'input';
            case _:       '$this';
        }
    } //toString

} //TextEventType

/** A gamepad device event type */
@:enum abstract GamepadDeviceEventType(Int) from Int to Int {

        /** A unknown device event */
    var unknown             = 0;
        /** A device added event */
    var device_added        = 1;
        /** A device removed event */
    var device_removed      = 2;
        /** A device was remapped */
    var device_remapped     = 3;

    inline function toString() {
        return switch(this) {
            case unknown:         'unknown';
            case device_added:    'device_added';
            case device_removed:  'device_removed';
            case device_remapped: 'device_remapped';
            case _:               '$this';
        }
    } //toString

} //GamepadDeviceEventType


/** Input modifier state */
typedef ModState = {

        /** no modifiers are down */
    var none : Bool;
        /** left shift key is down */
    var lshift : Bool;
        /** right shift key is down */
    var rshift : Bool;
        /** left ctrl key is down */
    var lctrl : Bool;
        /** right ctrl key is down */
    var rctrl : Bool;
        /** left alt/option key is down */
    var lalt : Bool;
        /** right alt/option key is down */
    var ralt : Bool;
        /** left windows/command key is down */
    var lmeta : Bool;
        /** right windows/command key is down */
    var rmeta : Bool;
        /** numlock is enabled */
    var num : Bool;
        /** capslock is enabled */
    var caps : Bool;
        /** mode key is down */
    var mode : Bool;
        /** left or right ctrl key is down */
    var ctrl : Bool;
        /** left or right shift key is down */
    var shift : Bool;
        /** left or right alt/option key is down */
    var alt : Bool;
        /** left or right windows/command key is down */
    var meta : Bool;

} //ModState


@:enum abstract SystemEventType(Int) from Int to Int {

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

} //WindowEvent

@:enum abstract InputEventType(Int) from Int to Int {

        /** An unknown input event */
    var unknown        = 0;
        /** An keyboard input event */
    var key            = 1;
        /** An mouse input event */
    var mouse          = 2;
        /** An touch input event */
    var touch          = 3;
        /** An joystick input event. On mobile, accellerometer is a joystick (for now) */
    var joystick       = 4;
        /** An controller input event. Use these instead of joystick on desktop. */
    var controller     = 5;

    inline function toString() {
        return switch(this) {
            case unknown:       'unknown';
            case key:           'key';
            case mouse:         'mouse';
            case touch:         'touch';
            case joystick:      'joystick';
            case controller:    'controller';
            case _:             '$this';
        }
    } //toString

} //InputEvent

