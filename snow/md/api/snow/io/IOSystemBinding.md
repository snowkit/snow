
[![Logo](../../../images/logo.png)](../../../api/index.html)

---



<h1>IOSystemBinding</h1>
<small>`snow.io.IOSystemBinding`</small>



---

`class`<br/>implements <code><span>snow.utils.AbstractClass</span></code>
<span class="meta">
<br/>meta: @:build(&#x27;???&#x27;), @:autoBuild(&#x27;???&#x27;)
</span>


---

&nbsp;
&nbsp;



<h3>Members</h3> <hr/><span class="member apipage">
                <a name="manager"><a class="lift" href="#manager">manager</a></a><div class="clear"></div><code class="signature apipage">manager : [snow.io.IO](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="lib"><a class="lift" href="#lib">lib</a></a><div class="clear"></div><code class="signature apipage">lib : [snow.Snow](#)</code><br/></span>
            <span class="small_desc_flat"></span>





<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="init"><a class="lift" href="#init">init</a></a> <div class="clear"></div><code class="signature apipage">init() : [Void](#)</code><br/><span class="small_desc_flat">Called when the IO manager initiates this system</span>
        </span>
    <span class="method apipage">
            <a name="process"><a class="lift" href="#process">process</a></a> <div class="clear"></div><code class="signature apipage">process() : [Void](#)</code><br/><span class="small_desc_flat">Called when the IO manager updates this system</span>
        </span>
    <span class="method apipage">
            <a name="destroy"><a class="lift" href="#destroy">destroy</a></a> <div class="clear"></div><code class="signature apipage">destroy() : [Void](#)</code><br/><span class="small_desc_flat">Called when the IO manager destroys this system</span>
        </span>
    <span class="method apipage">
            <a name="on_event"><a class="lift" href="#on_event">on\_event</a></a> <div class="clear"></div><code class="signature apipage">on\_event(\_event:[snow.types.SystemEvent](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat">Called when the IO manager forwards an event to this system</span>
        </span>
    <span class="method apipage">
            <a name="url_open"><a class="lift" href="#url_open">url\_open</a></a> <div class="clear"></div><code class="signature apipage">url\_open(\_url:[String](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat">Call this to open a url in the default browser</span>
        </span>
    <span class="method apipage">
            <a name="watch_add"><a class="lift" href="#watch_add">watch\_add</a></a> <div class="clear"></div><code class="signature apipage">watch\_add(\_path:[String](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat">Call this to add a directory to watch for file change notifications.
                This is for directories only. Children files + sub folders children files will notify of change.
                supports:`windows` `mac` `linux` only</span>
        </span>
    <span class="method apipage">
            <a name="watch_remove"><a class="lift" href="#watch_remove">watch\_remove</a></a> <div class="clear"></div><code class="signature apipage">watch\_remove(\_path:[String](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat">Call this to remove a watched directory.
                supports:`windows` `mac` `linux` only</span>
        </span>
    <span class="method apipage">
            <a name="dialog_open"><a class="lift" href="#dialog_open">dialog\_open</a></a> <div class="clear"></div><code class="signature apipage">dialog\_open(\_title:[String](#)<span>=&#x27;Select file&#x27;</span>, \_filters:[Array](#)&lt;[snow.types.FileFilter](#)&gt;<span>=null</span>) : [String](#)</code><br/><span class="small_desc_flat">Call this to open a native platform file open dialog.
                Returns a blank string if they cancel or any error occurs.
                supports: `windows` `mac` `linux`</span>
        </span>
    <span class="method apipage">
            <a name="dialog_save"><a class="lift" href="#dialog_save">dialog\_save</a></a> <div class="clear"></div><code class="signature apipage">dialog\_save(\_title:[String](#)<span>=&#x27;Save file&#x27;</span>, \_filter:[snow.types.FileFilter](#)<span>=null</span>) : [String](#)</code><br/><span class="small_desc_flat">Call this to open a native platform file save dialog.
                Returns a blank string if they cancel or any error occurs.
                supports:`windows` `mac` `linux`</span>
        </span>
    <span class="method apipage">
            <a name="dialog_folder"><a class="lift" href="#dialog_folder">dialog\_folder</a></a> <div class="clear"></div><code class="signature apipage">dialog\_folder(\_title:[String](#)<span>=&#x27;Select folder&#x27;</span>) : [String](#)</code><br/><span class="small_desc_flat">Call this to open a native platform folder select dialog.
                Returns a blank string if they cancel or any error occurs.
                supports:`windows` `mac` `linux`</span>
        </span>
    





---

&nbsp;
&nbsp;
&nbsp;
&nbsp;
