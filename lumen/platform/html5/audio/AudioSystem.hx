package lumen.platform.html5.audio;

import lumen.audio.Audio;
import lumen.audio.AudioSystem;
import lumen.types.Types;


@:noCompletion class AudioSystem extends AudioSystemBinding {
	
    public function new( _manager:Audio, _lib:Lumen ) {

        manager = _manager;
        lib = _lib;

    } //new

    override public function init() {

    } //init

    override public function update() {

    } //update

    override public function destroy() {

    } //destroy

    override public function suspend() {

    } //suspend

    override public function resume() {

    } //resume


} //AudioSystem
