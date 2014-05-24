package lumen.audio;

import lumen.audio.Audio;
import lumen.Lumen;

import lumen.utils.AbstractClass;

#if lumen_html5
    
    #if lumen_audio_howlerjs
        @:noCompletion typedef AudioSystem = lumen.platform.html5.audio.howlerjs.AudioSystem;
    #else
        @:noCompletion typedef AudioSystem = lumen.platform.html5.audio.AudioSystem;
    #end

#else 

    #if lumen_audio_openal
        @:noCompletion typedef AudioSystem = lumen.platform.native.audio.openal.AudioSystem;
    #else
        @:noCompletion typedef AudioSystem = lumen.platform.native.audio.AudioSystem;
    #end //lumen_audio_openal

#end 


/** Internal audio system definition, interact with this system through `lumen.Audio`, not directly */
@:noCompletion class AudioSystemBinding implements AbstractClass {

    public var manager : Audio;
    public var lib : Lumen;

        /** Called by the audio manager when initiating this system*/
    public function init();
        /** Called by the audio manager when updating this system*/
    public function update();
        /** Called by the audio manager when destroying this system*/
    public function destroy();
        /** Called by the audio manager when suspending this system*/
    public function suspend();
        /** Called by the audio manager when resuming this system*/
    public function resume();


} //AudioSystem