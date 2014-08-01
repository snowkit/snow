package snow.io;

import snow.utils.AbstractClass;
import snow.types.Types;

#if snow_html5

    @:noCompletion typedef IOSystem = snow.platform.html5.io.IOSystem;

#else

    @:noCompletion typedef IOSystem = snow.platform.native.io.IOSystem;

#end


class IOSystemBinding implements AbstractClass {

    var manager : IO;
    var lib : Snow;

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

} //IOSystem
