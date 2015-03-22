package snow.platform.native.io;

import snow.io.IOSystem;
import snow.io.IO;
import snow.io.typedarray.Uint8Array;
import snow.utils.Promise;

import snow.types.Types;

import haxe.io.Path;

import snow.platform.native.io.IOFile;

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
        override public function url_open( _url:String ) {

            if(_url != null && _url.length > 0) {
                snow_io_url_open( _url );
            }

        } //url_open

        /** Load bytes from the file path/url given.
            On web a request is sent for the data */
    override public function data_load( _path:String, ?_options:IODataOptions ) : Promise {

        return new Promise(function(resolve, reject) {

            var _binary = (_options != null && _options.binary);
            var _file : IOFile = IOFile.from_file(_path, _binary ? 'rb' : 'r' );

            if(_file != null) {

                    //jump to the end, measure size
                _file.seek(0, IOSeek.end);

                var size = _file.tell();

                    //reset to beginning
                _file.seek(0, IOSeek.set);

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
    override public function data_save( _path:String, _data:Uint8Array, ?_options:IODataOptions ) : Bool {

        var _binary = (_options != null && _options.binary);
        var _file : IOFile = IOFile.from_file(_path, _binary ? 'wb' : 'w' );

        if(_file != null) {
            var count : Int = _file.write( _data, _data.length, 1 );

                _file.close();

            return count == 1;
        }

        return false;

    } //data_save

    //Static public API functions specific to native/desktop.

        #if desktop


            /** Call this to add a directory to watch for file change notifications.
                This is for directories only. Children files + sub folders children files will notify of change.
                supports:`windows` `mac` `linux` only */
            override public function watch_add( _path:String ) : Void {

                if(_path != null && _path.length > 0) {
                    snow_io_add_watch( resolve(_path) );
                }

            } //watch_add

            /** Call this to remove a watched directory.
                supports:`windows` `mac` `linux` only */
            override public function watch_remove( _path:String ) : Void {

                if(_path != null && _path.length > 0) {
                    snow_io_remove_watch( resolve(_path) );
                }

            } //watch_remove

            //File dialogs, only available on platforms where it makes sense.

            /** Call this to open a native platform file open dialog.
                Returns a blank string if they cancel or any error occurs.
                supports: `windows` `mac` `linux` */
            override public function dialog_open( ?_title:String = "Select file", ?_filters:Array<FileFilter> ) : String {

                    //disallow null to the native code
                if(_filters == null) {
                    _filters = [];
                }

                return snow_io_dialog_open( _title, _filters );

            } //dialog_open

                /** Call this to open a native platform file save dialog.
                    Returns a blank string if they cancel or any error occurs.
                    supports:`windows` `mac` `linux` */
            override public function dialog_save( ?_title:String = "Save file", ?_filter:FileFilter ) : String {

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
            override public function dialog_folder( ?_title:String = "Select folder" ) : String {

                return snow_io_dialog_folder( _title );

            } //dialog_folder

        #end // desktop

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


        static var snow_io_url_open         = Libs.load( "snow", "snow_io_url_open", 1 );

    #if desktop

        static var snow_io_add_watch        = Libs.load( "snow", "snow_io_add_watch", 1 );
        static var snow_io_remove_watch     = Libs.load( "snow", "snow_io_remove_watch", 1 );

        static var snow_io_dialog_open      = Libs.load( "snow", "snow_io_dialog_open", 2 );
        static var snow_io_dialog_save      = Libs.load( "snow", "snow_io_dialog_save", 2 );
        static var snow_io_dialog_folder    = Libs.load( "snow", "snow_io_dialog_folder", 1 );

    #end //desktop

    } //IO

#end //snow_native