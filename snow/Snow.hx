package snow;


import snow.App;
import snow.io.typedarray.Uint8Array;
import snow.types.Types;
import snow.utils.Timer;

import snow.utils.Promise;

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

        if(snow.Log.get_level() > 1) {
            log('log / level to ${snow.Log.get_level()}' );
            log('log / filter : ${snow.Log.get_filter()}');
            log('log / exclude : ${snow.Log.get_exclude()}');
        }

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

        _debug('init / initializing');

            //ensure that we are in the correct location for asset loading

        #if snow_native

            var app_path = core.app_path();
            var pref_path = core.app_path_prefs();

            Sys.setCwd( app_path );

            _debug('init / setting up app path $app_path');
            _debug('init / setting up pref path: $pref_path');

        #end //snow_native

        _debug('init / pre ready, init host');

            //any app pre ready init can be handled in here
        host.on_internal_init();

    } //on_snow_init

    function on_snow_ready() {

        if(was_ready) {
            throw Error.error('firing ready event more than once is invalid usage');
        }

        _debug('init / setting up additional systems...');

                //create the sub systems
            io = new IO( this );
            input = new Input( this );
            audio = new Audio( this );
            assets = new Assets( this );
            windowing = new Windowing( this );

            //disllow re-entry
        was_ready = true;

        setup_default_assets().then(function(_){

            setup_configs().then(function(_){

                setup_default_window();

                _debug('init / calling host ready');

                is_ready = true;
                host.ready();

            });

        }).error(function(e) {

            throw Error.init('snow / cannot recover from error: $e');

        });

        //:todo:
        //       iOS has a catch 22,
        //       iOS has to create the window to handle the main loop,
        //       so our update is deferred till then. Promises were using
        //       the update loop to propagate, so they never got called.
        //       Luckily we can just manually flush any until the ready happens for now.

        #if ios
            while(!is_ready) {
                    //handle promise executions
                snow.utils.Promise.Promises.step();
                    //fire any next tick callbacks
                handle_next_list();
            }
        #end

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

        if(freeze) return;

            //first update timers
        Timer.update();

            //handle promise executions
        snow.utils.Promise.Promises.step();

            //fire any next tick callbacks
        handle_next_list();

            //game updates aren't allowed till we are flagged
        if(!is_ready) return;

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
            _debug( 'event / system event / ${_event.type} / $_event');
        }

        if( _event.type != SystemEventType.update ) {
            _verboser( 'event / system event / $_event');
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

    function setup_default_assets() {

        return new Promise(function(resolve, reject) {

            if(!snow_config.config_custom_assets) {

                    //load the correct asset path from the snow config
                assets.manifest_path = snow_config.config_assets_path;

                    //
                _debug('assets / fetching list "${assets.manifest_path}"');

                    //we fetch the a list from the manifest
                default_asset_list().then(function(list) {

                        //then we add the list for the asset manager
                    config.assets = list;
                    assets.add( config.assets );

                    resolve();

                }).error(function(e:Dynamic) {

                    //default asset manifest is not critical
                    //and will leave logs so we just continue with
                    //making a note of the state
                    config.assets = [];
                    resolve();

                });

            } //custom assets

        }); //promise

    } //ready_default_assets

    function setup_configs() {

            //sync configs
        config.window = default_window_config();
        config.render = default_render_config();

        return new Promise(function(resolve, reject){

            if(!snow_config.config_custom_runtime) {

                _debug('config / fetching runtime config');

                default_runtime_config().then(function(_runtime_conf:Dynamic) {

                    config.runtime = _runtime_conf;
                    setup_host_config();
                    resolve();

                });

            } else {

                    //if default config is disabled
                    //we still need the user config
                setup_host_config();
                resolve();

            } //disabled

        }); //promise

    } //setup_configs

    function setup_host_config() {

        _debug('config / fetching user config');

        config = host.config( config );

    } //setup_host_config


    function setup_default_window() {

        _debug('windowing / creating default window');

            //force fullscreen on mobile to get better
            //behavior from the window for now.
            //borderless will control the status bar
        #if mobile
            config.window.fullscreen = true;
        #end //mobile

            //now if they requested a window, let's open one
        if(config.has_window == true) {

            window = windowing.create( config.window );

                //failed to create?
            if(window.handle == null) {
                throw Error.windowing('requested default window cannot be created. cannot continue');
            }

        } //has_window

    } //create_default_window


        /** handles the default method of parsing a runtime config json,
            To change this behavior override `get_runtime_config`. This is called by default in get_runtime_config. */
    function default_runtime_config() : Promise {

        return new Promise(function(resolve, reject) {

            var json:Dynamic = null;

                //we want to load the runtime config from a json file by default
            var onload = function(asset:snow.assets.AssetText) {
                if(asset.text != null) {
                    try {

                        json = haxe.Json.parse( asset.text );
                        _debug('config / ok / loaded runtime config');

                    } catch(e:Dynamic) {
                        log('config / json parse error ');
                        throw Error.init('config / failed / default runtime config failed to parse as JSON. cannot recover. $e');
                    }

                    resolve(json);
                }
            }

            var found = assets.text( snow_config.config_runtime_path, { silent:true, onload:onload });
            if(found == null) resolve({});

        }); //promise

    } //default_runtime_config

        /** handles the default method of parsing the file manifest list as json, stored in an array and returned. */
    function default_asset_list() : Promise {

        return new Promise(function(resolve, reject){

            var list_path : String = assets.assets_root + assets.manifest_path;
            var load = io.data_load( list_path, { binary:false });

            load.then(function(_data:Uint8Array) {

                var _filedata = _data.toBytes().toString();
                if(_filedata != null && _filedata.length != 0) {

                    var _list:Array<String> = haxe.Json.parse(_filedata.toString());
                    var asset_list : Array<AssetInfo> = [];

                    for(asset in _list) {

                        asset_list.push({
                            id : asset,
                            path : haxe.io.Path.join([assets.assets_root, asset]),
                            type : haxe.io.Path.extension(asset),
                            ext : haxe.io.Path.extension(asset)
                        });

                    } //for each asset

                    _debug('assets / ok / loaded asset manifest.');
                    _debug('assets / list loaded as $asset_list');

                    resolve( asset_list );

                } else { //manifest_data != null

                    log('assets / info / default asset manifest is empty?');
                    reject('default asset manifest is empty');

                }

            }).error(function(e:Dynamic) {

                log('assets / info / default asset manifest not found at $list_path');
                reject('default asset manifest error: $e');

            });

        }); //new promise

    } //default_asset_list


        /** Returns a default configured render config */
    function default_render_config() : RenderConfig {

        _debug('config / fetching default render config');

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

        _debug('config / fetching default window config');

        var conf =  {
            fullscreen_desktop  : true,
            fullscreen          : false,
            borderless          : false,
            resizable           : true,
            x                   : 0x1FFF0000,
            y                   : 0x1FFF0000,
            width               : 960,
            height              : 640,
            title               : 'snow app'
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

    function handle_next_list() {

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

    } //handle_next_list

} //Snow

