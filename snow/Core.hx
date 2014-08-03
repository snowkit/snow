package snow;

import snow.utils.AbstractClass;
import snow.types.Types;

#if snow_web

   @:noCompletion typedef Core = snow.platform.web.Core;

#else

   @:noCompletion typedef Core = snow.platform.native.Core;

#end //snow_web


/**
Implemented in the platform specific concrete versions of this class.

This uses a macro to allow this class to pretend to be abstract, and complain via compiler errors if the specific functions are missing.
 */
@:noCompletion class CoreBinding implements AbstractClass {

        //The snow instance
    var app : Snow;
        /** Called by the snow internals to intiialize the core and subsystems of the framework, with the event handler passed in for where to deliver system events */
    public function init( _event_handler : SystemEvent->Void ) : Void;
        /** Called to explicitly shutdown the framework cleanly. Called by `quit` and `app_terminated` type events by the core, for example. */
    public function shutdown() : Void;
        /** Get the most precise timestamp available on the platform, in seconds (time is always in seconds in snow) */
    public function timestamp() : Float;
        /** Return the full path that the application is located */
    public function app_path() : String;
        /** On platforms where this makes sense, get the application specific writeable data path */
    public function pref_path( _appname:String, _package:String ) : String;


} //CoreBinding
