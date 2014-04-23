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
        var source : Int;
        var buffer : Int;

        var playing : Bool = true;
        var pitch : Float = 1;
        var dir : Int = 1;

        override public function init() {

            device = ALC.openDevice();
            context = ALC.createContext(device, null);

            ALC.makeContextCurrent( context );

            source = AL.genSource();

            AL.sourcef( source, AL.PITCH, 1.0 );
            AL.sourcef( source, AL.GAIN, 1.0 );
            AL.source3f( source, AL.POSITION, 0.0, 0.0, 0.0 );
            AL.source3f( source, AL.VELOCITY, 0.0, 0.0, 0.0 );

            AL.sourcei( source, AL.LOOPING, AL.TRUE );

            buffer = AL.genBuffer();

            // var data = ByteArray.readFile( "./assets/sound.pcm" );
            // var info : AudioInfo = lib.loadsound_ogg("assets/sound.ogg");
            var info : AudioInfo = lib.loadsound_wav("assets/sound.wav");

            if(info == null) {
                trace("Not playing test sound, failed to load sound");
                return;
            } else {

                trace("loading audio file : " + info.id + " / " + info.format);

                trace("\t rate : " + info.rate);
                trace("\t channels : " + info.channels);
                trace("\t bitrate : " + info.bitrate);
                trace("\t bits_per_sample : " + info.bits_per_sample);
            }

            var format = AL.FORMAT_STEREO16;

                //stereo is 2+ channels
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

            AL.bufferData(buffer, format, new Float32Array(info.data), info.data.byteLength, info.rate );
            AL.sourcei(source, AL.BUFFER, buffer);

        } //init

        override public function toggle() {

            playing = !playing;

            if(playing) {
                AL.sourcePlay(source);
            } else {
                AL.sourceStop(source);
            }

        } //toggle

        override public function update() {

            if(playing) {

                pitch += 0.01 * dir;

                if(pitch > 2) dir = -1;
                if(pitch <= 0.1) dir = 1;

                AL.sourcef( source, AL.PITCH, pitch );

            }
        }

        override public function destroy() {
            ALC.closeDevice( device );
        }
        
    } //AudioSystemOpenAL


#end //lumen_audio_openal
