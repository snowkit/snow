package lumen;

import lumen.utils.ByteArray;
import lumen.input.Input;
import lumen.LumenTypes;

    //Note all times in lumen are in seconds.
    //The default type of application, with variable delta time, or fixed delta time, or a fixed frame rate

class App {

//Access to the lumen API

    public var app : Lumen;

//Configurable values

        //the scale of time
    public var timescale : Float = 1;
             //if this is non zero this will be passed in
    public var fixed_delta : Float = 0;
        //if this is non zero, updates will be forced to this rate
    public var fixed_rate : Float = 0;
        //the maximum frame time
    public var max_frame_time : Float = 0.25;

//Timing information

        //the time the last frame took to run
    public var delta_time : Float = 0.016;
        //the time the last frame took to run
    public var delta_sim : Float = 0.016;
        //the start time of the last frame
    public var last_frame_start : Float = 0.0;
        //the current simulation time
    public var current_time : Float = 0;
        //the start time of this frame
    public var cur_frame_start : Float = 0.0;

//Internal values

        //for fixed_rate, the time when the next tick should occur around
    var next_tick : Float = 0;

//override these in your game class

        //user facing api
    public function new() {}
    public function ready() {}
    public function update(dt:Float) {}

    public function onkeydown( _event : KeyEvent ) {}
    public function onkeyup( _event : KeyEvent ) {}
    public function ontextinput( _event : TextEvent ) {}

    public function onmouseup( _event:MouseEvent ) {}
    public function onmousedown( _event:MouseEvent ) {}
    public function onmousewheel( _event:MouseEvent ) {}
    public function onmousemove( _event:MouseEvent ) {}

    public function ontouchup( _event:TouchEvent ) {}
    public function ontouchdown( _event:TouchEvent ) {}
    public function ontouchmove( _event:TouchEvent ) {}

    public function ongamepadaxis( _event:GamepadEvent ) {}
    public function ongamepadbuttonup( _event:GamepadEvent ) {}
    public function ongamepadbuttondown( _event:GamepadEvent ) {}
    public function ongamepaddevice( _event:GamepadEvent ) {}

//override this if you want to change how the runtime config is loaded/handled

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

//overide this if you want to change how the asset config is loaded/handled 

    public function get_asset_list() : Array<AssetInfo> {

        var asset_list : Array<AssetInfo> = [];
        var manifest_data = ByteArray.readFile( app.assets.assets_root + app.assets.manifest_path );

        if(manifest_data != null) {

            var _list:Array<Dynamic> = haxe.Unserializer.run(manifest_data.toString());

            for(asset in _list) {

                asset_list.push({
                    id : asset.id,
                    path : asset.path,
                    type : Std.string(asset.type).toLowerCase(),
                    ext : haxe.io.Path.extension(asset.path)
                });

            } //for each asset

        } //manifest_data != null

        return asset_list;

    } //get_asset_list

//No need to interact with these, unless you want pre-ready init, just call super.on_lumen_init() etc
//to maintain expected App behavior. You can override behavior in the base class, like AppFixedTimestep

        //internal facing api
    @:noCompletion public function on_lumen_init() {

        cur_frame_start = app.time;
        last_frame_start = cur_frame_start;
        current_time = 0;
        delta_time = 0.016;

    } //on_lumen_init

    @:noCompletion public function on_lumen_update() {

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

            //yield to the system a bit
        Sys.sleep(0);

    } //on_lumen_update

} //App



    //For more information see : http://gafferongames.com/game-physics/fix-your-timestep/
    //this stores and calculates a fixed game update loop, and rendering interpolation is required
    //for smooth updates between frames.
class AppFixedTimestep extends App {

        //fixed simulation update speed
    public var mspf : Float = 0.0167;
        //the overflow of the updates
    public var overflow : Float = 0.0;

    @:noCompletion override public function on_lumen_init() {

        mspf = 1.0/60.0;
        last_frame_start = app.time;

    } //on_lumen_init

        //no super.on_lumen_update because this entirely controls
        //the update loop for the application itself
    @:noCompletion override public function on_lumen_update() {

        cur_frame_start = app.time;
        delta_time = (cur_frame_start - last_frame_start) * timescale;

        if(delta_time > max_frame_time) {
            delta_time = max_frame_time;
        }

        last_frame_start = cur_frame_start;

        overflow += delta_time;

        while(overflow >= mspf) {

            app.do_internal_update(mspf * timescale);

            current_time += mspf * timescale;

            overflow -= mspf * timescale;

        } //overflow >= mspf

        app.do_internal_render();

            //yield for the system
        Sys.sleep(0);

    } //on_lumen_update

} //AppFixedTimestep
