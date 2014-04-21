package lumen;

import haxe.Timer;

import lumen.LumenTypes;

import lumen.utils.ByteArray;
import lumen.window.Window;
import lumen.window.WindowManager;
import lumen.input.InputManager;
import lumen.audio.AudioManager;


class App {
    
    public var app : Lumen;

    public function new() {} 
    public function ready() {}
    public function update(t:Float, dt:Float) {

    }

}

class Lumen {
    
    public var host : App;
    public var config : LumenConfig;

    public var window : WindowManager;
    public var input : InputManager;
    public var audio : AudioManager;

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

        lumen_init( on_event );

    } //init

    public function shutdown() {

        shutting_down = true;

        audio.destroy();
        input.destroy();
        window.destroy();

        lumen_shutdown();

        has_shutdown = true;

    } //shutdown


    public var main_window : Window;

    function on_lumen_ready() {

        if(was_ready) {
            _debug("/ lumen / firing ready event repeatedly is likely not ideal...");
            return;
        }

            //ensure that we are in the correct location for asset loading
        #if lumen_native 
            Sys.setCwd( lumen_app_path() );
                //test this on other platforms, on mac it's writing to 'lumen/def/'
            lumen_pref_path('lumen','default');
        #end //lumen_native
            
            //create the sub systems 
        window = new WindowManager( this );
        input = new InputManager( this );
        audio = new AudioManager( this );        

        was_ready = true;

        _debug('/ lumen / ready, setting up additional systems...');

            //now if they requested a window, let's open one
        main_window = window.create( config.window_config );
            
            // window.create( config.window_config );
            // window.create( config.window_config );
            // window.create( config.window_config );

            //and track the main window only for now 
        main_window.window_event_handler = on_main_window_event;

            //fixed delta time
        mspf = 0.016; //50 fps update
        last_frame_start = lumen_timestamp();

            //now ready
        is_ready = true;
        
            //tell the host app we are done
        host.ready();        

    } //on_lumen_ready

    public var last_frame_start : Float = 0.0;
    public var current_frame_start : Float = 0.0;
    public var last_frame_time : Float = 0.0;
    public var overflow : Float = 0.0;
    public var mspf : Float = 0.01;
    public var t : Float = 0;

    function on_lumen_update() {

        if(!is_ready) {
            return;
        }

        current_frame_start = lumen_timestamp();
        last_frame_time = current_frame_start - last_frame_start;
        
        if(last_frame_time > 0.25) {
            last_frame_time = 0.25;
        }

        last_frame_start = current_frame_start;

        overflow += last_frame_time;

        while(overflow >= mspf) {
            
            input.update();
            audio.update();
            host.update(t, mspf);

            t += mspf;

            overflow -= mspf;

        }

            //render
        window.update( overflow / mspf );

            //yield
        Sys.sleep(0);

    } //on_lumen_update

    function on_event( _event:SystemEvent ) {
            
        _event.type = SystemEvents.typed( cast _event.type );

        if( _event.type != SystemEventType.update && 
            _event.type != SystemEventType.unknown && 
            _event.type != SystemEventType.window &&
            _event.type != SystemEventType.input 

        ) {
            trace( "/ lumen / system event : " + _event );
        }

        switch(_event.type) {

            case SystemEventType.ready: {
                on_lumen_ready();
            } //ready

            case SystemEventType.update: {
                on_lumen_update();
            } //update

            case SystemEventType.quit: {
                shutdown();
            } //quit

            case SystemEventType.window: {
                window.on_event( _event );
            } //window
            
            case SystemEventType.input: {
                if(is_ready) {
                    input.on_event( _event );
                }
            } //input

            case SystemEventType.shutdown: {
                // #if debug
                    _debug('/ lumen / Goodbye.');
                // #end
            } //shutdown

            default: {

            } //default

        } //switch _event.type

    } //on_event

    public function loadimage( path:String, ?components:Int = 4 ) : ImageInfo {
        return lumen_image_load_bytes( path, components );
    }
    public function loadsound_ogg( path:String ) : AudioInfo {
        return lumen_audio_load_ogg_bytes( path );
    }

    function on_main_window_event( _event:WindowEvent ) {

        if(_event.type == window_close) {
            shutdown();
        }

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
        private static var lumen_timestamp = load( "lumen", "lumen_timestamp", 0 );
        private static var lumen_app_path = load( "lumen", "lumen_app_path", 0 );
        private static var lumen_pref_path = load( "lumen", "lumen_pref_path", 2 );
        
        private static var lumen_audio_load_ogg_bytes = load( "lumen", "lumen_audio_load_ogg_bytes", 1 );
        private static var lumen_image_load_bytes = load( "lumen", "lumen_image_load_bytes", 2 );

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

