package snow.extension;

interface SnowExtension {
    public function onevent():Void;
}





// var list = snow.extension.Extension.list();
// for( ext in list ) {
//     trace('\tregister ext $ext');
//     var inst:snow.extension.SnowExtension = Type.createInstance( Type.resolveClass(ext), [] );
//     inst.onevent();
//     trace(inst);
// }
