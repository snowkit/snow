
import snow.api.Debug.*;
import snow.types.Types;
import snow.modules.opengl.GL;

typedef UserConfig = {
    int : Int,
    float : Float,
    string : String,
    test : Bool
}

@:log_as('app')
class Main extends snow.App {

    function new() {}

    override function config( config:AppConfig ) : AppConfig {

        config.window.title = 'snow test config';

        return config;

    } //config

    override function ready() {

        log('ready');
        log('app config: ${app.config.user}');

        assert(app.config.user != null);
        assert(app.config.user.int == 12);
        assert(app.config.user.float == 1.2);
        assert(app.config.user.string == 'snow');
        assert(app.config.user.test == true);

    } //ready

    override function onkeyup( keycode:Int, _,_, mod:ModState, _,_ ) {

        if( keycode == Key.escape ) {
            app.shutdown();
        }

    } //onkeyup

    var r = 0.0;
    override function tick( delta:Float ) {

        r = r % 1.0;

        GL.clearColor(r,r,r,1.0);
        GL.clear(GL.COLOR_BUFFER_BIT);

    } //update

} //Main
