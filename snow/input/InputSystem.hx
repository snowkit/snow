package snow.input;

import snow.Snow;
import snow.types.Types;
import snow.input.Input;

import snow.utils.AbstractClass;
import snow.window.Window;


#if snow_web

    @:noCompletion typedef InputSystem = snow.platform.web.input.InputSystem;

#else

    #if snow_input_sdl
        @:noCompletion typedef InputSystem = snow.platform.native.input.sdl.InputSystem;
    #else
        @:noCompletion typedef InputSystem = snow.platform.native.input.InputSystem;
    #end

#end

/** Internal input system, accessed through `snow.Input`, not directly */
@:noCompletion class InputSystemBinding implements AbstractClass {

    public var manager : Input;
    public var lib : Snow;

        /** Called when the input manager initiates this system */
    public function init();
        /** Called when the input manager updates this system */
    public function process();
        /** Called when the input manager destroys this system */
    public function destroy();
        /** Called when the input manager forwards an event to this system */
    public function on_event( _event : InputEvent );

        /** Start a system text input state, this includes soft keyboard on mobile. on some platforms like web this does nothing (yet?) */
    public function text_input_start();
        /** End a system text input state, this includes soft keyboard on mobile. on some platforms like web this does nothing (yet?) */
    public function text_input_stop();
        /** In a system text input state, this determines the area that is accepting input. */
    public function text_input_rect(x:Int, y:Int, w:Int, h:Int);

        /** Open a gamepad with this id */
    public function gamepad_add(id:Int);
        /** Close a gamepad with this id */
    public function gamepad_remove(id:Int);
        /** Listen for input events on the given window */
    @:noCompletion public function listen( window:Window );
        /** Stop listening for input events on the given window */
    @:noCompletion public function unlisten( window:Window );

} //InputSystemBinding
