
[![Logo](../../../images/logo.png)](../../../api/index.html)

---



#MouseEvent

Information about a mouse event \n\n`raw` : The raw event from the system, unmodified   \n`timestamp` : The time in seconds when this touch event occurred, use for deltas   \n`window_id` : The window id this event originated from    \n`which` : Which mouse this event originated from (usually 0)   \n`state` : The state this event is in   \n`button` : The button id, if the event `state` is `down` or `up`   \n`x` : The x position in the window of the mouse event   \n`y` : The y position in the window of the mouse event   \n`xrel` : The relative x position if `state` is `move` or a window has grabbed state   \n`yrel` : The relative y position if `state` is `move` or a window has grabbed state

---

`typedef`
<span class="meta">

</span>


---

&nbsp;
&nbsp;

<h3>Members</h3> <hr/><span class="member apipage">
            <a name="button"><a class="lift" href="#button">button</a></a><code class="signature apipage">button : [lumen.types.MouseButton](#lumen.types.MouseButton)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="raw"><a class="lift" href="#raw">raw</a></a><code class="signature apipage">raw : [lumen.types.InputEvent](#lumen.types.InputEvent)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="state"><a class="lift" href="#state">state</a></a><code class="signature apipage">state : [lumen.types.MouseState](#lumen.types.MouseState)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="timestamp"><a class="lift" href="#timestamp">timestamp</a></a><code class="signature apipage">timestamp : [Float](http://api.haxe.org/Float.html)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="which"><a class="lift" href="#which">which</a></a><code class="signature apipage">which : [Int](http://api.haxe.org/Int.html)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="window_id"><a class="lift" href="#window_id">window\_id</a></a><code class="signature apipage">window\_id : [Int](http://api.haxe.org/Int.html)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="x"><a class="lift" href="#x">x</a></a><code class="signature apipage">x : [Int](http://api.haxe.org/Int.html)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="xrel"><a class="lift" href="#xrel">xrel</a></a><code class="signature apipage">xrel : [Int](http://api.haxe.org/Int.html)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="y"><a class="lift" href="#y">y</a></a><code class="signature apipage">y : [Int](http://api.haxe.org/Int.html)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="yrel"><a class="lift" href="#yrel">yrel</a></a><code class="signature apipage">yrel : [Int](http://api.haxe.org/Int.html)</code><br/></span>
        <span class="small_desc_flat"></span>

<h3>Methods</h3> <hr/>no public methods

<h3>Properties</h3> <hr/>no public properties

&nbsp;
&nbsp;
&nbsp;