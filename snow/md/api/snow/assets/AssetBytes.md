
[![Logo](../../../images/logo.png)](../../../api/index.html)

---



<h1>AssetBytes</h1>
<small>`snow.assets.AssetBytes`</small>

An asset that contains byte `bytes` as a `ByteArray`. Get assets from the `Assets` class, via `app.assets`

---

`class`extends <code><span>snow.assets.Asset</span></code>

---

&nbsp;
&nbsp;



<h3>Members</h3> <hr/><span class="member apipage">
                <a name="bytes"><a class="lift" href="#bytes">bytes</a></a><div class="clear"></div><code class="signature apipage">bytes : [snow.utils.ByteArray](#)</code><br/></span>
            <span class="small_desc_flat">The `ByteArray` this asset contains</span><span class="member apipage">
                <a name="async"><a class="lift" href="#async">async</a></a><div class="clear"></div><code class="signature apipage">async : [Bool](#)</code><br/></span>
            <span class="small_desc_flat">Whether or not this bytes data will load syncronously. Used in `load` only.</span>





<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="load"><a class="lift" href="#load">load</a></a> <div class="clear"></div><code class="signature apipage">load(onload:[snow.assets.AssetBytes](#)&nbsp;-&gt; [Void](#)<span>=null</span>) : [Void](#)</code><br/><span class="small_desc_flat">Called from `app.assets.bytes`, or manually, if reloading the asset data at a later point.
            Note this function calls the onload handler in the next frame, so sync code can return.</span>
        </span>
    <span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a> <div class="clear"></div><code class="signature apipage">new(\_assets:[snow.assets.Assets](#)<span></span>, \_info:[snow.types.AssetInfo](#)<span></span>, \_async:[Bool](#)<span>=false</span>) : [Void](#)</code><br/><span class="small_desc_flat">Called from `app.assets`</span>
        </span>
    





---

&nbsp;
&nbsp;
&nbsp;
&nbsp;
