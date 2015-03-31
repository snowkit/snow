package snow.modules.howlerjs;

import snow.types.Types;

typedef Sound = snow.modules.howlerjs.sound.Sound;

@:allow(snow.system.audio.Audio)
class Audio implements snow.modules.interfaces.Audio {

    var suspended_sounds : Array<snow.system.audio.Sound>;
    var system : snow.system.audio.Audio;

    function new( _system:snow.system.audio.Audio ) {
        system = _system;
        suspended_sounds = [];
    }

    function init() {}
    function update() {}
    function destroy() {}
    function on_event( event:SystemEvent ) {}

    public function suspend() {

        for(sound in system.handles) {
            if(sound.playing) {
                sound.toggle();
                suspended_sounds.push(sound);
            }
        }

    } //suspend

    public function resume() {

        while(suspended_sounds.length > 0) {
            var sound = suspended_sounds.pop();
            sound.toggle();
        }

    } //resume

        //called by howler js as it forces specifying the on end handler
        //when loading the sound... not at any point later,
        //so we use this and the internal map to get a Sound and handle
    @:allow(snow.core.web.assets.Assets)
    function _on_end(handle:AudioHandle) {
        var sound = system.handles.get(handle);
        if(sound != null) {
            sound.emit('end');
        }
    }

} //AudioSystem
