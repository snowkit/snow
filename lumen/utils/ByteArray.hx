package lumen.utils;


//Platform defines


#if lumen_html5
   	typedef ByteArray = lumen.platform.html5.utils.ByteArray;
#else
   	typedef ByteArray = lumen.platform.native.utils.ByteArray;
#end
