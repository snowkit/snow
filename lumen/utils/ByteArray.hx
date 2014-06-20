package lumen.utils;


//Platform defines


#if lumen_html5
   	typedef ByteArray = lumen.platform.html5.utils.ByteArray;
#else
   	typedef ByteArray = lumen.platform.native.utils.ByteArray;
#end

//Helpers

@:noCompletion class Endian {

    public static inline var BIG_ENDIAN : String = "bigEndian";
    public static inline var LITTLE_ENDIAN : String = "littleEndian";

}