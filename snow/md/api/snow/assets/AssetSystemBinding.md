
[![Logo](../../../images/logo.png)](../../../api/index.html)

---



<h1>AssetSystemBinding</h1>
<small>`snow.assets.AssetSystemBinding`</small>



---

`class`<br/>implements <code><span>snow.utils.AbstractClass</span></code>
<span class="meta">
<br/>meta: @:build(&#x27;???&#x27;), @:autoBuild(&#x27;???&#x27;), @:noCompletion
</span>


---

&nbsp;
&nbsp;



<h3>Members</h3> <hr/><span class="member apipage">
                <a name="manager"><a class="lift" href="#manager">manager</a></a><div class="clear"></div><code class="signature apipage">manager : [snow.assets.Assets](#)</code><br/></span>
            <span class="small_desc_flat"></span>





<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="exists"><a class="lift" href="#exists">exists</a></a> <div class="clear"></div><code class="signature apipage">exists(\_id:[String](#)<span></span>, \_strict:[Bool](#)<span>=true</span>) : [Bool](#)</code><br/><span class="small_desc_flat">Return true if the asset exists or false if not.
            If strict is enabled, it will only check the stored asset list.
            If strict is false, will allow unlisted paths and use platform specific exists checks.
            On web targets, this will return false for unlisted files as http requests for 404's is silly.</span>
        </span>
    <span class="method apipage">
            <a name="image_load_info"><a class="lift" href="#image_load_info">image\_load\_info</a></a> <div class="clear"></div><code class="signature apipage">image\_load\_info(\_path:[String](#)<span></span>, \_components:[Int](#)<span>=4</span>, \_onload:[snow.types.ImageInfo](#)&nbsp;-&gt; [Void](#)<span>=null</span>) : [snow.types.ImageInfo](#)</code><br/><span class="small_desc_flat">Image info load from file path. Use `app.assets`</span>
        </span>
    <span class="method apipage">
            <a name="image_info_from_bytes"><a class="lift" href="#image_info_from_bytes">image\_info\_from\_bytes</a></a> <div class="clear"></div><code class="signature apipage">image\_info\_from\_bytes(\_path:[String](#)<span></span>, \_bytes:[snow.utils.ByteArray](#)<span></span>, \_components:[Int](#)<span>=4</span>) : [snow.types.ImageInfo](#)</code><br/><span class="small_desc_flat">Image info load from `ByteArray`. Use `app.assets`</span>
        </span>
    <span class="method apipage">
            <a name="audio_load_info"><a class="lift" href="#audio_load_info">audio\_load\_info</a></a> <div class="clear"></div><code class="signature apipage">audio\_load\_info(\_path:[String](#)<span></span>, \_format:[snow.types.AudioFormatType](#)<span>=null</span>, \_load:[Bool](#)<span>=true</span>, \_onload:[snow.types.AudioInfo](#)&nbsp;-&gt; [Void](#)<span>=null</span>) : [snow.types.AudioInfo](#)</code><br/><span class="small_desc_flat">Audio info loader, use `app.assets`</span>
        </span>
    <span class="method apipage">
            <a name="audio_seek_source"><a class="lift" href="#audio_seek_source">audio\_seek\_source</a></a> <div class="clear"></div><code class="signature apipage">audio\_seek\_source(\_info:[snow.types.AudioInfo](#)<span></span>, \_to:[Int](#)<span></span>) : [Bool](#)</code><br/><span class="small_desc_flat">Audio seek the specified audio info to the given position in bytes. `native` only</span>
        </span>
    <span class="method apipage">
            <a name="audio_load_portion"><a class="lift" href="#audio_load_portion">audio\_load\_portion</a></a> <div class="clear"></div><code class="signature apipage">audio\_load\_portion(\_info:[snow.types.AudioInfo](#)<span></span>, \_start:[Int](#)<span></span>, \_len:[Int](#)<span></span>) : [snow.types.AudioDataBlob](#)</code><br/><span class="small_desc_flat">Audio portion loading (used for streaming or splitting source files into multiple blobs). sizes are in bytes. `native` only</span>
        </span>
    





---

&nbsp;
&nbsp;
&nbsp;
&nbsp;
