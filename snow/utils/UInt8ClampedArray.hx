package snow.utils;


//Platform defines


#if snow_web
    typedef UIntClamped8Array = snow.platform.web.utils.UInt8ClampedArray;
#else
    typedef UIntClamped8Array = snow.platform.native.utils.UInt8ClampedArray;
#end
