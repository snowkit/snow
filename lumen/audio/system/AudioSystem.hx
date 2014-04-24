package lumen.audio.system;

import lumen.audio.Audio;
import lumen.Lumen;


#if lumen_audio_openal

    typedef LumenAudioSystem = lumen.audio.system.openal.AudioSystemOpenAL;

#else

    typedef LumenAudioSystem = lumen.audio.system.AudioSystem;

#end //lumen_audio_openal


class AudioSystem {

    var manager : Audio;
    var lib : Lumen;

    public function new( _manager:Audio, _lib:Lumen ) {

        manager = _manager;
        lib = _lib;

    } //new

    public function init() {
    } //init

    public function update() {
    } //update

    public function destroy() {
    } //destroy

    public function toggle() {
    } //toggle


} //AudioSystem