package lumen.audio;

import lumen.LumenTypes;
import lumen.audio.system.AudioSystem;
import lumen.audio.system.AudioSystem.LumenAudioSystem;

class AudioManager {

    var lib : Lumen;    
    var system : LumenAudioSystem;

    public function new( _lib:Lumen ) {

        lib = _lib;

        system = new LumenAudioSystem(this, lib);

        system.init();

    } //new

    public function toggle() {
        system.toggle();
    } //toggle

    public function destroy() {
        system.destroy();
    } //destroy

    public function update() {
        system.update();
    } //update

} //AudioManager