package lumen.utils;


//Platform defines


#if lumen_html5
    typedef ArrayBufferView = lumen.platform.html5.utils.ArrayBufferView;
#else
    typedef ArrayBufferView = lumen.platform.native.utils.ArrayBufferView;
#end