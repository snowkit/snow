package snow.platform.native.audio.openal;

import snow.audio.Audio;
import snow.types.Types;
import snow.utils.Float32Array;

import snow.audio.openal.AL;
import snow.platform.native.audio.openal.OpenALHelper;


/** The openal specific implementation of Sound */
@:noCompletion class Sound extends snow.platform.native.audio.Sound {


        /** the sound source name */
    public var source : Int;
        /** the sound buffer name */
    public var buffer : Int;
        /** mono8? stereo16? */
    public var format : Int;

    public function new( _manager:Audio, _name:String ) {

        super(_manager, _name);

    } //new

//API

    override public function play() {

        playing = true;

            //play is explicitly not looping
        if(looping) {
            looping = false;
        }

        AL.sourcePlay(source);

        trace('/ snow / audio / ${name} playing sound / ${AL.getErrorMeaning(AL.getError())} ');

    } //play

     override public function loop() {

        playing = true;

        if(!looping) {
            looping = true;
        }

        AL.sourcePlay(source);

        trace('/ snow / audio / ${name} looping sound / ${AL.getErrorMeaning(AL.getError())} ');

    } //loop

    override public function pause() {

        playing = false;

        AL.sourcePause(source);

        trace('/ snow / audio / ${name} pausing sound / ${AL.getErrorMeaning(AL.getError())} ');

    } //pause

    override public function stop() {

        playing = false;

        AL.sourceStop(source);

        trace('/ snow / audio / ${name} stopping sound / ${AL.getErrorMeaning(AL.getError())} ');

    } //stop

    override function destroy() {

        stop();

        AL.deleteSource(source);
        AL.deleteBuffer(buffer);

    } //destroy

//internal

    override function internal_update() {

        if(!playing) {
            return;
        }

        var _al_play_state = AL.getSourcei(source, AL.SOURCE_STATE);

        if(_al_play_state != AL.PLAYING) {
            playing = false;
            emit('end');
        }

    } //internal_update

//getters / setters

    override function set_info( _info:AudioInfo ) : AudioInfo {

            //if preexisting,
        if(info != null) {
            destroy();
        }

            //flag as done for gc
        info = null;

            //now
        if(_info == null) {

            trace("/ snow / not creating sound, info was null");

            return info;

        }

            //store the new sound
        info = _info;
        loaded = true;

        trace('/ snow / creating sound / ${name} / ${info.id} / ${info.format}');

            // trace("/ snow /\t > rate : " + info.data.rate);
            // trace("/ snow /\t > channels : " + info.data.channels);
            // trace("/ snow /\t > bitrate : " + info.data.bitrate);
            // trace("/ snow /\t > bits_per_sample : " + info.data.bits_per_sample);
            // trace("/ snow /\t > file length : " + info.data.length);
            // trace("/ snow /\t > byte length: " + info.data.length_pcm);
            // trace("/ snow /\t > duration : " + duration);

        source = AL.genSource();

            trace('/ snow / audio / ${name} generating source for sound / ${AL.getErrorMeaning(AL.getError())} ');

            //ask the shared openal helper function
        OpenALHelper.default_source_setup( source );

            //generate a buffer for this sound
        buffer = AL.genBuffer();

            trace('/ snow / audio / ${name} generating buffer for sound / ${AL.getErrorMeaning(AL.getError())} ');

            //ask the helper to determine the format
        format = OpenALHelper.determine_format( info );

            //check that we have valid data info
        if(info.data.bytes == null || info.data.bytes.length == 0) {
            trace('/ snow / audio / ${name} cannot create sound, empty/null data provided!');
            return info;
        }

            //give the data from the sound info to the buffer
        AL.bufferData(buffer, format, new Float32Array(info.data.bytes), info.data.bytes.length, info.data.rate );

            trace('/ snow / audio / ${name} buffered data / ${AL.getErrorMeaning(AL.getError())} ');

            //give the buffer to the source
        AL.sourcei(source, AL.BUFFER, buffer);

            trace('/ snow / audio / ${name} assigning buffer to source / ${AL.getErrorMeaning(AL.getError())} ');

            //handle onload handlers
        emit('load');

        return info;

    } //set_info

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
