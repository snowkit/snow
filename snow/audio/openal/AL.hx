package snow.audio.openal;

#if snow_web

    #error "OpenAL is not available on web browser platforms. Including this file on that platform is not possible."

#else

    typedef AL = snow.platform.native.audio.openal.AL;
    typedef ALC = snow.platform.native.audio.openal.AL.ALC;
    typedef Device = snow.platform.native.audio.openal.AL.Device;
    typedef Context = snow.platform.native.audio.openal.AL.Context;

#end