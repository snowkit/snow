package snow.platform;

class Mac implements Platform {

    public var name: String = 'mac';
    public var app: snow.Snowdev;

    function new(_app:snow.Snowdev) {

        app = _app;

        trace('platform / mac / new');

    } //new

    function init() {
        trace('platform / mac / init');
    }

    function shutdown() {
        trace('platform / mac / shutdown');
    }

} //Mac

