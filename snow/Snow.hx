package snow;


import snow.App;
import snow.types.Types;
import snow.utils.ByteArray;
import snow.utils.Timer;

import snow.io.IO;
import snow.input.Input;
import snow.audio.Audio;
import snow.assets.Assets;
import snow.window.Window;
import snow.window.Windowing;

    //the platform core bindings
import snow.Core;

import snow.Log.log;
import snow.Log._debug;
import snow.Log._verbose;
import snow.Log._verboser;

class Snow {

//Property accessors

        /** The current timestamp */
    public var time (get,never) : Float;
        /** Generate a unique ID to use */
    public var uniqueid (get,never) : String;


//State management

        /** The host application */
    public var host : App;
        /** The application configuration specifics (like window, runtime, and asset lists) */
    public var config : AppConfig;
        /** The configuration for snow itself, set via build project flags */
    public var snow_config : SnowConfig;
        /** Whether or not we are frozen, ignoring events i.e backgrounded/paused */
    public var freeze (default,set) : Bool = false;

//Sub systems

        /** The io system */
    public var io : IO;
        /** The input system */
    public var input : Input;
        /** The asset system */
    public var assets : Assets;
        /** The audio system */
    public var audio : Audio;
        /** The window manager */
    public var windowing : Windowing;

        /** Set if shut down has commenced */
    public var shutting_down : Bool = false;
        /** Set if shut dow has completed  */
    public var has_shutdown : Bool = false;
        /** If the config specifies a default window, this is it */
    public var window : Window;

//Internal values

        //if already passed the ready state
    var was_ready : Bool = false;
        //if ready has completed, so systems can begin safely
    var is_ready : Bool = false;
        //the core platform instance to bind us
    @:noCompletion public static var core : Core;


    @:noCompletion public function new() {

            //We create the core as a concrete platform version of the core
        core = new Core( this );
        next_list = [];

    } //new

//Internal API

    @:noCompletion public function init( _snow_config:SnowConfig, _host : App ) {

        snow_config = _snow_config;
        if(snow_config.app_package == null) {
            snow_config.app_package = 'org.snowkit.snowdefault';
        }

        config = {
            has_window : true,
            runtime : {},
            window : null,
            render : null,
            assets : [],
            web : {
                no_context_menu : true,
                prevent_default_keys : [
                    Key.left, Key.right, Key.up, Key.down,
                    Key.backspace, Key.tab, Key.delete
                ],
                prevent_default_mouse_wheel : true,
                true_fullscreen : false
            },
            native : {
                audio_buffer_length : 176400,
                audio_buffer_count : 4
            }
        };

        host = _host;
        host.app = this;

        core.init( on_event );

    } //init

        /** Shutdown the engine and quit */
    public function shutdown() {

        shutting_down = true;

        host.ondestroy();
        io.destroy();
        audio.destroy();
        input.destroy();
        windowing.destroy();

        core.shutdown();

        has_shutdown = true;

    } //shutdown

    inline function get_time() : Float {

        return core.timestamp();

    } //time getter

    function on_snow_init() {

        _debug('initializing - ');

            //ensure that we are in the correct location for asset loading

        #if snow_native

            var app_path = core.app_path();
            var pref_path = core.app_path_prefs();

            Sys.setCwd( app_path );

            _debug('setting up app path $app_path');
            _debug('setting up pref path: $pref_path');

        #end //snow_native

        _debug('pre ready, init host');

            //any app pre ready init can be handled in here
        host.on_internal_init();

    } //on_snow_init

    function on_snow_ready() {

        if(was_ready) {
            log("firing ready event repeatedly is not ideal...");
            return;
        }


        _debug('ready, setting up additional systems...');


                //create the sub systems
            io = new IO( this );
            input = new Input( this );
            audio = new Audio( this );
            assets = new Assets( this );
            windowing = new Windowing( this );


        if(!snow_config.config_custom_assets){

                //load the correct asset path from the snow config
            assets.manifest_path = snow_config.config_assets_path;

                //
            _debug('fetching asset list "${assets.manifest_path}"');

                //we fetch the a list from the manifest
            config.assets = default_asset_list();
                //then we add the list for the asset manager
            assets.add( config.assets );

        } //custom assets

        if(!snow_config.config_custom_runtime) {
                //fetch from a config file, the custom
            config.runtime = default_runtime_config();
        }

        config.window = default_window_config();
        config.render = default_render_config();

        _debug('fetching user config');

            //request config changes, if any
        config = host.config( config );

            //force fullscreen on mobile to get better
            //behavior from the window for now.
            //borderless will control the status bar
        #if mobile
            config.window.fullscreen = true;
        #end //mobile

            //disllow re-entry
        was_ready = true;

        _debug('creating default window');

            //now if they requested a window, let's open one
        if(config.has_window == true) {

            window = windowing.create( config.window );

                //failed to create?
            if(window.handle == null) {
                throw "requested default window cannot be created. Cannot continue.";
            }

        } //has_window

            //now ready
        is_ready = true;

            //tell the host app we are done
        host.ready();

    } //on_snow_ready

    @:allow(snow.App)
    function do_internal_update( dt:Float ) {

        io.update();
        input.update();
        audio.update();
        host.update( dt );

    } //do_internal_update

        /** Called for you by snow, unless configured otherwise. Only call this manually if your render_rate is 0! */
    public function render() {

        windowing.update();

    } //render

    function on_snow_update() {

        if(!is_ready || freeze) {
            return;
        }

            //first update timers
        Timer.update();

            //fire any next tick
        if(next_list.length > 0) {

                //to avoid culling ones adding during a next call
            var _pre_next_length = next_list.length;
                //avoid allocating on the run loop
                //as much as possible so no iterator
            for(i in 0 ... next_list.length) {
                next_list[i]();
            }

            next_list.splice(0, _pre_next_length);

        } //next_list.length

            //handle any internal updates
        host.on_internal_update();

            //handle any internal render updates
        host.on_internal_render();

            //let the system have some time
        #if snow_native
            Sys.sleep(0);
        #end

    } //on_snow_update

    public function dispatch_system_event( _event:SystemEvent ) {

        on_event(_event);

    } //dispatch_system_event

    function on_event( _event:SystemEvent ) {

        if( _event.type != SystemEventType.update &&
            _event.type != SystemEventType.unknown &&
            _event.type != SystemEventType.window &&
            _event.type != SystemEventType.input

        ) {
            _debug( "system event : " + _event + ' / ' + _event.type );
        }

        if( _event.type != SystemEventType.update ) {
            _verboser( "system event : " + _event );
        }

            //all systems should get these basically...
            //cos of app lifecycles etc being here.
        if(is_ready) {
            io.on_event( _event );
            audio.on_event( _event );
            windowing.on_event( _event );
            input.on_event( _event );
            host.onevent( _event );
        }

        switch(_event.type) {

            case SystemEventType.init: {
                on_snow_init();
            } //init

            case SystemEventType.ready: {
                on_snow_ready();
            } //ready

            case SystemEventType.update: {
                on_snow_update();
            } //update

            case SystemEventType.quit, SystemEventType.app_terminating: {
                shutdown();
            } //quit

            case SystemEventType.shutdown: {
                log('Goodbye.');
            } //shutdown

            default: {

            } //default

        } //switch _event.type

    } //on_event

    function set_freeze( _freeze:Bool ) {

        freeze = _freeze;

        if(_freeze) {
            audio.suspend();
        } else {
            audio.resume();
        }

        return freeze;

    } //set_freeze



        /** handles the default method of parsing a runtime config json,
            To change this behavior override `get_runtime_config`. This is called by default in get_runtime_config. */
    function default_runtime_config() : Dynamic {

            //we want to load the runtime config from a json file by default
        var config_data = assets.text( snow_config.config_runtime_path, { silent:true });

            //only care if there is a config
        if(config_data != null && config_data.text != null) {

            try {

                var json = haxe.Json.parse( config_data.text );

                _debug('config / ok / default runtime config');

                return json;

            } catch(e:Dynamic) {

                log('config / failed / default runtime config failed to parse as JSON. cannot recover.');
                throw e;

            }
        }

        return {};

    } //default_runtime_config

        /** handles the default method of parsing the file manifest list as json, stored in an array and returned. */
    function default_asset_list() : Array<AssetInfo> {

        var asset_list : Array<AssetInfo> = [];
        var list_path : String = assets.assets_root + assets.manifest_path;
        var manifest_data = null;

        manifest_data = ByteArray.readFile( list_path, { async:false, binary:false });

        if(manifest_data != null && manifest_data.length != 0) {

                var _list:Array<String> = haxe.Json.parse(manifest_data.toString());

                for(asset in _list) {

                    asset_list.push({
                        id : asset,
                        path : haxe.io.Path.join([assets.assets_root, asset]),
                        type : haxe.io.Path.extension(asset),
                        ext : haxe.io.Path.extension(asset)
                    });

                } //for each asset

            _debug('assets / ok / loaded default asset manifest.');

        } else { //manifest_data != null

            log('assets / info / default asset manifest not found.');

        }

        return asset_list;

    } //default_asset_list


        /** Returns a default configured render config */
    function default_render_config() : RenderConfig {

        return {
            depth : false,
            stencil : false,
            antialiasing : 0,
            red_bits : 8,
            green_bits : 8,
            blue_bits : 8,
            alpha_bits : 8,
            depth_bits : 0,
            stencil_bits : 0,
            opengl : {
                minor:0, major:0,
                profile:OpenGLProfile.compatibility
            }
        };

    } //default_render_config

        /** Returns a default configured window config */
    function default_window_config() : WindowConfig {

        var conf =  {
            fullscreen_desktop  : true,
            fullscreen          : false,
            borderless          : false,
            resizable           : true,
            x                   : 0x1FFF0000,
            y                   : 0x1FFF0000,
            width               : 960,
            height              : 640,
            title               : "snow app"
        };

            #if mobile
                conf.fullscreen = true;
                conf.borderless = true;
            #end //mobile

        return conf;

    } //default_window_config


//Helpers

    function get_uniqueid() : String {
        return _uniqueid();
    } //get_uniqueid

    inline function _uniqueid(?val:Int) : String {

        // http://www.anotherchris.net/csharp/friendly-unique-id-generation-part-2/#base62

        if(val == null) val = Std.random(0x7fffffff);

        function to_char(value:Int) : String {
            if (value > 9) {
                var ascii = (65 + (value - 10));
                if (ascii > 90) { ascii += 6; }
                return String.fromCharCode(ascii);
            } else return Std.string(value).charAt(0);
        } //to_char

        var r = Std.int(val % 62);
        var q = Std.int(val / 62);
        if (q > 0) return _uniqueid(q) + to_char(r);
        else return Std.string(to_char(r));

    } //_uniqueid

        /** Loads a function out of a library */
    public static function load( library:String, method:String, args:Int = 0 ) : Dynamic {

        return snow.utils.Libs.load( library, method, args );

    } //load


    static var next_list : Array<Void->Void>;
        /** Call a function at the start of the next frame,
            useful for async calls in a sync context, allowing the sync function to return safely before the onload is fired. */
    public static function next( func: Void->Void ) {

        if(func != null) {
            next_list.push(func);
        }

    } //next

} //Snow

