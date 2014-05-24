package lumen.platform.native.audio;

import lumen.audio.Audio;
import lumen.audio.AudioSystem;
import lumen.types.Types;

    //This is not needlessly empty, it binds an empty platform binding where no implementation exists

@:noCompletion class AudioSystem extends AudioSystemBinding {
	
    public function new( _manager:Audio, _lib:Lumen ) {

        manager = _manager;
        lib = _lib;

    } //new

    override public function init() {}
    override public function update() {}
    override public function destroy() {}
    override public function suspend() {}
    override public function resume() {}

} //AudioSystem
