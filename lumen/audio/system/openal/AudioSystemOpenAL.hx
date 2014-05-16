package lumen.audio.system.openal;

import lumen.LumenTypes;
import lumen.audio.system.AudioSystem;

import lumen.utils.ByteArray;
import lumen.utils.Float32Array;

#if lumen_audio_openal

import lumen.audio.al.AL;
import lumen.audio.al.AL.Context;
import lumen.audio.al.AL.Device;

    class AudioSystemOpenAL extends AudioSystem {

        var device : Device;
        var context : Context;

        override function init() {

                trace('/ lumen / audio / init ');

            device = ALC.openDevice();

                trace('/ lumen / audio / created device / ${device} / ${ AL.getErrorMeaning(AL.getError()) }');

            context = ALC.createContext(device, null);

                trace('/ lumen / audio / created context / ${context} / ${ AL.getErrorMeaning(AL.getError()) }');

            ALC.makeContextCurrent( context );

                trace('/ lumen / audio / set current / ${ AL.getErrorMeaning(AL.getError()) }');

        } //init

        override function destroy() {

            ALC.makeContextCurrent( null );
            ALC.destroyContext( context );
            ALC.closeDevice( device );

                trace('/ lumen / audio / destroying device / ${ AL.getErrorMeaning(AL.getError()) }');

        } //destroy

        override function suspend() {

                trace('/ lumen / audio / suspending context ');

            ALC.suspendContext( context );
            ALC.makeContextCurrent( null );

        } //suspend

        override function resume() {

                trace('/ lumen / audio / resuming context ');

            ALC.processContext( context );
            ALC.makeContextCurrent( context );

        } //resume

    } //AudioSystemOpenAL


#end //lumen_audio_openal
