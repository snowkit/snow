package snow.utils;


//Platform defines


#if snow_html5
    typedef UInt32Array = snow.platform.html5.utils.UInt32Array;
#else
    typedef UInt32Array = snow.platform.native.utils.UInt32Array;
#end
