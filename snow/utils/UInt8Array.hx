package snow.utils;


//Platform defines


#if snow_web
    typedef UInt8Array = snow.platform.web.utils.UInt8Array;
#else
    typedef UInt8Array = snow.platform.native.utils.UInt8Array;
#end
