package lumen.platform.html5.window;

import lumen.Lumen;
import lumen.types.Types;
import lumen.window.Window;
import lumen.window.Windowing;
import lumen.window.WindowSystem;

    //Internal class handled by Windowing, a less concrete implementation of the window system 
@:noCompletion class WindowSystem extends WindowSystemBinding {

    public function new( _manager:Windowing, _lib:Lumen ) {

        manager = _manager;
        lib = _lib;

    } //new
    
    override public function init() {
    } //init

    override public function update() {
    } //update

    override public function destroy() {
    } //destroy

        //:todo:
    override public function window_create( config:WindowConfig, on_created: WindowHandle->Int->WindowConfig->Void ) {}
    override public function window_close( handle:WindowHandle ) {}
    override public function window_update( handle:WindowHandle ) {}
    override public function window_render( handle:WindowHandle ) {}
    override public function window_swap( handle:WindowHandle ) {}
    override public function window_simple_message( handle:WindowHandle, message:String, title:String="" ) {}
    override public function window_set_size( handle:WindowHandle, w:Int, h:Int ) {}
    override public function window_set_position( handle:WindowHandle, x:Int, y:Int ) {}
    override public function window_set_title( handle:WindowHandle, title:String ) {}
    override public function window_set_max_size( handle:WindowHandle, w:Int, h:Int ) {}
    override public function window_set_min_size( handle:WindowHandle, w:Int, h:Int ) {}
    override public function window_grab( handle:WindowHandle, grabbed:Bool ) {}
    override public function window_fullscreen( handle:WindowHandle, fullscreen:Bool, fullscreen_desktop_mode:Int = 1 ) {}
    override public function window_bordered( handle:WindowHandle, bordered:Bool ) {}

        //:todo:
    override public function display_count() : Int { return 1; }
    override public function display_mode_count( display:Int ) : Int { return 1; }
    override public function display_native_mode( display:Int ) : DisplayMode { return null; }
    override public function display_current_mode( display:Int ) : DisplayMode { return null; }
    override public function display_mode( display:Int, mode_index:Int ) : DisplayMode { return null; }
    override public function display_bounds( display:Int ) : DisplayBounds { return null; }
    override public function display_name( display:Int ) : String { return ''; }


} //WindowSystemHTML5
