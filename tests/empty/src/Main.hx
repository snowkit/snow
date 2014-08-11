
import snow.Log.log;
import snow.types.Types;
import snow.render.opengl.GL;

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

    function render( window:snow.window.Window ) {

        GL.clearColor(1.0, 1.0, 1.0, 1.0);
        GL.clear(GL.COLOR_BUFFER_BIT);

    } //render

} //Main
