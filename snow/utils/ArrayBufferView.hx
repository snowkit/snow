package snow.utils;


//Platform defines


#if snow_html5
    typedef ArrayBufferView = snow.platform.html5.utils.ArrayBufferView;
#else
    typedef ArrayBufferView = snow.platform.native.utils.ArrayBufferView;
#end