package lumen.audio.system;

import lumen.audio.Audio;
import lumen.Lumen;


#if lumen_audio_openal

    typedef LumenAudioSystem = lumen.audio.system.openal.AudioSystemOpenAL;
    typedef LumenSound = lumen.audio.system.openal.SoundOpenAL;
    typedef LumenSoundStream = lumen.audio.system.openal.SoundStreamOpenAL;

#else

    typedef LumenAudioSystem = lumen.audio.system.AudioSystem;
    typedef LumenSound = lumen.audio.system.Sound;
    typedef LumenSoundStream = lumen.audio.system.SoundStream;

#end //lumen_audio_openal


class AudioSystem {

    public var manager : Audio;
    public var lib : Lumen;

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