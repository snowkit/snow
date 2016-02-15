
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

        config.window.title = 'snow / samples / config';

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

        app.shutdown();

    } //ready

} //Main
