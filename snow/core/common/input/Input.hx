package snow.core.common.input;

import snow.types.Types;
import snow.api.Debug.*;
import snow.system.window.Window;

@:allow(snow.system.input.Input)
class Input implements snow.modules.interfaces.Input {

    var app : snow.Snow;

    function new(_app:snow.Snow) app = _app;
    function onevent(_event:SystemEvent) {}
    function shutdown() {}

    function listen(window:Window) {

        log('listen in core module does nothing');

    } //listen

    function unlisten(window:Window) {

        log('unlisten in core module does nothing');

    } //unlisten

    public function text_input_start() : Void {

        log('text_input_start in core module does nothing');

    } //text_input_start

    public function text_input_stop() : Void {

        log('text_input_stop in core module does nothing');

    } //text_input_stop

    public function text_input_rect(x:Int, y:Int, w:Int, h:Int) : Void {

        log('text_input_rect in core module does nothing');

    } //text_input_rect

} //Input
