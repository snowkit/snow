package lumen.platform.html5.assets;

import lumen.assets.Assets;
import lumen.assets.AssetSystem;
import lumen.types.Types;


@:noCompletion class AssetSystem extends AssetSystemBinding {
	
    public function new( _manager:Assets ) {
        manager = _manager;
    }

//images

    override public function image_load_info( _path:String, ?_components:Int = 4) : ImageInfo {
        return null;
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
