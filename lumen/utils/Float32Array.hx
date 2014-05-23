package lumen.utils;


//Platform defines


#if lumen_html5
    typedef Float32Array = lumen.platform.html5.utils.Float32Array;
#else
    typedef Float32Array = lumen.platform.native.utils.Float32Array;
#end
