package lumen.audio.system;

import lumen.audio.Audio;
import lumen.LumenTypes;

import lumen.audio.system.Sound;

//The base class for a streaming sound instance

class SoundStream extends Sound {

	public function new( _manager:Audio, _name:String, _audio_info : AudioInfo ) {
		super(_manager, _name, _audio_info);
	}

}