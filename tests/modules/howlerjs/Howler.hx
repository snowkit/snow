package snow.modules.howlerjs;

@:native("window.Howler")
extern class Howler {
	static var ctx:js.html.audio.AudioContext;
	static var usingWebAudio:Bool;

	static function codecs(ext:String):Bool;

	@:overload(function(vol:Float):Howler {})
	static function volume(vol:Float):Float;

	static function mute():Howler;

	static function unmute():Howler;
}