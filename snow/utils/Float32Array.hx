package snow.utils;


//Platform defines


#if snow_web
    typedef Float32Array = snow.platform.web.utils.Float32Array;
#else
    typedef Float32Array = snow.platform.native.utils.Float32Array;
#end
