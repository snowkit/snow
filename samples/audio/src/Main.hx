
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
            app.assets.audio('assets/sound.wav'),
            app.assets.audio('assets/music.wav')
        ];

        snow.api.Promise.all(list)
            .then(sound_loaded).error(function(e) log(e));

    } //ready

    var wind : AudioSource;
    var sound : AudioSource;
    var music : AudioSource;

    var wind_handle : AudioHandle;
    var music_handle : AudioHandle;

    //135034__mrlindstrom__windloop6sec.wav
    function sound_loaded(list:Array<AssetAudio>) {

        wind = new AudioSource(app, list[0].audio);
        sound = new AudioSource(app, list[1].audio);
        music = new AudioSource(app, list[2].audio, true);

        log('loaded wind : ' + wind.info);
        log('loaded sound : ' + sound.info);
        log('loaded music : ' + music.info);

        wind_handle = app.audio.loop(wind,0.2);
        music_handle = app.audio.loop(music,1);

        trace('wind playing, handle: $wind_handle');
        trace('music playing, handle: $music_handle');
        
        app.audio.on(ae_end, function(_handle) {
            trace('audio ended: $_handle');
        }); //_handle

    } //sound_loaded

    override function onmousemove(x:Int, y:Int, _, _, _, _) {

        var p = x / (app.runtime.window_width()-1);

        if(app.input.keydown(Key.key_p)) {
            p *= 2.0;
            app.audio.pitch(wind_handle, p);    
            log('wind pitch $p');
        } else if(app.input.keydown(Key.key_l)) {
            p = (p - 0.5) * 2.0;
            app.audio.pan(wind_handle, p);
            log('wind pan $p');
        } else if(app.input.keydown(Key.key_v)) {
            app.audio.volume(wind_handle, p);
            log('wind volume $p');
        }
        
    }

    override function onmouseup( x:Int, y:Int, button:Int, _, _ ) {

        if(sound != null) {
            var _handle = app.audio.play(sound);
            trace('played sound with handle: $_handle');
        }

    } //onmouseup

    var s = false;
    override function onkeyup( keycode:Int, _,_, mod:ModState, _,_ ) {


        if(keycode == Key.key_b) {
            s = !s;
            if(s) app.audio.suspend(); else app.audio.resume();
            trace('audio suspended: $s');
        }

        if(keycode == Key.key_s) {
            if(app.audio.active) {
                var _state = app.audio.state_of(music_handle);
                if(_state != as_stopped) {
                    app.audio.stop(music_handle);
                    trace('music stopped (was $_state)');
                } else {
                    music_handle = app.audio.play(music, 1.0);
                    trace('music playing, handle: $music_handle');
                }
            }
        }

        if(keycode == Key.key_n) {
            if(app.audio.active) {
                var _state = app.audio.state_of(music_handle);
                trace('cycle music state: currently $_state');
                switch(_state) {
                    case as_playing: app.audio.pause(music_handle);
                    case as_paused:  app.audio.unpause(music_handle);
                    case _:
                }
                trace('      now ${app.audio.state_of(music_handle)}');
            }
        }

        if( keycode == Key.escape ) {
            app.shutdown();
        }

    } //onkeyup

    override function tick( delta:Float ) {

        GL.clearColor(1.0,1.0,1.0,1.0);
        GL.clear(GL.COLOR_BUFFER_BIT);

    } //

} //Main
