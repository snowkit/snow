package snow;

import snow.runtime.Runtime;
import snow.api.Debug.*;
import snow.api.Promise;
import snow.api.buffers.Uint8Array;
import snow.types.Types;

import snow.system.io.IO;
import snow.system.input.Input;
import snow.system.assets.Assets;
import snow.system.audio.Audio;
import snow.system.window.Windowing;

class Snow {

    //public

            /** The host application */
        public var host : App;
            /** The runtime module */
        public static var runtime : Runtime;

            /** The current timestamp */
        public var time (get,never) : Float;
            /** Generate a unique ID to use */
        public var uniqueid (get,never) : String;
            /** A static access to the timestamp for convenience */
        public static var timestamp (get, never) : Float;

    //systems

            /** The io system */
        public var io : IO;
            /** The input system */
        public var input : Input;
            /** The audio system */
        public var audio : Audio;
            /** The asset system */
        public var assets : Assets;
            /** The window system */
        public var windowing : Windowing;

    //state

            /** The platform identifier, a string,
                but uses `snow.types.Types.Platform` abstract enum internally */
        public var platform : String = 'unknown';
            /** The os identifier, a string,
                but uses `snow.types.Types.OS` abstract enum internally */
        public var os : String;
            /** A debug flag for convenience, true if the app was built with the haxe -debug flag or define */
        public var debug : Bool = #if debug true #else false #end;

            /** Set if shut down has commenced */
        public var shutting_down : Bool = false;
            /** Set if shut dow has completed  */
        public var has_shutdown : Bool = false;

    //api

        public function new(_host : App) {

            log('app / init / debug:$debug');
            log('app / ident: ' + snow.Set.app_ident);
            log('app / config: ' + snow.Set.app_config);

            if(snow.api.Debug.get_level() > 1) {
                log('log / level to ${snow.api.Debug.get_level()}' );
                log('log / filter : ${snow.api.Debug.get_filter()}');
                log('log / exclude : ${snow.api.Debug.get_exclude()}');
            }

            host = _host;
            host.app = this;

            log('app / assets / ${snow.Set.module_assets}');
            log('app / audio / ${snow.Set.module_audio}');
            log('app / input / ${snow.Set.module_input}');
            log('app / io / ${snow.Set.module_io}');
            log('app / window / ${snow.Set.module_window}');

            io = new IO(this);
            input = new Input(this);
            audio = new Audio(this);
            assets = new Assets(this);
            windowing = new Windowing(this);

            log('app / runtime / new ${snow.Set.app_runtime}');

            runtime = new snow.Set.HostRuntime(this);

            assertnull(os, 'init - Runtime didn\'t set the app.os value!');
            assertnull(platform, 'init - Runtime didn\'t set the app.platform value!');

            log('app / os:$os / platform:$platform / $time');
            log('app / runtime / ${runtime.name} / run');

            runtime.run();

            if(!(has_shutdown || shutting_down)) {
                shutdown();
            }

            log('app / exit / $time');

        } //new

            /** Shutdown the engine and quit */
        public function shutdown() {

            assert(shutting_down == false, 'snow - calling shutdown more than once is disallowed');
            assert(has_shutdown == false, 'snow - calling shutdown more than once is disallowed');

            shutting_down = true;

            host.ondestroy();

            runtime.shutdown();

            has_shutdown = true;

        } //shutdown

    //internal

        inline function get_time() : Float return runtime.timestamp();
        inline function get_uniqueid() : String return make_uniqueid();
        static inline function get_timestamp() : Float return runtime.timestamp();

    //helpers

        function make_uniqueid(?val:Int) : String {

            // http://www.anotherchris.net/csharp/friendly-unique-id-generation-part-2/#base62

            if(val == null) {
                #if neko val = Std.random(0x3FFFFFFF);
                #else val = Std.random(0x7fffffff);
                #end
            }

            inline function to_char(value:Int) {
                if (value > 9) {
                    var ascii = (65 + (value - 10));
                    if (ascii > 90) ascii += 6;
                    return String.fromCharCode(ascii);
                } else return Std.string(value).charAt(0);
            } //to_char

            var r = Std.int(val % 62);
            var q = Std.int(val / 62);

            if (q > 0) return make_uniqueid(q) + to_char(r);

            return Std.string(to_char(r));

        } //make_uniqueid

        inline function typename(t:Dynamic) {

            return Type.getClassName(Type.getClass(t));

        } //typename

} //Snow
