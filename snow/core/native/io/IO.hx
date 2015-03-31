package snow.core.native.io;

import snow.io.typedarray.Uint8Array;
import snow.utils.Promise;
import snow.types.Types;
import snow.io.File;
import snow.utils.Libs;
import sys.FileSystem;

import haxe.io.Path;


/** This class is a low level cross platform IO helper.
    If you want file access, use `Assets` instead, unless really required. */
@:allow(snow.system.io.IO)
class IO implements snow.modules.interfaces.IO {

    var system:snow.system.io.IO;

    function new( _system:snow.system.io.IO ) system = _system;

//Public API

        /** Return the full path that the application is located */
    public function app_path() : String {

        return snow_app_path();

    } //app_path

         /** On platforms where this makes sense, get the application specific writeable data path.
             Uses the package from `SnowConfig`, passed through from flow projects or boot config. */
    public function app_path_prefs() : String {

        var _parts = system.app.snow_config.app_package.split('.');
        var _appname = _parts.pop();
        var _org = _parts.join('.');

        return snow_pref_path( _org, _appname );

    } //app_path_prefs


//Static public API functions specific to native/desktop.

    #if desktop


        /** Call this to add a directory to watch for file change notifications.
            This is for directories only. Children files + sub folders children files will notify of change.
            supports:`windows` `mac` `linux` only */
        public function watch_add( _path:String ) : Void {

            if(_path != null && _path.length > 0) {
                snow_io_add_watch( resolve(_path) );
            }

        } //watch_add

        /** Call this to remove a watched directory.
            supports:`windows` `mac` `linux` only */
        public function watch_remove( _path:String ) : Void {

            if(_path != null && _path.length > 0) {
                snow_io_remove_watch( resolve(_path) );
            }

        } //watch_remove

        //File dialogs, only available on platforms where it makes sense.

        /** Call this to open a native platform file open dialog.
            Returns a blank string if they cancel or any error occurs.
            supports: `windows` `mac` `linux` */
        public function dialog_open( ?_title:String = "Select file", ?_filters:Array<FileFilter> ) : String {

                //disallow null to the native code
            if(_filters == null) {
                _filters = [];
            }

            return snow_io_dialog_open( _title, _filters );

        } //dialog_open

            /** Call this to open a native platform file save dialog.
                Returns a blank string if they cancel or any error occurs.
                supports:`windows` `mac` `linux` */
        public function dialog_save( ?_title:String = "Save file", ?_filter:FileFilter ) : String {

                //sending as an array simplifies common
                //code on the native side, but a single extension
                //for a save dialog is logical, or no filter for all files.
            var _filters : Array<FileFilter> = [];

            if(_filter != null) {
                _filters.push(_filter);
            }

            return snow_io_dialog_save( _title, _filters );

        } //dialog_save

            /** Call this to open a native platform folder select dialog.
                Returns a blank string if they cancel or any error occurs.
                supports:`windows` `mac` `linux` */
        public function dialog_folder( ?_title:String = "Select folder" ) : String {

            return snow_io_dialog_folder( _title );

        } //dialog_folder

    #end // desktop


//API concrete Implementation

        /** Opens the specified url in the default browser */
    public function url_open( _url:String ) {

        if(_url != null && _url.length > 0) {
            snow_io_url_open( _url );
        }

    } //url_open

        /** Load bytes from the file path/url given.
            On web a request is sent for the data */
    public function data_load( _path:String, ?_options:IODataOptions ) : Promise {

        return new Promise(function(resolve, reject) {

            var _binary = (_options != null && _options.binary);
            var _file = File.from_file(_path, _binary ? 'rb' : 'r' );

            if(_file != null) {

                    //jump to the end, measure size
                _file.seek(0, FileSeek.end);

                var size = _file.tell();

                    //reset to beginning
                _file.seek(0, FileSeek.set);

                    //create a buffer to read to
                var _dest = new Uint8Array(size);
                var _read = _file.read(_dest, _dest.length, 1);

                    //close+release the file handle
                _file.close();

                resolve(_dest);

            } else { //_file != null

                reject('data_load file cannot be opened $_path');

            }

        });

    } //data_load

        /** Save bytes to the file path/url given. Overwrites the file without warning.
            Does not ensure the path (i.e doesn't check or create folders).
            On platforms where this doesn't make sense (web) this will do nothing atm */
    public function data_save( _path:String, _data:Uint8Array, ?_options:IODataOptions ) : Bool {

        var _binary = (_options != null && _options.binary);
        var _file = File.from_file(_path, _binary ? 'wb' : 'w' );

        if(_file != null) {
            var count : Int = _file.write( _data, _data.length, 1 );

                _file.close();

            return count == 1;
        }

        return false;

    } //data_save


//Internal API

    function init() {}
    function update() {}
    function destroy() {}
    function on_event( _event:SystemEvent ) {}

//Internal

        // :temp: feature from newer version of haxe std
    static function isAbsolute ( path : String ) : Bool {
        if (StringTools.startsWith(path, '/')) return true;
        if (path.charAt(2) == ':') return true;
        return false;
    }

        //convert a path to absolute (if needed) and normalize, remove slash, etc
    static function resolve( _path:String ) {

        if(!isAbsolute(_path)) {
            _path = FileSystem.fullPath(_path);
        }

        _path = Path.normalize(_path);
        _path = Path.removeTrailingSlashes(_path);

        return _path;

    } //resolve

//Bindings


    static var snow_io_url_open         = Libs.load( "snow", "snow_io_url_open", 1 );
    static var snow_app_path            = Libs.load( "snow", "snow_app_path", 0 );
    static var snow_pref_path           = Libs.load( "snow", "snow_pref_path", 2 );

    #if desktop

        static var snow_io_add_watch        = Libs.load( "snow", "snow_io_add_watch", 1 );
        static var snow_io_remove_watch     = Libs.load( "snow", "snow_io_remove_watch", 1 );

        static var snow_io_dialog_open      = Libs.load( "snow", "snow_io_dialog_open", 2 );
        static var snow_io_dialog_save      = Libs.load( "snow", "snow_io_dialog_save", 2 );
        static var snow_io_dialog_folder    = Libs.load( "snow", "snow_io_dialog_folder", 1 );

    #end //desktop

} //IO

