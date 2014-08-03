package snow.utils;


//Platform defines


#if snow_web
   	typedef ByteArray = snow.platform.web.utils.ByteArray;
#else
   	typedef ByteArray = snow.platform.native.utils.ByteArray;
#end
