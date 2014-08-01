package snow.io;

import snow.io.IOSystem;
import snow.types.Types;

class IO {


    var lib : Snow;
    var system : IOSystem;


     @:noCompletion public function new( _lib:Snow ) {

        lib = _lib;

        system = new IOSystem(this, lib);

        system.init();

    } //new

        /** Call this to open a url in the default browser */
    public function url_open( _url:String ) {

        system.url_open(_url);

    } //url_open

    @:noCompletion public function on_event( _event:SystemEvent ) {

        system.on_event( _event );

    } //on_event

    @:noCompletion public function update() {

        system.process();

    } //update

    @:noCompletion public function destroy() {

        system.destroy();

    } //destroy


} //IO
