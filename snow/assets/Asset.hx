package snow.assets;

import snow.assets.Assets;
import snow.types.Types;

/**  An asset base class. Get assets from the `Assets` class, via `app.assets` */
class Asset {


        /** The asset manager associated with this asset */
    public var assets : Assets;
        /** The id of this asset like `assets/image.png` */
    public var id : String;
        /** The `AssetInfo` of this asset */
    public var info : AssetInfo;
        /** The concrete type this asset holds (useful when handling as Asset base class) */
    public var type : AssetType;
        /** Whether or not to persist this asset in the cache when it is cleared normally.
            default false. */
    public var persist : Bool = false;
        /** Whether or not to cache this asset for subsequent calls to `get_*` functions.
            Prevents multiple IO accesses, but data is stored in memory.
            default true. */
    public var cache : Bool = true;
        /** True if this asset has completely loaded. Only changed through `load` and when load completes */
    public var loaded : Bool = false;


    public function new( _assets:Assets, _info:AssetInfo ) {

        assets = _assets;
        info = _info;
        id = info.id;

    } //new

} //Asset