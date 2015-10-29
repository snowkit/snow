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

    static function timestamp() : Float {
        return 0.0;
    }

    public function window_grab(enable:Bool) : Bool {

        log('runtime / web / window_grab');
        return false;

    } //window_grab

    public function window_fullscreen(enable:Bool, ?true_fullscreen:Bool=false) : Bool {

        log('runtime / web / window_fullscreen');
        return false;

    } //window_fullscreen

} //Web

typedef WebConfig = {

        /** If true, right clicking will consume the event on the canvas. `event.preventDefault` is used. default: true*/
    @:optional var no_context_menu : Bool;

        /** Any Key.* values stored in this array sent to the page will be consumed by snow. `event.preventDefault` is used.
            Keys can be removed or added to the array at runtime. default:left,up,down,right,backspace,tab,delete */
    @:optional var prevent_default_keys : Array<Int>;
        /** If true, mouse wheel events sent to the page will be consumed by snow. `event.preventDefault` is used. default: true*/
    @:optional var prevent_default_mouse_wheel : Bool;

        /** If true, native fullscreen will be requested from the user.
            If not, the canvas will fill the window size instead.
            Take note : true fullscreen requests only work when driven by a user event (click/keys).
            You cannot force fullscreen on web. default: false */
    @:optional var true_fullscreen : Bool;

} //WebConfig
