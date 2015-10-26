package snow.runtime;

@:allow(snow.Snow)
interface Runtime {

    var name : String;
    var app : snow.Snow;

        /** Starts the runtime, usually this includes a loop, so it doesn't return.
            This is called after the other modules are initiated. */
    private function run() : Void;
        /** Shut down the runtime. A runtime should immediately clean up, stop any loops etc from this call. */
    private function shutdown() : Void;
        /** Access to the runtime timestamp in seconds */
    private function timestamp() : Float;

} //Runtime
