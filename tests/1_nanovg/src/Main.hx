
import lumen.Lumen;
import lumen.types.Types;
import lumen.assets.Assets;
import lumen.input.Input;
import lumen.App;

import lumen.render.opengl.GL;

import hxnanovg.Nvg;
using cpp.NativeString;

@:buildXml("&<include name='${haxelib:hx-nanovg}/Build.xml'/>")
class Main extends lumen.App {

    var vg:cpp.Pointer<NvgContext>;

    override function ready() {

        trace('/ HOST / ready');

        trace("app config is loaded as : " + app.config.runtime );

        trace("OpenGL reports version " + GL.versionString());

        vg = Nvg.createGL(512, 512, NvgMode.ANTIALIAS);

        app.window.render_handler = onrender;

    } //ready

    override function onkeyup( keycode:Int, _,_, mod:ModState, _,_ ) {

            //alt enter to toggle fullscreen test
        if( keycode == Key.RETURN && mod.alt ) {
            app.window.fullscreen = !app.window.fullscreen;
        }

            //ctrl enter to toggle pointer lock test
        if( keycode == Key.RETURN && mod.ctrl ) {
            app.window.grab = !app.window.grab;
        }

        if( keycode == Key.ESCAPE ) {
            app.shutdown();
        }

    } //onkeyup


    override function update( delta:Float ) {

        if(app.input.keyreleased(Key.SPACE)) {
            trace('space released');
        }

        if(app.input.keypressed(Key.SPACE)) {
            trace('space pressed');
        }

    } //update


    function onrender( window:lumen.window.Window ) {

        GL.viewport (0, 0, app.window.width, app.window.height);
        GL.clearColor (0.3, 0.3, 0.3, 1.0);
        GL.clear (GL.COLOR_BUFFER_BIT | GL.DEPTH_BUFFER_BIT | GL.STENCIL_BUFFER_BIT);

        Nvg.beginFrame(vg, 800, 600, 1.0);
        Nvg.rect(vg, 100,100, 500,300);
        Nvg.circle(vg, 120,120, 250);
        Nvg.pathWinding(vg, NvgSolidity.HOLE);   // Mark circle as a hole.
        Nvg.fillColor(vg, Nvg.rgba(255,192,0,255));
        Nvg.fill(vg);
        Nvg.endFrame(vg);

    } //onrender hook


} //Main
