
[![Logo](../../../images/logo.png)](../../../api/index.html)

---



<h1>AssetAudio</h1>
<small>`snow.assets.AssetAudio`</small>

An asset that contains audio file `audio` as an `AudioInfo`. Get assets from the `Assets` class, via `app.assets`

---

`class`extends <code><span>snow.assets.Asset</span></code>

---

&nbsp;
&nbsp;



<h3>Members</h3> <hr/><span class="member apipage">
                <a name="audio"><a class="lift" href="#audio">audio</a></a><div class="clear"></div><code class="signature apipage">audio : [snow.types.AudioInfo](#)</code><br/></span>
            <span class="small_desc_flat">The `AudioInfo` this asset contains</span><span class="member apipage">
                <a name="format"><a class="lift" href="#format">format</a></a><div class="clear"></div><code class="signature apipage">format : [snow.types.AudioFormatType](#)</code><br/></span>
            <span class="small_desc_flat">The audio format of this asset</span><span class="member apipage">
                <a name="load_full"><a class="lift" href="#load_full">load\_full</a></a><div class="clear"></div><code class="signature apipage">load\_full : [Bool](#)</code><br/></span>
            <span class="small_desc_flat">Whether or not this asset is to be loaded in full (or alternatively, streamed). Used from `load` only.</span>





<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="load"><a class="lift" href="#load">load</a></a> <div class="clear"></div><code class="signature apipage">load(onload:[snow.assets.AssetAudio](#)&nbsp;-&gt; [Void](#)<span>=null</span>) : [Void](#)</code><br/><span class="small_desc_flat">Called from `app.assets.audio`, or manually, if reloading the asset data at a later point.
            Note this function calls the onload handler in the next frame, so sync code can return.</span>
        </span>
    <span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a> <div class="clear"></div><code class="signature apipage">new(\_assets:[snow.assets.Assets](#)<span></span>, \_info:[snow.types.AssetInfo](#)<span></span>, \_format:[snow.types.AudioFormatType](#)<span></span>, \_load:[Bool](#)<span>=true</span>) : [Void](#)</code><br/><span class="small_desc_flat">Created from `app.assets.audio`</span>
        </span>
    





---

&nbsp;
&nbsp;
&nbsp;
&nbsp;
