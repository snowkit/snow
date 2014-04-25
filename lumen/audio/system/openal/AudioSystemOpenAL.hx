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

        override public function init() {

            device = ALC.openDevice();
            context = ALC.createContext(device, null);

            ALC.makeContextCurrent( context );

        } //init

        override public function update() {
                    
        }

        override public function destroy() {
            ALC.closeDevice( device );
        }
        
    } //AudioSystemOpenAL


#end //lumen_audio_openal
