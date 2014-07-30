
[![Logo](../../../images/logo.png)](../../../api/index.html)

---



<h1>AppConfig</h1>
<small>`snow.types.AppConfig`</small>

The application config info

---

`typedef`

---

&nbsp;
&nbsp;



<h3>Members</h3> <hr/><span class="member apipage">
                <a name="window"><a class="lift" href="#window">window</a></a><div class="clear"></div><code class="signature apipage">window : [Null](#)&lt;[snow.types.WindowConfig](#)&gt;</code><br/></span>
            <span class="small_desc_flat">the window config for the default window, if `has_window` is true. default: see `WindowConfig` docs</span><span class="member apipage">
                <a name="runtime"><a class="lift" href="#runtime">runtime</a></a><div class="clear"></div><code class="signature apipage">runtime : [Dynamic](#)</code><br/></span>
            <span class="small_desc_flat">the user specific config, by default, read from a json file at runtime</span><span class="member apipage">
                <a name="has_window"><a class="lift" href="#has_window">has\_window</a></a><div class="clear"></div><code class="signature apipage">has\_window : [Null](#)&lt;[Bool](#)&gt;</code><br/></span>
            <span class="small_desc_flat">whether or not to create and run a default window, default: true</span><span class="member apipage">
                <a name="assets"><a class="lift" href="#assets">assets</a></a><div class="clear"></div><code class="signature apipage">assets : [Array](#)&lt;[snow.types.AssetInfo](#)&gt;</code><br/></span>
            <span class="small_desc_flat">the raw list of assets. use the app.assets from Snow for access to these. read from a manifest file by default</span>







---

&nbsp;
&nbsp;
&nbsp;
&nbsp;