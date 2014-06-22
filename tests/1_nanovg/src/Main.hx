
import snow.Snow;
import snow.types.Types;
import snow.assets.Assets;
import snow.input.Input;
import snow.App;

import snow.render.opengl.GL;

import hxnanovg.Nvg;
using cpp.NativeString;


@:buildXml("&<include name='${haxelib:hx-nanovg}/Build.xml'/>")
class Main extends snow.App {

    var vg:cpp.Pointer<NvgContext>;
    var font:Int;
    var current_text : String = 'type to change this ™';

    var linearGradient:NvgPaint;

    override function ready() {

        trace('/ HOST / ready');

        trace("app config is loaded as : " + app.config.runtime );

        trace("OpenGL reports version " + GL.versionString());

        vg = Nvg.createGL(512, 512, NvgMode.ANTIALIAS);

        font = Nvg.createFont(vg, "FiraSans-Regular".c_str(), "assets/FiraSans-Regular.ttf".c_str());

        linearGradient = Nvg.linearGradient(vg, 0, 0, 500, 500, Nvg.rgba(255,192,0,255), Nvg.rgba(0,0,0,255));

        app.window.onrender = onrender;

    } //ready

    override function onkeydown( keycode:Int, scancode:Int,_, mod:ModState, _,_ ) {

        if( keycode == Key.BACKSPACE ) {
            current_text = haxe.Utf8.sub(current_text, 0,  haxe.Utf8.length(current_text)-1);
        }

    }

    override function onkeyup( keycode:Int, scancode:Int,_, mod:ModState, _,_ ) {

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


        if( keycode == Key.F1 ) {
            app.window.width = 800;
            app.window.height = 600;
        }

        if( keycode == Key.F2 ) {
            app.window.width = 1024;
            app.window.height = 768;
        }

    } //onkeyup

    override function ontextinput( text:String, start:Int, length:Int, type:TextEventType, timestamp:Float, window_id:Int ) {

        current_text += text;

    }

    override function update( delta:Float ) {

        if(app.input.keyreleased(Key.SPACE)) {
            trace('space released');
        }

        if(app.input.keypressed(Key.SPACE)) {
            trace('space pressed');
        }

    } //update


    function onrender( window:snow.window.Window ) {

        GL.viewport (0, 0, app.window.width, app.window.height);
        GL.clearColor (0.3, 0.3, 0.3, 1.0);
        GL.clear (GL.COLOR_BUFFER_BIT | GL.DEPTH_BUFFER_BIT | GL.STENCIL_BUFFER_BIT);

        Nvg.beginFrame(vg, app.window.width, app.window.height, 1.0);
        

        Nvg.beginPath(vg);
        Nvg.rect(vg, 100,100, 500,300);
        Nvg.circle(vg, 120,120, 250);
        Nvg.pathWinding(vg, NvgSolidity.HOLE);   // Mark circle as a hole.
        //Nvg.fillColor(vg, Nvg.rgba(255,192,0,255));
        Nvg.fillPaint(vg, linearGradient);
        Nvg.fill(vg);
        
        Nvg.fontFaceId(vg, font);
        Nvg.fillColor(vg, Nvg.rgba(255,0,0,255));
        Nvg.text(vg, 50, 50, current_text.c_str(), untyped __cpp__("NULL"));
        

        Nvg.fontSize(vg, 200.0);
        Nvg.fontFaceId(vg, font);
        Nvg.fillColor(vg, Nvg.rgba(255,255,255,64));
        Nvg.textAlign(vg, NvgAlign.ALIGN_LEFT|NvgAlign.ALIGN_MIDDLE);
        Nvg.text(vg, 100, 100, "sdkfjdsh".c_str(), untyped __cpp__("NULL"));

        Nvg.endFrame(vg);

    } //onrender hook


} //Main
