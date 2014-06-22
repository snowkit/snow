package snow.assets;

import snow.Snow;
import snow.assets.Assets;
import snow.types.Types;

import snow.utils.AbstractClass;


#if snow_html5
    @:noCompletion typedef AssetSystem = snow.platform.html5.assets.AssetSystem;
#else
    @:noCompletion typedef AssetSystem = snow.platform.native.assets.AssetSystem;
#end

@:noCompletion class AssetSystemBinding implements AbstractClass {

    public var manager : Assets;

        /** Image info loader */
    public function image_load_info( _path:String, ?_components:Int = 4, ?_onloaded:?ImageInfo->Void ) : ImageInfo;

        /** OGG specific info loader */
    public function audio_load_ogg( asset:AssetInfo, ?load:Bool=true ) : AudioInfo;
        /** OGG specific portion loader */
    public function audio_load_portion_ogg( _info:AudioInfo, _start:Int, _len:Int ) : AudioDataBlob;
        /** OGG specific seek handler */
    public function audio_seek_source_ogg( _info:AudioInfo, _to:Int ) : Bool;
        /** WAV specific info loader */
    public function audio_load_wav( asset:AssetInfo, ?load:Bool=true ) : AudioInfo;
        /** WAV specific portion loader */
    public function audio_load_portion_wav( _info:AudioInfo, _start:Int, _len:Int ) : AudioDataBlob;
        /** WAV specific seek handler */
    public function audio_seek_source_wav( _info:AudioInfo, _to:Int ) : Bool;
        /** PCM specific info loader */
    public function audio_load_pcm( asset:AssetInfo, ?load:Bool=true ) : AudioInfo;
        /** PCM specific portion loader */
    public function audio_load_portion_pcm( _info:AudioInfo, _start:Int, _len:Int ) : AudioDataBlob;
        /** PCM specific seek handler */
    public function audio_seek_source_pcm( _info:AudioInfo, _to:Int ) : Bool;


} //AssetSystemBinding