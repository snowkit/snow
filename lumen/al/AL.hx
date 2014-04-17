package lumen.al;

import lumen.utils.Libs;
import lumen.utils.Float32Array;
import lumen.utils.IMemoryRange;

class AL {

    public static var NONE : Int                                = 0;
    public static var FALSE : Int                               = 0;
    public static var TRUE : Int                                = 1;

    public static var SOURCE_RELATIVE : Int                     = 0x202;
    public static var CONE_INNER_ANGLE : Int                    = 0x1001;
    public static var CONE_OUTER_ANGLE : Int                    = 0x1002;
    public static var PITCH : Int                               = 0x1003;
    public static var POSITION : Int                            = 0x1004;
    public static var DIRECTION : Int                           = 0x1005;
    public static var VELOCITY : Int                            = 0x1006;
    public static var LOOPING : Int                             = 0x1007;
    public static var BUFFER : Int                              = 0x1009;
    public static var GAIN : Int                                = 0x100A;
    public static var MIN_GAIN : Int                            = 0x100D;
    public static var MAX_GAIN : Int                            = 0x100E;
    public static var ORIENTATION : Int                         = 0x100F;
    public static var SOURCE_STATE : Int                        = 0x1010;
    public static var INITIAL : Int                             = 0x1011;
    public static var PLAYING : Int                             = 0x1012;
    public static var PAUSED : Int                              = 0x1013;
    public static var STOPPED : Int                             = 0x1014;
    public static var BUFFERS_QUEUED : Int                      = 0x1015;
    public static var BUFFERS_PROCESSED : Int                   = 0x1016;
    public static var REFERENCE_DISTANCE : Int                  = 0x1020;
    public static var ROLLOFF_FACTOR : Int                      = 0x1021;
    public static var CONE_OUTER_GAIN : Int                     = 0x1022;
    public static var MAX_DISTANCE : Int                        = 0x1023;
    public static var SEC_OFFSET : Int                          = 0x1024;
    public static var SAMPLE_OFFSET : Int                       = 0x1025;
    public static var BYTE_OFFSET : Int                         = 0x1026;
    public static var SOURCE_TYPE : Int                         = 0x1027;
    public static var STATIC : Int                              = 0x1028;
    public static var STREAMING : Int                           = 0x1029;
    public static var UNDETERMINED : Int                        = 0x1030;
    public static var FORMAT_MONO8 : Int                        = 0x1100;
    public static var FORMAT_MONO16 : Int                       = 0x1101;
    public static var FORMAT_STEREO8 : Int                      = 0x1102;
    public static var FORMAT_STEREO16 : Int                     = 0x1103;
    public static var FREQUENCY : Int                           = 0x2001;
    public static var BITS : Int                                = 0x2002;
    public static var CHANNELS : Int                            = 0x2003;
    public static var SIZE : Int                                = 0x2004;
    public static var NO_ERROR : Int                            = 0;
    public static var INVALID_NAME : Int                        = 0xA001;
    public static var INVALID_ENUM : Int                        = 0xA002;
    public static var INVALID_VALUE : Int                       = 0xA003;
    public static var INVALID_OPERATION : Int                   = 0xA004;
    public static var OUT_OF_MEMORY : Int                       = 0xA005;
    public static var VENDOR : Int                              = 0xB001;
    public static var VERSION : Int                             = 0xB002;
    public static var RENDERER : Int                            = 0xB003;
    public static var EXTENSIONS : Int                          = 0xB004;


    public static var AL_DOPPLER_FACTOR:Int                     = 0xC000;
    public static var SPEED_OF_SOUND:Int                        = 0xC003;
    public static var DOPPLER_VELOCITY:Int                      = 0xC001;

    public static function alDopplerFactor(value:Float) : Void {
        alhx_DopplerFactor(value);
    }
    
    public static function alDopplerVelocity(value:Float) : Void {
        alhx_DopplerVelocity(value);
    }

    public static function alSpeedOfSound(value:Float) : Void {
        alhx_SpeedOfSound(value);
    }

    public static var DISTANCE_MODEL:Int                        = 0xD000;
    public static var INVERSE_DISTANCE:Int                      = 0xD001;
    public static var INVERSE_DISTANCE_CLAMPED:Int              = 0xD002;
    public static var LINEAR_DISTANCE:Int                       = 0xD003;
    public static var LINEAR_DISTANCE_CLAMPED:Int               = 0xD004;
    public static var EXPONENT_DISTANCE:Int                     = 0xD005;
    public static var EXPONENT_DISTANCE_CLAMPED:Int             = 0xD006;

//

    public static function alDistanceModel(distanceModel:Int) : Void {
        alhx_DistanceModel(distanceModel);
    }

    public static function alEnable(capability:Int) : Void {
        alhx_Enable(capability);
    }

    public static function alDisable(capability:Int) : Void {
        alhx_Disable(capability);
    }

    public static function alIsEnabled(capability:Int) : Bool {
        return alhx_IsEnabled(capability);
    }

    public static function alGetString(param:Int) : String {
        return alhx_GetString(param);
    }

    public static function alGetBooleanv(param:Int) : Array<Bool> {
        return alhx_GetBooleanv(param);
    }

    public static function alGetIntegerv(param:Int) : Array<Int> {
        return alhx_GetIntegerv(param);
    }

    public static function alGetFloatv(param:Int) : Array<Float> {
        return alhx_GetFloatv(param);
    }

    public static function alGetDoublev(param:Int) : Array<Float> {
        return alhx_GetDoublev(param);
    }

    public static function alGetBoolean(param:Int) : Bool {
        return alhx_GetBoolean(param);
    }

    public static function alGetInteger(param:Int) : Int {
        return alhx_GetInteger(param);
    }

    public static function alGetFloat(param:Int) : Float {
        return alhx_GetFloat(param);
    }

    public static function alGetDouble(param:Int) : Float {
        return alhx_GetDouble(param);
    }

//

//
    public static function alGetError() : Int {
        return alhx_GetError();
    }

    public static function alIsExtensionPresent(extname:String) : Bool {
        return alhx_IsExtensionPresent(extname);
    }

        // :warn: not sure yet 
    public static function alGetProcAddress(fname:String) : Dynamic {
        return null;
    }

    public static function alGetEnumValue(ename:String) : Int {
        return alhx_GetEnumValue(ename);
    }


//
    public static function alListenerf(param:Int, value:Float) : Void {
        alhx_Listenerf(param, value);
    }

    public static function alListener3f(param:Int, value1:Float, value2:Float, value3:Float) : Void {
        alhx_Listener3f(param, value1, value2, value3);
    }

    public static function alListenerfv(param:Int, values:Array<Float> ) : Void {
        alhx_Listenerfv(param, values);
    }

    public static function alListeneri(param:Int, value:Int) : Void {
        alhx_Listeneri(param, value);
    }

    public static function alListener3i(param:Int, value1:Int, value2:Int, value3:Int) : Void {
        alhx_Listener3i(param, value1, value2, value3);
    }

    public static function alListeneriv(param:Int, values:Array<Int> ) : Void {
        alhx_Listeneriv(param, values);
    }

//
    public static function alGetListenerf(param:Int) : Float {
        return alhx_GetListenerf(param);
    }

    public static function alGetListener3f(param:Int) : Array<Float> {
        return alhx_GetListener3f(param);
    }

    public static function alGetListenerfv(param:Int) : Array<Float> {
        return alhx_GetListenerfv(param);
    }

    public static function alGetListeneri(param:Int) : Int {
        return alhx_GetListeneri(param);
    }

    public static function alGetListener3i(param:Int) : Array<Int> {
        return alhx_GetListener3i(param);
    }

    public static function alGetListeneriv(param:Int) : Array<Int> {
        return alhx_GetListeneriv(param);
    }

//
    public static function alGenSources(n:Int) : Array<Int> {
        return alhx_GenSources(n);
    }

    public static function alDeleteSources(n:Int, sources:Array<Int>) : Void {
        alhx_DeleteSources(n, sources);
    }

    public static function alIsSource(source:Int) : Bool {
        return alhx_IsSource(source);
    }

//
    public static function alSourcef(source:Int, param:Int, value:Float) : Void {
        alhx_Sourcef(source, param, value);
    }

    public static function alSource3f(source:Int, param:Int, value1:Float, value2:Float, value3:Float) : Void {
        alhx_Source3f(source, param, value1, value2, value3);
    }

    public static function alSourcefv(source:Int, param:Int, values:Array<Float> ) : Void {
        alhx_Sourcefv(source, param, values);
    }

    public static function alSourcei(source:Int, param:Int, value:Int) : Void {
        alhx_Sourcei(source, param, value);
    }

    public static function alSource3i(source:Int, param:Int, value1:Int, value2:Int, value3:Int) : Void {
        alhx_Source3i(source, param, value1, value2, value3);
    }

    public static function alSourceiv(source:Int, param:Int, values:Array<Int> ) : Void {
        alhx_Sourceiv(source, param, values);
    }

//
    public static function alGetSourcef(source:Int, param:Int) : Float {
        return alhx_GetSourcef(source,param);
    }

    public static function alGetSource3f(source:Int, param:Int) : Array<Float> {
        return alhx_GetSource3f(source,param);
    }

    public static function alGetSourcefv(source:Int, param:Int) : Array<Float> {
        return alhx_GetSourcefv(source,param);
    }

    public static function alGetSourcei(source:Int,  param:Int) : Int {
        return alhx_GetSourcei(source,param);
    }

    public static function alGetSource3i(source:Int, param:Int) : Array<Int> {
        return alhx_GetSource3i(source,param);
    }

    public static function alGetSourceiv(source:Int,  param:Int) : Array<Int> {
        return alhx_GetSourceiv(source,param);
    }


//
    public static function alSourcePlayv(n:Int, sources:Array<Int>) : Void {
        alhx_SourcePlayv(n, sources);
    }

    public static function alSourceStopv(n:Int, sources:Array<Int>) : Void {
        alhx_SourceStopv(n, sources);
    }

    public static function alSourceRewindv(n:Int, sources:Array<Int>) : Void {
        alhx_SourceRewindv(n, sources);
    }

    public static function alSourcePausev(n:Int, sources:Array<Int>) : Void {
        alhx_SourcePausev(n, sources);
    }


//
    public static function alSourcePlay(source:Int) : Void {
        alhx_SourcePlay(source);
    }

    public static function alSourceStop(source:Int) : Void {
        alhx_SourceStop(source);
    }

    public static function alSourceRewind(source:Int) : Void {
        alhx_SourceRewind(source);
    }

    public static function alSourcePause(source:Int) : Void {
        alhx_SourcePause(source);
    }


    public static function alSourceQueueBuffers(source:Int, nb:Int, buffers:Array<Int> ) : Void {
        alhx_SourceQueueBuffers(source, nb, buffers);
    }

    public static function alSourceUnqueueBuffers(source:Int, nb:Int, buffers:Array<Int> ) : Void {
        alhx_SourceUnqueueBuffers(source, nb, buffers);
    }

//
    public static function alGenBuffers(n:Int, buffers:Array<Int> ) : Void {
        alhx_GenBuffers(n, buffers);
    }

    public static function alDeleteBuffers(n:Int, buffers:Array<Int>) : Void {
        alhx_DeleteBuffers(n, buffers);
    }

    public static function alIsBuffer(buffer:Int) : Bool {
        return alhx_IsBuffer(buffer);
    }
//
    // public static function alBufferData(buffer:Int, format:Int, const ALvoid *data, size:Int, freq:Int) : Void;

    public static function alBufferf(buffer:Int, param:Int, value:Float) : Void {
        alhx_Buffer(buffer, param, value);
    }

    public static function alBuffer3f(buffer:Int, param:Int, value1:Float, value2:Float, value3:Float) : Void {
        alhx_Buffer3f(buffer, param, value1, value2, value3);
    }

    public static function alBufferfv(buffer:Int, param:Int, values:Array<Float> ) : Void {
        alhx_Bufferfv(buffer, param, values);
    }

    public static function alBufferi(buffer:Int, param:Int, value:Int) : Void {
        alhx_Bufferi(buffer, param, value);
    }

    public static function alBuffer3i(buffer:Int, param:Int, value1:Int, value2:Int, value3:Int) : Void {
        alhx_Buffer3i(buffer, param, value1, value2, value3);
    }

    public static function alBufferiv(buffer:Int, param:Int, values:Array<Int> ) : Void {
        alhx_Bufferiv(buffer, param, values);
    }


    public static function alGetBufferf(buffer:Int, param:Int) : Array<Float> {
        return alhx_GetBufferf(buffer, param);
    }

    public static function alGetBuffer3f(buffer:Int, param:Int) : Array<Float> {
        return alhx_GetBuffer3f(buffer, param);
    }

    public static function alGetBufferfv(buffer:Int, param:Int) : Array<Float> {
        return alhx_GetBufferfv(buffer, param);
    }

    public static function alGetBufferi(buffer:Int, param:Int) : Array<Int> {
        return alhx_GetBufferi(buffer, param);
    }

    public static function alGetBuffer3i(buffer:Int, param:Int) : Array<Int> {
        return alhx_GetBuffer3i(buffer, param);
    }

    public static function alGetBufferiv(buffer:Int, param:Int) : Array<Int> {
        return alhx_GetBufferiv(buffer, param);
    }

//

    public static var ALC_FALSE : Int = 0;
    public static var ALC_TRUE : Int = 1;
    public static var ALC_FREQUENCY : Int = 0x1007;
    public static var ALC_REFRESH : Int = 0x1008;
    public static var ALC_SYNC : Int = 0x1009;
    public static var ALC_MONO_SOURCES : Int = 0x1010;
    public static var ALC_STEREO_SOURCES : Int = 0x1011;
    public static var ALC_NO_ERROR : Int = 0;
    public static var ALC_INVALID_DEVICE : Int = 0xA001;
    public static var ALC_INVALID_CONTEXT : Int = 0xA002;
    public static var ALC_INVALID_ENUM : Int = 0xA003;
    public static var ALC_INVALID_VALUE : Int = 0xA004;
    public static var ALC_OUT_OF_MEMORY : Int = 0xA005;
    public static var ALC_ATTRIBUTES_SIZE : Int = 0x1002;
    public static var ALC_ALL_ATTRIBUTES : Int = 0x1003;
    public static var ALC_DEFAULT_DEVICE_SPECIFIER : Int = 0x1004;
    public static var ALC_DEVICE_SPECIFIER : Int = 0x1005;
    public static var ALC_EXTENSIONS : Int = 0x1006;

    public static var ALC_ENUMERATE_ALL_EXT : Int = 1;
    public static var ALC_DEFAULT_ALL_DEVICES_SPECIFIER : Int = 0x1012;
    public static var ALC_ALL_DEVICES_SPECIFIER : Int = 0x1013;

//
    public static function alcCreateContext(device:Dynamic, ?attrlist:Array<Int>) : Dynamic {
        return alhx_alcCreateContext(device, attrlist);
    }

    public static function alcMakeContextCurrent(context:Dynamic) : Bool {
        return alhx_alcMakeContextCurrent(context);
    }

    public static function alcProcessContext(context:Dynamic) : Void {
        alhx_alcProcessContext(context);
    }

    public static function alcSuspendContext(context:Dynamic) : Void {
        alhx_alcSuspendContext(context);
    }

    public static function alcDestroyContext(context:Dynamic) : Void {
        alhx_alcDestroyContext(context);
    }

    public static function alcGetCurrentContext() : Dynamic {
        return alhx_alcGetCurrentContext();
    }

    public static function alcGetContextsDevice(context:Dynamic) : Dynamic {
        return alhx_alcGetContextsDevice(context);
    }

//
    public static function alcOpenDevice(?devicename:String) : Dynamic {
        return alhx_alcOpenDevice(devicename);
    }

    public static function alcCloseDevice(device:Dynamic) : Bool {
        return alhx_alcCloseDevice(device);
    }

//
    public static function alcGetError(device:Dynamic) : Int {
        return alhx_alcGetError(device);
    }

    public static function alcGetString(device:Dynamic, param:Int) : String {
        return alhx_alcGetString(device, param);
    }

    public static function alcGetIntegerv(device:Dynamic, param:Int, size:Int) : Array<Int> {
        return alhx_alcGetIntegerv(device, param, size);
    }

//

    private static var alhx_alcCreateContext = Libs.load("lumen", "alhx_alcCreateContext", 2);
    private static var alhx_alcMakeContextCurrent = Libs.load("lumen", "alhx_alcMakeContextCurrent", 1);
    private static var alhx_alcProcessContext = Libs.load("lumen", "alhx_alcProcessContext", 1);
    private static var alhx_alcSuspendContext = Libs.load("lumen", "alhx_alcSuspendContext", 1);
    private static var alhx_alcDestroyContext = Libs.load("lumen", "alhx_alcDestroyContext", 1);
    private static var alhx_alcGetCurrentContext = Libs.load("lumen", "alhx_alcGetCurrentContext", 0);
    private static var alhx_alcGetContextsDevice = Libs.load("lumen", "alhx_alcGetContextsDevice", 1);

    private static var alhx_alcOpenDevice = Libs.load("lumen", "alhx_alcOpenDevice", 1);
    private static var alhx_alcCloseDevice = Libs.load("lumen", "alhx_alcCloseDevice", 1);

    private static var alhx_alcGetError = Libs.load("lumen", "alhx_alcGetError", 1);
    private static var alhx_alcGetString = Libs.load("lumen", "alhx_alcGetString", 2);
    private static var alhx_alcGetIntegerv = Libs.load("lumen", "alhx_alcGetIntegerv", 3);

//

    private static var alhx_DopplerFactor = Libs.load("lumen", "alhx_DopplerFactor", 1);
    private static var alhx_DopplerVelocity = Libs.load("lumen", "alhx_DopplerVelocity", 1);
    private static var alhx_SpeedOfSound = Libs.load("lumen", "alhx_SpeedOfSound", 1);

    private static var alhx_DistanceModel = Libs.load("lumen", "alhx_DistanceModel", 1);
    private static var alhx_Enable = Libs.load("lumen", "alhx_Enable", 1);
    private static var alhx_Disable = Libs.load("lumen", "alhx_Disable", 1);
    private static var alhx_IsEnabled = Libs.load("lumen", "alhx_IsEnabled", 1);
    private static var alhx_GetString = Libs.load("lumen", "alhx_GetString", 1);
    private static var alhx_GetBooleanv = Libs.load("lumen", "alhx_GetBooleanv", 1);
    private static var alhx_GetIntegerv = Libs.load("lumen", "alhx_GetIntegerv", 1);
    private static var alhx_GetFloatv = Libs.load("lumen", "alhx_GetFloatv", 1);
    private static var alhx_GetDoublev = Libs.load("lumen", "alhx_GetDoublev", 1);
    private static var alhx_GetBoolean = Libs.load("lumen", "alhx_GetBoolean", 1);
    private static var alhx_GetInteger = Libs.load("lumen", "alhx_GetInteger", 1);
    private static var alhx_GetFloat = Libs.load("lumen", "alhx_GetFloat", 1);
    private static var alhx_GetDouble = Libs.load("lumen", "alhx_GetDouble", 1);
    
    private static var alhx_GetError = Libs.load("lumen", "alhx_GetError", 0);
    private static var alhx_IsExtensionPresent = Libs.load("lumen", "alhx_IsExtensionPresent", 1);
    private static var alhx_GetProcAddress = Libs.load("lumen", "alhx_GetProcAddress", 1);
    private static var alhx_GetEnumValue = Libs.load("lumen", "alhx_GetEnumValue", 1);

    private static var alhx_Listenerf = Libs.load("lumen", "alhx_Listenerf", 2);
    private static var alhx_Listener3f = Libs.load("lumen", "alhx_Listener3f", 4);
    private static var alhx_Listenerfv = Libs.load("lumen", "alhx_Listenerfv", 2);
    private static var alhx_Listeneri = Libs.load("lumen", "alhx_Listeneri", 2);
    private static var alhx_Listener3i = Libs.load("lumen", "alhx_Listener3i", 4);
    private static var alhx_Listeneriv = Libs.load("lumen", "alhx_Listeneriv", 2);

    private static var alhx_GetListenerf = Libs.load("lumen", "alhx_GetListenerf", 1);
    private static var alhx_GetListener3f = Libs.load("lumen", "alhx_GetListener3f", 1);
    private static var alhx_GetListenerfv = Libs.load("lumen", "alhx_GetListenerfv", 1);
    private static var alhx_GetListeneri = Libs.load("lumen", "alhx_GetListeneri", 1);
    private static var alhx_GetListener3i = Libs.load("lumen", "alhx_GetListener3i", 1);
    private static var alhx_GetListeneriv = Libs.load("lumen", "alhx_GetListeneriv", 1);

    private static var alhx_GenSources = Libs.load("lumen", "alhx_GenSources", 1);
    private static var alhx_DeleteSources = Libs.load("lumen", "alhx_DeleteSources", 2);
    private static var alhx_IsSource = Libs.load("lumen", "alhx_IsSource", 1);

    private static var alhx_Sourcef = Libs.load("lumen", "alhx_Sourcef", 3);
    private static var alhx_Source3f = Libs.load("lumen", "alhx_Source3f", 5);
    private static var alhx_Sourcefv = Libs.load("lumen", "alhx_Sourcefv", 3);
    private static var alhx_Sourcei = Libs.load("lumen", "alhx_Sourcei", 3);
    private static var alhx_Source3i = Libs.load("lumen", "alhx_Source3i", 5);
    private static var alhx_Sourceiv = Libs.load("lumen", "alhx_Sourceiv", 3);

    private static var alhx_GetSourcef = Libs.load("lumen", "alhx_GetSourcef", 2);
    private static var alhx_GetSource3f = Libs.load("lumen", "alhx_GetSource3f", 2);
    private static var alhx_GetSourcefv = Libs.load("lumen", "alhx_GetSourcefv", 2);
    private static var alhx_GetSourcei = Libs.load("lumen", "alhx_GetSourcei", 2);
    private static var alhx_GetSource3i = Libs.load("lumen", "alhx_GetSource3i", 2);
    private static var alhx_GetSourceiv = Libs.load("lumen", "alhx_GetSourceiv", 2);

    private static var alhx_SourcePlayv = Libs.load("lumen", "alhx_SourcePlayv", 2);
    private static var alhx_SourceStopv = Libs.load("lumen", "alhx_SourceStopv", 2);
    private static var alhx_SourceRewindv = Libs.load("lumen", "alhx_SourceRewindv", 2);
    private static var alhx_SourcePausev = Libs.load("lumen", "alhx_SourcePausev", 2);

    private static var alhx_SourceQueueBuffers = Libs.load("lumen", "alhx_SourceQueueBuffers", 3);
    private static var alhx_SourceUnqueueBuffers = Libs.load("lumen", "alhx_SourceUnqueueBuffers", 3);

    private static var alhx_SourcePlay = Libs.load("lumen", "alhx_SourcePlay", 1);
    private static var alhx_SourceStop = Libs.load("lumen", "alhx_SourceStop", 1);
    private static var alhx_SourceRewind = Libs.load("lumen", "alhx_SourceRewind", 1);
    private static var alhx_SourcePause = Libs.load("lumen", "alhx_SourcePause", 1);

    private static var alhx_GenBuffers = Libs.load("lumen", "alhx_GenBuffers", 2);
    private static var alhx_DeleteBuffers = Libs.load("lumen", "alhx_DeleteBuffers", 2);
    private static var alhx_IsBuffer = Libs.load("lumen", "alhx_IsBuffer", 1);

    private static var alhx_Bufferf = Libs.load("lumen", "alhx_Bufferf", 3);
    private static var alhx_Buffer3f = Libs.load("lumen", "alhx_Buffer3f", 5);
    private static var alhx_Bufferfv = Libs.load("lumen", "alhx_Bufferfv", 3);
    private static var alhx_Bufferi = Libs.load("lumen", "alhx_Bufferi", 3);
    private static var alhx_Buffer3i = Libs.load("lumen", "alhx_Buffer3i", 5);
    private static var alhx_Bufferiv = Libs.load("lumen", "alhx_Bufferiv", 3);

    private static var alhx_GetBufferf = Libs.load("lumen", "alhx_GetBufferf", 2);
    private static var alhx_GetBuffer3f = Libs.load("lumen", "alhx_GetBuffer3f", 2);
    private static var alhx_GetBufferfv = Libs.load("lumen", "alhx_GetBufferfv", 2);
    private static var alhx_GetBufferi = Libs.load("lumen", "alhx_GetBufferi", 2);
    private static var alhx_GetBuffer3i = Libs.load("lumen", "alhx_GetBuffer3i", 2);
    private static var alhx_GetBufferiv = Libs.load("lumen", "alhx_GetBufferiv", 2);

} //AL
