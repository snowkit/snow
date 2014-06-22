package snow.utils;


//Platform defines


#if snow_html5
    typedef Float32Array = snow.platform.html5.utils.Float32Array;
#else
    typedef Float32Array = snow.platform.native.utils.Float32Array;
#end
