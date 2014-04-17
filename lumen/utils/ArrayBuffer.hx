package lumen.utils;

#if lumen_html5
   typedef ArrayBuffer = js.html.ArrayBuffer;
#else
   typedef ArrayBuffer = lumen.utils.ByteArray;
#end //lumen_html5
