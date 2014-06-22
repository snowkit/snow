package snow.utils;

import haxe.PosInfos;
import haxe.Log;

#if snow_native

    class Timer {

        static var running_timers:Array<Timer> = [];

        @:noCompletion public var time:Float;
        @:noCompletion public var fire_at:Float;
        @:noCompletion public var running:Bool;

        public function new(_time:Float) {

            time = _time;
            running_timers.push( this );
            fire_at = time;
            running = true;

        } //new

        public static function measure<T>( f : Void -> T, ?pos : PosInfos ) : T {
            var t0 = stamp();
            var r = f();
            Log.trace((stamp() - t0) + "s", pos);
            return r;
        }

        // Set this with "run=..."
        dynamic public function run () { }

        public function stop ():Void {

            if (running) {
                running = false;
                running_timers.remove (this);
            }

        } //stop


        /**
         * @private
         */
        @:noCompletion public static function __process_timers() {

            var now = stamp();

            for (timer in running_timers) {
                if(timer.running) {
                    if(now >= timer.fire_at) {
                        timer.fire_at += timer.time;
                        timer.run();
                    } //now
                }
            } //all timers

        } //__process_timers

            //From std/haxe/Timer.hx
        public static function delay( _f:Void -> Void, _time:Int ) {

            var t = new Timer( _time );
            t.run = function() {
                t.stop();
                _f();
            };

            return t;

        } //delay


        static public function stamp():Float {
            return snow_timestamp();
        } //stamp()

        static var snow_timestamp  = snow.utils.Libs.load( "snow", "snow_timestamp", 0 );

    } //Timer

#else //lime_native

    class Timer {

        private var id : Null<Int>;

            // Create a new timer that will run every [time_ms] (in milliseconds).
        public function new( time_ms : Int ){
            #if flash9
                var me = this;
                id = untyped __global__["flash.utils.setInterval"](function() { me.run(); },time_ms);
            #elseif flash
                var me = this;
                id = untyped _global["setInterval"](function() { me.run(); },time_ms);
            #elseif js
                var me = this;
                id = untyped window.setInterval(function() me.run(),time_ms);
            #end
        }

            // Stop the timer definitely.
        public function stop() {
            if( id == null )
                return;
            #if flash9
                untyped __global__["flash.utils.clearInterval"](id);
            #elseif flash
                untyped _global["clearInterval"](id);
            #elseif js
                untyped window.clearInterval(id);
            #end
            id = null;
        }

            // This is the [run()] method that is called when the Timer executes. It can be either overriden in subclasses or directly rebinded with another function-value.
        public dynamic function run() {
        }


            // This will delay the call to [f] for the given time. [f] will only be called once.
        public static function delay( f : Void -> Void, time_ms : Int ) {
            var t = new haxe.Timer(time_ms);
            t.run = function() {
                t.stop();
                f();
            };
            return t;
        }


            //Measure the time it takes to execute the function [f] and trace it. Returns the value returned by [f].
        public static function measure<T>( f : Void -> T, ?pos : PosInfos ) : T {
            var t0 = stamp();
            var r = f();
            Log.trace((stamp() - t0) + "s", pos);
            return r;
        }

            // Returns the most precise timestamp, in seconds. The value itself might differ depending on platforms, only differences between two values make sense.
        public static function stamp() : Float {
            #if flash
                return flash.Lib.getTimer() / 1000;
            #elseif (neko || php)
                return Sys.time();
            #elseif js
                return Date.now().getTime() / 1000;
            #elseif cpp
                return untyped __global__.__time_stamp();
            #else
                return 0;
            #end
        } //stamp

    } //Timer

#end //!native
