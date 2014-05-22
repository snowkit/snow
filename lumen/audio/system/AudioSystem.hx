package lumen.audio.system;

import lumen.audio.Audio;
import lumen.Lumen;


#if lumen_audio_openal

    @:noCompletion typedef LumenAudioSystem = lumen.audio.system.openal.AudioSystemOpenAL;
    @:noCompletion typedef LumenSound = lumen.audio.system.openal.SoundOpenAL;
    @:noCompletion typedef LumenSoundStream = lumen.audio.system.openal.SoundStreamOpenAL;

#else

    @:noCompletion typedef LumenAudioSystem = lumen.audio.system.AudioSystem;
    @:noCompletion typedef LumenSound = lumen.audio.system.Sound;
    @:noCompletion typedef LumenSoundStream = lumen.audio.system.SoundStream;

#end //lumen_audio_openal

/** Internal audio system definition, interact with this system through `lumen.Audio`, not directly */
@:noCompletion class AudioSystem {

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

    public function suspend() {
    } //suspend

    public function resume() {
    } //resume


} //AudioSystem