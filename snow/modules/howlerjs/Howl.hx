package snow.modules.howlerjs;

@:native("window.Howl")
extern class Howl {
	function new(options:HowlOptions):Void;

	function load():Howl;

	@:overload(function(urls:Array<String>):Howl {})
	function urls(urls:Array<String>):Array<String>;

	function play(?sprite:String, ?callBack:String -> Void):Howl;

	function pause(?id:String):Howl;

	function stop(?id:String):Howl;

	function mute(?id:String):Howl;

	function unmute(?id:String):Howl;

	@:overload(function(vol:Float, ?id:String):Howl {})
	function volume(?vol:Float, ?id:String):Float;

	@:overload(function(loop:Bool):Howl {})
	function loop(?loop:Bool):Bool;

	@:overload(function(sprite:SpriteParams):Howl {})
	function sprite(sprite:SpriteParams):Dynamic;

	@:overload(function(pos:Float, ?id:String):Howl {})
	function pos(?pos:Float, ?id:String):Float;

	@:overload(function(x:Float, y:Float, z:Float, ?id:String):Howl {})
	function pos3d(?x:Float, ?y:Float, ?z:Float, ?id:String):Array<Float>;

	function fade(f:Float, t:Float, len:Float, ?callBack:Void -> Void, ?id:String):Howl;

	function fadeIn(t:Float, len:Float, callBack:Void -> Void):Howl; // deprecated

	function fadeOut(t:Float, len:Float, callBack:Void -> Void, ?id:String):Howl; // deprecated

	function on(event:String, ?fn:Void -> Void):Howl;

	function off(event:String, ?fn:Void -> Void):Howl;

	function unload():Void;

	// Web Audio only
	function decodeAudioData(arraybuffer:js.html.ArrayBuffer, obj:Howl, url:String):String;

	function loadBuffer(obj:Howl, url:String):String;

	function loadSound(obj:Howl, buffer:js.html.audio.AudioBuffer):String;

	function refreshBuffer(obj:Howl, loop:Array<RefreshBufferLoopParams>, ?id:String):Void;
}

typedef RefreshBufferLoopParams = {
	var loop:Bool;
	var pos:Float;
	var duration:Float;
}

typedef SpriteParams = {
	var offset:Int;
	var duration:Int;
	@:optional var loop:Bool;
}

typedef HowlOptions = {
	@:optional var autoplay:Bool;
	@:optional var buffer:Bool;
	@:optional var duration:Float;
	@:optional var format:String;
	@:optional var loop:Bool;
	@:optional var sprite:Dynamic;
	@:optional var src:String;
	@:optional var pos3d:Array<Float>;
	@:optional var volume:Float;
	@:optional var urls:Array<String>;
	@:optional var rate:Float;

	// allow forcing of a specific panningModel ('equalpower' or 'HRTF'),
	// if none is specified, defaults to 'equalpower' and switches to 'HRTF'
	// if 3d sound is used
	@:optional var model:String;

	@:optional var onload:Void -> Void;
	@:optional var onloaderror:Void -> Void;
	@:optional var onend:Void -> Void;
	@:optional var onpause:Void -> Void;
	@:optional var onplay:Void -> Void;
}