package lumen.platform.html5.assets;

import lumen.assets.Assets;
import lumen.assets.AssetSystem;
import lumen.types.Types;

#if lumen_html5

    @:noCompletion class AssetSystem extends AssetSystemBinding {
    	
        public function new( _manager:Assets ) {
            manager = _manager;
        }

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

        override public function image_load_info( _path:String, ?_components:Int = 4, ?_onloaded:?ImageInfo->Void ) : ImageInfo {

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
                    data : new lumen.utils.UInt8Array( image_bytes.data )
                };

                    //cleanup
                tmp_canvas = null; tmp_context = null; image_bytes = null;
                
                    //append the listener
                if(_onloaded != null) {
                    _onloaded( info );
                }

            } //image.onload

                //source comes after the onload being set, for race conditions
            image.src = _path;        

            return info;

        } //image_load_info

    //ogg

        override public function audio_load_ogg( asset:AssetInfo, ?load:Bool=true ) : AudioInfo {
            return null;
        } //audio_load_ogg

        override public function audio_load_portion_ogg( _info:AudioInfo, _start:Int, _len:Int ) : AudioDataBlob {
            return null;
        } //load_audio_portion_ogg

        override public function audio_seek_source_ogg( _info:AudioInfo, _to:Int ) : Bool {
            return false;
        } //audio_seek_source_ogg

    //wav

        override public function audio_load_wav( asset:AssetInfo, ?load:Bool=true ) : AudioInfo {
            return null;
        } //audio_load_wav

        override public function audio_load_portion_wav( _info:AudioInfo, _start:Int, _len:Int ) : AudioDataBlob {
            return null;
        } //load_audio_portion_wav

        override public function audio_seek_source_wav( _info:AudioInfo, _to:Int ) : Bool {
            return false;
        } //audio_seek_source_ogg

    //pcm

        override public function audio_load_pcm( asset:AssetInfo, ?load:Bool=true ) : AudioInfo {
            return null;
        } //audio_load_pcm

        override public function audio_load_portion_pcm( _info:AudioInfo, _start:Int, _len:Int ) : AudioDataBlob {
            return null;
        } //load_audio_portion_pcm

        override public function audio_seek_source_pcm( _info:AudioInfo, _to:Int ) : Bool {
            return false;
        } //audio_seek_source_pcm

    } //AssetSystem

#end //lumen_html5