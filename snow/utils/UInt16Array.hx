package snow.utils;


//Platform defines


#if snow_web
    typedef UInt16Array = snow.platform.web.utils.UInt16Array;
#else
    typedef UInt16Array = snow.platform.native.utils.UInt16Array;
#end
