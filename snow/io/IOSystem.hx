package snow.io;

import snow.utils.AbstractClass;
import snow.types.Types;

#if snow_web

    @:noCompletion typedef IOSystem = snow.platform.web.io.IOSystem;

#else

    @:noCompletion typedef IOSystem = snow.platform.native.io.IOSystem;

#end


class IOSystemBinding implements AbstractClass {

    public var manager : IO;
    public var lib : Snow;

        /** Called when the IO manager initiates this system */
    public function init();
        /** Called when the IO manager updates this system */
    public function process();
        /** Called when the IO manager destroys this system */
    public function destroy();
        /** Called when the IO manager forwards an event to this system */
    public function on_event( _event : SystemEvent );
        /** Call this to open a url in the default browser */
    public function url_open( _url:String );

    #if desktop

            /** Call this to add a directory to watch for file change notifications.
                This is for directories only. Children files + sub folders children files will notify of change.
                supports:`windows` `mac` `linux` only */
        public function watch_add( _path:String ) : Void;
            /** Call this to remove a watched directory.
                supports:`windows` `mac` `linux` only */
        public function watch_remove( _path:String ) : Void;
            /** Call this to open a native platform file open dialog.
                Returns a blank string if they cancel or any error occurs.
                supports: `windows` `mac` `linux` */
        public function dialog_open( ?_title:String = "Select file", ?_filters:Array<FileFilter> ) : String;
            /** Call this to open a native platform file save dialog.
                Returns a blank string if they cancel or any error occurs.
                supports:`windows` `mac` `linux` */
        public function dialog_save( ?_title:String = "Save file", ?_filters:Array<FileFilter> ) : String;
            /** Call this to open a native platform folder select dialog.
                Returns a blank string if they cancel or any error occurs.
                supports:`windows` `mac` `linux` */
        public function dialog_folder( ?_title:String = "Select folder" ) : String;

    #end //desktop

} //IOSystem
