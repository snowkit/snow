package snow.platform.html5.assets;

import snow.assets.Assets;
import snow.assets.AssetSystem;
import snow.types.Types;

#if snow_html5

    @:noCompletion class AssetSystem extends AssetSystemBinding {

        public function new( _manager:Assets ) {
            manager = _manager;
        }

    override public function exists( _id:String, ?_strict:Bool=true ) : Bool {

        var listed = manager.listed(_id);

        return listed;

    } //exists

    //images

        function nearest_power_of_two(_value:Int) {

            _value--;

            _value |= _value >> 1;
            _value |= _value >> 2;
            _value |= _value >> 4;
            _value |= _value >> 8;
            _value |= _value >> 16;

            _value++;

            return _value;

        } //nearest_power_of_two

        override public function image_load_info( _path:String, ?_components:Int = 4, ?_onload:?ImageInfo->Void ) : ImageInfo {

                //Create an image element to load the image source
            var image : js.html.ImageElement = js.Browser.document.createImageElement();
            var info : ImageInfo = null;

            image.onload = function(a) {

                var width_pot = nearest_power_of_two(image.width);
                var height_pot = nearest_power_of_two(image.height);

                var tmp_canvas = js.Browser.document.createCanvasElement();

                    tmp_canvas.width = width_pot;
                    tmp_canvas.height = height_pot;

                var tmp_context = tmp_canvas.getContext2d();

                    tmp_context.clearRect( 0,0, tmp_canvas.width, tmp_canvas.height );
                    tmp_context.drawImage( image, 0, 0, image.width, image.height );

                var image_bytes = null;

                try {

                    image_bytes = tmp_context.getImageData( 0, 0, tmp_canvas.width, tmp_canvas.height );

                } catch(e:Dynamic) {

                    var tips = '- textures served from file:/// throw security errors\n';
                        tips += '- textures served over http:// work for cross origin byte requests';

                    trace(tips);
                    throw e;

                } //catch

                info = {
                    id : _path,
                    bpp : 4,
                    width : image.width,
                    height : image.height,
                    width_actual : width_pot,
                    height_actual : height_pot,
                    bpp_source : 4,
                    data : new snow.utils.UInt8Array( image_bytes.data )
                };

                    //cleanup
                tmp_canvas = null; tmp_context = null; image_bytes = null;

                    //append the listener
                if(_onload != null) {
                    _onload( info );
                }

            } //image.onload

                //source comes after the onload being set, for race conditions
            image.src = _path;

            return info;

        } //image_load_info

    override public function image_info_from_bytes( _path:String, _bytes:ByteArray, ?_components:Int = 4 ) : ImageInfo {
        return null;
    }

    override public function audio_load_info( _path:String, ?_format:AudioFormatType, ?_load:Bool = true, ?_onload:?AudioInfo->Void ) : AudioInfo {
        return null;
    }

    override public function audio_seek_source( _info:AudioInfo, _to:Int ) : Bool {

        switch(_info.format) {
            case AudioFormatType.ogg:
                return audio_seek_source_ogg(_info, _to);
            case AudioFormatType.wav:
                return audio_seek_source_wav(_info, _to);
            case AudioFormatType.pcm:
                return audio_seek_source_pcm(_info, _to);
            default:
                return false;
        }

        return false;

    } //audio_seek_source

    override public function audio_load_portion( _info:AudioInfo, _start:Int, _len:Int ) : AudioDataBlob {

        switch(_info.format) {
            case AudioFormatType.ogg:
                return audio_load_portion_ogg(_info, _start, _len);
            case AudioFormatType.wav:
                return audio_load_portion_wav(_info, _start, _len);
            case AudioFormatType.pcm:
                return audio_load_portion_pcm(_info, _start, _len);
            default:
                return null;
        }

        return null;

    } //audio_load_portion

    //ogg

        function audio_load_ogg( asset:AssetInfo, ?load:Bool=true ) : AudioInfo {
            return null;
        } //audio_load_ogg

        function audio_load_portion_ogg( _info:AudioInfo, _start:Int, _len:Int ) : AudioDataBlob {
            return null;
        } //load_audio_portion_ogg

        function audio_seek_source_ogg( _info:AudioInfo, _to:Int ) : Bool {
            return false;
        } //audio_seek_source_ogg

    //wav

        function audio_load_wav( asset:AssetInfo, ?load:Bool=true ) : AudioInfo {
            return null;
        } //audio_load_wav

        function audio_load_portion_wav( _info:AudioInfo, _start:Int, _len:Int ) : AudioDataBlob {
            return null;
        } //load_audio_portion_wav

        function audio_seek_source_wav( _info:AudioInfo, _to:Int ) : Bool {
            return false;
        } //audio_seek_source_ogg

    //pcm

        function audio_load_pcm( asset:AssetInfo, ?load:Bool=true ) : AudioInfo {
            return null;
        } //audio_load_pcm

        function audio_load_portion_pcm( _info:AudioInfo, _start:Int, _len:Int ) : AudioDataBlob {
            return null;
        } //load_audio_portion_pcm

        function audio_seek_source_pcm( _info:AudioInfo, _to:Int ) : Bool {
            return false;
        } //audio_seek_source_pcm

    } //AssetSystem

#end //snow_html5