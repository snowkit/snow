package lumen.audio;

import lumen.LumenTypes;

import lumen.al.AL;

class AudioManager {

    var lib : Lumen;
    var device : Dynamic;
    var context : Dynamic;

    public function new( _lib:Lumen ) {

        lib = _lib;

        device = AL.alcOpenDevice();
        context = AL.alcCreateContext(device, null);


    } //new

    public function destroy() {
        AL.alcCloseDevice( device );
    }

    public function update() {

    }

} //AudioManager