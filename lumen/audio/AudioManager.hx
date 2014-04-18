package lumen.audio;

import lumen.LumenTypes;

import lumen.al.AL;
import lumen.al.AL.Context;
import lumen.al.AL.Device;

class AudioManager {

    var lib : Lumen;

    var device : Device;
    var context : Context;
    var source : Int;

    public function new( _lib:Lumen ) {

        lib = _lib;

        device = ALC.openDevice();
        context = ALC.createContext(device, null);

        ALC.makeContextCurrent( context );

        source = AL.genSource();

        AL.sourcef( source, AL.PITCH, 1 );

        AL.sourcef( source, AL.GAIN, 1 );

        AL.source3f( source, AL.POSITION, 0, 0, 0 );

        AL.source3f( source, AL.VELOCITY, 0, 0, 0 );

        AL.sourcei( source, AL.LOOPING, AL.FALSE );

        trace( AL.getErrorMeaning(AL.getError()) );
    } //new

    public function destroy() {
        
        ALC.closeDevice( device );

    }

    public function update() {

    }

} //AudioManager