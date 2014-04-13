package lumen;

import haxe.Timer;

typedef LumenConfig<T> = {
    ? host                  : T,
    ? fullscreen            : Bool,
    ? resizable             : Bool,
    ? borderless            : Bool,
    ? antialiasing          : Int,
    ? stencil_buffer        : Bool,
    ? depth_buffer          : Bool,
    ? vsync                 : Bool,
    ? fps                   : Int,
    ? width                 : Int,
    ? height                : Int,
    ? title                 : String,

    ? orientation           : String,
    ? multitouch_supported  : Bool,
    ? multitouch            : Bool
}

class Lumen<T> {

    public var host : T;
    public var config : LumenConfig<T>;

    public var shutting_down : Bool = false;
    public var has_shutdown : Bool = false;

    public function new() {

    } //new

//Internal API

    @:noCompletion public function init( _host:T, _config : LumenConfig<T> ) {
        
        host = _host;
        config = _config;

        // #if debug
            _debug('/ lumen / initializing - ', true);
            _debug('/ lumen / Creating window at ' + config.width + 'x' + config.height, true);
        // #end

        trace("/ lumen / hold on... ");
        lumen_create_window( on_window_created, config );

        _debug('/ lumen / Ready.');

    } //init

    function on_window_created( _config:LumenConfig<T> ) {
        trace('/ lumen / done.');
        trace(_config);
    }

    public function shutdown() {

        shutting_down = true;

        has_shutdown = true;

        // #if debug
            _debug('/ lumen / Goodbye.');
        // #end

    } //shutdown

//Helpers

       //Loads a function out of a dynamic haxe library
    public static function load( library:String, method:String, args:Int = 0 ) : Dynamic {

        return lumen.utils.Libs.load( library, method, args );

    } //load

//Native bindings

    #if lumen_native

        private static var lumen_create_window = load( "lumen", "lumen_create_window", 2 );

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

