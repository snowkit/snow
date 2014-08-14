
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
                <a name="window_list"><a class="lift" href="#window_list">window\_list</a></a><div class="clear"></div><code class="signature apipage">window\_list : [Map](#)&lt;[Int](#), [snow.window.Window](#)&gt;</code><br/></span>
            <span class="small_desc_flat">The list of windows in this manager</span><span class="member apipage">
                <a name="window_handles"><a class="lift" href="#window_handles">window\_handles</a></a><div class="clear"></div><code class="signature apipage">window\_handles : [Map](#)&lt;[snow.types.WindowHandle](#), [Int](#)&gt;</code><br/></span>
            <span class="small_desc_flat">The list of window handles, pointing to id's in the `window_list`</span><span class="member apipage">
                <a name="window_count"><a class="lift" href="#window_count">window\_count</a></a><div class="clear"></div><code class="signature apipage">window\_count : [Int](#)</code><br/></span>
            <span class="small_desc_flat">The number of windows in this manager</span>





<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="create"><a class="lift" href="#create">create</a></a> <div class="clear"></div><code class="signature apipage">create(\_config:[snow.types.WindowConfig](#)<span></span>) : [snow.window.Window](#)</code><br/><span class="small_desc_flat">Create a window with the given config.</span>
        </span>
    <span class="method apipage">
            <a name="enable_vsync"><a class="lift" href="#enable_vsync">enable\_vsync</a></a> <div class="clear"></div><code class="signature apipage">enable\_vsync(\_enable:[Bool](#)<span></span>) : [Int](#)</code><br/><span class="small_desc_flat">Toggle vertical refresh. This is not window specific but context wide</span>
        </span>
    <span class="method apipage">
            <a name="enable_cursor"><a class="lift" href="#enable_cursor">enable\_cursor</a></a> <div class="clear"></div><code class="signature apipage">enable\_cursor(\_enable:[Bool](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat">Toggle the OS cursor. This is not window specific but application wide, when inside a window, the OS cursor is hidden.</span>
        </span>
    <span class="method apipage">
            <a name="enable_cursor_lock"><a class="lift" href="#enable_cursor_lock">enable\_cursor\_lock</a></a> <div class="clear"></div><code class="signature apipage">enable\_cursor\_lock(\_enable:[Bool](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat">Lock the OS cursor to the foreground window. This hides the cursor and prevents it from leaving, reporting relative coordinates.</span>
        </span>
    <span class="method apipage">
            <a name="display_count"><a class="lift" href="#display_count">display\_count</a></a> <div class="clear"></div><code class="signature apipage">display\_count() : [Int](#)</code><br/><span class="small_desc_flat">Get the number of displays present</span>
        </span>
    <span class="method apipage">
            <a name="display_mode_count"><a class="lift" href="#display_mode_count">display\_mode\_count</a></a> <div class="clear"></div><code class="signature apipage">display\_mode\_count(display:[Int](#)<span></span>) : [Int](#)</code><br/><span class="small_desc_flat">Get the number of display modes present</span>
        </span>
    <span class="method apipage">
            <a name="display_native_mode"><a class="lift" href="#display_native_mode">display\_native\_mode</a></a> <div class="clear"></div><code class="signature apipage">display\_native\_mode(display:[Int](#)<span></span>) : [snow.types.DisplayMode](#)</code><br/><span class="small_desc_flat">Get the native mode information of the display by index</span>
        </span>
    <span class="method apipage">
            <a name="display_current_mode"><a class="lift" href="#display_current_mode">display\_current\_mode</a></a> <div class="clear"></div><code class="signature apipage">display\_current\_mode(display:[Int](#)<span></span>) : [snow.types.DisplayMode](#)</code><br/><span class="small_desc_flat">Get the current mode information of the display by index</span>
        </span>
    <span class="method apipage">
            <a name="display_mode"><a class="lift" href="#display_mode">display\_mode</a></a> <div class="clear"></div><code class="signature apipage">display\_mode(display:[Int](#)<span></span>, mode\_index:[Int](#)<span></span>) : [snow.types.DisplayMode](#)</code><br/><span class="small_desc_flat">Get the information from a specific mode index, the index is obtained by iterating with a `display_mode_count` as the loop value</span>
        </span>
    <span class="method apipage">
            <a name="display_bounds"><a class="lift" href="#display_bounds">display\_bounds</a></a> <div class="clear"></div><code class="signature apipage">display\_bounds(display:[Int](#)<span></span>) : [Dynamic](#)</code><br/><span class="small_desc_flat">Get the bounds of the display by index</span>
        </span>
    <span class="method apipage">
            <a name="display_name"><a class="lift" href="#display_name">display\_name</a></a> <div class="clear"></div><code class="signature apipage">display\_name(display:[Int](#)<span></span>) : [String](#)</code><br/><span class="small_desc_flat">Get the name of the display by index, where available</span>
        </span>
    





---

&nbsp;
&nbsp;
&nbsp;
&nbsp;
