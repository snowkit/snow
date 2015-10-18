package snow.modules.sdl;

import sdl.SDL;

class Input extends snow.core.common.input.Input {

    override public function text_input_start() : Void {

        SDL.startTextInput();

    } //text_input_start

    override public function text_input_stop() : Void {

        SDL.stopTextInput();

    } //text_input_stop

    override public function text_input_rect(x:Int, y:Int, w:Int, h:Int) : Void {

        SDL.setTextInputRect(x, y, w, h);

    } //text_input_rect

} //Input