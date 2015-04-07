package snow.system.io;

import snow.Snow;
import snow.types.Types;
import snow.api.buffers.Uint8Array;
import snow.api.Promise;

#if !macro
    private typedef IOModule = haxe.macro.MacroType<[snow.system.module.Module.assign('IO')]>;
#end

@:allow(snow.Snow)
class IO {


    @:noCompletion public var app : Snow;

    /** Access to the platform specific api, if any */
    public var module : snow.system.module.IO;

        /** Constructed internally, use `app.io` */
    @:allow(snow.Snow)
    function new( _app:Snow ) {

        app = _app;

        module = new snow.system.module.IO(this);

        module.init();

    } //new

        /** Call this to open a url in the default browser */
    public inline function url_open( _url:String ) {

        module.url_open(_url);

    } //url_open

        /** Load bytes from the file path/url given.
            On web a request is sent for the data */
    public inline function data_load( _path:String, ?_options:IODataOptions ) : Promise {

        return module.data_load( _path, _options );

    } //data_load


        /** Save bytes to the file path/url given.
            On platforms where this doesn't make sense (web) this will do nothing atm */
    public inline function data_save( _path:String, _data:Uint8Array, ?_options:IODataOptions ) : Bool {

        return module.data_save( _path, _data, _options );

    } //data_save

        /** Returns a promise for data, optionally provided by the given provider, and optionally processed by the given processor. */
    public function data_flow<T>( _id:String, ?_processor:Snow->String->T->Promise, ?_provider:Snow->String->Promise ) : Promise {

        if(_provider == null) _provider = default_provider;

        return new Promise(function(resolve, reject) {

            _provider(app, _id).then(

                function(data) {
                    if(_processor != null) {
                        _processor(app, _id, data).then(resolve, reject);
                    } else {
                        resolve(data);
                    }
                }

            ).error(reject);

        }); //promise

    } //data_flow

    inline function default_provider(_app:Snow, _id:String) return data_load(_id);


//Internal

        /** Called by Snow when a system event happens. */
    inline function on_event( _event:SystemEvent ) {

        module.on_event( _event );

    } //on_event

        /** Called by Snow, update any IO related processing */
    inline function update() {

        module.update();

    } //update

        /** Called by Snow, cleans up IO */
    inline function destroy() {

        module.destroy();

    } //destroy


} //IO
