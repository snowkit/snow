package snow.systems.audio;

import snow.systems.assets.Asset.AssetAudio;

class AudioSource {

    public var asset: AssetAudio;

        /** Whether or not the source is considered looping */
    @:isVar public var looping (get,set) : Bool = false;
        /** Whether or not only a single instance is allowed */
    @:isVar public var singular (get,set) : Bool = false;
        /** When an instance is created it will use this volume, unless specified on the play call */
    @:isVar public var default_volume (get,set) : Float = 1.0;

    public function new(_asset:AssetAudio) {
        asset = _asset;
    } //new

        /** */
    public function instance() : AudioInstance {
        
        return null;

    } //instance

        /** */
    function stop() {

    }

    function get_looping() : Bool return looping;
    function set_looping(_val:Bool) : Bool return looping = _val;
    function get_singular() : Bool return singular;
    function set_singular(_val:Bool) : Bool return singular = _val;
    function get_default_volume() : Float return default_volume;
    function set_default_volume(_val:Float) : Float return default_volume = _val;

}
