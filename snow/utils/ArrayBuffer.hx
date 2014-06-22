package snow.utils;


//Platform defines


#if snow_html5
   	typedef ArrayBuffer = snow.platform.html5.utils.ArrayBuffer;
#else
   	typedef ArrayBuffer = snow.platform.native.utils.ArrayBuffer;
#end
