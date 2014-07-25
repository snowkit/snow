package snow;


import snow.App;
import snow.types.Types;
import snow.utils.ByteArray;
import snow.utils.Timer;

import snow.assets.Assets;
import snow.input.Input;
import snow.audio.Audio;
import snow.window.Windowing;
import snow.window.Window;

    //the platform core bindings
import snow.Core;

class Snow {

//Property accessors

        /** The current timestamp */
    public var time (get,never) : Float;
        /** Generate a unique ID to use */
    public var uniqueid (get,never) : String;


//State management

        /** The host application */
    public var host : App;
        /** The configuration from the project file, runtime config and other configs */
    public var config : SnowConfig;

//Sub systems

        /** The window manager */
    public var windowing : Windowing;
        /** The input system */
    public var input : Input;
        /** The audio system */
    public var audio : Audio;
        /** The asset system */
    public var assets : Assets;

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
    var core : Core;

    @:noCompletion public function new() {

            //We create the core as a concrete platform version of the core
        core = new Core( this );

    } //new

//Internal API

    @:noCompletion public function init( __config : SnowConfig ) {

        if(__config == null) {
            throw "/ snow / init / failed due to null config passed in.";
        }

        if(__config.host == null) {
            throw "/ snow / init / failed due to null config.host passed in.";
        }

        config = __config;

        if(config.run_loop == null) {
            config.run_loop = true;
        }

        host = config.host;
        host.app = this;

        core.init( on_event );

    } //init

        /** Shutdown the engine and quit */
    public function shutdown() {

        shutting_down = true;

        host.destroyed();
        audio.destroy();
        input.destroy();
        windowing.destroy();

        core.shutdown();

        has_shutdown = true;

    } //shutdown

    function get_time() : Float {

        return core.timestamp();

    } //time getter

    function on_snow_init() {

        _debug('/ snow / initializing - ', true);

            //ensure that we are in the correct location for asset loading

        #if snow_native

            var app_path = core.app_path();

            _debug('/ snow / setting up app path ${app_path}', true);

            Sys.setCwd( app_path );

            #if !mobile
                _debug('/ snow / setting up pref path', true);
                core.pref_path('snow','default');
            #end //mobile

        #end //snow_native

        _debug('/ snow / pre ready, init host', true);

            //any app pre ready init can be handled in here
        host.on_internal_init();

    } //on_snow_init

    function on_snow_ready() {

        if(was_ready) {
            _debug("/ snow / firing ready event repeatedly is not ideal...");
            return;
        }


        _debug('/ snow / ready, setting up additional systems...');


                //create the sub systems
            windowing = new Windowing( this );
            input = new Input( this );
            audio = new Audio( this );
            assets = new Assets( this );


        _debug('/ snow / fetching asset list "${assets.manifest_path}"' , true);


                //we fetch the a list from the host so they can override it
            config.asset_data = host.get_asset_list();
                //then we add the list for the asset manager
            assets.add( config.asset_data );


        _debug('/ snow / fetching runtime config', true);


            //fetch runtime config before we actually tell them to pre-ready init
        config.runtime = host.get_runtime_config();


        _debug('/ snow / fetching window config', true);

            //fetch runtime config before we actually tell them to pre-ready init
        config.window = host.get_window_config();

            //disllow re-entry
        was_ready = true;

            //now if they requested a window, let's open one
        window = windowing.create( config.window );

            //now ready
        is_ready = true;

            //tell the host app we are done
        host.ready();

    } //on_snow_ready

    @:noCompletion public function do_internal_update( dt:Float ) {
        input.update();
        audio.update();
        host.update( dt );
    }

    @:noCompletion public function do_internal_render() {
        windowing.update();
    }

    function on_snow_update() {

        if(!is_ready) {
            return;
        }

            //update any timers
        Timer.update();

            //handle any internal updates
        host.on_internal_update();

    } //on_snow_update

    public function dispatch_system_event( _event:SystemEvent ) {

        on_event(_event);

    } //dispatch_system_event

    function on_event( _event:SystemEvent ) {

        if(Std.is(_event.type, Int)) {
            _event.type = SystemEvents.typed( cast _event.type );
        }

        if( _event.type != SystemEventType.update &&
            _event.type != SystemEventType.unknown &&
            _event.type != SystemEventType.window &&
            _event.type != SystemEventType.input

        ) {
            trace( "/ snow / system event : " + _event );
        }

            //all systems should get these basically...
            //cos of app lifecycles etc being here.
        if(is_ready) {
            audio.on_event( _event );
            windowing.on_event( _event );
            input.on_event( _event );
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
                _debug('/ snow / Goodbye.');
            } //shutdown

            default: {

            } //default

        } //switch _event.type

    } //on_event


//Helpers

    function get_uniqueid() : String {

        return haxe.crypto.Md5.encode( Std.string( time * Math.random() ));

    } //uniqueid

        /** Loads a function out of a library */
    public static function load( library:String, method:String, args:Int = 0 ) : Dynamic {

        return snow.utils.Libs.load( library, method, args );

    } //load

//Debug helpers

    // #if debug

        @:noCompletion public var log : Bool = true;
        @:noCompletion public var verbose : Bool = true;
        @:noCompletion public var more_verbose : Bool = false;
        @:noCompletion public function _debug(value:Dynamic, _verbose:Bool = false, _more_verbose:Bool = false) {
            if(log) {
                if(verbose && _verbose && !_more_verbose) {
                    trace(value);
                } else
                if(more_verbose && _more_verbose) {
                    trace(value);
                } else {
                    if(!_verbose && !_more_verbose) {
                        trace(value);
                    }
                } //elses
            } //log
        } //_debug

    // #end //debug

} //Snow

