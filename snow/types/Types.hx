package snow.types;

import snow.Snow;
import snow.utils.ByteArray;
import snow.utils.UInt8Array;

import snow.assets.AssetImage;
import snow.assets.AssetText;
import snow.assets.AssetBytes;
import snow.assets.AssetAudio;

typedef Key = snow.input.Keycodes.Keycodes;
typedef Scan = snow.input.Keycodes.Scancodes;


/** Information for a single asset */
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


/** The options for an `AssetBytes` asset.
    Get assets from the `Assets` class, via `app.assets` */
typedef AssetBytesOptions = {
    ? strict : Bool,
    ? async : Bool,
    ? onload : AssetBytes -> Void
} //AssetBytesOptions

/** The options for an `AssetText` asset.
    Get assets from the `Assets` class, via `app.assets` */
typedef AssetTextOptions = {
    ? strict : Bool,
    ? async : Bool,
    ? onload : AssetText -> Void
} //AssetTextOptions

/** The options for an `AssetImage` asset.
    Get assets from the `Assets` class, via `app.assets` */
typedef AssetImageOptions = {
    ? strict : Bool,
    ? components : Int,
    ? onload : AssetImage -> Void,
    ? bytes : ByteArray
} //AssetImageOptions

/** The options for an `AssetAudio` asset */
typedef AssetAudioOptions = {
    ? strict : Bool,
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

/** The runtime application config info */
typedef AppConfig = {

        /** whether or not to create and run a default window, default: true */
    @:optional var has_window   : Bool;

        /** the window config for the default window, if `has_window` is true. default: see `WindowConfig` docs*/
    @:optional var window       : WindowConfig;
        /** the user specific config, by default, read from a json file at runtime */
    @:optional var runtime      : Dynamic;
        /** the raw list of assets. use the app.assets from Snow for access to these. read from a manifest file by default */
    @:optional var assets       : Array<AssetInfo>;
        /** config specific to the web target */
    @:optional var web          : AppConfigWeb;
        /** config specific to the web target */
    @:optional var native       : AppConfigNative;

} //AppConfig

typedef AppConfigWeb = {

        /** If true, right clicking will consume the event on the canvas. `event.preventDefault` is used. default: true*/
    @:optional var no_context_menu : Bool;

} //AppConfigWeb

typedef AppConfigNative = {

        /** The default length of a single stream buffer in bytes. default:176400, This is ~1 sec in 16 bit mono. */
    @:optional var audio_buffer_length : Int;

        /** The default number of audio buffers to use for a single stream. Set no less than 2, as it's a queue. See `Audio` docs. default:4 */
    @:optional var audio_buffer_count : Int;

} //AppConfigWeb

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
        /** image data */
    var data : UInt8Array;

} //ImageInfo

/** The type of audio format */
enum AudioFormatType {

    unknown;
    ogg;
    wav;
    pcm;

} //AudioFormatType

#if snow_audio_howlerjs

        /** The platform specific implementation detail about the audio data */
    typedef AudioDataInfo = {
            /** */
        var _unused : Bool;
    } //AudioDataInfo

#else

        /** The platform specific implementation detail about the audio data */
    typedef AudioDataInfo = {

            /** the file length in bytes */
        var length : Int;
            /** the pcm uncompressed raw length in bytes */
        var length_pcm : Int;
            /** number of channels */
        var channels : Int;
            /** hz rate */
        var rate : Int;
            /** sound bitrate */
        var bitrate : Int;
            /** bits per sample, 8 / 16 */
        var bits_per_sample : Int;
            /** sound raw data */
        var bytes : ByteArray;

    } //AudioDataInfo

#end //

/** Information about an audio file/data */
typedef AudioInfo = {

        /** file source id */
    var id : String;
        /** format */
    var format : AudioFormatType;
        /** the platform audio data info */
    var data : AudioDataInfo;
        /** the platform audio handle for later manipulation */
    var handle : AudioHandle;

} //AudioInfo

/** Information about an audio portion requested via assets */
typedef AudioDataBlob = {

        /** True if the file has reached the end of the data in this blob */
    var bytes : ByteArray;
        /** The data stored in this blob */
    var complete : Bool;

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
        /** set the number of red bits for the rendering to use. Unless you need to change this, don't. default: 8 */
    @:optional var red_bits   : Int;
        /** set the number of green bits for the rendering to use. Unless you need to change this, don't. default: 8 */
    @:optional var green_bits   : Int;
        /** set the number of blue bits for the rendering to use. Unless you need to change this, don't. default: 8 */
    @:optional var blue_bits   : Int;
        /** set the number of alpha bits for the rendering to use. Unless you need to change this, don't. default: 8 */
    @:optional var alpha_bits   : Int;
        /** create a depth buffer at the specified bit depth (i.e `0` or `16` bit depth buffer) default: 0 */
    @:optional var depth_bits   : Int;
        /** create a stencil buffer at the specified bit depth (i.e `8` or `16` bit stencil buffer). default: 0 */
    @:optional var stencil_bits : Int;
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

/** A system event */
typedef SystemEvent = {

        /** The type of system event this event is. SystemEventType */
    @:optional var type : Int;
        /** If type is `window` this will be populated, otherwise null */
    @:optional var window : WindowEvent;
        /** If type is `input` this will be populated, otherwise null */
    @:optional var input : InputEvent;
        /** If type is `file` this will be populated, otherwise null */
    @:optional var file : FileEvent;

} //SystemEvent

/** A system window event */
typedef WindowEvent = {

        /** The type of window event this was. Use WindowEventType */
    @:optional var type : Int;
        /** The time in seconds that this event occured, useful for deltas */
    @:optional var timestamp : Float;
        /** The window id from which this event originated */
    @:optional var window_id : Int;
        /** The raw platform event data, only useful if you are implementing
            a new platform or lack access to data from the system that snow does not expose */
    @:optional var event : Dynamic;

} //WindowEvent

/** A system file watch event */
typedef FileEvent = {

        /** The type of file watch event, modify/create/delete. Use FileEventType */
    @:optional var type : Int;
        /** The time in seconds when this event was fired */
    @:optional var timestamp : Float;
        /** The absolute path that was notifying */
    @:optional var path : String;

} //FileEvent

/** A system input event */
typedef InputEvent = {

        /** The type of input event this was. Use InputEventType */
    @:optional var type : Int;
        /** The time in seconds that this event occured, useful for deltas */
    @:optional var timestamp : Float;
        /** The window id from which this event originated */
    @:optional var window_id : Int;
        /** The raw platform event data, only useful if you are implementing
            a new platform or lack access to data from the system that snow does not expose */
    @:optional var event : Dynamic;

} //InputEvent

/** Information about a display mode */
typedef DisplayMode = {
    format : Int,
    refresh_rate : Int,
    width : Int,
    height : Int
}

    /** A platform window handle */
#if snow_web
    typedef WindowHandle = js.html.CanvasElement;
#else
    typedef WindowHandle = Null<Float>;
#end //snow_web

    /** A platform window handle */
#if snow_audio_howlerjs
    typedef AudioHandle = snow.platform.web.audio.howlerjs.Howl;
#else
    typedef AudioHandle = Null<Float>;
#end //snow_web



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


//Conversion helpers for native <-> snow events

@:noCompletion class SystemEventType {

        //snow core events
        //from native :
        //se_unknown, se_init, se_ready, se_update, se_shutdown, se_window, se_input

        /** An unknown system event */
    public static inline var unknown                    = 0;
        /** An internal system init event */
    public static inline var init                       = 1;
        /** An internal system ready event */
    public static inline var ready                      = 2;
        /** An internal system update event */
    public static inline var update                     = 3;
        /** An system shutdown event */
    public static inline var shutdown                   = 4;
        /** An system window event */
    public static inline var window                     = 5;
        /** An system input event */
    public static inline var input                      = 6;

        //snow application events

        /** An system quit event. Initiated by user, can be cancelled/ignored */
    public static inline var quit                       = 7;
        /** An system terminating event, called by the OS (mobile specific) */
    public static inline var app_terminating            = 8;
        /** An system low memory event, clear memory if you can. Called by the OS (mobile specific) */
    public static inline var app_lowmemory              = 9;
        /** An event for just before the app enters the background, called by the OS (mobile specific) */
    public static inline var app_willenterbackground    = 10;
        /** An event for when the app enters the background, called by the OS (mobile specific) */
    public static inline var app_didenterbackground     = 11;
        /** An event for just before the app enters the foreground, called by the OS (mobile specific) */
    public static inline var app_willenterforeground    = 12;
        /** An event for when the app enters the foreground, called by the OS (mobile specific) */
    public static inline var app_didenterforeground     = 13;
        /** An event for when the a file watch notification occurs */
    public static inline var file                       = 14;

    static var names = [
        'unknown', 'init', 'ready', 'update', 'shutdown',
        'window', 'input', 'quit', 'app_terminating', 'app_lowmemory',
        'app_willenterbackground', 'app_didenterbackground',
        'app_willenterforeground', 'app_didenterforeground', 'file'
    ];

    public static function to_string( _type:Int ) {
        return names[_type];
    }

} //SystemEvents

@:noCompletion class WindowEventType {

        //window events,
        // from native :
        // we_unknown, we_created, we_shown, we_hidden, we_exposed, we_moved, we_resized, we_size_changed, we_minimized, we_maximized, we_restored, we_enter, we_leave, we_focus_gained, we_focus_lost, we_close, we_destroy

        /** An unknown window event */
    public static inline var unknown          = 0;
        /** A window is created */
    public static inline var created          = 1;
        /** A window is shown */
    public static inline var shown            = 2;
        /** A window is hidden */
    public static inline var hidden           = 3;
        /** A window is exposed */
    public static inline var exposed          = 4;
        /** A window is moved */
    public static inline var moved            = 5;
        /** A window is resized, by the user or code. */
    public static inline var resized          = 6;
        /** A window is resized, by the OS or internals. */
    public static inline var size_changed     = 7;
        /** A window is minimized */
    public static inline var minimized        = 8;
        /** A window is maximized */
    public static inline var maximized        = 9;
        /** A window is restored */
    public static inline var restored         = 10;
        /** A window is entered by a mouse */
    public static inline var enter            = 11;
        /** A window is left by a mouse */
    public static inline var leave            = 12;
        /** A window has gained focus */
    public static inline var focus_gained     = 13;
        /** A window has lost focus */
    public static inline var focus_lost       = 14;
        /** A window is being closed/hidden */
    public static inline var close            = 15;
        /** A window is being destroyed */
    public static inline var destroy          = 16;

    static var names = [
        'unknown', 'created', 'shown', 'hidden', 'exposed',
        'moved', 'resized', 'size_changed', 'minimized',
        'maximized', 'restored', 'enter', 'leave',
        'focus_gained', 'focus_lost', 'close', 'destroy'
    ];

    public static function to_string( _type:Int ) {
        return names[_type];
    }

} //WindowEvents

@:noCompletion class InputEventType {

        //Input events
        //from native :
        //ie_unknown, ie_key, ie_mouse, ie_touch, ie_joystick, ie_controller

        /** An unknown input event */
    public static inline var unknown        = 0;
        /** An keyboard input event */
    public static inline var key            = 1;
        /** An mouse input event */
    public static inline var mouse          = 2;
        /** An touch input event */
    public static inline var touch          = 3;
        /** An joystick input event. On mobile, accellerometer is a joystick (for now) */
    public static inline var joystick       = 4;
        /** An controller input event. Use these instead of joystick on desktop. */
    public static inline var controller     = 5;

    static var names = [
        'unknown', 'key', 'mouse', 'touch', 'joystick', 'controller'
    ];

    public static function to_string( _type:Int ) {
        return names[_type];
    }

} //InputEvents

@:noCompletion class FileEventType {

        //File watch events
        //from native :
        //fe_unknown, fe_modify, fe_remove, fe_create, fe_drop

        /** An unknown watch event */
    public static inline var unknown    = 0;
        /** An event for when the a file is modified */
    public static inline var modify     = 1;
        /** An event for when the a file is removed */
    public static inline var remove     = 2;
        /** An event for when the a file is created */
    public static inline var create     = 3;
        /** An event for when the a file is dropped on a window */
    public static inline var drop       = 4;

    static var names = [
        'unknown', 'modify', 'remove', 'create', 'drop'
    ];

    public static function to_string( _type:Int ) {
        return names[_type];
    }

} //FileEvents
