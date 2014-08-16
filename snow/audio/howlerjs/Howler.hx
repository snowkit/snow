package snow.audio.howlerjs;

#if snow_web

    typedef Howler = snow.platform.web.audio.howlerjs.Howler;

#else

    #error "HowlerJS is only available on web browser platforms. Including this file on other platforms is not possible."

#end