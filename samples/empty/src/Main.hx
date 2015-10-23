
import snow.api.Debug.*;
import snow.types.Types;

@:log_as('app')
class Main extends snow.App {

    override function config( config:AppConfig ) : AppConfig {

        config.window.title = 'snow empty app template';

        return config;

    } //config

    override function ready() {

        log('ready ' + app.config.runtime);

        trace(app.assets.path('file.png'));

    } //ready

    override function onkeyup( keycode:Int, _,_, mod:ModState, _,_ ) {

        if( keycode == Key.escape ) {
            app.shutdown();
        }

    } //onkeyup

    override function update( delta:Float ) {

    } //update

    function render() {

    } //render

} //Main
