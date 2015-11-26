package snow.modules.openal;

import snow.systems.audio.AudioInstance;

import snow.api.Debug.*;

@:log_as('AL sound')
@:allow(snow.modules.openal.Audio)
class ALAudioInstance extends AudioInstance {

        /** the AL source handle */
    public var al_source : Int;
        /** The current pan in -1,1 range */
    var pan : Float = 0.0;

    public function new(_source:snow.systems.audio.AudioSource, _volume:Float) {
            
        super(_source);

        al_source = AL.genSource();

        //:todo: errors

        AL.sourcef(al_source, AL.GAIN, _volume);
        AL.sourcei(al_source, AL.LOOPING, AL.FALSE);

        AL.sourcef(al_source, AL.PITCH, 1.0);
        AL.source3f(al_source, AL.POSITION, 0.0, 0.0, 0.0);
        AL.source3f(al_source, AL.VELOCITY, 0.0, 0.0, 0.0);

    } //new

}