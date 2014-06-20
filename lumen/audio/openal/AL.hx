package lumen.audio.openal;

#if lumen_html5

    //OpenAL doesn't exist on html5 platforms so, this should throw a compiler error even attempting to include this

#else

    typedef AL = lumen.platform.native.audio.openal.AL;
    typedef ALC = lumen.platform.native.audio.openal.AL.ALC;
    typedef Device = lumen.platform.native.audio.openal.AL.Device;
    typedef Context = lumen.platform.native.audio.openal.AL.Context;

#end