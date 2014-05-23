package lumen.utils;


//Platform defines


#if lumen_html5
    typedef Int32Array = lumen.platform.html5.utils.Int32Array;
#else
    typedef Int32Array = lumen.platform.native.utils.Int32Array;
#end
