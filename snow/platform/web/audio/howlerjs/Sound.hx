package snow.platform.web.audio.howlerjs;

import snow.audio.Audio;
import snow.types.Types;

import snow.Log.log;
import snow.Log._debug;
import snow.Log._verbose;
import snow.Log._verboser;

#if snow_web

class Sound extends snow.platform.web.audio.Sound {

    public function new( _manager:Audio, _name:String ) {

        super(_manager, _name);

    } //new

    override function set_info( _info:AudioInfo ) {

            //if preexisting,
        if(info != null) {
            destroy();
        }

            //flag as done for gc
        info = null;

                //now
            if(_info == null) {
                log("not creating sound, info was null");
                return info;
            }

            //store the new sound
        info = _info;
        loaded = true;

            //handle listeners
        emit('load');

            _debug('creating sound / ${name} / ${info.id} / ${info.format}');

        return info;

    } //set_info


    var pan_dirty : Bool = false;
    var volume_dirty : Bool = false;

    override function set_pan(_pan:Float) : Float {

            pan_dirty = true;

        return pan = _pan;

    } //set_pan

    override function set_volume(_volume:Float) : Float {

            volume_dirty = true;

        return volume = _volume;

    } //set_volume


    override function set_pitch( _pitch:Float ) : Float {

        untyped this.info.handle._rate = _pitch;

        return pitch = _pitch;

    } //set_pitch

    override function set_position( _position:Float ) : Float {

        if(info != null && info.handle != null) {
            info.handle.pos(_position);
        }

        return position = _position;

    } //set_position

    override function get_position() : Float {

        if(info != null && info.handle != null) {
            return info.handle.pos();
        } //has info

        return position;
    } //get_position

        //will return 0 if the info is not set yet i.e loading
    override function get_duration() : Float {

        if(info != null && info.handle != null) {
            return untyped this.info.handle._duration;
        } //has info

        return 0;

    } //get_duration

        /** Play this sound */
    override public function play() {


        if(info != null && info.handle != null) {

            playing = true;

            info.handle.loop(false);
            info.handle.play();
                //weird thing, howler won't set
                //the pan because it can't find an active sound,
                //so we simply set it immediate after playing if it changed
            if(pan_dirty) {
                info.handle.pos3d(pan);
            }

            if(volume_dirty) {
                info.handle.volume(volume);
            }

        }  //has info

    } //play

        /** Loop this sound */
    override public function loop() {

        if(info != null && info.handle != null) {

            playing = true;

            info.handle.loop(true);
            info.handle.play();

                //see note in play()
            if(pan_dirty) {
                info.handle.pos3d(pan);
            }
            if(volume_dirty) {
                info.handle.volume(volume);
            }

        } //has info

    } //loop

        /** Stop this sound */
    override public function stop() {

        playing = false;

        if(info != null && info.handle != null) {
            info.handle.stop();
        } //

    } //stop

        /** Pause this sound */
    override public function pause() {

        if(info != null && info.handle != null) {
            info.handle.pause();
        } //

    } //pause

        /** Destroy this sound and it's data */
    override public function destroy() {

        if(info != null && info.handle != null) {
            info.handle.unload();
        } //

        manager.kill(this);

    } //destroy

} //Sound

#end //snow_web