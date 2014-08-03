package snow.window;

import snow.Snow;
import snow.types.Types;
import snow.window.Window;
import snow.window.Windowing;

import snow.utils.AbstractClass;

#if snow_web

    @:noCompletion typedef WindowSystem = snow.platform.web.window.WindowSystem;

#else

    #if snow_window_sdl
        @:noCompletion typedef WindowSystem = snow.platform.native.window.sdl.WindowSystem;
    #else
        @:noCompletion typedef WindowSystem = snow.platform.native.window.WindowSystem;
    #end

#end


/**
    Internal class handled by `Windowing`, a less concrete implementation of the platform window bindings.
    WindowBinding is bound to snow.platform.native.WindowSystem, snow.platform.native.WindowSystem etc
*/
@:noCompletion class WindowSystemBinding implements AbstractClass {

    public var manager : Windowing;
    public var lib : Snow;

        /** Called when the window manager initializes this system */
    public function init();
        /** Called when the window manager updates this system */
    public function process();
        /** Called when the window manager destroys this system */
    public function destroy();
        /** Called to set up any listeners on the given window  */
    public function listen( window:Window );
        /** Called to remove any listeners on the given window  */
    public function unlisten( window:Window );

        /** Create a window with config, calls on_created when complete passing the handle, the ID,
            and the actual config that was used since the requested config could fail */
    public function create( config:WindowConfig, on_created: WindowHandle->Int->WindowConfig->Void );
        /** Close a given window */
    public function close( window:Window );
        /** reopen this window once closed. Destroyed windows cannot be reopened, it must use create again */
    public function show( window:Window );
        /** Close a given window */
    public function destroy_window( window:Window );
        /** Update a given window */
    public function update( window:Window );
        /** Render a given window */
    public function render( window:Window );
        /** Swap a given window */
    public function swap( window:Window );
        /** Display a message on a window */
    public function simple_message( window:Window, message:String, ?title:String="" );
        /** Set the size of a window */
    public function set_size( window:Window, w:Int, h:Int );
        /** Set the position of a window */
    public function set_position( window:Window, x:Int, y:Int );
        /** Set the title of a window */
    public function set_title( window:Window, title:String );
        /** Set the max size of a window */
    public function set_max_size( window:Window, w:Int, h:Int );
        /** Set the min size of a window */
    public function set_min_size( window:Window, w:Int, h:Int );
        /** Set the fullscreen state of a window */
    public function fullscreen( window:Window, fullscreen:Bool, windowed_fullscreen:Bool = true );
        /** Set the bordered state of a window */
    public function bordered( window:Window, bordered:Bool );
//cursor
        /** Set the grab state of a window */
    public function grab( window:Window, grabbed:Bool );
        /** Set the cursor position inside of a given window */
    public function set_cursor_position( window:Window, x:Int, y:Int );

//General

        /** Toggle the OS cursor. This is not window specific but system wide */
    public function system_enable_cursor( enable:Bool );
        /** Lock the OS cursor to the foreground window. This hides the cursor and prevents it from leaving, reporting relative coordinates. */
    public function system_lock_cursor( enable:Bool );
        /** Toggle vertical refresh. This is not window specific but context wide, returns 0 on success or -1 if not supported */
    public function system_enable_vsync( enable:Bool ) : Int;

//Desktop

        /** Get the number of displays present */
    public function display_count() : Int;
        /** Get the number of display modes present */
    public function display_mode_count( display:Int ) : Int;
        /** Get the native mode information of the display by index */
    public function display_native_mode( display:Int ) : DisplayMode;
        /** Get the current mode information of the display by index */
    public function display_current_mode( display:Int ) : DisplayMode;
        /** Get the information from a specific mode index, the index obtrained from iterating with `display_mode_count` value */
    public function display_mode( display:Int, mode_index:Int ) : DisplayMode;
        /** Get the bounds of the display by index */
    public function display_bounds( display:Int ) : { x:Int, y:Int, width:Int, height:Int };
        /** Get the name of the display by index, where available */
    public function display_name( display:Int ) : String;


} //WindowSystemBinding
