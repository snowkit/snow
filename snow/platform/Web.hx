package snow.platform;

@:allow(snow.Snowdev)
class Web implements Platform {

    public var name: String = 'web';
    public var app: snow.Snowdev;

    function new(_app:snow.Snowdev) {

        app = _app;

        trace('platform / web / new');

    } //new

    function init() {
        trace('platform / web / init');
    }

    function shutdown() {
        trace('platform / web / shutdown');
    }

} //Web

