package snow.utils;

import haxe.PosInfos;
import haxe.Log;

    class Timer {

        static var running_timers:Array<Timer> = [];

        @:noCompletion public var time:Float;
        @:noCompletion public var fire_at:Float;
        @:noCompletion public var running:Bool;

        public function new(_time:Float) {

            time = _time;
            running_timers.push( this );
            fire_at = stamp() + time;
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
        @:noCompletion public static function update() {

            var now = stamp();

            for (timer in running_timers) {
                if(timer.running) {
                    if(now >= timer.fire_at) {
                        timer.fire_at += timer.time;
                        timer.run();
                    } //now
                }
            } //all timers

        } //update

            //From std/haxe/Timer.hx
        public static function delay( _time:Float, _f:Void -> Void ) {

            var t = new Timer( _time );
            t.run = function() {
                t.stop();
                _f();
            };

            return t;

        } //delay


        static public function stamp():Float {
            return Snow.core.timestamp();
        } //stamp()

    } //Timer

