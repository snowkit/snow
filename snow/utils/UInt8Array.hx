package snow.utils;


//Platform defines


#if snow_html5
    typedef UInt8Array = snow.platform.html5.utils.UInt8Array;
#else
    typedef UInt8Array = snow.platform.native.utils.UInt8Array;
#end
