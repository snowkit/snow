

class Main extends lumen.App {

    override public function ready() {

    //buffers

        new buffers.TestInt8Array();



        app.shutdown();

    } //ready

    override public function destroyed() {


    } //destroyed

} //Main
