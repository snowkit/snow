package snow.utils;


//Platform defines


#if snow_html5
    typedef Int8Array = snow.platform.html5.utils.Int8Array;
#else
    typedef Int8Array = snow.platform.native.utils.Int8Array;
#end
