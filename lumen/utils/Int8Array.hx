package lumen.utils;


//Platform defines


#if lumen_html5
    typedef Int8Array = lumen.platform.html5.utils.Int8Array;
#else
    typedef Int8Array = lumen.platform.native.utils.Int8Array;
#end
