package snow.platform.web.audio.howlerjs;

import snow.audio.Audio;
import snow.types.Types;

@:noCompletion class AudioSystem extends snow.platform.web.audio.AudioSystem {

    var suspended_sounds : Array<Sound>;

    override public function init() {

        suspended_sounds = [];

    } //init

    override public function process() {

    } //process

    override public function destroy() {

    } //destroy


    override public function suspend() {

        for(sound in manager.handles) {
            if(sound.playing) {
                sound.toggle();
                suspended_sounds.push(sound);
            }
        }

    } //suspend

    override public function resume() {

        while(suspended_sounds.length > 0) {
            var sound = suspended_sounds.pop();
            sound.toggle();
        }

    } //resume

        //called by howler js as it forces specifying the on end handler
        //when loading the sound... not at any point later,
        //so we use this and the internal map to get a Sound and handle
    public function _on_end(handle:AudioHandle) {
        var sound = manager.handles.get(handle);
        if(sound != null) {
            sound.emit('end');
        }
    }

} //AudioSystem
