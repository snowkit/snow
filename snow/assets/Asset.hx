package snow.assets;

import snow.assets.Assets;
import snow.types.Types;


/**  An asset base class. Get assets from the `app.assets` */
class Asset {


        /** The asset manager associated with this asset */
    public var assets : Assets;
        /** The id of this asset like `assets/image.png` */
    public var id : String;
        /** The `AssetInfo` of this asset */
    public var info : AssetInfo;
        /** The concrete type this asset holds (useful when handling as Asset base class) */
    public var type : AssetType;
        /** True if this asset has completely loaded. Only changed through `load` and when load completes */
    public var loaded : Bool = false;


        /** Called from subclasses, by `app.assets` */
    public function new( _assets:Assets, _info:AssetInfo ) {

        assets = _assets;
        info = _info;
        id = info.id;

    } //new


} //Asset