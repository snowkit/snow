
[![Logo](../../images/logo.png)](../../api/index.html)

---



<h1>CoreBinding</h1>
<small>`snow.CoreBinding`</small>

Implemented in the platform specific concrete versions of this class.

This uses a macro to allow this class to pretend to be abstract, and complain via compiler errors if the specific functions are missing.

---

`class`<br/>implements <code><span>snow.utils.AbstractClass</span></code>
<span class="meta">
<br/>meta: @:build(&#x27;???&#x27;), @:autoBuild(&#x27;???&#x27;), @:noCompletion
</span>


---

&nbsp;
&nbsp;



<h3>Members</h3> <hr/>





<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="init"><a class="lift" href="#init">init</a></a><code class="signature apipage">init(\_event\_handler:<span></span>) : Void</code><br/><span class="small_desc_flat">Called by the snow internals to intiialize the core and subsystems of the framework, with the event handler passed in for where to deliver system events</span>
        </span>
    <span class="method apipage">
            <a name="shutdown"><a class="lift" href="#shutdown">shutdown</a></a><code class="signature apipage">shutdown() : Void</code><br/><span class="small_desc_flat">Called to explicitly shutdown the framework cleanly. Called by `quit` and `app_terminated` type events by the core, for example.</span>
        </span>
    <span class="method apipage">
            <a name="timestamp"><a class="lift" href="#timestamp">timestamp</a></a><code class="signature apipage">timestamp() : Float</code><br/><span class="small_desc_flat">Get the most precise timestamp available on the platform, in seconds (time is always in seconds in snow)</span>
        </span>
    <span class="method apipage">
            <a name="app_path"><a class="lift" href="#app_path">app\_path</a></a><code class="signature apipage">app\_path() : String</code><br/><span class="small_desc_flat">Return the full path that the application is located</span>
        </span>
    <span class="method apipage">
            <a name="pref_path"><a class="lift" href="#pref_path">pref\_path</a></a><code class="signature apipage">pref\_path(\_appname:String<span></span>, \_package:String<span></span>) : String</code><br/><span class="small_desc_flat">On platforms where this makes sense, get the application specific writeable data path</span>
        </span>
    





---

&nbsp;
&nbsp;
&nbsp;
&nbsp;