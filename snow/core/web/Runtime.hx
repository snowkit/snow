package snow.core.web;

import snow.types.Types;
import snow.api.Debug.*;

typedef RuntimeConfig = {}
typedef WindowHandle = js.html.CanvasElement;

@:allow(snow.Snow)
class Runtime implements snow.runtime.Runtime {

    public var app:snow.Snow;
    public var window : WindowHandle;
    public var name: String = 'web';
    
    function new(_app:snow.Snow) {

        app = _app;
        timestamp_start = timestamp();

    } //new

    function shutdown(?_immediate:Bool=false) {

        log('runtime / web / shutdown');

    } //shutdown

    function run() : Bool {

        log('runtime / web / run');

        return false;

    } //run

    static var timestamp_start : Float = 0.0;
    inline public static function timestamp() : Float {

        return (js.Browser.window.performance.now()/1000.0) - timestamp_start;

    }

    function ready() {

        log('runtime / web / ready');
        
    } //ready

    public function window_grab(enable:Bool) : Bool {

        log('runtime / web / window_grab');

        return false;

    } //window_grab

    public function window_fullscreen(enable:Bool, ?true_fullscreen:Bool=false) : Bool {

        log('runtime / web / window_fullscreen');

        return false;

    } //window_fullscreen

    public function window_device_pixel_ratio() {
        
        var _dpr = js.Browser.window.devicePixelRatio;
        if(_dpr == null) _dpr = 1.0;
        
        return _dpr;        

    } //window_device_pixel_ratio

    public function window_width() : Int {

        return window.height;

    } //window_width

    public function window_height() : Int {

        return window.height;

    } //window_height

}