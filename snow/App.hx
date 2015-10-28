package snow;

import snow.api.Debug.assertnull;
import snow.types.Types;


/** The default type of snow application, with variable delta, update limit, render limit, timescale and more. 
    See the {App Guide} for complete details. */
@:allow(snow)
class App {

//Access to the snow API

        /** use this to access the api features. *i.e* `app.assets.text(_id)` */
    public var app : Snow;

//Configurable values

        /** the scale of time */
    public var timescale : Float = 1;
        /** if this is non zero this will be passed in */
    public var fixed_delta : Float = 0;
        /** if this is non zero, rendering will be forced to this rate */
    public var render_rate : Float = -1;
        /** if this is non zero, updates will be forced to this rate */
    public var update_rate : Float = 0;
        /** the maximum frame time */
    public var max_frame_time : Float = 0.25;

//Timing information

        /** the time the last frame took to run */
    public var delta_time : Float = 1/60;
        /** the simulated time the last frame took to run, relative to scale etc */
    public var delta_sim : Float = 1/60;
        /** the start time of the last frame */
    public var last_frame_start : Float = 0.0;
        /** the current simulation time */
    public var current_time : Float = 0;
        /** the start time of this frame */
    public var cur_frame_start : Float = 0.0;
        /** the alpha time for a render between frame updates */
    public var alpha : Float = 1.0;

//Internal values

        /** for update_rate, the time when the next tick should occur around */
    var next_tick : Float = 0;
        /** for update_rate, the time when the next tick should occur around */
    var next_render : Float = 0;

//override these in your game class

        /** The default constructor of an App is empty, so you can override it if you want, but take note that this happens way before snow is ready for use. Use [ready](#ready) for entry point. */
    public function new() {}
        /** Called by snow to request config changes, override this to change the defaults.
            This happens before ready, so the values are available when ready is called. */
    function config(_config:AppConfig) : AppConfig  return _config;
        /** Your entry point. Called for you when you can initialize your application */
    function ready() {}
        /** Your update loop. Called every frame for you. The dt value depends on the timing configuration (see the {App Guide}) */
    function update(dt:Float) {}
        /** Your exit point. Called for you when you should shut down your application */
    function ondestroy() {}
        /** Low level event handler from snow core. Often handled by the subsystems so check there first. */
    function onevent(event:SystemEvent) {}

        /** Called each frame *before* everything, the beginning of the frame. Use with understanding. */
    function ontickstart() {}
        /** Called each frame *after* everything, at the end of the frame. Use with understanding. */
    function ontickend() {}

        /** Called for you when a key is pressed down */
    function onkeydown(keycode:Int, scancode:Int, repeat:Bool, mod:ModState, timestamp:Float, window_id:Int) {}
        /** Called for you when a key is released */
    function onkeyup(keycode:Int, scancode:Int, repeat:Bool, mod:ModState, timestamp:Float, window_id:Int) {}
        /** Called for you when text input is happening. Use this for textfields, as it handles the complexity of unicode etc. */
    function ontextinput( text:String, start:Int, length:Int, type:TextEventType, timestamp:Float, window_id:Int) {}

        /** Called for you when a mouse button is pressed */
    function onmousedown(x:Int, y:Int, button:Int, timestamp:Float, window_id:Int) {}
        /** Called for you when a mouse button is released */
    function onmouseup(x:Int, y:Int, button:Int, timestamp:Float, window_id:Int) {}
        /** Called for you when the mouse wheel moves */
    function onmousewheel(x:Int, y:Int, timestamp:Float, window_id:Int) {}
        /** Called for you when the mouse moves */
    function onmousemove(x:Int, y:Int, xrel:Int, yrel:Int, timestamp:Float, window_id:Int) {}

        /** Called for you when a touch is released, use the `touch_id` to track which */
    function ontouchdown(x:Float, y:Float, touch_id:Int, timestamp:Float) {}
        /** Called for you when a touch is first pressed, use the `touch_id` to track which */
    function ontouchup(x:Float, y:Float, touch_id:Int, timestamp:Float) {}
        /** Called for you when a touch is moved, use the `touch_id` to track which */
    function ontouchmove(x:Float, y:Float, dx:Float, dy:Float, touch_id:Int, timestamp:Float) {}

        /** Called for you when a connected gamepad axis moves, use `which` to determine gamepad id */
    function ongamepadaxis(gamepad:Int, axis:Int, value:Float, timestamp:Float) {}
        /** Called for you when a connected gamepad button is pressed, use `which` to determine gamepad id */
    function ongamepaddown(gamepad:Int, button:Int, value:Float, timestamp:Float) {}
        /** Called for you when a connected gamepad button is released, use `which` to determine gamepad id */
    function ongamepadup(gamepad:Int, button:Int, value:Float, timestamp:Float) {}
        /** Called for you when a gamepad is connected or disconnected, use `which` to determine gamepad id. 
            `id` is the string name identifier for the controller, specified from the system. */
    function ongamepaddevice(gamepad:Int, id:String, type:GamepadDeviceEventType, timestamp:Float) {}

//Internal

    //Main app entry point

    #if !snow_no_main

        static function main() {

            try {

                var _app = new AppHost();

                assertnull(_app, 'snow main App instance was null!');

                trace('App main set to `${snow.types.TypeNames.app_main}`, instance: $_app');

                new snow.Snow(_app);

            } catch(e:Dynamic) {

                var _cur_stack = haxe.CallStack.callStack();
                var _exc_stack = haxe.CallStack.exceptionStack();
                var _full_stack = _exc_stack.concat(_cur_stack);

                if(_full_stack.length > 0) {
                    Sys.println('\nUncaught Error: $e');
                    Sys.println('\n${StringTools.trim(haxe.CallStack.toString(_full_stack))}');
                    Sys.println('\nRe-throw:');
                }
                
                throw e;

            } //catch

        } //main

    #end //!snow_no_main

} //App
