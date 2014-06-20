

//Starting implementation of direct native OpenAL bindings


//To test, currently the using class (like Sound.hx) needs this by the class definition
// @:buildXml('
//    <files id="haxe">,
//         <compilerflag value="-I${haxelib:lumen}/project/include/"/>
//    </files>
//    <target id="haxe">
//         <vflag name="-framework" value="OpenAL" if="mac || iphone" />
//    </target>
// ')


@:include("audio/openal/lumen_openal.h")
extern class ALN {

// scene configs

    @:native("alDopplerFactor")
    public static function dopplerFactor(value:Float) : Void;

    @:native("alDopplerVelocity")
    public static function dopplerVelocity(value:Float) : Void;

    @:native("alSpeedOfSound")
    public static function speedOfSound(value:Float) : Void;

    @:native("alDistanceModel")
    public static function distanceModel(distanceModel:Int) : Void;

// scene management

    @:native("alEnable")
    public static function enable(capability:Int) : Void;

    @:native("alDisable")
    public static function disable(capability:Int) : Void;

    @:native("alIsEnabled")
    public static function isEnabled(capability:Int) : Bool;

// scene state

    @:native('alGetString')
    public static function getString(param:Int) : String;

    @:native('alGetBooleanv')
    public static function getBooleanv(param:Int, ?count:Int = 1 ) : Array<Bool>;

    @:native('alGetIntegerv')
    public static function getIntegerv(param:Int, ?count:Int = 1 ) : Array<Int>;

    @:native('alGetFloatv')
    public static function getFloatv(param:Int, ?count:Int = 1 ) : Array<Float>;

    @:native('alGetDoublev')
    public static function getDoublev(param:Int, ?count:Int = 1 ) : Array<Float>;

    @:native('alGetBoolean')
    public static function getBoolean(param:Int) : Bool;

    @:native('alGetInteger')
    public static function getInteger(param:Int) : Int;

    @:native('alGetFloat')
    public static function getFloat(param:Int) : Float;

    @:native('alGetDouble')
    public static function getDouble(param:Int) : Float;

    @:native('alGetError')
    public static function getError() : Int;

// extensions

    @:native('alIsExtensionPresent')
    public static function isExtensionPresent(extname:String) : Bool;

    @:native('alGetEnumValue')
    public static function getEnumValue(ename:String) : Int;

        // :warn: not sure yet
    public static function getProcAddress(fname:String) : Dynamic {
        return null;
    }

// source state

    @:native('alSourcef')
    public static function sourcef(source:Int, param:Int, value:Float) : Void;

    @:native('alSource3f')
    public static function source3f(source:Int, param:Int, value1:Float, value2:Float, value3:Float) : Void;

    @:native('alSourcefv')
    public static function sourcefv(source:Int, param:Int, values:Array<Float> ) : Void;

    @:native('alSourcei')
    public static function sourcei(source:Int, param:Int, value:Int) : Void;

    @:native('alSource3i')
    public static function source3i(source:Int, param:Int, value1:Int, value2:Int, value3:Int) : Void;

    @:native('alSourceiv')
    public static function sourceiv(source:Int, param:Int, values:Array<Int> ) : Void;

    @:native('alGetSourcef')
    public static function getSourcef(source:Int, param:Int) : Float;

    @:native('alGetSource3f')
    public static function getSource3f(source:Int, param:Int) : Array<Float>;

    @:native('alGetSourcefv')
    public static function getSourcefv(source:Int, param:Int) : Array<Float>;

    @:native('alGetSourcei')
    public static function getSourcei(source:Int,  param:Int) : Int;

    @:native('alGetSource3i')
    public static function getSource3i(source:Int, param:Int) : Array<Int>;

    @:native('alGetSourceiv')
    public static function getSourceiv(source:Int,  param:Int, ?count:Int = 1) : Array<Int>;

//source states

    @:native('alSourcePlayv')
    public static function sourcePlayv(sources:Array<Int>) : Void;

    @:native('alSourceStopv')
    public static function sourceStopv(sources:Array<Int>) : Void;

    @:native('alSourceRewindv')
    public static function sourceRewindv(sources:Array<Int>) : Void;

    @:native('alSourcePausev')
    public static function sourcePausev(sources:Array<Int>) : Void;

    @:native('alSourcePlay')
    public static function sourcePlay(source:Int) : Void;

    @:native('alSourceStop')
    public static function sourceStop(source:Int) : Void;

    @:native('alSourceRewind')
    public static function sourceRewind(source:Int) : Void;

    @:native('alSourcePause')
    public static function sourcePause(source:Int) : Void;

    @:native('alSourceQueueBuffers')
    public static function sourceQueueBuffers(source:Int, nb:Int, buffers:Array<Int> ) : Void;

    @:native('alSourceUnqueueBuffers')
    public static function sourceUnqueueBuffers(source:Int, nb:Int ) : Array<Int>;
}
