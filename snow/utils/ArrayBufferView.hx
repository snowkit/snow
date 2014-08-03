package snow.utils;


//Platform defines


#if snow_web
    typedef ArrayBufferView = snow.platform.web.utils.ArrayBufferView;
#else
    typedef ArrayBufferView = snow.platform.native.utils.ArrayBufferView;
#end