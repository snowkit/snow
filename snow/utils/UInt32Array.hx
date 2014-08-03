package snow.utils;


//Platform defines


#if snow_web
    typedef UInt32Array = snow.platform.web.utils.UInt32Array;
#else
    typedef UInt32Array = snow.platform.native.utils.UInt32Array;
#end
