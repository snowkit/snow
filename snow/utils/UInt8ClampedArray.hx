package snow.utils;


//Platform defines


#if snow_web
    typedef UInt8ClampedArray = snow.platform.web.utils.UInt8ClampedArray;
#else
    typedef UInt8ClampedArray = snow.platform.native.utils.UInt8ClampedArray;
#end
