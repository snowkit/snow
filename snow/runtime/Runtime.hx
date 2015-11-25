package snow.runtime;

@:allow(snow.Snow)
interface Runtime {

    var name : String;
    var app : snow.Snow;

        /** After the ready event but before the app ready */
    private function ready() : Void;
        /** Starts the runtime, usually this includes a loop, so it doesn't return.
            This is called after the other modules are initiated. */
    private function run() : Void;
        /** Shut down the runtime. A runtime should immediately clean up, stop any loops etc from this call. */
    private function shutdown() : Void;
        
        /** Grabs the main window, capturing the mouse and returning relative motion.
            i.e What a first person camera might want to rotate freely. returns false if it fails or is unavailable. */
    function window_grab(enable:Bool) : Bool;
        /** Set the main window to fullscreen. returns false if it fails or is unavailable. */
    function window_fullscreen(enable:Bool, ?true_fullscreen:Bool=false) : Bool;
        /** Get the device pixel ratio (scaling factor for high resolution/high dpi/retina devices) */
    function window_device_pixel_ratio() : Float;
        /** Get the width of the render surface of the window (i.e post-device-scale) */
    function window_width() : Int;
        /** Get the height of the render surface of the window (i.e post-device-scale) */
    function window_height() : Int;

} //Runtime
