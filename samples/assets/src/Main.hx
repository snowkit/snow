
import snow.api.Debug.*;
import snow.types.Types;
import snow.modules.opengl.GL;

typedef UserConfig = {}

@:log_as('app')
class Main extends snow.App {

    function new() {}

    override function config(config:AppConfig) : AppConfig {

        config.window.title = 'snow / samples / assets';

        return config;

    } //config

    override function ready() {

        log('ready');
        log('app config: ${app.config.user}');
        log('runtime config: ${app.config.runtime}');

        test_image_assets();
        test_audio_assets();

    } //ready

    override function onkeyup(keycode:Int, _, _, mod:ModState, _, _) {

        if( keycode == Key.escape ) {
            app.shutdown();
        }

    } //onkeyup

    override function tick(delta:Float) {

        GL.clearColor(1.0, 1.0, 1.0, 1.0);
        GL.clear(GL.COLOR_BUFFER_BIT);

    } //update

    function test_image_assets() {

        var list = [
            app.assets.image('assets/test.png'),
            app.assets.image('assets/test.bmp'),
            app.assets.image('assets/test.gif'),
            app.assets.image('assets/test.jpg'),
            app.assets.image('assets/test.psd'),
            app.assets.image('assets/test.tga')
        ];

        snow.api.Promise.all(list)
            .then(function(assets:Array<AssetImage>) {

                for(asset in assets) {
                    var image = asset.image;
                    log('`${image.id}` : ${image.width}x${image.height}x${image.bpp}(${image.bpp_source}) [${image.pixels.length}]');
                }

            }).error(function(error) {
                log('error loading images ' + error);
            });

        #if snow_native

            var imghandle = app.io.module.file_handle('assets/test.png','rb');
            var imgfsize = app.io.module.file_size(imghandle);
            var imgbytes = new snow.api.buffers.Uint8Array(imgfsize);
            
            app.io.module.file_read(imghandle, imgbytes, imgfsize, 1);

            var imgA = app.assets.module.image_info_from_load_direct('assets/test.png');
            var imgB = app.assets.module.image_info_from_bytes_direct('assets/test.png', imgbytes);

            log('`${imgA.id}` (direct from file)  : ${imgA.width}x${imgA.height}x${imgA.bpp}(${imgA.bpp_source}) [${imgA.pixels.length}]');
            log('`${imgB.id}` (direct from bytes) : ${imgB.width}x${imgB.height}x${imgB.bpp}(${imgB.bpp_source}) [${imgB.pixels.length}]');
        #end

    } //test_image_assets

    function test_audio_assets() {

        var list = [
            app.assets.audio('assets/sound.wav'),
            app.assets.audio('assets/sound.ogg')
        ];

        snow.api.Promise.all(list)
            .then(function(assets:Array<AssetAudio>){
                for(asset in assets) {
                    var audio = asset.audio;
                    log('`${audio.id}` : ${audio.channels} channels, ${audio.rate}Hz, PCM length: ${audio.length} format:${audio.format}');
                }
            }).error(function(error){
                log(error);
            });

        #if snow_native

            var wavhandle = app.io.module.file_handle('assets/sound.wav','rb');
            var wavfsize = app.io.module.file_size(wavhandle);
            var wavbytes = new snow.api.buffers.Uint8Array(wavfsize);

            app.io.module.file_read(wavhandle, wavbytes, wavfsize, 1);
            
            var wavA =  snow.core.native.audio.NativeAudioData.data_from_load_direct(app, 'assets/sound.wav');
            var wavB = snow.core.native.audio.NativeAudioData.data_from_bytes_direct(app, 'assets/sound.wav', wavbytes);

            log('`${wavA.id}` (wav direct from file) : ${wavA.channels} channels, ${wavA.rate}Hz, PCM length: ${wavA.length} format:${wavA.format}');
            log('`${wavB.id}` (wav direct from bytes) : ${wavB.channels} channels, ${wavB.rate}Hz, PCM length: ${wavB.length} format:${wavB.format}');


            var ogghandle = app.io.module.file_handle('assets/sound.ogg','rb');
            var oggfsize = app.io.module.file_size(ogghandle);
            var oggbytes = new snow.api.buffers.Uint8Array(oggfsize);

            app.io.module.file_read(ogghandle, oggbytes, oggfsize, 1);

            var oggA = snow.core.native.audio.NativeAudioData.data_from_load_direct(app, 'assets/sound.ogg');
            var oggB = snow.core.native.audio.NativeAudioData.data_from_bytes_direct(app, 'assets/sound.ogg', oggbytes);

            log('`${oggA.id}` (ogg direct from file) : ${oggA.channels} channels, ${oggA.rate}Hz, PCM length: ${oggA.length} format:${oggA.format}');
            log('`${oggB.id}` (ogg direct from bytes) : ${oggB.channels} channels, ${oggB.rate}Hz, PCM length: ${oggB.length} format:${oggB.format}');

        #end

    } //test_audio_assets


} //Main
