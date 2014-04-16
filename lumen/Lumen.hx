package lumen;

import haxe.Timer;

import lumen.LumenTypes;

import lumen.window.Window;
import lumen.window.WindowManager;
import lumen.input.InputManager;


class App {
    
    public var app : Lumen;

    public function ready() {}

}

class Lumen {
    
    public var host : App;
    public var config : LumenConfig;

    public var windower : WindowManager;
    public var inputer : InputManager;

    public var shutting_down : Bool = false;
    public var has_shutdown : Bool = false;

    var was_ready : Bool = false;
    var is_ready : Bool = false;

    public function new() {

    } //new

//Internal API

    @:noCompletion public function init( _host:App, _config : LumenConfig ) {
        
        host = _host;
        host.app = this;
        config = _config;

        // #if debug
            _debug('/ lumen / initializing - ', true);
        // #end

        windower = new WindowManager( this );
        inputer = new InputManager( this );

        lumen_init( on_event );

    } //init

    public function shutdown() {

        shutting_down = true;

        inputer.destroy();
        windower.destroy();

        lumen_shutdown();

        has_shutdown = true;

        // #if debug
            _debug('/ lumen / Goodbye.');
        // #end

    } //shutdown


    var main_window : Window;

    function on_lumen_ready() {

        if(was_ready) {
            _debug("/ lumen / firing ready event repeatedly is likely not ideal...");
            return;
        }

        was_ready = true;

        _debug('/ lumen / ready and setting up additional requests...');

            //now if they requested a window, let's open one
        main_window = windower.create( config.window_config );
        
            var w2 = windower.create( config.window_config );
            var w3 = windower.create( config.window_config );
            var w4 = windower.create( config.window_config );

            //and track the main window only for now 
        main_window.window_event_handler = on_main_window_event;

            //now ready
        is_ready = true;

            //tell the host app we are done
        host.ready();

    } //on_lumen_ready

    function on_lumen_update() {

        windower.update();
        inputer.update();

    } //on_lumen_update

    function on_event( _event:SystemEvent ) {
            
        _event.type = SystemEvents.typed( cast _event.type );

        if( _event.type != update && 
            _event.type != unknown && 
            _event.type != window &&
            _event.type != input 

        ) {
            trace( "/ lumen / system event : " + _event );
        }

        switch(_event.type) {

            case unknown : { }

            case ready: {
                on_lumen_ready();
            } //ready

            case update: {
                on_lumen_update();
            } //update

            case quit: {
                shutdown();
            } //update

            case window: {
                windower.on_event( _event );
            }
            
            case input: {
                if(is_ready) {
                    inputer.on_event( _event );
                }
            }

            case shutdown : { }
            case app_willenterforeground : { }
            case app_willenterbackground : { }
            case app_terminating : { }
            case app_lowmemory : { }
            case app_didenterforeground : { }
            case app_didenterbackground : { }

        } //switch _event.type

    } //on_event

    function on_main_window_event( _event:WindowEvent ) {

        if(_event.type == window_close) {
            shutdown();
        } //if close

    } //main_window_events

//Helpers

       //Loads a function out of a dynamic haxe library
    public static function load( library:String, method:String, args:Int = 0 ) : Dynamic {

        return lumen.utils.Libs.load( library, method, args );

    } //load

//Native bindings

    #if lumen_native

        private static var lumen_init = load( "lumen", "lumen_init", 1 );
        private static var lumen_shutdown = load( "lumen", "lumen_shutdown", 0 );

    #end //lumen_native

//Debug helpers

    // #if debug

        public var log : Bool = true;
        public var verbose : Bool = true;
        public var more_verbose : Bool = false;
        public function _debug(value:Dynamic, _verbose:Bool = false, _more_verbose:Bool = false) { 
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

