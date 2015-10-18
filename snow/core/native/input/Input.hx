package snow.core.native.input;

import snow.types.Types;
import snow.api.Libs;
import snow.system.window.Window;


@:allow(snow.system.input.Input)
class Input implements snow.modules.interfaces.Input {

    var app : snow.Snow;

    function new(_app:snow.Snow) app = _app;
    function onevent(_event:SystemEvent) {}
    function shutdown() {}

    function listen(window:Window) {}
    function unlisten(window:Window) {}

    //:todo: warn of empty module
    public function text_input_start() : Void {}
    public function text_input_stop() : Void {}
    public function text_input_rect(x:Int, y:Int, w:Int, h:Int) : Void {}

} //Input
