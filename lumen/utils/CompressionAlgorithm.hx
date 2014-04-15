package lumen.utils;
#if (lumen_native || lumen_html5)
// #if (cpp || neko)

enum CompressionAlgorithm {
    DEFLATE;
    ZLIB;
    LZMA;
    GZIP;
} 

#else
typedef CompressionAlgorithm = flash.utils.CompressionAlgorithm;
#end