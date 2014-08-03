package snow.platform.web.assets;

import snow.assets.Assets;
import snow.assets.AssetSystem;
import snow.types.Types;
import snow.utils.ByteArray;

#if snow_web


    #if snow_audio_howlerjs
        import snow.platform.web.audio.howlerjs.Howl;
    #end //snow_audio_howlerjs

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

            if(_bytes == null) {
                trace("/ snow / invalid bytes passed to image_info_from_bytes " + _path);
                return null;
            }

                //Then we need it to be a BytesInput haxe.io.Input
            var _raw_bytes : haxe.io.Bytes = ByteArray.toBytes(_bytes);
                //now a byte input for format.png
            var byte_input = new haxe.io.BytesInput(_raw_bytes, 0, _raw_bytes.length);
                //get the raw data
            var png_data = new snow.utils.format.png.Reader(byte_input).read();
                //Extract the bytes from the png reader
            var png_bytes = snow.utils.format.png.Tools.extract32(png_data);
                //And the header information for infomation
            var png_header = snow.utils.format.png.Tools.getHeader(png_data);

            return {
                id : _path,
                bpp : _components,
                width : png_header.width,
                height : png_header.height,
                width_actual : png_header.width,
                height_actual : png_header.height,
                bpp_source : png_header.colbits,
                data : new snow.utils.UInt8Array(png_bytes.getData())
            }

        } //image_info_from_bytes

        override public function audio_load_info( _path:String, ?_format:AudioFormatType, ?_load:Bool = true, ?_onload:?AudioInfo->Void ) : AudioInfo {

            var sound : Howl = null;

            var info : AudioInfo = {
                format:_format,
                id:_path, handle:null, data:null
            };

            info.handle = new Howl({
                urls: [_path],
                    //this seems to not work as intended
                    //when skipping sounds. :todo: test on server
                // buffer : !_load,
                onload : function(){
                    if(_onload != null) {
                        _onload(info);
                    }
                }
            });

            return info;

        } //audio_load_info

    } //AssetSystem

#end //snow_web