
import snow.types.Types;
import mohxa.Mohxa;

/**
    Copyright Sven Bergström, Thomas Hourdel 2014
    Created for snow https://github.com/underscorediscovery/snow
    License MIT
**/

class Main extends snow.App {

    override function config( config:AppConfig ) {

        config.has_window = false;

        return config;

    } //config

    var failed : Int = 0;
    var total : Int = 0;
    var time : Float = 0;

    override function ready() {


        //buffers

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
