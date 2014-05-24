package lumen.platform.native.audio.openal;


import lumen.types.Types;
import lumen.audio.AudioSystem;

import lumen.audio.openal.AL;
import lumen.audio.openal.AL.Context;
import lumen.audio.openal.AL.Device;


    /** Internal audio system implementation for OpenAL, interact with this system through `lumen.Audio`, not directly */
@:noCompletion class AudioSystem extends lumen.platform.native.audio.AudioSystem {

    var device : Device;
    var context : Context;

    override public function init() {

            trace('/ lumen / audio / init ');

        device = ALC.openDevice();

            trace('/ lumen / audio / created device / ${device} / ${ AL.getErrorMeaning(AL.getError()) }');

        context = ALC.createContext(device, null);

            trace('/ lumen / audio / created context / ${context} / ${ AL.getErrorMeaning(AL.getError()) }');

        ALC.makeContextCurrent( context );

            trace('/ lumen / audio / set current / ${ AL.getErrorMeaning(AL.getError()) }');

    } //init

    override public function destroy() {

        ALC.makeContextCurrent( null );
        ALC.destroyContext( context );
        ALC.closeDevice( device );

            trace('/ lumen / audio / destroying device / ${ AL.getErrorMeaning(AL.getError()) }');

    } //destroy

    override public function suspend() {

            trace('/ lumen / audio / suspending context ');

        ALC.suspendContext( context );
        ALC.makeContextCurrent( null );

    } //suspend

    override public function resume() {

            trace('/ lumen / audio / resuming context ');

        ALC.processContext( context );
        ALC.makeContextCurrent( context );

    } //resume

} //AudioSystem
