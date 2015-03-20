package snow.platform.web.io;

import snow.types.Types;
import snow.io.IOSystem;
import snow.io.IO;

import snow.io.typedarray.Uint8Array;
import snow.utils.Promise;

#if snow_web


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

            /** Load bytes from the file path/url given.
                On web a request is sent for the data */
        override public function data_load( _path:String, ?_options:IODataOptions ) : Promise {

            return new Promise(function(resolve,reject) {

                    //defaults
                var _async = true;
                var _binary = true;

                if(_options != null) {
                    if(_options.binary != null) _binary = _options.binary;
                }

                var request = new js.html.XMLHttpRequest();
                    request.open("GET", _path, _async);

                if(_binary) {
                    request.overrideMimeType('text/plain; charset=x-user-defined');
                } else {
                    request.overrideMimeType('text/plain; charset=UTF-8');
                }

                    //only _async can set the type it seems
                if(_async) {
                    #if (haxe_ver < 3.2)
                        request.responseType = 'arraybuffer';
                    #else
                        request.responseType = js.html.XMLHttpRequestResponseType.ARRAYBUFFER;
                    #end
                }

                request.onload = function(data) {

                    if(request.status == 200) {
                        resolve( new Uint8Array(request.response) );
                    } else {
                        reject('request status was ${request.status} / ${request.statusText}');
                    }

                } //onload

                request.send();

            });

        } //data_load

        override public function data_save( _path:String, _data:Uint8Array, ?_options:IODataOptions ) : Bool {

            return false;

        } //data_save

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


#end //snow_web