package snow.audio.howlerjs;

#if snow_web

    typedef Howl = snow.platform.web.audio.howlerjs.Howl;

#else

    #if !display
        #error "HowlerJS is only available on web browser platforms. Including this file on other platforms is not possible."
    #end

#end