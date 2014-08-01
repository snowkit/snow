package snow.platform.native.io;

import snow.io.IOSystem;
import snow.io.IO;
import snow.types.Types;

import haxe.io.Path;

#if snow_native

    import snow.utils.Libs;
    import sys.FileSystem;


    /** This class is a low level cross platform IO helper.
        If you want file access, use `Assets` instead, unless really required. */
    class IOSystem extends IOSystemBinding {


        @:noCompletion public function new( _manager:IO, _lib:Snow ) {

            manager = _manager;
            lib = _lib;

        } //new

    //Public API

            /** Opens the specified url in the default browser */
        override  function url_open( _url:String ) {

            if(_url != null && _url.length > 0) {
                snow_io_url_open( _url );
            }

        } //url_open

    //Static public API functions specific to native/desktop.

            /** Add a folder to a watch list for notifications when the contents of the folder change */
        public static function watch_add( _path:String ) {

            if(_path != null && _path.length > 0) {
                snow_io_add_watch( resolve(_path) );
            }

        } //watch_add

            /** Remove a folder from the watch list */
        public static function watch_remove( _path:String ) {

            if(_path != null && _path.length > 0) {
                snow_io_remove_watch( resolve(_path) );
            }

        } //watch_remove

    //File dialogs, only available on platforms where it makes sense.

            /** Opens a file open dialog. Returns a blank string if they cancel or any error occurs. */
        public static function dialog_open( ?_title:String = "Select file", ?_filters:Array<FileFilter> ) {

                //disallow null to the native code
            if(_filters == null) {
                _filters = [ { extension:'*', desc:'all files' } ];
            }

            return snow_io_dialog_open( _title, _filters );

        } //dialog_open

            /** Opens a file save file dialog. Returns a blank string if they cancel or any error occurs. */
        public static function dialog_save( ?_title:String = "Save file", ?_filters:Array<FileFilter> ) {

                //disallow null to the native code
            if(_filters == null) {
                _filters = [ { extension:'*', desc:'all files' } ];
            }

            return snow_io_dialog_save( _title, _filters );

        } //dialog_save

            /** Opens a file open folder select dialog. Returns a blank string if they cancel or any error occurs. */
        public static function dialog_folder( ?_title:String = "Select folder" ) {

            return snow_io_dialog_folder( _title );

        } //dialog_folder

    //Internal API

        @:noCompletion override public function init() {
        } //init
        @:noCompletion override public function process() {
        } //process
        @:noCompletion override public function destroy() {
        } //destroy
        @:noCompletion override public function on_event( _event:SystemEvent ) {
        } //destroy

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

        static var snow_io_add_watch        = Libs.load( "snow", "snow_io_add_watch", 1 );
        static var snow_io_remove_watch     = Libs.load( "snow", "snow_io_remove_watch", 1 );

        static var snow_io_url_open         = Libs.load( "snow", "snow_io_url_open", 1 );

        static var snow_io_dialog_open      = Libs.load( "snow", "snow_io_dialog_open", 2 );
        static var snow_io_dialog_save      = Libs.load( "snow", "snow_io_dialog_save", 2 );
        static var snow_io_dialog_folder    = Libs.load( "snow", "snow_io_dialog_folder", 1 );

    } //IO

#end //snow_native