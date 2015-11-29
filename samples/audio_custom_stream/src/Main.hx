import snow.api.Debug.*;
import snow.types.Types;
import snow.modules.opengl.GL;
import snow.systems.audio.AudioSource;
import snow.systems.audio.AudioInstance;

import Oooh;

typedef UserConfig = {}

@:log_as('app')
class Main extends snow.App {

    function new() {}

    override function config( config:AppConfig ) : AppConfig {

        config.window.title = 'snow audio';

        return config;

    } //config

    var oooh : Oooh;

    override function ready() {

        log('ready');
        
        var source = new OoohSource(app);
        var handle = app.audio.play(source);
        trace('oooh handle: $handle');
        oooh = cast app.audio.instance_of(handle);

    } //ready

    override function onmousemove(x:Int, y:Int, _, _, _, _) {

        oooh.freq = 220+(x/app.runtime.window_width()*440);
        trace('oooh freq: ${oooh.freq}');

    }

    override function onmouseup( x:Int, y:Int, button:Int, _, _ ) {

    } //onmouseup

    override function onkeyup( keycode:Int, _,_, mod:ModState, _,_ ) {

        if( keycode == Key.escape ) {
            app.shutdown();
        }

    } //onkeyup

    override function tick( delta:Float ) {

        GL.clearColor(1.0,1.0,1.0,1.0);
        GL.clear(GL.COLOR_BUFFER_BIT);

    } //

} //Main
