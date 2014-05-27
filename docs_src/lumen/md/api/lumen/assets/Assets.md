
[![Logo](../../../images/logo.png)](../../../api/index.html)

---



#Assets

The asset system class gives you access to fetching and manipulating assets, \n    caching/uncaching assets, and handles loading files and data cross platform

---

`class`
<span class="meta">

</span>


---

&nbsp;
&nbsp;

<h3>Members</h3> <hr/><span class="member apipage">
            <a name="assets_root"><a class="lift" href="#assets_root">assets\_root</a></a><code class="signature apipage">assets\_root : [String](http://api.haxe.org/String.html)</code><br/></span>
        <span class="small_desc_flat">If the assets are not relative to the runtime root path, this value can adjust all asset paths. This is automatically handled and exists to allow control.</span><span class="member apipage">
            <a name="list"><a class="lift" href="#list">list</a></a><code class="signature apipage">list : [Map](http://api.haxe.org/Map.html)&lt;[String](http://api.haxe.org/String.html), [lumen.types.AssetInfo](#lumen.types.AssetInfo)&gt;</code><br/></span>
        <span class="small_desc_flat">The list of assets in the system, added at startup by the `App` class, in the `get_asset_list` function</span><span class="member apipage">
            <a name="manifest_path"><a class="lift" href="#manifest_path">manifest\_path</a></a><code class="signature apipage">manifest\_path : [String](http://api.haxe.org/String.html)</code><br/></span>
        <span class="small_desc_flat">The manifest file to parse for the asset list. By default, this is set to `manifest` from the build tools but the `App` class can have a custom `get_asset_list` handler use this value.</span>

<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="add"><a class="lift" href="#add">add</a></a><code class="signature apipage">add(\_list:<span>[Array](http://api.haxe.org/Array.html)&lt;[lumen.types.AssetInfo](#lumen.types.AssetInfo)&gt;</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Add an asset list to the system</span>
        </span>
    <span class="method apipage">
            <a name="exists"><a class="lift" href="#exists">exists</a></a><code class="signature apipage">exists(\_id:<span>[String](http://api.haxe.org/String.html)</span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat">Check if an asset exists in the system</span>
        </span>
    <span class="method apipage">
            <a name="get"><a class="lift" href="#get">get</a></a><code class="signature apipage">get(\_id:<span>[String](http://api.haxe.org/String.html)</span>) : [lumen.types.AssetInfo](#lumen.types.AssetInfo)</code><br/><span class="small_desc_flat">Get an asset from the system</span>
        </span>
    <span class="method apipage">
            <a name="get_audio"><a class="lift" href="#get_audio">get\_audio</a></a><code class="signature apipage">get\_audio(\_id:<span>[String](http://api.haxe.org/String.html)</span>, ?options:<span>[lumen.types.AssetAudioOptions](#lumen.types.AssetAudioOptions)=null</span>) : [lumen.types.AssetAudio](#lumen.types.AssetAudio)</code><br/><span class="small_desc_flat">Get an asset as a `AssetAudio`, used for audio files</span>
        </span>
    <span class="method apipage">
            <a name="get_bytes"><a class="lift" href="#get_bytes">get\_bytes</a></a><code class="signature apipage">get\_bytes(\_id:<span>[String](http://api.haxe.org/String.html)</span>) : [lumen.types.AssetBytes](#lumen.types.AssetBytes)</code><br/><span class="small_desc_flat">Get an asset as a `ByteArray`, used for binary assets</span>
        </span>
    <span class="method apipage">
            <a name="get_image"><a class="lift" href="#get_image">get\_image</a></a><code class="signature apipage">get\_image(\_id:<span>[String](http://api.haxe.org/String.html)</span>, ?options:<span>[lumen.types.AssetImageOptions](#lumen.types.AssetImageOptions)=null</span>) : [lumen.types.AssetImage](#lumen.types.AssetImage)</code><br/><span class="small_desc_flat">Get an asset as a `AssetImage`, used for image files</span>
        </span>
    <span class="method apipage">
            <a name="get_text"><a class="lift" href="#get_text">get\_text</a></a><code class="signature apipage">get\_text(\_id:<span>[String](http://api.haxe.org/String.html)</span>) : [lumen.types.AssetText](#lumen.types.AssetText)</code><br/><span class="small_desc_flat">Get an asset as a `String`, used for text based assets</span>
        </span>
    <span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a><code class="signature apipage">new(\_lib:<span>[lumen.Lumen](#lumen.Lumen)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="path"><a class="lift" href="#path">path</a></a><code class="signature apipage">path(\_id:<span>[String](http://api.haxe.org/String.html)</span>) : [String](http://api.haxe.org/String.html)</code><br/><span class="small_desc_flat">Get the asset path for an asset, adjusted by platform, root etc.</span>
        </span>
    

<h3>Properties</h3> <hr/>no public properties

&nbsp;
&nbsp;
&nbsp;