package snow.runtime;

@:allow(snow.Snowdev)
class Mac implements Runtime {

    public var name: String = 'mac';
    public var app: snow.Snowdev;

    function new(_app:snow.Snowdev) {

        app = _app;

        trace('runtime / mac / new');

    } //new

    function init() {
        trace('runtime / mac / init');
    }

    function shutdown() {
        trace('runtime / mac / shutdown');
    }

} //Mac

