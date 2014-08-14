
[![Logo](../../../images/logo.png)](../../../api/index.html)

---



<h1>Asset</h1>
<small>`snow.assets.Asset`</small>

An asset base class. Get assets from the `app.assets`

---

`class`

---

&nbsp;
&nbsp;



<h3>Members</h3> <hr/><span class="member apipage">
                <a name="assets"><a class="lift" href="#assets">assets</a></a><div class="clear"></div><code class="signature apipage">assets : [snow.assets.Assets](#)</code><br/></span>
            <span class="small_desc_flat">The asset manager associated with this asset</span><span class="member apipage">
                <a name="id"><a class="lift" href="#id">id</a></a><div class="clear"></div><code class="signature apipage">id : [String](#)</code><br/></span>
            <span class="small_desc_flat">The id of this asset like `assets/image.png`</span><span class="member apipage">
                <a name="info"><a class="lift" href="#info">info</a></a><div class="clear"></div><code class="signature apipage">info : [snow.types.AssetInfo](#)</code><br/></span>
            <span class="small_desc_flat">The `AssetInfo` of this asset</span><span class="member apipage">
                <a name="type"><a class="lift" href="#type">type</a></a><div class="clear"></div><code class="signature apipage">type : [snow.types.AssetType](#)</code><br/></span>
            <span class="small_desc_flat">The concrete type this asset holds (useful when handling as Asset base class)</span><span class="member apipage">
                <a name="loaded"><a class="lift" href="#loaded">loaded</a></a><div class="clear"></div><code class="signature apipage">loaded : [Bool](#)</code><br/></span>
            <span class="small_desc_flat">True if this asset has completely loaded. Only changed through `load` and when load completes</span>





<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a> <div class="clear"></div><code class="signature apipage">new(\_assets:[snow.assets.Assets](#)<span></span>, \_info:[snow.types.AssetInfo](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat">Called from subclasses, by `app.assets`</span>
        </span>
    





---

&nbsp;
&nbsp;
&nbsp;
&nbsp;
