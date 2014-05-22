
[![Logo](../../../images/logo.png)](../../../index.html)

---


##[API Index](../../../api/index.html#lumen.assets)   
[lumen](../)     
&emsp;&emsp;&emsp;[lumen.assets](./)   
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;Assets

---

#Assets

The asset system class gives you access to fetching and manipulating assets, 
    caching/uncaching assets, and handles loading files and data cross platform

---


[Members](#Members)   
[Methods](#Methods)   


---

&nbsp;   

<a class="lift" name="Members" ></a>
###Members   
---
<a class="lift" name="assets_root" href="#assets_root">assets_root</a>



`assets_root : String`

<span class="small_desc_flat"> If the assets are not relative to the runtime root path, this value can adjust all asset paths. This is automatically handled and exists to allow control. </span>   

<a class="lift" name="list" href="#list">list</a>



`list : Map<String,lumen.types.AssetInfo>`

<span class="small_desc_flat"> The list of assets in the system, added at startup by the `App` class, in the `get_asset_list` function </span>   

<a class="lift" name="manifest_path" href="#manifest_path">manifest_path</a>



`manifest_path : String`

<span class="small_desc_flat"> The manifest file to parse for the asset list. By default, this is set to `manifest` from the build tools but the `App` class can have a custom `get_asset_list` handler use this value. </span>   

&nbsp;   

&nbsp;   

<a class="lift" name="Methods" ></a>
###Methods   
---
<a class="lift" name="add" href="#add">add</a>



`add(_list:Array<lumen.types.AssetInfo>) : Void`

<span class="small_desc_flat"> Add an asset list to the system </span>   

<a class="lift" name="exists" href="#exists">exists</a>



`exists(_id:String) : Bool`

<span class="small_desc_flat"> Check if an asset exists in the system </span>   

<a class="lift" name="get" href="#get">get</a>



`get(_id:String) : lumen.types.AssetInfo`

<span class="small_desc_flat"> Get an asset from the system </span>   

<a class="lift" name="get_audio" href="#get_audio">get_audio</a>



`get_audio(_id:String, ?options:lumen.assets.AssetAudioOptions) : lumen.assets.AssetAudio`

<span class="small_desc_flat"> Get an asset as a `AssetAudio`, used for audio files </span>   

<a class="lift" name="get_bytes" href="#get_bytes">get_bytes</a>



`get_bytes(_id:String) : lumen.assets.AssetBytes`

<span class="small_desc_flat"> Get an asset as a `ByteArray`, used for binary assets </span>   

<a class="lift" name="get_image" href="#get_image">get_image</a>



`get_image(_id:String, ?options:lumen.assets.AssetImageOptions) : lumen.assets.AssetImage`

<span class="small_desc_flat"> Get an asset as a `AssetImage`, used for image files </span>   

<a class="lift" name="get_text" href="#get_text">get_text</a>



`get_text(_id:String) : lumen.assets.AssetText`

<span class="small_desc_flat"> Get an asset as a `String`, used for text based assets </span>   

<a class="lift" name="new" href="#new">new</a>



`new(_lib:lumen.Lumen) `

<span class="small_desc_flat">  </span>   

<a class="lift" name="path" href="#path">path</a>



`path(_id:String) : String`

<span class="small_desc_flat"> Get the asset path for an asset, adjusted by platform, root etc. </span>   



&nbsp;
&nbsp;
&nbsp;

---  


&nbsp;   
&nbsp;   