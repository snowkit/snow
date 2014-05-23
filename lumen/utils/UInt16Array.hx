package lumen.utils;


//Platform defines


#if lumen_html5
    typedef UInt16Array = lumen.platform.html5.utils.UInt16Array;
#else
    typedef UInt16Array = lumen.platform.native.utils.UInt16Array;
#end
