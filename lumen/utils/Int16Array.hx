package lumen.utils;


//Platform defines


#if lumen_html5
    typedef Int16Array = lumen.platform.html5.utils.Int16Array;
#else
    typedef Int16Array = lumen.platform.native.utils.Int16Array;
#end
