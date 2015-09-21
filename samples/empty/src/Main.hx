
import snow.api.Debug.*;
import snow.types.Types;

@:log_as('app')
class Main extends snow.App {

    override function config( config:AppConfig ) : AppConfig {

        config.window.title = 'snow empty application template';
        return config;

    } //config

    override function ready() {

        log('ready');
        app.window.onrender = render;

    } //ready

    override function onkeyup( keycode:Int, _,_, mod:ModState, _,_ ) {

        if( keycode == Key.escape ) {
            app.shutdown();
        }

    } //onkeyup

    override function update( delta:Float ) {

    } //update

    function render( window:snow.system.window.Window ) {

    } //render

} //Main
