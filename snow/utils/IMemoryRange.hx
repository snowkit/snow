package snow.utils;


import snow.utils.ByteArray;


interface IMemoryRange {


    public function getByteBuffer ():ByteArray;
    public function getStart ():Int;
    public function getLength ():Int;


} //IMemoryRange