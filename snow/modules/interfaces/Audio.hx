package snow.modules.interfaces;

import snow.types.Types;

@:allow(snow.system.audio.Audio)
interface Audio {

    private function init():Void;
    private function update():Void;
    private function destroy():Void;
    private function on_event( event:SystemEvent ):Void;

    function suspend():Void;
    function resume():Void;

} //Input