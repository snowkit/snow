
import snow.api.Debug.*;
import snow.types.Types;
import snow.modules.opengl.GL;

typedef UserConfig = {
    int : Int,
    string : String,
    whatever : Bool
}

@:log_as('app')
class Main extends snow.App {

    function new() {}

    override function config( config:AppConfig ) : AppConfig {

        config.window.title = 'snow empty app';

        return config;

    } //config


    override function ready() {

        log('ready');
        log('app config: ${app.config.user}');
        log('runtime config: ${app.config.runtime}');
        log('asset path: ${app.assets.path('fake.file')}');

        test_assets();

    } //ready

    override function onkeyup( keycode:Int, _,_, mod:ModState, _,_ ) {

        if( keycode == Key.escape ) {
            app.shutdown();
        }

    } //onkeyup

    var r = 0.0;
    override function update( delta:Float ) {

        // trace(delta);
        r += (0.3 * delta);
        r = r % 1.0;

        GL.clearColor(r,r,r,1.0);
        GL.clear(GL.COLOR_BUFFER_BIT);

    } //update

    function test_assets() {

        app.assets.image('assets/test.png')
            .then(function(asset:AssetImage){
                var image = asset.image;
                log('`${image.id}` : ${image.width}x${image.height}x${image.bpp}(${image.bpp_source}) [${image.pixels.length}]');
            }).error(function(error){
                log(error);
            });

        app.assets.audio('assets/sound.wav')
            .then(function(asset:AssetAudio){
                var audio = asset.audio;
                log('`${audio.id}` : ' + audio);
            }).error(function(error){
                log(error);
            });

        #if snow_native
            var imghandle = app.io.module.file_handle('assets/test.png','rb');
            var imgfsize = app.io.module.file_size(imghandle);
            var imgbytes = new snow.api.buffers.Uint8Array(imgfsize);
            app.io.module.file_read(imghandle, imgbytes, imgfsize, 1);
            var imginfo = app.assets.module.image_info_from_load_direct('assets/test.png');
            var imginfo2 = app.assets.module.image_info_from_bytes_direct('assets/test.png', imgbytes);
            trace(imginfo);
            trace(imginfo2);

            var wavhandle = app.io.module.file_handle('assets/sound.wav','rb');
            var wavfsize = app.io.module.file_size(wavhandle);
            var wavbytes = new snow.api.buffers.Uint8Array(wavfsize);
            app.io.module.file_read(wavhandle, wavbytes, wavfsize, 1);
            var wavinfo = app.assets.module.audio_info_from_load_direct('assets/sound.wav');
            var wavinfo2 = app.assets.module.audio_info_from_bytes_direct('assets/sound.wav', wavbytes);
            trace(wavinfo);
            trace(wavinfo2);

            var ogghandle = app.io.module.file_handle('assets/sound.ogg','rb');
            var oggfsize = app.io.module.file_size(ogghandle);
            var oggbytes = new snow.api.buffers.Uint8Array(oggfsize);
            app.io.module.file_read(ogghandle, oggbytes, oggfsize, 1);
            var ogginfo = app.assets.module.audio_info_from_load_direct('assets/sound.ogg');
            var ogginfo2 = app.assets.module.audio_info_from_bytes_direct('assets/sound.ogg', oggbytes);
            trace(ogginfo);
            trace(ogginfo2);
        #end

    } //test_assets


} //Main
