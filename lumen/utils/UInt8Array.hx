package lumen.utils;


//Platform defines


#if lumen_html5
    typedef UInt8Array = lumen.platform.html5.utils.UInt8Array;
#else
    typedef UInt8Array = lumen.platform.native.utils.UInt8Array;
#end
