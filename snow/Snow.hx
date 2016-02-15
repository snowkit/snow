package snow;

import snow.api.Debug.*;
import snow.api.Timer;
import snow.api.Promise;
import snow.api.buffers.Uint8Array;
import snow.types.Types;

import snow.core.Runtime;
import snow.systems.io.IO;
import snow.systems.input.Input;
import snow.systems.assets.Asset.AssetJSON;
import snow.systems.assets.Assets;
import snow.systems.audio.Audio;


class Snow {

    //public

            /** The host application */
        public var host : AppHost;
            /** The application configuration specifics (like window, user, runtime, etc) */
        public var config : snow.types.Types.AppConfig;
            /** Whether or not we are frozen, ignoring events i.e backgrounded/paused */
        public var freeze (default,set) : Bool = false;
            /** Whether or not the ready state has been reached */
        public var ready (default, null) : Bool = false;

            /** The current timestamp */
        public var time (get,never) : Float;
            /** Generate a unique ID to use */
        public var uniqueid (get,never) : String;
            /** A static access to the timestamp for convenience */
        public static var timestamp (get, never) : Float;

    //systems

            /** The runtime module */
        public var runtime : AppRuntime;
            /** The io system */
        public var io : IO;
            /** The input system */
        public var input : Input;
            /** The audio system */
        public var audio : Audio;
            /** The asset system */
        public var assets : Assets;

    //state

            /** The platform identifier, a string,
                but uses `snow.types.Types.Platform` abstract enum internally */
        public var platform : String = 'unknown';
            /** The os identifier, a string,
                but uses `snow.types.Types.OS` abstract enum internally */
        public var os : String;
            /** A debug flag for convenience, true if the app was built with the haxe -debug flag or define */
        public var debug : Bool = #if debug true #else false #end;

            /** Set if shut down has commenced */
        public var shutting_down : Bool = false;
            /** Set if shut dow has completed  */
        public var has_shutdown : Bool = false;

    //extensions

        var extensions: Array<snow.core.Extension>;

    //internal preallocated events

        var sys_event: SystemEvent;
        var win_event: WindowEvent;

    //api

        public function new(_host : AppHost) {

            assertnull(_host, 'snow App instance was null!');

            _debug('app / init / debug:$debug');
            _debug('app / ident: ' + snow.types.Config.app_ident);
            _debug('app / config: ' + snow.types.Config.app_config);

            if(snow.api.Debug.get_level() > 1) {
                log('log / level to ${snow.api.Debug.get_level()}' );
                var _filter = snow.api.Debug.get_filter();
                var _exclude = snow.api.Debug.get_exclude();
                if(_filter != null) log('log / filter : $_filter');
                if(_exclude != null) log('log / exclude : $_exclude');
            }

            host = _host;
            host.app = this;
            config = default_config();

            _debug('app / assets / ${snow.types.Config.module_assets}');
            _debug('app / audio / ${snow.types.Config.module_audio}');
            _debug('app / io / ${snow.types.Config.module_io}');

            sys_event = new SystemEvent();
            win_event = new WindowEvent();

            io = new IO(this);
            input = new Input(this);
            audio = new Audio(this);
            assets = new Assets(this);

            extensions = [];
            for(_ext_type in snow.types.Config.extensions) {

                var _class = Type.resolveClass(_ext_type);
                if(_class == null) throw Error.error('Extension `$_ext_type`: Type not found via Type.resolveClass!');

                var _instance:snow.core.Extension = Type.createInstance(_class, null);
                if(_instance == null) throw Error.error('Extension `$_ext_type`: Instance was null on calling new()!');

                extensions.push(_instance);

            } //each extension

            _debug('app / runtime / new ${snow.types.Config.app_runtime}');

            runtime = new AppRuntime(this);

            assertnull(os, 'init - Runtime didn\'t set the app.os value!');
            assertnull(platform, 'init - Runtime didn\'t set the app.platform value!');
            // assertnull(config.runtime, 'init - Runtime didn\'t set the app.config.runtime value!');

            _debug('app / os:$os / platform:$platform / init / $time');
            dispatch_event(se_init);
            host.internal_init();

            step();

            _debug('app / ready / $time');
            dispatch_event(se_ready);

            step();

            _debug('init / runtime / ${runtime.name} / run');

            var _should_exit = runtime.run();
            if(_should_exit && !(has_shutdown || shutting_down)) {
                shutdown();
            }

        } //new

            //internal
        var immediate_shutdown = false;

            /** Shutdown the engine and quit */
        public function shutdown() {

            // assert(shutting_down == false, 'snow - calling shutdown more than once is disallowed');
            if(shutting_down) {
                log('shutdown / called again, already shutting down - ignoring');
                return;
            }
            
            assert(has_shutdown == false, 'snow - calling shutdown more than once is disallowed');

            shutting_down = true;

            host.ondestroy();

            dispatch_event(se_shutdown);

            io.shutdown();
            audio.shutdown();
            assets.shutdown();
            input.shutdown();

            runtime.shutdown(immediate_shutdown);

            has_shutdown = true;

        } //shutdown

    //events

            /** Dispatch a system event explicitly */
        public function dispatch_event(_type:SystemEventType) {

            sys_event.set(_type, null, null);

            onevent(sys_event);

        } //dispatch_event

        public function dispatch_window_event(_type:WindowEventType, _timestamp:Float, _window_id:Int, _x:Int, _y:Int) {
            
            win_event.set(_type, _timestamp, _window_id, _x, _y);
            sys_event.set(se_window, win_event, null);
            
            onevent(sys_event);

        } //dispatch_window_event

        @:allow(snow.systems.input.Input)
        function dispatch_input_event(_event:InputEvent) {
            
            sys_event.set(se_input, null, _event);
            
            onevent(sys_event);

        } //dispatch_input_event

            /** Handles snow system events, typically emitted via the runtime and modules.
                Dispatch events manually using the `dispatch_*` calls. */
        var i = 0;
        public function onevent(_event:SystemEvent) {

            // if( _event.type != se_tick ) {
            //    log('event / system event / ${_event.type}');
            //     if(_event.window != null) {
            //         log('   window / ${_event.window.type} / ${_event.window.window_id} / ${_event.window.data1},${_event.window.data2}');
            //     }
            // }

            io.onevent( _event );
            audio.onevent( _event );
            input.onevent( _event );
            host.onevent( _event );

            i = 0; while(i < extensions.length) {
                extensions[i].onevent(_event);
                ++i;
            }

            switch(_event.type) {

                case se_ready:                      on_ready_event();
                case se_tick:                       on_tick_event();
                case se_quit:                       shutdown();
                case se_shutdown:                   log('goodbye.');
                    //mobile app terminate is an immediate termination
                case se_app_terminating:
                    immediate_shutdown = true;
                    shutdown();
                case _:

            } //switch _event.type

        } //onevent

            /** Call a function at the start of the next frame,
                useful for async calls in a sync context, allowing the sync function to return safely before the onload is fired. */
        inline
        public static function next( func: Void->Void ) {

            if(func != null) next_queue.push(func);

        } //next

            /** Call a function at the end of the current frame */
        inline
        public static function defer( func: Void->Void ) {

            if(func != null) defer_queue.push(func);

        } //defer

    //internal endpoints

        inline function get_time() : Float return get_timestamp();
        inline function get_uniqueid() : String return make_uniqueid();
        static inline function get_timestamp() : Float return AppRuntime.timestamp();

    //internal event handlers

        var had_ready_event = false;
        inline function on_ready_event() {

            assert(had_ready_event == false, 'snow; the ready event should not be fired repeatedly');
            had_ready_event = true;

            setup_configs().then(function(_) {

                _debug('init / setup default configs : ok');
                _debug('init / runtime ready');
                runtime.ready();

                _debug('init / host ready');
                host.ready();

                _debug('init / ready');
                ready = true;

            }).error(function(e) {

                throw Error.init('snow / cannot recover from error: $e');

            });

            step();

        } //on_ready_event

        inline function on_tick_event() {

            if(freeze) return;

            Timer.update();

            snow.api.Promise.Promises.step();

            cycle_next_queue();

            if(!shutting_down && ready) {
                host.internal_tick();
            }

            cycle_defer_queue();

        } //on_tick_event

    //setup and boot

        function setup_configs() {

                //blank/null config path means don't try to load it
            if(snow.types.Config.app_config == null || snow.types.Config.app_config == '') {

                setup_host_config();

                return Promise.resolve();

            } //blank config

            return new Promise(function(resolve, reject) {

                _debug('config / fetching user config');

                default_user_config().then(function(_user_conf:Dynamic) {

                    config.user = _user_conf;

                }).error(function(error){

                    throw Error.init('config / failed / default user config JSON failed to parse. Cannot recover. $error');

                }).then(function(){

                    setup_host_config();
                    resolve();

                });

            }); //promise

        } //setup_configs

        inline function setup_host_config() {

            _debug('config / fetching host config');

            config = host.config( config );

        } //setup_host_config

            /** Handles the default method of parsing a user config json */
        function default_user_config() : Promise {

            _debug('config / setting up default user config');

                //for the default config, we only reject if there is a json parse error
            return new Promise(function(resolve, reject) {

                var load = io.data_flow(assets.path(snow.types.Config.app_config), AssetJSON.processor);

                    load.then(resolve).error(function(error:Error) {
                        switch(error) {
                            case Error.parse(val):
                                reject(error);
                            case _:
                                log('config / user config will be null! / $error');
                                resolve(null);
                        }
                    });

            }); //promise

        } //default_user_config

        function default_config() : AppConfig {

            return {
                user : null,
                window : default_window_config(),
                render : default_render_config(),
                runtime : null
            }

        } //default_config

        /** Returns a default configured render config */
        function default_render_config() : RenderConfig {

            _debug('config / fetching default render config');

            return {
                depth : 0,
                stencil : 0,
                antialiasing : 0,
                red_bits : 8,
                green_bits : 8,
                blue_bits : 8,
                alpha_bits : 8,
                opengl : {
                    #if mobile
                        major:2, minor:0,
                        profile: OpenGLProfile.gles
                    #else
                        major:0, minor: 0,
                        profile: OpenGLProfile.compatibility
                    #end
                },
                webgl : {
                    version : 1
                }
            };

        } //default_render_config

            /** Returns a default configured window config */
        function default_window_config() : WindowConfig {

            _debug('config / fetching default window config');

            var conf : WindowConfig = {
                true_fullscreen     : false,
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

    //properties

        function set_freeze( _freeze:Bool ) {

            freeze = _freeze;

            dispatch_event(_freeze ? se_freeze : se_unfreeze);

            return freeze;

        } //set_freeze

    //step

        inline function step() {

            snow.api.Promise.Promises.step();

            while(next_queue.length > 0) {
                cycle_next_queue();
            }

            while(defer_queue.length > 0) {
                cycle_defer_queue();
            }

        } //step

    //callbacks

        static var next_queue : Array<Void->Void> = [];
        static var defer_queue : Array<Void->Void> = [];

        inline function cycle_next_queue() {

            var count = next_queue.length;
            var i = 0;
            while(i < count) {
                (next_queue.shift())();
                ++i;
            }

        } //cycle_next_queue

        inline function cycle_defer_queue() {

            var count = defer_queue.length;
            var i = 0;
            while(i < count) {
                (defer_queue.shift())();
                ++i;
            }

        } //cycle_next_queue

    //helpers

        @:noCompletion public
        inline function copy_window_config( _config:WindowConfig ) : WindowConfig {
            return {
                borderless:_config.borderless,
                fullscreen:_config.fullscreen,
                true_fullscreen:_config.true_fullscreen,
                height:_config.height,
                no_input:_config.no_input,
                resizable:_config.resizable,
                title:'${_config.title}',
                width:_config.width,
                x:_config.x,
                y:_config.y
            }
        }

        @:noCompletion public
        inline function copy_render_config( _config:RenderConfig ) : RenderConfig {
            return {
                antialiasing: _config.antialiasing,
                depth: _config.depth,
                stencil: _config.stencil,
                red_bits: _config.red_bits,
                green_bits: _config.green_bits,
                blue_bits: _config.blue_bits,
                alpha_bits: _config.alpha_bits,
                opengl : {
                    major: _config.opengl.major,
                    minor: _config.opengl.minor,
                    profile: _config.opengl.profile
                }
            }
        }

        function make_uniqueid(?val:Int) : String {

            // http://www.anotherchris.net/csharp/friendly-unique-id-generation-part-2/#base62

            if(val == null) {
                #if neko val = Std.random(0x3FFFFFFF);
                #else val = Std.random(0x7fffffff);
                #end
            }

            inline function to_char(value:Int) {
                if (value > 9) {
                    var ascii = (65 + (value - 10));
                    if (ascii > 90) ascii += 6;
                    return String.fromCharCode(ascii);
                } else return Std.string(value).charAt(0);
            } //to_char

            var r = Std.int(val % 62);
            var q = Std.int(val / 62);

            if (q > 0) return make_uniqueid(q) + to_char(r);

            return Std.string(to_char(r));

        } //make_uniqueid

} //Snow
