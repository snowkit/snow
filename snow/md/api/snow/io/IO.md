
[![Logo](../../../images/logo.png)](../../../api/index.html)

---



<h1>IO</h1>
<small>`snow.io.IO`</small>

This class is a low level cross platform IO helper.
    If you want file access, use `Assets` instead, unless really required.

---

`class`

---

&nbsp;
&nbsp;



<h3>Members</h3> <hr/>





<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="url_open"><a class="lift" href="#url_open">url\_open</a></a> <span class="inline-block static">static</span><div class="clear"></div><code class="signature apipage">url\_open(\_url:[String](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat">Opens the specified url in the default browser</span>
        </span>
    <span class="method apipage">
            <a name="from_file"><a class="lift" href="#from_file">from\_file</a></a> <span class="inline-block static">static</span><div class="clear"></div><code class="signature apipage">from\_file(\_id:[String](#)<span></span>, \_mode:[String](#)<span>=&#x27;rb&#x27;</span>) : [snow.io.IOFile](#)</code><br/><span class="small_desc_flat">Create an `IOFile` from a file path `_id`, this bypasses the `Asset` system path helpers.</span>
        </span>
    <span class="method apipage">
            <a name="watch_add"><a class="lift" href="#watch_add">watch\_add</a></a> <span class="inline-block static">static</span><div class="clear"></div><code class="signature apipage">watch\_add(\_path:[String](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat">Add a folder to a watch list for notifications when the contents of the folder change</span>
        </span>
    <span class="method apipage">
            <a name="watch_remove"><a class="lift" href="#watch_remove">watch\_remove</a></a> <span class="inline-block static">static</span><div class="clear"></div><code class="signature apipage">watch\_remove(\_path:[String](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat">Remove a folder from the watch list</span>
        </span>
    <span class="method apipage">
            <a name="dialog_open"><a class="lift" href="#dialog_open">dialog\_open</a></a> <span class="inline-block static">static</span><div class="clear"></div><code class="signature apipage">dialog\_open(\_title:[String](#)<span>=&#x27;Select file&#x27;</span>) : [Dynamic](#)</code><br/><span class="small_desc_flat">Opens a file open dialog. Returns a blank string if they cancel or any error occurs.</span>
        </span>
    <span class="method apipage">
            <a name="dialog_save"><a class="lift" href="#dialog_save">dialog\_save</a></a> <span class="inline-block static">static</span><div class="clear"></div><code class="signature apipage">dialog\_save(\_title:[String](#)<span>=&#x27;Save file&#x27;</span>) : [Dynamic](#)</code><br/><span class="small_desc_flat">Opens a file save file dialog. Returns a blank string if they cancel or any error occurs.</span>
        </span>
    <span class="method apipage">
            <a name="dialog_folder"><a class="lift" href="#dialog_folder">dialog\_folder</a></a> <span class="inline-block static">static</span><div class="clear"></div><code class="signature apipage">dialog\_folder(\_title:[String](#)<span>=&#x27;Select folder&#x27;</span>) : [Dynamic](#)</code><br/><span class="small_desc_flat">Opens a file open folder select dialog. Returns a blank string if they cancel or any error occurs.</span>
        </span>
    





---

&nbsp;
&nbsp;
&nbsp;
&nbsp;