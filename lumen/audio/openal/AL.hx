package lumen.audio.openal;

#if lumen_html5

    #error "OpenAL is not available on html5 browser platforms. Including this file on that platform is not possible."

#else

    typedef AL = lumen.platform.native.audio.openal.AL;
    typedef ALC = lumen.platform.native.audio.openal.AL.ALC;
    typedef Device = lumen.platform.native.audio.openal.AL.Device;
    typedef Context = lumen.platform.native.audio.openal.AL.Context;

#end