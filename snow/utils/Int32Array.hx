package snow.utils;


//Platform defines


#if snow_html5
    typedef Int32Array = snow.platform.html5.utils.Int32Array;
#else
    typedef Int32Array = snow.platform.native.utils.Int32Array;
#end
