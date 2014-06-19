package lumen.window;

import lumen.Lumen;
import lumen.types.Types;
import lumen.window.Window;
import lumen.window.Windowing;

import lumen.utils.AbstractClass;

#if lumen_html5

    @:noCompletion typedef WindowSystem = lumen.platform.html5.window.WindowSystem;

#else

    #if lumen_window_sdl
        @:noCompletion typedef WindowSystem = lumen.platform.native.window.sdl.WindowSystem;
    #else
        @:noCompletion typedef WindowSystem = lumen.platform.native.window.WindowSystem;
    #end

#end


/**
    Internal class handled by `Windowing`, a less concrete implementation of the platform window bindings.
    WindowBinding is bound to lumen.platform.native.WindowSystem, lumen.platform.native.WindowSystem etc
*/
@:noCompletion class WindowSystemBinding implements AbstractClass {

    var manager : Windowing;
    var lib : Lumen;

        /** Called when the window manager initializes this system */
    public function init();
        /** Called when the window manager updates this system */
    public function update();
        /** Called when the window manager destroys this system */
    public function destroy();
        /** Called to set up any listeners on the given window  */
    public function listen( window:Window );
        /** Called to remove any listeners on the given window  */
    public function unlisten( window:Window );

        /** Create a window with config, calls on_created when complete passing the handle, the ID,
            and the actual config that was used since the requested config could fail */
    public function window_create( config:WindowConfig, on_created: WindowHandle->Int->WindowConfig->Void );
        /** Close a given window handle */
    public function window_close( window:Window );
        /** Update a given window */
    public function window_update( window:Window );
        /** Render a given window */
    public function window_render( window:Window );
        /** Swap a given window */
    public function window_swap( window:Window );
        /** Display a message on a window */
    public function window_simple_message( window:Window, message:String, ?title:String="" );
        /** Set the size of a window */
    public function window_set_size( window:Window, w:Int, h:Int );
        /** Set the position of a window */
    public function window_set_position( window:Window, x:Int, y:Int );
        /** Set the title of a window */
    public function window_set_title( window:Window, title:String );
        /** Set the max size of a window */
    public function window_set_max_size( window:Window, w:Int, h:Int );
        /** Set the min size of a window */
    public function window_set_min_size( window:Window, w:Int, h:Int );
        /** Set the grab state of a window */
    public function window_grab( window:Window, grabbed:Bool );
        /** Set the fullscreen state of a window */
    public function window_fullscreen( window:Window, fullscreen:Bool, fullscreen_desktop_mode:Int = 1 );
        /** Set the bordered state of a window */
    public function window_bordered( window:Window, bordered:Bool );


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
