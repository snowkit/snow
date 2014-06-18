package lumen;

import haxe.Timer;

import lumen.App;
import lumen.types.Types;
import lumen.utils.ByteArray;

import lumen.assets.Assets;
import lumen.input.Input;
import lumen.audio.Audio;
import lumen.window.Windowing;
import lumen.window.Window;

    //the platform core bindings
import lumen.Core;

class Lumen {

//Property accessors

        /** The current timestamp */
    public var time (get,never) : Float;
        /** Generate a unique ID to use */
    public var uniqueid (get,never) : String;


//State management

        /** The host application */
    public var host : App;
        /** The configuration from the project file, runtime config and other configs */
    public var config : LumenConfig;

//Sub systems

        /** The window manager */
    public var window : Windowing;
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
    public var main_window : Window;

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

    @:noCompletion public function init( _host:App, _config : LumenConfig ) {

        host = _host;
        host.app = this;
        config = _config;

        core.init( on_event );

    } //init

        /** Shutdown the engine and quit */
    public function shutdown() {

        shutting_down = true;

        audio.destroy();
        input.destroy();
        window.destroy();

        core.shutdown();

        has_shutdown = true;

    } //shutdown

    function get_time() : Float {

        return core.timestamp();

    } //time getter

    function on_lumen_init() {

        _debug('/ lumen / initializing - ', true);

            //ensure that we are in the correct location for asset loading

        #if lumen_native

            var app_path = core.app_path();

            _debug('/ lumen / setting up app path ${app_path}', true);

            Sys.setCwd( app_path );

            #if !mobile
                _debug('/ lumen / setting up pref path', true);
                core.pref_path('lumen','default');
            #end //mobile

        #end //lumen_native

        _debug('/ lumen / pre ready, init host', true);

            //any app pre ready init can be handled in here
        host.on_lumen_init();

    } //on_lumen_init

    function on_lumen_ready() {

        if(was_ready) {
            _debug("/ lumen / firing ready event repeatedly is not ideal...");
            return;
        }


        _debug('/ lumen / ready, setting up additional systems...');


                //create the sub systems
            window = new Windowing( this );
            input = new Input( this );
            audio = new Audio( this );
            assets = new Assets( this );


        _debug('/ lumen / fetching asset list "${assets.manifest_path}"' , true);


                //we fetch the a list from the host so they can override it
            config.asset_data = host.get_asset_list();
                //then we add the list for the asset manager
            assets.add( config.asset_data );


        _debug('/ lumen / fetching runtime config', true);


            //fetch runtime config before we actually tell them to pre-ready init
        config.runtime_config = host.get_runtime_config();

            //disllow re-entry
        was_ready = true;

            //:todo: this should be abstracted to the host in some way
            //load in the window size from the runtime config
        if(config.runtime_config.window != null) {

            if(config.runtime_config.window.width != null) {
                config.window_config.width = config.runtime_config.window.width;
            }

            if(config.runtime_config.window.height != null) {
                config.window_config.height = config.runtime_config.window.height;
            }

        } //runtime config window flag

            //now if they requested a window, let's open one
        main_window = window.create( config.window_config );

            //now ready
        is_ready = true;

            //tell the host app we are done
        host.ready();

    } //on_lumen_ready

    @:noCompletion public function do_internal_update( dt:Float ) {
        input.update();
        audio.update();
        host.update( dt );
    }

    @:noCompletion public function do_internal_render() {
        window.update();
    }

    function on_lumen_update() {

        if(!is_ready) {
            return;
        }

            //handle any internal updates
        host.on_lumen_update();

    } //on_lumen_update

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
            trace( "/ lumen / system event : " + _event );
        }

            //all systems should get these basically...
            //cos of app lifecycles etc being here.
        if(is_ready) {
            audio.on_event( _event );
            window.on_event( _event );
            input.on_event( _event );
        }

        switch(_event.type) {

            case SystemEventType.init: {
                on_lumen_init();
            } //init

            case SystemEventType.ready: {
                on_lumen_ready();
            } //ready

            case SystemEventType.update: {
                on_lumen_update();
            } //update

            case SystemEventType.quit, SystemEventType.app_terminating: {
                shutdown();
            } //quit

            case SystemEventType.shutdown: {
                _debug('/ lumen / Goodbye.');
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

        return lumen.utils.Libs.load( library, method, args );

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

} //Lumen

