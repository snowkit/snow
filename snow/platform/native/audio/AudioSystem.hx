package snow.platform.native.audio;

import snow.audio.Audio;
import snow.audio.AudioSystem;
import snow.types.Types;

    //This is not needlessly empty, it binds an empty platform binding where no implementation exists

@:noCompletion class AudioSystem extends AudioSystemBinding {

    public function new( _manager:Audio, _lib:Snow ) {

        manager = _manager;
        lib = _lib;

    } //new

    override public function init() {}
    override public function process() {}
    override public function destroy() {}
    override public function suspend() {}
    override public function resume() {}

} //AudioSystem
