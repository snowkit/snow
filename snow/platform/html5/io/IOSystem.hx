package snow.platform.html5.io;

import snow.types.Types;
import snow.io.IOSystem;
import snow.io.IO;

#if snow_html5


    class IOSystem extends IOSystemBinding {

        @:noCompletion public function new( _manager:IO, _lib:Snow ) {

            manager = _manager;
            lib = _lib;

        } //new

    //Public API

        override public function url_open( _url:String ) {

            if(_url != null && _url.length > 0) {
                js.Browser.window.open(_url, '_blank');
            }

        } //url_open

    //Internal API

        @:noCompletion override public function init() {
        } //init
        @:noCompletion override public function process() {
        } //process
        @:noCompletion override public function destroy() {
        } //destroy
        @:noCompletion override public function on_event( _event:SystemEvent ) {
        } //destroy


    } //IOSystem


#end //snow_html5