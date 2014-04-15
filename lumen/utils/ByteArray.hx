package lumen.utils;

#if lumen_html5
   typedef ByteArray = lumen.utils.html5.ByteArray;
#else
   typedef ByteArray = lumen.utils.native.ByteArray;
#end //lumen_html5
