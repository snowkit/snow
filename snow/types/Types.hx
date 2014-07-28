package snow.types;

import snow.Snow;
import snow.utils.ByteArray;
import snow.utils.UInt8Array;

import snow.assets.AssetImage;
import snow.assets.AssetText;
import snow.assets.AssetBytes;
import snow.assets.AssetAudio;

/**
Information for a single asset
*/
typedef AssetInfo = {

        /** the asset id */
    var id : String;
        /** the location of the asset */
    var path : String;
        /** the asset extension, if any */
    var ext : String;
        /** a convenience type indicator */
    var type : String;

} //AssetInfo

    /** A type to identify assets when stored as an Asset */
enum AssetType {

    bytes;
    text;
    image;
    audio;

} //AssetType


/**  The options for an `AssetBytes` asset. Get assets from the `Assets` class, via `app.assets` */
typedef AssetBytesOptions = {
    ? async : Bool,
    ? onload : AssetBytes -> Void
} //AssetBytesOptions

/**  The options for an `AssetText` asset. Get assets from the `Assets` class, via `app.assets` */
typedef AssetTextOptions = {
    ? async : Bool,
    ? onload : AssetText -> Void
} //AssetTextOptions

/**  The options for an `AssetImage` asset. Get assets from the `Assets` class, via `app.assets` */
typedef AssetImageOptions = {
    ? components : Int,
    ? onload : AssetImage -> Void,
    ? bytes : ByteArray
} //AssetImageOptions

/**  The options for an `AssetAudio` asset */
typedef AssetAudioOptions = {
    ? type : String,
    ? load : Bool,
    ? onload : AssetAudio -> Void
} //AssetAudioOptions


/** Snow specific configurations, set from build config */
typedef SnowConfig = {

        /** whether or not the core should run a loop at all, default: true */
    @:optional var has_loop : Bool;
        /** The default place to find the asset manifest file, default: `manifest` */
    @:optional var config_assets_path : String;
        /** The default place to find the runtime config file, default: `config.json` */
    @:optional var config_runtime_path : String;
        /** If set, no default runtime config will be loaded (use `App.config` to load a config manually). default: false */
    @:optional var config_custom_runtime : Bool;
        /** If set, no default asset list will be loaded (use `App.config` to load a config manually). default: false */
    @:optional var config_custom_assets : Bool;

} //SnowConfig

/** The application config info */
typedef AppConfig = {

        /** whether or not to create and run a default window, default: true */
    @:optional var has_window   : Bool;

        /** the window config for the default window, if `has_window` is true. default: see `WindowConfig` docs*/
    @:optional var window       : WindowConfig;
        /** the user specific config, by default, read from a json file at runtime */
    @:optional var runtime      : Dynamic;
        /** the raw list of assets. use the app.assets from Snow for access to these. read from a manifest file by default */
    @:optional var assets       : Array<AssetInfo>;

} //AppConfig


/**
Information about an image file/data

`id` : source asset id
`bpp` : used bits per pixel
`width` : image width
`height` : image height
`bpp_source` : source bits per pixel
`data` : image data

*/
typedef ImageInfo = {

    id : String,
    bpp : Int,
    width : Int,
    height : Int,
    width_actual : Int,
    height_actual : Int,
    bpp_source : Int,
    data : UInt8Array

} //ImageInfo

/** The type of audio format */
enum AudioFormatType {

    unknown;
    ogg;
    wav;
    pcm;

} //AudioFormatType

/**
Information about an audio file/data

`id` : file source
`format` : format
`channels` : number of channels
`rate` : hz rate
`bitrate` : sound bitrate
`bits_per_sample` : bits per sample, 8 / 16
`data` : sound raw data,
`length` : the file length in bytes
`length_pcm` : the pcm uncompressed raw length in bytes
`handle` : the native audio handle for later manipulation

*/
typedef AudioInfo = {

    id : String,
    format : AudioFormatType,
    channels : Int,
    rate : Int,
    bitrate : Int,
    bits_per_sample : Int,
    data : ByteArray,
    length : Int,
    length_pcm : Int,
    handle : Dynamic

} //AudioInfo

/**
Information about an audio portion requested via assets

`complete` : True if the file has reached the end in this blob
`data` : The data stored in this blob

*/
typedef AudioDataBlob = {

    data : ByteArray,
    complete : Bool

} //AudioDataBlob

/** Window configuration information for creating windows */
typedef WindowConfig = {

        /** create in fullscreen, default: false, `mobile` true */
    @:optional var fullscreen   : Bool;
        /** allow the window to be resized, default: true */
    @:optional var resizable    : Bool;
        /** create as a borderless window, default: false */
    @:optional var borderless   : Bool;
        /** a value of `0`, `2`, `4`, `8` or other valid antialiasing flags. default: 0 */
    @:optional var antialiasing : Int;
        /** create a stencil buffer at the specified bit depth (i.e `8` or `16` bit stencil buffer). default: 0 */
    @:optional var stencil_bits : Int;
        /** create a depth buffer at the specified bit depth (i.e `0` or `16` bit depth buffer) default: 0 */
    @:optional var depth_bits   : Int;
        /** window y at creation. Leave this alone to use the OS default. */
    @:optional var x            : Int;
        /** window x at creation. Leave this alone to use the OS default. */
    @:optional var y            : Int;
        /** window height at creation, default: 960 */
    @:optional var width        : Int;
        /** window width at creation, default: 640 */
    @:optional var height       : Int;
        /** window title, default: 'snow app' */
    @:optional var title        : String;
        /** disables input arriving at/from this window. default: false */
    @:optional var no_input     : Bool;

} //WindowConfig

/**
A system event.
Values below are null unless the event `type` matches. _i.e_ if type is `window`, the `window` value is not null, and so on */
typedef SystemEvent = {

    ? type : SystemEventType,
    ? window : WindowEvent,
    ? input : InputEvent,
    ? filewatch : FileWatchEvent

} //SystemEvent

/**
A system window event

`? type` : The type of window event this was
`? timestamp` : The time in seconds that this event occured, useful for deltas
`? window_id` : The window id from which this event originated
`? event` : The raw platform event data

*/
typedef WindowEvent = {

    ? type : WindowEventType,
    ? timestamp : Float,
    ? window_id : Int,
    ? event : Dynamic

} //WindowEvent

/** A file watch event */
typedef FileWatchEvent = {

    ? type : FileWatchEventType,
    ? timestamp : Float,
    ? path : String

} //FileWatchEvent

/**
A system input event

`? type` : The type of input event this was
`? timestamp` : The time in seconds that this event occured, useful for deltas
`? window_id` : The window id from which this event originated
`? event` : The raw platform event data

*/
typedef InputEvent = {

    ? type : InputEventType,
    ? timestamp : Float,
    ? window_id : Int,
    ? event : Dynamic

} //InputEvent

/** Information about a display mode */
typedef DisplayMode = {
    format : Int,
    refresh_rate : Int,
    width : Int,
    height : Int
}

    /** A platform window handle */
#if snow_html5
typedef WindowHandle = js.html.CanvasElement;
#else
typedef WindowHandle = Dynamic;
#end //snow_html5


/** A typed system event */
enum SystemEventType {

/** An unknown system event */
    unknown;
/** An internal system init event */
    init;
/** An internal system ready event */
    ready;
/** An internal system update event */
    update;
/** An system shutdown event */
    shutdown;
/** An system window event */
    window;
/** An system input event */
    input;
/** An system quit event. Initiated by user, can be cancelled/ignored */
    quit;
/** An system terminating event, called by the OS (mobile specific) */
    app_terminating;
/** An system low memory event, clear memory if you can. Called by the OS (mobile specific) */
    app_lowmemory;
/** An event for just before the app enters the background, called by the OS (mobile specific) */
    app_willenterbackground;
/** An event for when the app enters the background, called by the OS (mobile specific) */
    app_didenterbackground;
/** An event for just before the app enters the foreground, called by the OS (mobile specific) */
    app_willenterforeground;
/** An event for when the app enters the foreground, called by the OS (mobile specific) */
    app_didenterforeground;
/** An event for when the a file watch notification occurs */
    filewatch;


} //SystemEventType

enum FileWatchEventType {

/** An unknown watch event */
    unknown;
/** An event for when the a file is modified */
    modify;
/** An event for when the a file is removed */
    remove;
/** An event for when the a file is created */
    create;

} //FileWatchEventType

//Window stuff

/** A typed window event */
enum WindowEventType {

/** An unknown window event */
    unknown;
/** A window is created */
    window_created;
/** A window is shown */
    window_shown;
/** A window is hidden */
    window_hidden;
/** A window is exposed */
    window_exposed;
/** A window is moved */
    window_moved;
/** A window is resized, by the user or code. */
    window_resized;
/** A window is resized, by the OS or internals. */
    window_size_changed;
/** A window is minimized */
    window_minimized;
/** A window is maximized */
    window_maximized;
/** A window is restored */
    window_restored;
/** A window is entered by a mouse */
    window_enter;
/** A window is left by a mouse */
    window_leave;
/** A window has gained focus */
    window_focus_gained;
/** A window has lost focus */
    window_focus_lost;
/** A window is being closed */
    window_close;

} //WindowEventType

/** A typed input event */
enum InputEventType {

/** An unknown input event */
    unknown;
/** An keyboard input event */
    key;
/** An mouse input event */
    mouse;
/** An touch input event */
    touch;
/** An joystick input event. On mobile, accellerometer is a joystick (for now) */
    joystick;
/** An controller input event. Use these instead of joystick on desktop. */
    controller;

} //InputEventType

/** A text specific event event type */
enum TextEventType {

/** An edit text typing event */
    edit;
/** An input text typing event */
    input;

} //TextEventType

/** A gamepad device event type */
enum GamepadDeviceEventType {

/** A device added event */
    device_added;
/** A device removed event */
    device_removed;
/** A device was remapped */
    device_remapped;

} //GamepadEventType


/** Input modifier state */
typedef ModState = {

        /** `none` : no modifiers are down */
    var none : Bool;
        /** `lshift` : left shift key is down */
    var lshift : Bool;
        /** `rshift` : right shift key is down */
    var rshift : Bool;
        /** `lctrl` : left ctrl key is down */
    var lctrl : Bool;
        /** `rctrl` : right ctrl key is down */
    var rctrl : Bool;
        /** `lalt` : left alt/option key is down */
    var lalt : Bool;
        /** `ralt` : right alt/option key is down */
    var ralt : Bool;
        /** `lmeta` : left windows/command key is down */
    var lmeta : Bool;
        /** `rmeta` : right windows/command key is down */
    var rmeta : Bool;
        /** `num` : numlock is enabled */
    var num : Bool;
        /** `caps` : capslock is enabled */
    var caps : Bool;
        /** `mode` : mode key is down */
    var mode : Bool;
        /** `ctrl` : left or right ctrl key is down */
    var ctrl : Bool;
        /** `shift` : left or right shift key is down */
    var shift : Bool;
        /** `alt` : left or right alt/option key is down */
    var alt : Bool;
        /** `meta` : left or right windows/command key is down */
    var meta : Bool;

} //ModState


//Conversion helpers for native <-> snow events

@:noCompletion class SystemEvents {

        //snow core events

    public static var se_unknown                    = 0;
    public static var se_init                       = 1;
    public static var se_ready                      = 2;
    public static var se_update                     = 3;
    public static var se_shutdown                   = 4;
    public static var se_window                     = 5;
    public static var se_input                      = 6;

        //snow application events

    public static var se_quit                       = 7;
    public static var se_app_terminating            = 8;
    public static var se_app_lowmemory              = 9;
    public static var se_app_willenterbackground    = 10;
    public static var se_app_didenterbackground     = 11;
    public static var se_app_willenterforeground    = 12;
    public static var se_app_didenterforeground     = 13;
    public static var se_filewatch                  = 14;

//Helpers

    public static function typed(type:Int) : SystemEventType {

            if(type == se_init)                         return SystemEventType.init;
            if(type == se_ready)                        return SystemEventType.ready;
            if(type == se_update)                       return SystemEventType.update;
            if(type == se_shutdown)                     return SystemEventType.shutdown;
            if(type == se_window)                       return SystemEventType.window;
            if(type == se_input)                        return SystemEventType.input;

            if(type == se_quit)                         return SystemEventType.quit;
            if(type == se_app_terminating)              return SystemEventType.app_terminating;
            if(type == se_app_lowmemory)                return SystemEventType.app_lowmemory;
            if(type == se_app_willenterbackground)      return SystemEventType.app_willenterbackground;
            if(type == se_app_didenterbackground)       return SystemEventType.app_didenterbackground;
            if(type == se_app_willenterforeground)      return SystemEventType.app_willenterforeground;
            if(type == se_app_didenterforeground)       return SystemEventType.app_didenterforeground;
            if(type == se_filewatch)                    return SystemEventType.filewatch;

        return SystemEventType.unknown;

    } //typed

} //SystemEvents

@:noCompletion class WindowEvents {

//window events

    public static var we_unknown          = 0;
    public static var we_created          = 1;
    public static var we_shown            = 2;
    public static var we_hidden           = 3;
    public static var we_exposed          = 4;
    public static var we_moved            = 5;
    public static var we_resized          = 6;
    public static var we_size_changed     = 7;
    public static var we_minimized        = 8;
    public static var we_maximized        = 9;
    public static var we_restored         = 10;
    public static var we_enter            = 11;
    public static var we_leave            = 12;
    public static var we_focus_gained     = 13;
    public static var we_focus_lost       = 14;
    public static var we_close            = 15;

//Helpers

        /** returns a typed `WindowEventType` from an integer ID, for communication between internal native + haxe code */
    public static function typed(type:Int) : WindowEventType {

            if(type == we_created)        return WindowEventType.window_created;
            if(type == we_shown)          return WindowEventType.window_shown;
            if(type == we_hidden)         return WindowEventType.window_hidden;
            if(type == we_exposed)        return WindowEventType.window_exposed;
            if(type == we_moved)          return WindowEventType.window_moved;
            if(type == we_resized)        return WindowEventType.window_resized;
            if(type == we_size_changed)   return WindowEventType.window_size_changed;
            if(type == we_minimized)      return WindowEventType.window_minimized;
            if(type == we_maximized)      return WindowEventType.window_maximized;
            if(type == we_restored)       return WindowEventType.window_restored;
            if(type == we_enter)          return WindowEventType.window_enter;
            if(type == we_leave)          return WindowEventType.window_leave;
            if(type == we_focus_gained)   return WindowEventType.window_focus_gained;
            if(type == we_focus_lost)     return WindowEventType.window_focus_lost;
            if(type == we_close)          return WindowEventType.window_close;

        return WindowEventType.unknown;

    } //typed

} //WindowEvents

@:noCompletion class InputEvents {

//Input events

        public static var ie_unknown                    = 0;
        public static var ie_key                        = 1;
        public static var ie_mouse                      = 2;
        public static var ie_touch                      = 3;
        public static var ie_joystick                   = 4;
        public static var ie_controller                 = 5;

//Helpers

        /** returns a typed `InputEventType` from an integer ID, for communication between internal native + haxe code */
    public static function typed(type:Int) : InputEventType {

            if(type == ie_unknown)      return InputEventType.unknown;
            if(type == ie_key)          return InputEventType.key;
            if(type == ie_mouse)        return InputEventType.mouse;
            if(type == ie_touch)        return InputEventType.touch;
            if(type == ie_joystick)     return InputEventType.joystick;
            if(type == ie_controller)   return InputEventType.controller;

        return InputEventType.unknown;

    } //typed

} //InputEvents

@:noCompletion class FileWatchEvents {

//File watch events

        public static var fe_unknown                    = 0;
        public static var fe_modify                     = 1;
        public static var fe_remove                     = 2;
        public static var fe_create                     = 3;

//Helpers

        /** returns a typed `InputEventType` from an integer ID, for communication between internal native + haxe code */
    public static function typed(type:Int) : FileWatchEventType {

            if(type == fe_unknown)      return FileWatchEventType.unknown;
            if(type == fe_modify)       return FileWatchEventType.modify;
            if(type == fe_remove)       return FileWatchEventType.remove;
            if(type == fe_create)       return FileWatchEventType.create;

        return FileWatchEventType.unknown;

    } //typed

} //FileWatchEvents
