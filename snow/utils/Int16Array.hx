package snow.utils;


//Platform defines


#if snow_web
    typedef Int16Array = snow.platform.web.utils.Int16Array;
#else
    typedef Int16Array = snow.platform.native.utils.Int16Array;
#end
