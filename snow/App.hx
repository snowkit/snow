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
        /** if this is non zero, updates will be forced to this rate */
    public var update_rate : Float = 0;

//Timing information

        /** The time at the start of this tick */
    public var tick_start : Float = 1.0/60.0;
        /** The time at the start of the previous tick */
    public var tick_start_prev : Float = 0.0;
        /** The amount of time the last tick took */
    public var tick_delta : Float = 1.0/60;

        /** The time at the start of this tick */
    public var frame_start : Float = 1.0/60.0;
        /** The time at the start of the previous frame */
    public var frame_start_prev : Float = 0.0;
        /** The amount of time the last frame took */
    public var frame_delta : Float = 1.0/60;
        /** the maximum frame time */
    public var frame_max_delta : Float = 0.25;

        /** the simulated time the last frame took to run, relative to scale etc */
    public var sim_delta : Float = 1/60;
        /** the current simulation time */
    public var sim_time : Float = 0;

//Specific to fixed timestep

        /** the alpha time for a interpolating between frame updates */
    public var fixed_alpha : Float = 1.0;
        /** use a "fix your timestep approach" */
    public var fixed_timestep : Bool = false;
        /** fixed simulation update speed */
    public var fixed_frame_time : Float = 0.0167;
        /** the overflow of the updates. This is used internally, for you, to calculate the alpha time for rendering interpolation as follows `alpha = overflow / fixed_frame_time;` */
    public var fixed_overflow : Float = 0.0;


//Internal values

        /** for update_rate, the time when the next tick should occur around */
    var next_tick : Float = 0;

//override these in your game class

    /** Called by snow to request config changes, override this to change the defaults.
            This happens before ready, so the values are available when ready is called. */
    function config(_config:AppConfig) : AppConfig return _config;
        /** Your entry point. Called for you when you can initialize your application */
    function ready() {}
        /** Your update loop. Called every frame for you. The dt value depends on the timing configuration (see the {App Guide}) */
    function update(dt:Float) {}
        /** The frame update loop. */
    function tick(dt:Float) {}
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
    function onmousewheel(x:Float, y:Float, timestamp:Float, window_id:Int) {}
        /** Called for you when the mouse moves */
    function onmousemove(x:Int, y:Int, xrel:Int, yrel:Int, timestamp:Float, window_id:Int) {}

        /** Called for you when a touch is released, use the `touch_id` to track which */
    function ontouchdown(x:Float, y:Float, dx:Float, dy:Float, touch_id:Int, timestamp:Float) {}
        /** Called for you when a touch is first pressed, use the `touch_id` to track which */
    function ontouchup(x:Float, y:Float, dx:Float, dy:Float, touch_id:Int, timestamp:Float) {}
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


    function internal_init() {

        sim_time = 0;
        fixed_frame_time = 1.0/60.0;

        tick_start = app.time;
        tick_start_prev = tick_start - fixed_frame_time;
        tick_delta = fixed_frame_time;

        frame_start = app.time;
        frame_start_prev = frame_start - fixed_frame_time;
        frame_delta = sim_delta = fixed_frame_time;

    } //internal_init

    function internal_tick() {

        ontickstart();

        tick_start = app.time;
        tick_delta = (tick_start - tick_start_prev);
        tick_start_prev = tick_start;

            if(fixed_timestep) {
                internal_tick_fixed_timestep();
            } else {
                internal_tick_default();
            }

        tick(tick_delta);

        ontickend();

        #if (snow_native && !snow_native_no_tick_sleep)
            Sys.sleep(0);
        #end

    } //internal_tick

    inline function internal_tick_default() : Void {

        if(update_rate != 0) {

            if(app.time < next_tick) {
                return;
            }

            next_tick = app.time + update_rate;

        }

        frame_start = tick_start;
        frame_delta = (frame_start - frame_start_prev);
        frame_start_prev = frame_start;

        if(frame_delta > frame_max_delta) {
            frame_delta = frame_max_delta;
        }

        var _used_delta = (fixed_delta == 0) ? frame_delta : fixed_delta;
        _used_delta *= timescale;
        sim_delta = _used_delta;

        sim_time += _used_delta;
        update(_used_delta);

    } //internal_tick_default

    inline function internal_tick_fixed_timestep() : Void {

        frame_start = app.time;
        frame_delta = (frame_start - frame_start_prev);
        frame_start_prev = frame_start;

        sim_delta = frame_delta * timescale;
        if(sim_delta > frame_max_delta) {
            sim_delta = frame_max_delta;
        }

        fixed_overflow += sim_delta;

        var _slice = fixed_frame_time * timescale;
        while(fixed_overflow >= fixed_frame_time) {

            update(_slice);
            sim_time += _slice;
            fixed_overflow -= _slice;

        }

        fixed_alpha = fixed_overflow / fixed_frame_time;

    } //internal_tick_fixed_timestep

//Internal

    //Main app entry point

    #if !snow_no_main

        static function main() {

            new snow.Snow(new AppHost());

        } //main

    #end //!snow_no_main

} //App
