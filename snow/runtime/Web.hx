package snow.runtime;

@:allow(snow.Snow)
class Web implements Runtime {

    public var name: String = 'web';
    public var app: snow.Snow;

    function new(_app:snow.Snow) {

        app = _app;

        trace('runtime / web / new');

    } //new

    function run() {
        trace('runtime / web / run');
    }

    function shutdown() {
        trace('runtime / web / shutdown');
    }

    function timestamp() : Float {
        return 0.0;
    }

} //Web

