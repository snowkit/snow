package lumen;

import haxe.Timer;

import lumen.App;
import lumen.LumenTypes;
import lumen.utils.ByteArray;

import lumen.input.Input;
import lumen.audio.Audio;
import lumen.window.Windowing;

import lumen.window.Window;


class Lumen {
    
    public var time (get,never) : Float;

    public var host : App;
    public var config : LumenConfig;

    public var window : Windowing;
    public var input : Input;
    public var audio : Audio;

    public var shutting_down : Bool = false;
    public var has_shutdown : Bool = false;

    public var main_window : Window;

    var was_ready : Bool = false;
    var is_ready : Bool = false;
    
    public function new() {
        
    } //new

//Internal API

    @:noCompletion public function init( _host:App, _config : LumenConfig ) {
        
        host = _host;
        host.app = this;
        config = _config;

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

    function get_time() : Float {

        return lumen_timestamp();

    } //time getter

    function on_lumen_init() {

        _debug('/ lumen / initializing - ', true);

            //ensure that we are in the correct location for asset loading

        #if lumen_native 

            Sys.setCwd( lumen_app_path() );
            
            lumen_pref_path('lumen','default');

        #end //lumen_native

            //fetch runtime config before we actually tell them to pre-ready init
        config.runtime_config = host.get_runtime_config();

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

            //disllow re-entry
        was_ready = true;

            //for now, load in the window size from the runtime config
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
            
            //and track the main window only for now 
        main_window.window_event_handler = on_main_window_event;

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

            case SystemEventType.init: {
                on_lumen_init();
            } //init

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
                _debug('/ lumen / Goodbye.');
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

    public function loadsound_wav( path:String ) : AudioInfo {
        return lumen_audio_load_wav_bytes( path );
    }

    function on_main_window_event( _event:WindowEvent ) {

        if(_event.type == window_close) {
            shutdown();
        }

    } //main_window_events

//Input handlers

    public function onkeydown( _event : KeyEvent ) {

        host.onkeydown(_event);

    } //onkeydown
    
    public function onkeyup( _event : KeyEvent ) {

        host.onkeyup(_event);

    } //onkeyup
    
    public function ontextinput( _event : TextEvent ) {

        host.ontextinput(_event);

    } //onkeyup

    public function onmouseup( _event:MouseEvent ) {
        
        host.onmouseup(_event);
        
    } //onmouseup

    public function onmousedown( _event:MouseEvent ) {

        host.onmousedown(_event);

    } //onmousedown

    public function onmousewheel( _event:MouseEvent ) {

        host.onmousewheel(_event);

    } //onmousewheel

    public function onmousemove( _event:MouseEvent ) {

        host.onmousemove(_event);

    } //onmousemove

//Helpers

       //Loads a function out of a dynamic haxe library
    public static function load( library:String, method:String, args:Int = 0 ) : Dynamic {

        return lumen.utils.Libs.load( library, method, args );

    } //load

//Native bindings

    #if lumen_native

        static var lumen_init = load( "lumen", "lumen_init", 1 );
        static var lumen_shutdown = load( "lumen", "lumen_shutdown", 0 );
        static var lumen_timestamp = load( "lumen", "lumen_timestamp", 0 );
        static var lumen_app_path = load( "lumen", "lumen_app_path", 0 );
        static var lumen_pref_path = load( "lumen", "lumen_pref_path", 2 );
        static var lumen_render_enable_vsync = load( "lumen", "lumen_render_enable_vsync", 1 );
        static var lumen_window_show_cursor = load( "lumen", "lumen_window_show_cursor", 1 );

        static var lumen_audio_load_ogg_bytes = load( "lumen", "lumen_audio_load_ogg_bytes", 1 );
        static var lumen_audio_load_wav_bytes = load( "lumen", "lumen_audio_load_wav_bytes", 1 );
        static var lumen_image_load_bytes = load( "lumen", "lumen_image_load_bytes", 2 );

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

