package snow.utils;


//Platform defines


#if snow_html5
   	typedef ByteArray = snow.platform.html5.utils.ByteArray;
#else
   	typedef ByteArray = snow.platform.native.utils.ByteArray;
#end
