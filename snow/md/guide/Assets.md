[![Logo]({{{rel_path}}}images/logo.png)]({{{rel_path}}}index.html#guide)

---

##Assets

The snow assets API takes care of loading assets for you across platforms.

As snow is designed to not make any assumptions, the loading of assets is set up to be flexible, allowing simple use but also controlled, advanced uses like reloading assets from disk at a later time, cacheing and so on.

The assets manager will not cache any assets for you, as this is an assumption that snow should not be making.

### The asset list

By default, snow uses a small file that lists the assets in your application, which is output from [flow](http://snowkit.org/flow/). This file simply contains a small json file describing the list of files in your application folder. Once the application starts, the asset list is loaded, and stored in the asset manager. This list is later used to query if an asset is _found_ by the system, **unless** strict mode is disabled for that query, or the entire system.

You can request that snow does not load this file, and you can request that flow not generate the file, if you so wish. This allows you to manually insert files using **app.assets.add** and you can do as you wish with regards to the loading or not loading of the list of assets.

**Take note** that on `web`, there is no concept of "does this file exist" without heavy cost (http request is very expensive for this concept). This means that the list inside of the asset manager is used to determine if a file is found or not on web.

To disable the asset list, see the [snow config API docs]({{{rel_path}}}api/snow/types/SnowConfig.html).

### The asset types

The asset system allows the loading of **bytes**, **image**, **text** and **audio** types. All of these functions are built with async loading in mind, and by default bytes and text will be forced to synchronous loading, which can be changed in the options to the functions.

The way the AssetBytes, AssetText, AssetAudio and AssetImage works is that each of the types that the asset manager returns will have an accompanying data object.

- AssetBytes - `asset.bytes : ByteArray`
- AssetText - `asset.text : String`
- AssetAudio - `asset.audio : AudioInfo`
- AssetImage - `asset.image : ImageInfo`

### Loading assets

When requesting an asset the following rules take place : 

- if the asset does not exist, null is returned.
- if the asset exists, a valid Asset type is returned.
- the valid Asset type will only populate it's *data* node once it is done loading.
- each asset request has an accompanying options which has an onload handler to pass in.

When considering if an asset exists or not, the following takes place :

- if `app.assets.strict == true` or the options strict flag is set, the asset list is authorative on existing files, an asset load can still fail if the list has an missing fail, returning null or the data node will be null upon loading.
- if `app.assets.strict == false` or the options strict flag is set to false, the disk is checked using normal filesystem exists calls, this allows loading absolute paths from anywhere and is for tools and applications that load user content.
- on web, if strict mode is disabled, the exists function always returns false if the file is not listed in the asset list.

It is the responsibility of the application to confirm validity and protect user data when using assets, strict or unstrict. The strict mode simply aids in confirming assets are loaded from the developers intent, not whether the file is valid, etc.

### Reloading assets

Once the asset is done loading, and you have used it's data / information, it is possible to retain the Asset instance, without disposing of it, and later request that it repopulate its data node for reuse.

A simple example of this is when reloading an image that has changed on disk, using the IO file watch events on desktop.

The Asset class types are very lightweight, but an image submitted to the GPU has already served it's purpose, so it's memory should be freed.

This is done by setting the AssetImage instance **image** node to null, i.e `asset.image = null;`. This allows the GC to clear memory from the image in RAM, but you may need it again to resubmit this image to the GPU if the file has changed on disk.

In this case, the `asset.load( _oncomplete )` function may be called directly, and when it is complete, if successful, the data object will be repopulated, allowing you to use `asset.image` once again. As soon as you have resubmitted the data, you can once again nullify the data node, keeping the asset in tact.

This allows flexible caching and management of assets with a low footprint and retains the information needed to reload an asset, like the path of the asset itself and so on.


---

##Back

[To the guide]({{{rel_path}}}index.html#guide)

<br/><br/><br/>
<br/><br/><br/>