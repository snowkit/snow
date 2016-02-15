
import snow.api.Debug.*;
import snow.types.Types;
import snow.modules.opengl.GL;

typedef UserConfig = {}

@:log_as('app')
class Main extends snow.App {

    function new() {}

    override function config( config:AppConfig ) : AppConfig {

        config.window.title = 'snow / samples / window';
        config.window.width = 300;
        config.window.height = 300;

        return config;

    } //config


    override function ready() {

        log('ready');

    } //ready

    override function onmousedown(x:Int, y:Int, button:Int, timestamp:Float, window_id:Int) {

        // log('$x,$y');

    }

    override function onmousemove(x:Int, y:Int, xrel:Int, yrel:Int, timestamp:Float, window_id:Int) {
        
        // log('$x,$y, $xrel,$yrel');        

    }

    var tfs = false;
    var fs = false;
    var grab = false;

    override function onkeyup( keycode:Int, _,_, mod:ModState, _,_ ) {

        if( keycode == Key.escape ) {
            app.shutdown();
        }
    
        if( keycode == Key.enter && mod.alt ) {
            fs = !fs;
            app.runtime.window_fullscreen(fs);
        }   

        if( keycode == Key.enter && mod.ctrl) {
            tfs = !tfs;
            app.runtime.window_fullscreen(tfs, true);
        }

        if( keycode == Key.enter && mod.shift) {
            grab = !grab;
            app.runtime.window_grab(grab);
        }

    } //onkeyup

    override public function onevent(event:SystemEvent) {

        if(event.type == se_window) {
            if(event.window.type == we_size_changed||event.window.type == we_resized) {
                trace('${event.window.type} / ${app.runtime.window_device_pixel_ratio()} / size changed ${event.window.x}x${event.window.y}');
            }
        }
    }

    var r = 0.0;
    override function tick( delta:Float ) {

        r += (0.3 * delta);
        r = r % 1.0;

        GL.clearColor(r,1.0,1.0,1.0);
        GL.clear(GL.COLOR_BUFFER_BIT);

    } //tick

} //Main
