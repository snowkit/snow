package snow.runtime;

@:allow(snow.Snowdev)
class Web implements Runtime {

    public var name: String = 'web';
    public var app: snow.Snowdev;

    function new(_app:snow.Snowdev) {

        app = _app;

        trace('runtime / web / new');

    } //new

    function init() {
        trace('runtime / web / init');
    }

    function shutdown() {
        trace('runtime / web / shutdown');
    }

} //Web

