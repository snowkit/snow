package snow.utils;


//Platform defines


#if snow_web
    typedef Int8Array = snow.platform.web.utils.Int8Array;
#else
    typedef Int8Array = snow.platform.native.utils.Int8Array;
#end
