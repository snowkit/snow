package snow.audio;

import snow.audio.Audio;
import snow.Snow;

import snow.utils.AbstractClass;

#if snow_web

    #if snow_audio_howlerjs
        @:noCompletion typedef AudioSystem = snow.platform.web.audio.howlerjs.AudioSystem;
    #else
        @:noCompletion typedef AudioSystem = snow.platform.web.audio.AudioSystem;
    #end

#else

    #if snow_audio_openal
        @:noCompletion typedef AudioSystem = snow.platform.native.audio.openal.AudioSystem;
    #else
        @:noCompletion typedef AudioSystem = snow.platform.native.audio.AudioSystem;
    #end //snow_audio_openal

#end


/** Internal audio system definition, interact with this system through `snow.Audio`, not directly */
@:noCompletion class AudioSystemBinding implements AbstractClass {

    public var manager : Audio;
    public var lib : Snow;

        /** Called by the audio manager when initiating this system*/
    public function init();
        /** Called by the audio manager when updating this system*/
    public function process();
        /** Called by the audio manager when destroying this system*/
    public function destroy();
        /** Called by the audio manager when suspending this system*/
    public function suspend();
        /** Called by the audio manager when resuming this system*/
    public function resume();


} //AudioSystem