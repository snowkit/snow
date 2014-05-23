package lumen.utils;


//Platform defines


#if lumen_html5
   	typedef ArrayBuffer = lumen.platform.html5.utils.ArrayBuffer;
#else
   	typedef ArrayBuffer = lumen.platform.native.utils.ArrayBuffer;
#end
