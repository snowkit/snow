package snow.modules.interfaces;

import snow.types.Types;

@:noCompletion
@:allow(snow.system.input.Input)
interface Input {

    private var app: snow.Snow;
    private function onevent( event:SystemEvent ):Void;
    private function shutdown():Void;

    private function listen( window:snow.system.window.Window ):Void;
    private function unlisten( window:snow.system.window.Window ):Void;

} //Input