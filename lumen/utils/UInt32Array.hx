package lumen.utils;


//Platform defines


#if lumen_html5
    typedef UInt32Array = lumen.platform.html5.utils.UInt32Array;
#else
    typedef UInt32Array = lumen.platform.native.utils.UInt32Array;
#end
