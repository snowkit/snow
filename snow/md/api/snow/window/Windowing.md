
[![Logo](../../../images/logo.png)](../../../api/index.html)

---



<h1>Windowing</h1>
<small>`snow.window.Windowing`</small>

A window manager, accessed via `app.window`

---

`class`

---

&nbsp;
&nbsp;



<h3>Members</h3> <hr/><span class="member apipage">
                <a name="lib"><a class="lift" href="#lib">lib</a></a><code class="signature apipage">lib : [snow.Snow](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="window_list"><a class="lift" href="#window_list">window\_list</a></a><code class="signature apipage">window\_list : [Map](#)&lt;[Int](#), [snow.window.Window](#)&gt;</code><br/></span>
            <span class="small_desc_flat">The list of windows in this manager</span><span class="member apipage">
                <a name="window_handles"><a class="lift" href="#window_handles">window\_handles</a></a><code class="signature apipage">window\_handles : [Map](#)&lt;[snow.types.WindowHandle](#), [Int](#)&gt;</code><br/></span>
            <span class="small_desc_flat">The list of window handles, pointing to id's in the `window_list`</span><span class="member apipage">
                <a name="window_count"><a class="lift" href="#window_count">window\_count</a></a><code class="signature apipage">window\_count : [Int](#)</code><br/></span>
            <span class="small_desc_flat">The number of windows in this manager</span>





<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="create"><a class="lift" href="#create">create</a></a> <div class="clear"></div><code class="signature apipage">create(\_config:[snow.types.WindowConfig](#)<span></span>) : [snow.window.Window](#)</code><br/><span class="small_desc_flat">Create a window with the given config</span>
        </span>
    <span class="method apipage">
            <a name="window_from_handle"><a class="lift" href="#window_from_handle">window\_from\_handle</a></a> <div class="clear"></div><code class="signature apipage">window\_from\_handle(\_handle:[snow.types.WindowHandle](#)<span></span>) : [snow.window.Window](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="window_from_id"><a class="lift" href="#window_from_id">window\_from\_id</a></a> <div class="clear"></div><code class="signature apipage">window\_from\_id(\_id:[Int](#)<span></span>) : [snow.window.Window](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    





---

&nbsp;
&nbsp;
&nbsp;
&nbsp;