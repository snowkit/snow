
import snow.api.Debug.*;
import snow.types.Types;

@:log_as('app')
class Main extends snow.App {

    override function config( config:AppConfig ) : AppConfig {

        config.window.title = 'snow empty app template';

        return config;

    } //config

    override function ready() {

        log('ready');
        log('runtime config: ${app.config.runtime}');
        log('asset path: ${app.assets.path('fake.file')}');

        app.assets.image('assets/test.png')
            .then(function(asset:AssetImage){
                var image = asset.image;
                log('`${image.id}` : ${image.width}x${image.height}x${image.bpp}(${image.bpp_source}) [${image.pixels.length}]');
            }).error(function(error){
                log(error);
            });

        var wavhandle = app.io.module.file_handle('assets/sound.wav','rb');
        var wavfsize = app.io.module.file_size(wavhandle);
        var wavbytes = new snow.api.buffers.Uint8Array(wavfsize);
        app.io.module.file_read(wavhandle, wavbytes, wavfsize, 1);
        var info = app.assets.module.audio_info_from_load('assets/sound.wav', true);
        var info2 = app.assets.module.audio_info_from_bytes(wavbytes, wav);
        trace(info);
        trace(info2);

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
