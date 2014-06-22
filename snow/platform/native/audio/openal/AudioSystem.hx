package snow.platform.native.audio.openal;


import snow.types.Types;
import snow.audio.AudioSystem;

import snow.audio.openal.AL;
import snow.audio.openal.AL.Context;
import snow.audio.openal.AL.Device;


    /** Internal audio system implementation for OpenAL, interact with this system through `snow.Audio`, not directly */
@:noCompletion class AudioSystem extends snow.platform.native.audio.AudioSystem {

    var device : Device;
    var context : Context;

    override public function init() {

            trace('/ snow / audio / init ');

        device = ALC.openDevice();

            trace('/ snow / audio / created device / ${device} / ${ AL.getErrorMeaning(AL.getError()) }');

        context = ALC.createContext(device, null);

            trace('/ snow / audio / created context / ${context} / ${ AL.getErrorMeaning(AL.getError()) }');

        ALC.makeContextCurrent( context );

            trace('/ snow / audio / set current / ${ AL.getErrorMeaning(AL.getError()) }');

    } //init

    override public function destroy() {

        ALC.makeContextCurrent( null );
        ALC.destroyContext( context );
        ALC.closeDevice( device );

            trace('/ snow / audio / destroying device / ${ AL.getErrorMeaning(AL.getError()) }');

    } //destroy

    override public function suspend() {

            trace('/ snow / audio / suspending context ');

        ALC.suspendContext( context );
        ALC.makeContextCurrent( null );

    } //suspend

    override public function resume() {

            trace('/ snow / audio / resuming context ');

        ALC.processContext( context );
        ALC.makeContextCurrent( context );

    } //resume

} //AudioSystem
