/**
    Copyright Sven Bergström, Thomas Hourdel 2014
    Created for snow https://github.com/underscorediscovery/snow
    License MIT
**/

import snow.types.Types;
import mohxa.Mohxa;

class Main extends snow.App {


    public static var f : snow.Snow;

    override function config( config:AppConfig ) {

        config.has_window = false;

        return config;

    } //config

    var failed : Int = 0;
    var total : Int = 0;
    var time : Float = 0;

    public static inline function ts() {
        return f.time;
    }

    override function ready() {

        f = app;

        //buffers

            //:todo: these are using ! for testing etc
        #if !typedarrays_correctness
            //int
                run(new buffers.TestInt8Array());
                run(new buffers.TestInt16Array());
                run(new buffers.TestInt32Array());
                run(new buffers.TestUInt8Array());
                run(new buffers.TestUInt8ClampedArray());
                run(new buffers.TestUInt16Array());
                run(new buffers.TestUInt32Array());
            //float
                run(new buffers.TestFloat32Array());
        #end
        #if !typedarrays_benchmark
            //benchmarks
                run(new buffers.TestTypedArrayPerformance());
        #end


        trace('completed $total tests, $failed failures (${time}ms)');

        #if snow_native
            var code = failed > 0 ? 1 : 0;
            Sys.exit( code );
        #else
            if(failed > 0) {
                throw 'tests failed';
            }
        #end

    } //ready

    function run<T:Mohxa>(instance:T) {

        instance.run();

        total += instance.total;
        failed += instance.failed;
        time += instance.total_time;

    }

} //Main
