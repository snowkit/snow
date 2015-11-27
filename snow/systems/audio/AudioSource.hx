package snow.systems.audio;

import snow.systems.assets.Asset.AssetAudio;

class AudioSource {

    public var asset: AssetAudio;

        /** Whether or not the source is a stream */
    public var is_stream (default,null) : Bool = false;

    public function new(_asset:AssetAudio, _is_stream:Bool=false) {
        
        asset = _asset;
        is_stream = _is_stream;

    } //new

        /** A helper for converting bytes to seconds for a sound source */
    public function bytes_to_seconds(_bytes:Int) : Float {

        var word = asset.audio.data.bits_per_sample == 16 ? 2 : 1;
        var sample_frames = (asset.audio.data.rate * asset.audio.data.channels * word);

        return _bytes / sample_frames;

    } //bytes_to_seconds

        /** A helper for converting seconds to bytes for this audio source */
    public function seconds_to_bytes(_seconds:Float) : Int {

        var word = asset.audio.data.bits_per_sample == 16 ? 2 : 1;
        var sample_frames = (asset.audio.data.rate * asset.audio.data.channels * word);

        return Std.int(_seconds * sample_frames);

    } //seconds_to_bytes

        //
    public function duration() : Float {

        return bytes_to_seconds(asset.audio.data.length_pcm);

    } //duration

}
