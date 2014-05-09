package lumen.audio.system.openal;

import lumen.audio.Audio;
import lumen.audio.system.Sound;

import lumen.LumenTypes;
import lumen.utils.Float32Array;

#if lumen_audio_openal

//The openal specific implementation of Sound
import lumen.audio.al.AL;

class SoundOpenAL extends Sound {

    public var source : Int;
    public var buffer : Int;
    var playing : Bool = false;

    public function new( _manager:Audio, _audio_info : AudioInfo ) {

        super(_manager, _audio_info);

        if(info == null) {

            trace("Not creating sound, _audio_info was null");

            return;

        } else {

            trace("/ lumen / creating sound : " + info.id + " / " + info.format);

            trace("\t > rate : " + info.rate);
            trace("\t > channels : " + info.channels);
            trace("\t > bitrate : " + info.bitrate);
            trace("\t > bits_per_sample : " + info.bits_per_sample);

        }

        source = AL.genSource();

        trace('lumen / audio / ${name} generating source for sound / ${AL.getErrorMeaning(AL.getError())} ');

            //default to 1 pitch
        AL.sourcef( source, AL.PITCH, 1.0 );
            //default to max volume
        AL.sourcef( source, AL.GAIN, 1.0 );
            //default to 2d sound
        AL.source3f( source, AL.POSITION, 0.0, 0.0, 0.0 );
        AL.source3f( source, AL.VELOCITY, 0.0, 0.0, 0.0 );
            //looping is false by default
        AL.sourcei( source, AL.LOOPING, AL.FALSE );

            //generate a buffer for this sound
        buffer = AL.genBuffer();

        trace('lumen / audio / ${name} generating buffer for sound / ${AL.getErrorMeaning(AL.getError())} ');

            //default format is mono 16
        var format = AL.FORMAT_MONO16;

                //if 2+ channels, it's stereo
            if(info.channels > 1) {
                if(info.bits_per_sample == 8) {
                    format = AL.FORMAT_STEREO8;
                    trace("\t format : STEREO 8");
                } else {
                    format = AL.FORMAT_STEREO16;
                    trace("\t format : STEREO 16");
                }
            } else { //mono
                if(info.bits_per_sample == 8) {
                    format = AL.FORMAT_MONO8;
                    trace("\t format : MONO 8");
                } else {
                    format = AL.FORMAT_MONO16;
                    trace("\t format : MONO 16");
                }
            }

            //give the data from the sound info to the buffer
        AL.bufferData(buffer, format, new Float32Array(info.data), info.data.byteLength, info.rate );

        trace('lumen / audio / ${name} buffered data / ${AL.getErrorMeaning(AL.getError())} ');

            //give the buffer to the source
        AL.sourcei(source, AL.BUFFER, buffer);

        trace('lumen / audio / ${name} assigning buffer to source / ${AL.getErrorMeaning(AL.getError())} ');

    } //new

//API

    override public function play() {
        playing = true;
        AL.sourcePlay(source);

        trace('lumen / audio / ${name} playing sound / ${AL.getErrorMeaning(AL.getError())} ');
    } //play

    override public function pause() {
        playing = false;
        AL.sourcePause(source);
    } //pause

    override public function stop() {
        playing = false;
        AL.sourceStop(source);
    } //stop

    override public function toggle() {

        playing = !playing;

        if(playing) {
            play();
        } else {
            pause();
        }

    } //toggle

//getters / setters

    override function get_pitch() : Float {
        return pitch;
    } //get_pitch

    override function get_volume() : Float {
        return volume;
    } //get_volume

    override function get_pan() : Float {
        return pan;
    } //get_pan

    static var half_pi : Float = 1.5707;

    override function set_pan( _pan:Float ) : Float {

        AL.source3f(source, AL.POSITION, Math.cos((_pan - 1) * (half_pi)), 0, Math.sin((_pan + 1) * (half_pi)));

        return pan = _pan;

    } //set_pan

    override function set_pitch( _pitch:Float ) : Float {

        AL.sourcef( source, AL.PITCH, _pitch );

        return pitch = _pitch;

    } //set_pitch

    override function set_volume( _volume:Float ) : Float {

        AL.sourcef( source, AL.GAIN, _volume );

        return volume = _volume;

    } //set_volume

} //SoundOpenAL

#end //lumen_audio_openal


// if(playing) {

//     pitch += 0.01 * dir;

//     if(pitch > 2) dir = -1;
//     if(pitch <= 0.1) dir = 1;

//     AL.sourcef( source, AL.PITCH, pitch );

// }