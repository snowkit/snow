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

        /** Create a window with config, calls on_created when complete passing the handle, the ID, 
            and the actual config that was used since the requested config could fail */
    public function window_create( config:WindowConfig, on_created: WindowHandle->Int->WindowConfig->Void );
        /** Close a given window handle */
    public function window_close( handle:WindowHandle );
        /** Update a given window handle */
    public function window_update( handle:WindowHandle );
        /** Render a given window handle */
    public function window_render( handle:WindowHandle );
        /** Swap a given window handle */
    public function window_swap( handle:WindowHandle );
        /** Display a message on a window handle */
    public function window_simple_message( handle:WindowHandle, message:String, ?title:String="" );
        /** Set the size of a window handle */
    public function window_set_size( handle:WindowHandle, w:Int, h:Int );
        /** Set the position of a window handle */
    public function window_set_position( handle:WindowHandle, x:Int, y:Int );
        /** Set the title of a window handle */
    public function window_set_title( handle:WindowHandle, title:String );
        /** Set the max size of a window handle */
    public function window_set_max_size( handle:WindowHandle, w:Int, h:Int );
        /** Set the min size of a window handle */
    public function window_set_min_size( handle:WindowHandle, w:Int, h:Int );
        /** Set the grab state of a window handle */
    public function window_grab( handle:WindowHandle, grabbed:Bool );
        /** Set the fullscreen state of a window handle */
    public function window_fullscreen( handle:WindowHandle, fullscreen:Bool, fullscreen_desktop_mode:Int = 1 );
        /** Set the bordered state of a window handle */
    public function window_bordered( handle:WindowHandle, bordered:Bool );


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
    public function display_bounds( display:Int ) : DisplayBounds;
        /** Get the name of the display by index, where available */
    public function display_name( display:Int ) : String;


} //WindowSystemBinding
