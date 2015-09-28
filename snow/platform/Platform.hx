package snow.platform;

@:allow(snow.Snowdev)
interface Platform {

    var name : String;
    var app : snow.Snowdev;

    private function init() : Void;
    private function shutdown() : Void;

} //Platform