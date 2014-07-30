
import snow.types.Types;

class Main extends snow.App {

    override function config( config:AppConfig ) {

        config.has_window = false;

        return config;

    } //config

    override function ready() {

        //buffers

            new buffers.TestInt8Array();
            // new buffers.TestInt16Array();
            // new buffers.TestInt32Array();
            // new buffers.TestUInt8Array();
            // // new buffers.TestUInt8ClampedArray();
            // new buffers.TestUInt16Array();
            // new buffers.TestUInt32Array();


    } //ready

} //Main
