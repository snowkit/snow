package snow.utils;


//Platform defines


#if snow_web
    typedef Int32Array = snow.platform.web.utils.Int32Array;
#else
    typedef Int32Array = snow.platform.native.utils.Int32Array;
#end
