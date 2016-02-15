
import snow.api.Debug.*;
import snow.types.Types;
import snow.modules.opengl.GL;

typedef UserConfig = {}

@:log_as('app')
class Main extends snow.App {

    function new() {}

    override function config( config:AppConfig ) : AppConfig {

        config.window.title = 'snow empty app';

        return config;

    } //config

    override function ready() {

        log('ready');

    } //ready

    override function onkeyup( keycode:Int, _,_, mod:ModState, _,_ ) {

        if( keycode == Key.escape ) {
            app.shutdown();
        }

    } //onkeyup

    override function tick( delta:Float ) {

        GL.clearColor(1.0, 1.0, 1.0, 1.0);
        GL.clear(GL.COLOR_BUFFER_BIT);

    } //update

} //Main
