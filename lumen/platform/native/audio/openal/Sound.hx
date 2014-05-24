package lumen.platform.native.audio.openal;

import lumen.audio.Audio;
import lumen.types.Types;
import lumen.utils.Float32Array;

import lumen.audio.openal.AL;
import lumen.platform.native.audio.openal.OpenALHelper;


/** The openal specific implementation of Sound */
@:noCompletion class Sound extends lumen.platform.native.audio.Sound {


        /** the sound source name */
    public var source : Int;
        /** the sound buffer name */
    public var buffer : Int;
        /** mono8? stereo16? */
    public var format : Int;

    public function new( _manager:Audio, _name:String, _audio_info : AudioInfo ) {

        super(_manager, _name, _audio_info);

        if(info == null) {

            trace("/ lumen / not creating sound, _audio_info was null");

            return;

        } else {

            trace('/ lumen / creating sound / ${name} / ${info.id} / ${info.format}');

            trace("/ lumen /\t > rate : " + info.rate);
            trace("/ lumen /\t > channels : " + info.channels);
            trace("/ lumen /\t > bitrate : " + info.bitrate);
            trace("/ lumen /\t > bits_per_sample : " + info.bits_per_sample);
            trace("/ lumen /\t > file length : " + info.length);
            trace("/ lumen /\t > byte length: " + info.length_pcm);
            trace("/ lumen /\t > duration : " + duration);

        }

        source = AL.genSource();

            trace('/ lumen / audio / ${name} generating source for sound / ${AL.getErrorMeaning(AL.getError())} ');

            //ask the shared openal helper function
        OpenALHelper.default_source_setup( source );

            //generate a buffer for this sound
        buffer = AL.genBuffer();

            trace('/ lumen / audio / ${name} generating buffer for sound / ${AL.getErrorMeaning(AL.getError())} ');

            //ask the helper to determine the format
        format = OpenALHelper.determine_format( info );

            //check that we have valid data info
        trace(info.data);
        trace(info.data.length);
        if(info.data == null || info.data.length == 0) {
            trace('/ lumen / audio / ${name} cannot create sound, empty/null data provided!');
            return;            
        }

            //give the data from the sound info to the buffer
        AL.bufferData(buffer, format, new Float32Array(info.data), info.data.length, info.rate );

            trace('/ lumen / audio / ${name} buffered data / ${AL.getErrorMeaning(AL.getError())} ');

            //give the buffer to the source
        AL.sourcei(source, AL.BUFFER, buffer);

            trace('/ lumen / audio / ${name} assigning buffer to source / ${AL.getErrorMeaning(AL.getError())} ');

    } //new

//API

    override public function play() {

        playing = true;

            //play is explicitly not looping
        if(looping) {
            looping = false;
        }

        AL.sourcePlay(source);

        trace('/ lumen / audio / ${name} playing sound / ${AL.getErrorMeaning(AL.getError())} ');

    } //play

     override public function loop() {

        playing = true;

        if(!looping) {
            looping = true;
        }

        AL.sourcePlay(source);

        trace('/ lumen / audio / ${name} looping sound / ${AL.getErrorMeaning(AL.getError())} ');

    } //loop

    override public function pause() {

        playing = false;

        AL.sourcePause(source);

        trace('/ lumen / audio / ${name} pausing sound / ${AL.getErrorMeaning(AL.getError())} ');

    } //pause

    override public function stop() {

        playing = false;

        AL.sourceStop(source);

        trace('/ lumen / audio / ${name} stopping sound / ${AL.getErrorMeaning(AL.getError())} ');

    } //stop

    override function destroy() {

        stop();
        
        AL.deleteSource(source);
        AL.deleteBuffer(buffer);

    } //destroy


//getters / setters

    static var half_pi : Float = 1.5707;

    override function get_position() : Int {

        return Std.int(AL.getSourcef(source, AL.SAMPLE_OFFSET));

    } //get_position

    override function get_time() : Float {
        
        return AL.getSourcef(source, AL.SEC_OFFSET);

    } //get_position

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

    override function set_looping( _looping:Bool ) : Bool {

        AL.sourcef( source, AL.LOOPING, _looping ? AL.TRUE : AL.FALSE );

        return looping = _looping;

    } //set_looping

    override function set_position( _position:Int ) : Int {
        
        AL.sourcef(source, AL.SAMPLE_OFFSET, _position);

        return position = _position;

    } //set_position

    override function set_time( _time:Float ) : Float {
        
        AL.sourcef(source, AL.SEC_OFFSET, _time);

        return time = _time;

    } //set_time

} //Sound
