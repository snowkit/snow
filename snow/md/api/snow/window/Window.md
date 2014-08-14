
[![Logo](../../../images/logo.png)](../../../api/index.html)

---



<h1>Window</h1>
<small>`snow.window.Window`</small>



---

`class`

---

&nbsp;
&nbsp;



<h3>Members</h3> <hr/><span class="member apipage">
                <a name="id"><a class="lift" href="#id">id</a></a><div class="clear"></div><code class="signature apipage">id : [Int](#)</code><br/></span>
            <span class="small_desc_flat">the window id, for tracking events to each window</span><span class="member apipage">
                <a name="manager"><a class="lift" href="#manager">manager</a></a><div class="clear"></div><code class="signature apipage">manager : [snow.window.Windowing](#)</code><br/></span>
            <span class="small_desc_flat">the manager this window belongs to</span><span class="member apipage">
                <a name="asked_config"><a class="lift" href="#asked_config">asked\_config</a></a><div class="clear"></div><code class="signature apipage">asked\_config : [snow.types.WindowConfig](#)</code><br/></span>
            <span class="small_desc_flat">the requested window config</span><span class="member apipage">
                <a name="config"><a class="lift" href="#config">config</a></a><div class="clear"></div><code class="signature apipage">config : [snow.types.WindowConfig](#)</code><br/></span>
            <span class="small_desc_flat">the actual returned window config</span><span class="member apipage">
                <a name="handle"><a class="lift" href="#handle">handle</a></a><div class="clear"></div><code class="signature apipage">handle : [snow.types.WindowHandle](#)</code><br/></span>
            <span class="small_desc_flat">the native window handle</span><span class="member apipage">
                <a name="onevent"><a class="lift" href="#onevent">onevent</a></a><div class="clear"></div><code class="signature apipage">onevent : [snow.types.WindowEvent](#)&nbsp;-&gt; [Void](#)</code><br/></span>
            <span class="small_desc_flat">the window event handler callback</span><span class="member apipage">
                <a name="onrender"><a class="lift" href="#onrender">onrender</a></a><div class="clear"></div><code class="signature apipage">onrender : [snow.window.Window](#)&nbsp;-&gt; [Void](#)</code><br/></span>
            <span class="small_desc_flat">the window render handler callback</span><span class="member apipage">
                <a name="fullscreen_desktop"><a class="lift" href="#fullscreen_desktop">fullscreen\_desktop</a></a><div class="clear"></div><code class="signature apipage">fullscreen\_desktop : [Bool](#)</code><br/></span>
            <span class="small_desc_flat">set this for fullscreen desktop mode, i.e created at the full desktop resolution</span><span class="member apipage">
                <a name="auto_swap"><a class="lift" href="#auto_swap">auto\_swap</a></a><div class="clear"></div><code class="signature apipage">auto\_swap : [Bool](#)</code><br/></span>
            <span class="small_desc_flat">set this if you want to control when a window swaps() where applicable</span><span class="member apipage">
                <a name="closed"><a class="lift" href="#closed">closed</a></a><div class="clear"></div><code class="signature apipage">closed : [Bool](#)</code><br/></span>
            <span class="small_desc_flat">A flag for whether this window is open or closed</span>



<h3>Properties</h3> <hr/><span class="member apipage">
                <a name="title"><a class="lift" href="#title">title</a></a> <div class="clear"></div><code class="signature apipage">title : [String](#)</code><br/></span>
            <span class="small_desc_flat">The window title `(read/write)`</span><span class="member apipage">
                <a name="bordered"><a class="lift" href="#bordered">bordered</a></a> <div class="clear"></div><code class="signature apipage">bordered : [Bool](#)</code><br/></span>
            <span class="small_desc_flat">The window bordered state `(read/write)`</span><span class="member apipage">
                <a name="grab"><a class="lift" href="#grab">grab</a></a> <div class="clear"></div><code class="signature apipage">grab : [Bool](#)</code><br/></span>
            <span class="small_desc_flat">The window grab state `(read/write)`</span><span class="member apipage">
                <a name="fullscreen"><a class="lift" href="#fullscreen">fullscreen</a></a> <div class="clear"></div><code class="signature apipage">fullscreen : [Bool](#)</code><br/></span>
            <span class="small_desc_flat">The window fullscreen state `(read/write)`</span><span class="member apipage">
                <a name="x"><a class="lift" href="#x">x</a></a> <div class="clear"></div><code class="signature apipage">x : [Int](#)</code><br/></span>
            <span class="small_desc_flat">The window position `(read/write)`</span><span class="member apipage">
                <a name="y"><a class="lift" href="#y">y</a></a> <div class="clear"></div><code class="signature apipage">y : [Int](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="width"><a class="lift" href="#width">width</a></a> <div class="clear"></div><code class="signature apipage">width : [Int](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="height"><a class="lift" href="#height">height</a></a> <div class="clear"></div><code class="signature apipage">height : [Int](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="max_size"><a class="lift" href="#max_size">max\_size</a></a> <div class="clear"></div><code class="signature apipage">max\_size : { y : [Int](#), x : [Int](#) }</code><br/></span>
            <span class="small_desc_flat">The window maximum size `(read/write)`</span><span class="member apipage">
                <a name="min_size"><a class="lift" href="#min_size">min\_size</a></a> <div class="clear"></div><code class="signature apipage">min\_size : { y : [Int](#), x : [Int](#) }</code><br/></span>
            <span class="small_desc_flat">The window minimum size `(read/write)`</span>



<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="swap"><a class="lift" href="#swap">swap</a></a> <div class="clear"></div><code class="signature apipage">swap() : [Void](#)</code><br/><span class="small_desc_flat">Swap the back buffer of the window, call after rendering to update the window view</span>
        </span>
    <span class="method apipage">
            <a name="destroy"><a class="lift" href="#destroy">destroy</a></a> <div class="clear"></div><code class="signature apipage">destroy() : [Void](#)</code><br/><span class="small_desc_flat">Destroy the window. To recreate it create must be used, show will not work.</span>
        </span>
    <span class="method apipage">
            <a name="close"><a class="lift" href="#close">close</a></a> <div class="clear"></div><code class="signature apipage">close() : [Void](#)</code><br/><span class="small_desc_flat">Close the window, hiding it (not destroying it). Calling show() will unhide it.</span>
        </span>
    <span class="method apipage">
            <a name="show"><a class="lift" href="#show">show</a></a> <div class="clear"></div><code class="signature apipage">show() : [Void](#)</code><br/><span class="small_desc_flat">Show the window, unhiding it. If destroyed, nothing happens.</span>
        </span>
    <span class="method apipage">
            <a name="simple_message"><a class="lift" href="#simple_message">simple\_message</a></a> <div class="clear"></div><code class="signature apipage">simple\_message(message:[String](#)<span></span>, title:[String](#)<span>=&#x27;&#x27;</span>) : [Void](#)</code><br/><span class="small_desc_flat">Display a cross platform message on this window</span>
        </span>
    <span class="method apipage">
            <a name="set_cursor_position"><a class="lift" href="#set_cursor_position">set\_cursor\_position</a></a> <div class="clear"></div><code class="signature apipage">set\_cursor\_position(\_x:[Int](#)<span></span>, \_y:[Int](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_position"><a class="lift" href="#set_position">set\_position</a></a> <div class="clear"></div><code class="signature apipage">set\_position(\_x:[Int](#)<span></span>, \_y:[Int](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_size"><a class="lift" href="#set_size">set\_size</a></a> <div class="clear"></div><code class="signature apipage">set\_size(\_width:[Int](#)<span></span>, \_height:[Int](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a> <div class="clear"></div><code class="signature apipage">new(\_manager:[snow.window.Windowing](#)<span></span>, \_config:[snow.types.WindowConfig](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    





---

&nbsp;
&nbsp;
&nbsp;
&nbsp;
