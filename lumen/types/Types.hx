package lumen.types;

import lumen.Lumen;
import lumen.utils.ByteArray;


typedef AssetInfo = {

    id : String,            //the asset id
    path : String,          //the asset actual path
    ext : String,           //the asset extension
    type : String           //a type indicator

}

typedef LumenConfig = {

    ? host                  : App,              //the bootstrapped application
    ? window_config         : WindowConfig,     //the window config for a default window, if any
    ? run_loop              : Bool,             //whether or not the core should run a loop at all
    ? runtime_config        : Dynamic,          //the user specific config read from json at runtime
    ? asset_data            : Array<AssetInfo>  //the raw list of assets. use the app.assets from Lumen for access

} //LumenConfig

typedef ImageInfo = {

    id : String,        //source asset id
    bpp : Int,          //used bits per pixel
    width : Int,        //image width
    height : Int,       //image height
    bpp_source : Int,   //source bits per pixel
    data : ByteArray    //image data

} //ImageInfo

enum AudioFormatType {

    unknown;
    ogg;
    wav;
    pcm;

} //AudioFormatType

typedef AudioInfo = {

    id : String,                //file source
    format : AudioFormatType,   //format
    channels : Int,             //number of channels
    rate : Int,                 //hz rate 
    bitrate : Int,              //sound bitrate
    bits_per_sample : Int,      //bits per sample, 8 / 16
    data : ByteArray,           //sound raw data,
    length : Int,               //the file length in bytes
    length_pcm : Int,           //the pcm uncompressed raw length in bytes
    handle : Dynamic            //the native audio handle for later manipulation

} //AudioInfo

typedef AudioDataBlob = {

    data : ByteArray,
    complete : Bool
    
} //AudioDataBlob

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

typedef SystemEvent = {

    ? type : SystemEventType,

        //certain events have data structures passed in
        //which are null if that event is not of the right type
        //so, if this event.type == se_window, window should be non-null
        //and populated with the specifics to that event
    ? window : WindowEvent,
    ? input : InputEvent

} //SystemEvent

typedef WindowEvent = {

    ? type : WindowEventType,
    ? timestamp : Float,
    ? window_id : Int,
    ? event : Dynamic

} //WindowEvent

typedef InputEvent = {

    ? type : InputEventType,
    ? timestamp : Float,
    ? window_id : Int,
    ? event : Dynamic

} //InputEvent


enum SystemEventType {

    unknown;

    init;
    ready;
    update;
    shutdown;
    window;
    input;

    quit;
    app_terminating;
    app_lowmemory;
    app_willenterbackground;
    app_didenterbackground;
    app_willenterforeground;
    app_didenterforeground;

} //SystemEventType

//Window stuff

enum WindowEventType {

    unknown;

    window_created;
    window_shown;
    window_hidden;
    window_exposed;
    window_moved;
    window_resized;
    window_size_changed;
    window_minimized;
    window_maximized;
    window_restored;
    window_enter;
    window_leave;
    window_focus_gained;
    window_focus_lost;
    window_close;

} //WindowEventType


enum InputEventType {

    unknown;

    key;
    mouse;
    touch;
    joystick;
    controller;

} //InputEventType

class SystemEvents {

        //lumen core events

        /** An unknown system event */
    public static var se_unknown                    = 0;
        /** An internal system init event */
    public static var se_init                       = 1;
        /** An internal system ready event */
    public static var se_ready                      = 2;
        /** An internal system update event */
    public static var se_update                     = 3;
        /** An system shutdown event */
    public static var se_shutdown                   = 4;
        /** An system window event */
    public static var se_window                     = 5;
        /** An system input event */
    public static var se_input                      = 6;

        //lumen application events

        /** An system quit event. Initiated by user, can be cancelled/ignored */
    public static var se_quit                       = 7;
        /** An system terminating event, called by the OS (mobile specific) */
    public static var se_app_terminating            = 8;
        /** An system low memory event, clear memory if you can. Called by the OS (mobile specific) */
    public static var se_app_lowmemory              = 9;
        /** An event for just before the app enters the background, called by the OS (mobile specific) */
    public static var se_app_willenterbackground    = 10;
        /** An event for when the app enters the background, called by the OS (mobile specific) */
    public static var se_app_didenterbackground     = 11;
        /** An event for just before the app enters the foreground, called by the OS (mobile specific) */
    public static var se_app_willenterforeground    = 12;
        /** An event for when the app enters the foreground, called by the OS (mobile specific) */
    public static var se_app_didenterforeground     = 13;

//Helpers
    
        /** returns a typed `SystemEventType` from an integer ID, for communication between internal native + haxe code */
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

class WindowEvents {

//window events
    
        /** An unknown window event */
    public static var we_unknown          = 0;
        /** A window is created */
    public static var we_created          = 1;
        /** A window is shown */
    public static var we_shown            = 2;
        /** A window is hidden */
    public static var we_hidden           = 3;
        /** A window is exposed */
    public static var we_exposed          = 4;
        /** A window is moved */
    public static var we_moved            = 5;
        /** A window is resized, by the user or code. */
    public static var we_resized          = 6;
        /** A window is resized, by the OS or internals. */
    public static var we_size_changed     = 7;
        /** A window is minimized */
    public static var we_minimized        = 8;
        /** A window is maximized */
    public static var we_maximized        = 9;
        /** A window is restored */
    public static var we_restored         = 10;
        /** A window is entered by a mouse */
    public static var we_enter            = 11;
        /** A window is left by a mouse */
    public static var we_leave            = 12;
        /** A window has gained focus */        
    public static var we_focus_gained     = 13;
        /** A window has lost focus */        
    public static var we_focus_lost       = 14;
        /** A window is being closed */        
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

class InputEvents {
    
//Input events

            /** An unknown input event */
        public static var ie_unknown                    = 0;

            /** An keyboard input event */
        public static var ie_key                        = 1;
            /** An mouse input event */
        public static var ie_mouse                      = 2;
            /** An touch input event */
        public static var ie_touch                      = 3;
            /** An joystick input event. On mobile, accellerometer is a joystick (for now) */
        public static var ie_joystick                   = 4;
            /** An controller input event. Use these instead of joystick on desktop. */
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
