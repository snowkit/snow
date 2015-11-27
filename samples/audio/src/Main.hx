
import snow.api.Debug.*;
import snow.types.Types;
import snow.modules.opengl.GL;
import snow.systems.audio.AudioSource;

typedef UserConfig = {}

@:log_as('app')
class Main extends snow.App {

    function new() {}

    override function config( config:AppConfig ) : AppConfig {

        config.window.title = 'snow audio';

        return config;

    } //config


    override function ready() {

        log('ready');

        var list = [
            app.assets.audio('assets/135034__mrlindstrom__windloop6sec.wav'),
            app.assets.audio('assets/sound.wav')
        ];

        snow.api.Promise.all(list)
            .then(sound_loaded).error(function(e) log(e));

    } //ready

    var wind : AudioSource;
    var sound : AudioSource;

    var wind_handle : AudioHandle;

    //135034__mrlindstrom__windloop6sec.wav
    function sound_loaded(list:Array<AssetAudio>) {
        
        wind = new AudioSource(list[0]);
        sound = new AudioSource(list[1]);

        log('loaded wind `${wind.asset.audio.id}` : ' + wind.asset.audio);
        log('loaded sound `${sound.asset.audio.id}` : ' + sound.asset.audio);

        wind_handle = app.audio.loop(wind);

    } //sound_loaded

    override function onmousemove(x:Int, y:Int, _, _, _, _) {

        var p = x / (app.runtime.window_width()-1);

        if(app.input.keydown(Key.key_p)) {
            p *= 2.0;
            app.audio.pitch(wind_handle, p);    
            log('pitch $p');
        } else if(app.input.keydown(Key.key_l)) {
            p = (p - 0.5) * 2.0;
            app.audio.pan(wind_handle, p);
            log('pan $p');
        } else if(app.input.keydown(Key.key_v)) {
            app.audio.volume(wind_handle, p);
            log('volume $p');
        }
        
    }

    override function onmouseup( x:Int, y:Int, button:Int, _, _ ) {

        if(sound != null) {
            var _handle = app.audio.play(sound);
            trace(_handle);
        }

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
