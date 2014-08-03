package snow.utils;


//Platform defines


#if snow_web
   	typedef ArrayBuffer = snow.platform.web.utils.ArrayBuffer;
#else
   	typedef ArrayBuffer = snow.platform.native.utils.ArrayBuffer;
#end
