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
@:enum abstract AssetType(Int) from Int to Int {

    var bytes   = 0;
    var text    = 1;
    var image   = 2;
    var audio   = 3;

} //AssetType

/** Options for the ByteArray.readFile function */
typedef ByteArrayReadOptions = {

        /** Whether or not the data should load async.
            This mainly affects web platform, as sync files
            will hang the page triggering a script timeout.
            Larger files should always use the async flag on web. */
    @:optional var async:Bool;
        /** Whether or not the data is binary.
            This mainly affects web platform. */
    @:optional var binary:Bool;

} //ByteArrayReadOptions


/** The options for an `AssetBytes` asset.
    Get assets from the `Assets` class, via `app.assets` */
typedef AssetBytesOptions = {
    ? silent : Bool,
    ? strict : Bool,
    ? async : Bool,
    ? onload : AssetBytes -> Void
} //AssetBytesOptions

/** The options for an `AssetText` asset.
    Get assets from the `Assets` class, via `app.assets` */
typedef AssetTextOptions = {
    ? silent : Bool,
    ? strict : Bool,
    ? async : Bool,
    ? onload : AssetText -> Void
} //AssetTextOptions

/** The options for an `AssetImage` asset.
    Get assets from the `Assets` class, via `app.assets` */
typedef AssetImageOptions = {
    ? silent : Bool,
    ? strict : Bool,
    ? components : Int,
    ? onload : AssetImage -> Void,
    ? bytes : ByteArray
} //AssetImageOptions

/** The options for an `AssetAudio` asset */
typedef AssetAudioOptions = {
    ? silent : Bool,
    ? strict : Bool,
    ? type : String,
    ? load : Bool,
    ? onload : AssetAudio -> Void,
    ? bytes : ByteArray
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

        /** The application specific package. i.e org.snowkit.snowapp
            This should match the common format above,
            the last part (snowapp) will be used as the app name,
            the first parts (org.snowkit) will be used as the path.
            This means for example, when storing a preference in an OS location,
            it would be stored under <OS user path>/org.snowkit/snowapp/
            This also means that it must obey the rules set out by app stores for bundle ID's,
            general urls, file folder names, and https://wiki.libsdl.org/SDL_GetPrefPath#Remarks
        */
    @:optional var app_package : String;

} //SnowConfig

/** The runtime application config info */
typedef AppConfig = {

        /** whether or not to create and run a default window, default: true */
    @:optional var has_window   : Bool;
        /** the window config for the default window, if `has_window` is true. default: see `WindowConfig` docs*/
    @:optional var window       : WindowConfig;

        /** The render config that specifies rendering and context backend specifics.  */
    @:optional var render       : RenderConfig;

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

} //AppConfigWeb

typedef AppConfigNative = {

        /** The default length of a single stream buffer in bytes. default:176400, This is ~1 sec in 16 bit mono. */
    @:optional var audio_buffer_length : Int;

        /** The default number of audio buffers to use for a single stream. Set no less than 2, as it's a queue. See `Audio` docs. default:4 */
    @:optional var audio_buffer_count : Int;

} //AppConfigNative

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
@:enum abstract AudioFormatType(Int) from Int to Int {

    var unknown  = 0;
    var ogg      = 1;
    var wav      = 2;
    var pcm      = 3;

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
        /** format. Use AudioFormatType */
    var format : Int;
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

} //AssetType


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
    @:optional var type : SystemEventType;
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
    @:optional var type : WindowEventType;
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
    @:optional var type : FileEventType;
        /** The time in seconds when this event was fired */
    @:optional var timestamp : Float;
        /** The absolute path that was notifying */
    @:optional var path : String;

} //FileEvent

/** A system input event */
typedef InputEvent = {

        /** The type of input event this was. Use InputEventType */
    @:optional var type : InputEventType;
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
@:enum abstract TextEventType(Int) from Int to Int {

/** An unknown text event */
    var unknown    = 0;
/** An edit text typing event */
    var edit    = 1;
/** An input text typing event */
    var input   = 2;

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

@:enum abstract SystemEventType(Int) from Int to Int {

        //snow core events
        //from native :
        //se_unknown, se_init, se_ready, se_update, se_shutdown, se_window, se_input

        /** An unknown system event */
    var unknown                    = 0;
        /** An internal system init event */
    var init                       = 1;
        /** An internal system ready event */
    var ready                      = 2;
        /** An internal system update event */
    var update                     = 3;
        /** An system shutdown event */
    var shutdown                   = 4;
        /** An system window event */
    var window                     = 5;
        /** An system input event */
    var input                      = 6;

        //snow application events

        /** An system quit event. Initiated by user, can be cancelled/ignored */
    var quit                       = 7;
        /** An system terminating event, called by the OS (mobile specific) */
    var app_terminating            = 8;
        /** An system low memory event, clear memory if you can. Called by the OS (mobile specific) */
    var app_lowmemory              = 9;
        /** An event for just before the app enters the background, called by the OS (mobile specific) */
    var app_willenterbackground    = 10;
        /** An event for when the app enters the background, called by the OS (mobile specific) */
    var app_didenterbackground     = 11;
        /** An event for just before the app enters the foreground, called by the OS (mobile specific) */
    var app_willenterforeground    = 12;
        /** An event for when the app enters the foreground, called by the OS (mobile specific) */
    var app_didenterforeground     = 13;
        /** An event for when the a file watch notification occurs */
    var file                       = 14;


} //SystemEvents

@:enum abstract WindowEventType(Int) from Int to Int {

        //window events,
        // from native :
        // we_unknown, we_created, we_shown, we_hidden, we_exposed, we_moved, we_resized, we_size_changed, we_minimized, we_maximized, we_restored, we_enter, we_leave, we_focus_gained, we_focus_lost, we_close, we_destroy

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


} //WindowEvent

@:enum abstract InputEventType(Int) from Int to Int {

        //Input events
        //from native :
        //ie_unknown, ie_key, ie_mouse, ie_touch, ie_joystick, ie_controller

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


} //InputEvent

@:enum abstract FileEventType(Int) from Int to Int {

        //File watch events
        //from native :
        //fe_unknown, fe_modify, fe_remove, fe_create, fe_drop

        /** An unknown watch event */
    var unknown    = 0;
        /** An event for when the a file is modified */
    var modify     = 1;
        /** An event for when the a file is removed */
    var remove     = 2;
        /** An event for when the a file is created */
    var create     = 3;
        /** An event for when the a file is dropped on a window */
    var drop       = 4;


} //FileEvent
