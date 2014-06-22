package snow.utils;


//Platform defines


#if snow_html5
    typedef Int16Array = snow.platform.html5.utils.Int16Array;
#else
    typedef Int16Array = snow.platform.native.utils.Int16Array;
#end
