package snow.utils;


//Platform defines


#if snow_html5
    typedef UInt16Array = snow.platform.html5.utils.UInt16Array;
#else
    typedef UInt16Array = snow.platform.native.utils.UInt16Array;
#end
