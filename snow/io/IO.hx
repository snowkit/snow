package snow.io;

import snow.io.IOSystem;
import snow.types.Types;

class IO {


    @:noCompletion public var lib : Snow;
    @:noCompletion public var platform : IOSystem;


     @:noCompletion public function new( _lib:Snow ) {

        lib = _lib;

        platform = new IOSystem(this, lib);

        platform.init();

    } //new

        /** Call this to open a url in the default browser */
    public function url_open( _url:String ) {

        platform.url_open(_url);

    } //url_open

    @:noCompletion public function on_event( _event:SystemEvent ) {

        platform.on_event( _event );

    } //on_event

    @:noCompletion public function update() {

        platform.process();

    } //update

    @:noCompletion public function destroy() {

        platform.destroy();

    } //destroy


} //IO
