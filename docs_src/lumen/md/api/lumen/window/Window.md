
[![Logo](../../../images/logo.png)](../../../api/index.html)

---



<h1>Window</h1>



---

`class`
<span class="meta">

</span>


---

&nbsp;
&nbsp;

<h3>Members</h3> <hr/><span class="member apipage">
            <a name="asked_config"><a class="lift" href="#asked_config">asked\_config</a></a><code class="signature apipage">asked\_config : [lumen.types.WindowConfig](#lumen.types.WindowConfig)</code><br/></span>
        <span class="small_desc_flat">the requested window config</span><span class="member apipage">
            <a name="config"><a class="lift" href="#config">config</a></a><code class="signature apipage">config : [lumen.types.WindowConfig](#lumen.types.WindowConfig)</code><br/></span>
        <span class="small_desc_flat">the actual returned window config</span><span class="member apipage">
            <a name="fullscreen_desktop"><a class="lift" href="#fullscreen_desktop">fullscreen\_desktop</a></a><code class="signature apipage">fullscreen\_desktop : [Bool](http://api.haxe.org/Bool.html)</code><br/></span>
        <span class="small_desc_flat">set this for fullscreen desktop mode, instead of fullscreen mode</span><span class="member apipage">
            <a name="handle"><a class="lift" href="#handle">handle</a></a><code class="signature apipage">handle : [lumen.types.WindowHandle](#lumen.types.WindowHandle)</code><br/></span>
        <span class="small_desc_flat">the native window handle</span><span class="member apipage">
            <a name="id"><a class="lift" href="#id">id</a></a><code class="signature apipage">id : [Int](http://api.haxe.org/Int.html)</code><br/></span>
        <span class="small_desc_flat">the window id, for tracking events to each window</span><span class="member apipage">
            <a name="manager"><a class="lift" href="#manager">manager</a></a><code class="signature apipage">manager : [lumen.window.Windowing](#lumen.window.Windowing)</code><br/></span>
        <span class="small_desc_flat">the manager this window belongs to</span><span class="member apipage">
            <a name="window_event_handler"><a class="lift" href="#window_event_handler">window\_event\_handler</a></a><code class="signature apipage">window\_event\_handler : [lumen.types.WindowEvent-&gt;Void](#lumen.types.WindowEvent->Void)</code><br/></span>
        <span class="small_desc_flat">the window event handler callback</span><span class="member apipage">
            <a name="window_render_handler"><a class="lift" href="#window_render_handler">window\_render\_handler</a></a><code class="signature apipage">window\_render\_handler : [lumen.window.Window-&gt;Void](#lumen.window.Window->Void)</code><br/></span>
        <span class="small_desc_flat">the window render handler callback</span>

<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="close"><a class="lift" href="#close">close</a></a><code class="signature apipage">close() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Close the window</span>
        </span>
    <span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a><code class="signature apipage">new(\_manager:<span>[lumen.window.Windowing](#lumen.window.Windowing)</span>, \_config:<span>[lumen.types.WindowConfig](#lumen.types.WindowConfig)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="simple_message"><a class="lift" href="#simple_message">simple\_message</a></a><code class="signature apipage">simple\_message(message:<span>[String](http://api.haxe.org/String.html)</span>, ?title:<span>[String](http://api.haxe.org/String.html)=&#x27;&#x27;</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Display a cross platform message on this window</span>
        </span>
    <span class="method apipage">
            <a name="swap"><a class="lift" href="#swap">swap</a></a><code class="signature apipage">swap() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Swap the back buffer of the window, call after rendering to update the window view</span>
        </span>
    

<h3>Properties</h3> <hr/><span class="property apipage">
            <a name="bordered"><a class="lift" href="#bordered">bordered</a></a><code class="signature apipage">bordered : [Bool]()</code><br/><span class="small_desc_flat">The window bordered state `(read/write)`</span>
        </span><span class="property apipage">
            <a name="fullscreen"><a class="lift" href="#fullscreen">fullscreen</a></a><code class="signature apipage">fullscreen : [Bool]()</code><br/><span class="small_desc_flat">The window fullscreen state `(read/write)`</span>
        </span><span class="property apipage">
            <a name="grab"><a class="lift" href="#grab">grab</a></a><code class="signature apipage">grab : [Bool]()</code><br/><span class="small_desc_flat">The window grab state `(read/write)`</span>
        </span><span class="property apipage">
            <a name="max_size"><a class="lift" href="#max_size">max\_size</a></a><code class="signature apipage">max\_size : [lumen.types.WindowSize]()</code><br/><span class="small_desc_flat">The window maximum size `(read/write)`</span>
        </span><span class="property apipage">
            <a name="min_size"><a class="lift" href="#min_size">min\_size</a></a><code class="signature apipage">min\_size : [lumen.types.WindowSize]()</code><br/><span class="small_desc_flat">The window minimum size `(read/write)`</span>
        </span><span class="property apipage">
            <a name="position"><a class="lift" href="#position">position</a></a><code class="signature apipage">position : [lumen.types.WindowPosition]()</code><br/><span class="small_desc_flat">The window position `(read/write)`</span>
        </span><span class="property apipage">
            <a name="size"><a class="lift" href="#size">size</a></a><code class="signature apipage">size : [lumen.types.WindowSize]()</code><br/><span class="small_desc_flat">The window size `(read/write)`</span>
        </span><span class="property apipage">
            <a name="title"><a class="lift" href="#title">title</a></a><code class="signature apipage">title : [String]()</code><br/><span class="small_desc_flat">The window title `(read/write)`</span>
        </span>

&nbsp;
&nbsp;
&nbsp;