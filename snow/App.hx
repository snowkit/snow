package snow;

import snow.utils.ByteArray;
import snow.input.Input;
import snow.types.Types;

    //Note all times in snow are in seconds.

/** The default type of application, with variable delta time, or fixed delta time, or a fixed frame rate. See the {App Guide} for complete details. */
@:test1 @:test2 class App {

//Access to the snow API

        /** use this to access the api features. *i.e* `app.assets.get_text(_id)` */
    public var app : Snow;

//Configurable values

        /** the scale of time */
    public var timescale : Float = 1;
        /** if this is non zero this will be passed in */
    public var fixed_delta : Float = 0;
        /** if this is non zero, updates will be forced to this rate */
    public var fixed_rate : Float = 0;
        /** the maximum frame time */
    public var max_frame_time : Float = 0.25;

//Timing information

        /** the time the last frame took to run */
    public var delta_time : Float = 0.016;
        /** the simulated time the last frame took to run, relative to scale etc */
    public var delta_sim : Float = 0.016;
        /** the start time of the last frame */
    public var last_frame_start : Float = 0.0;
        /** the current simulation time */
    public var current_time : Float = 0;
        /** the start time of this frame */
    public var cur_frame_start : Float = 0.0;
        /** the alpha time for a render between frame updates */
    public var alpha : Float = 1.0;

//Internal values

        /** for fixed_rate, the time when the next tick should occur around */
    var next_tick : Float = 0;

//override these in your game class

        /** The default constructor of an App is empty, so you can override it if you want, but take note that this happens way before snow is ready for use. Use [ready](#ready) for entry point. */
    public function new() {}
        /** Your entry point. Called for you when you can initialize your application */
    public function ready() {}
        /** Your update loop. Called every frame for you. The dt value depends on the timing configuration (see the {App Guide}) */
    public function update(dt:Float) {}
        /** Your exit point. Called for you when you should shut down your application */
    public function destroyed() {}

        /** Called for you when a key is pressed down */
    public function onkeydown( keycode:Int, scancode:Int, repeat:Bool, mod:ModState, timestamp:Float, window_id:Int ) {}
        /** Called for you when a key is released */
    public function onkeyup( keycode:Int, scancode:Int, repeat:Bool, mod:ModState, timestamp:Float, window_id:Int ) {}
        /** Called for you when text input is happening. Use this for textfields, as it handles the complexity of unicode etc. */
    public function ontextinput( text:String, start:Int, length:Int, type:TextEventType, timestamp:Float, window_id:Int ) {}

        /** Called for you when a mouse button is pressed */
    public function onmousedown( x:Int, y:Int, button:Int, timestamp:Float, window_id:Int ) {}
        /** Called for you when a mouse button is released */
    public function onmouseup( x:Int, y:Int, button:Int, timestamp:Float, window_id:Int ) {}
        /** Called for you when the mouse wheel moves */
    public function onmousewheel( x:Int, y:Int, timestamp:Float, window_id:Int ) {}
        /** Called for you when the mouse moves */
    public function onmousemove( x:Int, y:Int, xrel:Int, yrel:Int, timestamp:Float, window_id:Int ) {}

        /** Called for you when a touch is released, use the `touch_id` to track which */
    public function ontouchdown( x:Float, y:Float, touch_id:Int, timestamp:Float ) {}
        /** Called for you when a touch is first pressed, use the `touch_id` to track which */
    public function ontouchup( x:Float, y:Float, touch_id:Int, timestamp:Float ) {}
        /** Called for you when a touch is moved, use the `touch_id` to track which */
    public function ontouchmove( x:Float, y:Float, dx:Float, dy:Float, touch_id:Int, timestamp:Float ) {}

        /** Called for you when a connected gamepad axis moves, use `which` to determine gamepad id */
    public function ongamepadaxis( gamepad:Int, axis:Int, value:Float, timestamp:Float ) {}
        /** Called for you when a connected gamepad button is pressed, use `which` to determine gamepad id */
    public function ongamepadbuttondown( gamepad:Int, button:Int, value:Float, timestamp:Float ) {}
        /** Called for you when a connected gamepad button is released, use `which` to determine gamepad id */
    public function ongamepadbuttonup( gamepad:Int, button:Int, value:Float, timestamp:Float ) {}
        /** Called for you when a gamepad is connected or disconnected, use `which` to determine gamepad id */
    public function ongamepaddevice( gamepad:Int, type:GamepadDeviceEventType, timestamp:Float ) {}


        /** override this if you want to change how the runtime config is loaded/handled */
    public function get_runtime_config() : Dynamic {

            //we want to load the runtime config from a json file by default
            //:todo: this config name will be settable from project config
        var config_data = app.assets.get_text('config.json');

            //only care if there is a config
        if(config_data != null) {
            return haxe.Json.parse( config_data.text );
        }

        return {};

    } //get_runtime_config

        /** override this if you want to change how the asset list is loaded/handled. By default it uses the asset manifest generated by the build tools. */
    public function get_asset_list() : Array<AssetInfo> {

        var asset_list : Array<AssetInfo> = [];
        var manifest_data = ByteArray.readFile( app.assets.assets_root + app.assets.manifest_path );

        if(manifest_data != null && manifest_data.length != 0) {

            var _list:Array<Dynamic> = haxe.Unserializer.run(manifest_data.toString());

            for(asset in _list) {

                asset_list.push({
                    id : asset.id,
                    path : asset.path,
                    type : Std.string(asset.type).toLowerCase(),
                    ext : haxe.io.Path.extension(asset.path)
                });

            } //for each asset

        } else { //manifest_data != null
            trace('/ snow / default asset manifest not found, or length was zero');
        }

        return asset_list;

    } //get_asset_list

//No need to interact with these, unless you want pre-ready init, just call super.on_internal_init() etc
//to maintain expected App behavior. You can override behavior in the base class, like AppFixedTimestep

        //internal facing api
    @:noCompletion public function on_internal_init() {

        cur_frame_start = app.time;
        last_frame_start = cur_frame_start;
        current_time = 0;
        delta_time = 0.016;

    } //on_internal_init

    @:noCompletion public function on_internal_update() {

        if(fixed_rate != 0) {
                //we haven't reached the next frame yet?
            if(app.time < next_tick) {
                return;
            } else {
                //we have reached the next frame, update the tick
                next_tick = app.time + fixed_rate;
            }
        } //fixed_rate

            //the start of this frame is now
        cur_frame_start = app.time;
            //delta is time since the last frame start
        delta_time = (cur_frame_start - last_frame_start);
            //last frame start is updated to now
        last_frame_start = cur_frame_start;

            //which delta we are going to use, fixed or variable
        var used_delta = (fixed_delta == 0) ? delta_time : fixed_delta;
            //timescale the delta to the given scale
        used_delta *= timescale;
            //update the simulated delta value
        delta_sim = used_delta;

            //update the internal "time" counter
        current_time += used_delta;
            //do the internal systems update
        app.do_internal_update( used_delta );
            //and finally call render
        app.do_internal_render();

        #if snow_native

                //yield to the system a bit
            Sys.sleep(0);

        #end //snow_native

    } //on_internal_update

} //App



/** Read the {App Guide} for full info, and for even more information see : http://gafferongames.com/game-physics/fix-your-timestep/
    this stores and calculates a fixed game update loop, and rendering interpolation is required
    for smooth updates between frames. */
class AppFixedTimestep extends App {

        /** fixed simulation update speed */
    public var frame_time : Float = 0.0167;
        /** the overflow of the updates. This is used to calculate the alpha time for rendering interpolation, `var alpha_time = overflow / frame_time;` */
    public var overflow : Float = 0.0;


    @:noCompletion override public function on_internal_init() {

        frame_time = 1.0/60.0;
        last_frame_start = app.time;

    } //on_internal_init

        //no super.on_internal_update because this entirely controls
        //the update loop for the application itself
    @:noCompletion override public function on_internal_update() {

        cur_frame_start = app.time;
        delta_time = (cur_frame_start - last_frame_start);
        delta_sim = delta_time * timescale;

        if(delta_sim > max_frame_time) {
            delta_sim = max_frame_time;
        }

        last_frame_start = cur_frame_start;

        overflow += delta_sim;

        while(overflow >= frame_time) {

            app.do_internal_update(frame_time * timescale);

            current_time += frame_time * timescale;

            overflow -= frame_time * timescale;

        } //overflow >= frame_time

            //work this out before a render
        alpha = overflow / frame_time;

        app.do_internal_render();

        #if snow_native

                //yield for the system
            Sys.sleep(0);

        #end //snow_native

    } //on_internal_update

} //AppFixedTimestep
