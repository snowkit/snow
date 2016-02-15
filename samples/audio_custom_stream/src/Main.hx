import snow.api.Debug.*;
import snow.types.Types;
import snow.modules.opengl.GL;
import snow.systems.audio.AudioSource;
import snow.systems.audio.AudioInstance;

import Oooh;

typedef UserConfig = {}

@:log_as('app')
class Main extends snow.App {

    var oooh : Oooh;

    function new() {}

    override function config( config:AppConfig ) : AppConfig {

        config.window.title = 'snow / samples / audio custom stream';
        return config;

    } //config

    override function ready() {

        log('ready');
        
        var source = new OoohSource(app);
        var handle = app.audio.play(source);

            //we want to affect the freq of this specific instance 
        oooh = cast app.audio.instance_of(handle);

        trace('oooh handle: $handle');

    } //ready

    override function onmousemove(x:Int, y:Int, _, _, _, _) {

        #if !mobile
        oooh.freq = 220+(x/app.runtime.window_width()*440);
        trace('oooh freq: ${oooh.freq}');
        #end

    }

    override function ontouchmove( x:Float, y:Float, dx:Float, dy:Float, touch_id:Int, timestamp:Float ) {

        oooh.freq = 220+(x*440);
        // trace('oooh freq: ${oooh.freq}');

    }

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
