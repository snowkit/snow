package snow.core.web.io;

import snow.types.Types;
import snow.api.buffers.Uint8Array;
import snow.api.Promise;


@:allow(snow.system.io.IO)
class IO implements snow.modules.interfaces.IO {

    var system : snow.system.io.IO;

    function new( _system:snow.system.io.IO ) system = _system;

//Public API

    public function url_open( _url:String ) {

        if(_url != null && _url.length > 0) {
            js.Browser.window.open(_url, '_blank');
        }

    } //url_open

        /** Load bytes from the file path/url given.
            On web a request is sent for the data */
    public function data_load( _path:String, ?_options:IODataOptions ) : Promise {

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
                    reject(Error.error('request status was ${request.status} / ${request.statusText}'));
                }

            } //onload

            request.send();

        });

    } //data_load

    public function data_save( _path:String, _data:Uint8Array, ?_options:IODataOptions ) : Bool {

        return false;

    } //data_save

//Internal API

    function init() {}
    function update() {}
    function destroy() {}
    function on_event( _event:SystemEvent ) {}


} //IO
