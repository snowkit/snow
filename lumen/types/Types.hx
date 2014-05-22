package lumen.types;

import lumen.Lumen;
import lumen.utils.ByteArray;


/** 
Information for a single asset 

`id` : the asset id   
`path` : the location of the asset   
`ext` : the asset extension, if any   
`type` : a convenience type indicator   

*/
typedef AssetInfo = {

    id : String,
    path : String,
    ext : String,
    type : String

}

/** 
The lumen core configuration information

`? host` : the bootstrapped application   
`? window_config` : the window config for a default window, if any   
`? run_loop` : whether or not the core should run a loop at all   
`? runtime_config` : the user specific config read from json at runtime   
`? asset_data` : the raw list of assets. use the app.assets from Lumen for access   

*/
typedef LumenConfig = {

    ? host                  : App, 
    ? window_config         : WindowConfig, 
    ? run_loop              : Bool, 
    ? runtime_config        : Dynamic, 
    ? asset_data            : Array<AssetInfo>

} //LumenConfig

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
    bpp_source : Int,
    data : ByteArray 

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

/** 
Window configuration information for creating windows

`? fullscreen` : create in fullscreen   
`? resizable` : allow the window to be resized   
`? borderless` : create as a borderless window   
`? antialiasing` : a value of `2`, `4`, `8` or other valid antialiasing flags   
`? stencil_buffer` : create a stencil buffer (not per window)   
`? depth_buffer` : create a depth buffer (not per window)   
`? vsync` : enable vsync (not per window)   
`? fps` : window max fps if any   
`? x` : window y at creation   
`? y` : window x at creation   
`? width` : window height at creation   
`? height` : window width at creation   
`? title` : window title   
`? orientation` : `Mobile specific` - window orientation setting   

*/
typedef WindowConfig = {

    ? fullscreen            : Bool,
    ? resizable             : Bool,
    ? borderless            : Bool,
    ? antialiasing          : Int,
    ? stencil_buffer        : Bool,
    ? depth_buffer          : Bool,
    ? vsync                 : Bool,
    ? fps                   : Int,
    ? x                     : Int,
    ? y                     : Int,
    ? width                 : Int,
    ? height                : Int,
    ? title                 : String,

    ? orientation           : String,
    ? multitouch_supported  : Bool,
    ? multitouch            : Bool

} //WindowConfig

/** 
A system event. 
Values below are null unless the event `type` matches. _i.e_ if type is `window`, the `window` value is not null, and so on */
typedef SystemEvent = {

    ? type : SystemEventType,
    ? window : WindowEvent,
    ? input : InputEvent

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


} //SystemEventType

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

@:noCompletion class SystemEvents {

        //lumen core events

    public static var se_unknown                    = 0;
    public static var se_init                       = 1;
    public static var se_ready                      = 2;
    public static var se_update                     = 3;
    public static var se_shutdown                   = 4;
    public static var se_window                     = 5;
    public static var se_input                      = 6;

        //lumen application events

    public static var se_quit                       = 7;
    public static var se_app_terminating            = 8;
    public static var se_app_lowmemory              = 9;
    public static var se_app_willenterbackground    = 10;
    public static var se_app_didenterbackground     = 11;
    public static var se_app_willenterforeground    = 12;
    public static var se_app_didenterforeground     = 13;

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
