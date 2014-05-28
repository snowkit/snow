
[![Logo](../../../images/logo.png)](../../../api/index.html)

---



<h1>KeyEvent</h1>

Information about a keyboard event

`raw` : The raw event from the system, unmodified   
`scancode` : The `lumen.input.Scan` code value for this event   
`keycode` : The `lumen.input.Key` code value for this event   
`state` : The state of the key in this event   
`mod` : The modifier state of this event   
`repeat` : If this value is bigger than 0 this is a key repeat event of a key held down   
`timestamp` : The time in seconds when this touch event occurred, use for deltas   
`window_id` : The window id this event originated from

---

`typedef`
<span class="meta">

</span>


---

&nbsp;
&nbsp;

<h3>Members</h3> <hr/><span class="member apipage">
            <a name="keycode"><a class="lift" href="#keycode">keycode</a></a><code class="signature apipage">keycode : [Int](http://api.haxe.org/Int.html)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="mod"><a class="lift" href="#mod">mod</a></a><code class="signature apipage">mod : [lumen.types.ModState](#lumen.types.ModState)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="raw"><a class="lift" href="#raw">raw</a></a><code class="signature apipage">raw : [lumen.types.InputEvent](#lumen.types.InputEvent)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="repeat"><a class="lift" href="#repeat">repeat</a></a><code class="signature apipage">repeat : [Bool](http://api.haxe.org/Bool.html)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="scancode"><a class="lift" href="#scancode">scancode</a></a><code class="signature apipage">scancode : [Int](http://api.haxe.org/Int.html)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="state"><a class="lift" href="#state">state</a></a><code class="signature apipage">state : [lumen.types.PressedState](#lumen.types.PressedState)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="timestamp"><a class="lift" href="#timestamp">timestamp</a></a><code class="signature apipage">timestamp : [Float](http://api.haxe.org/Float.html)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="window_id"><a class="lift" href="#window_id">window\_id</a></a><code class="signature apipage">window\_id : [Int](http://api.haxe.org/Int.html)</code><br/></span>
        <span class="small_desc_flat"></span>

<h3>Methods</h3> <hr/>no public methods

<h3>Properties</h3> <hr/>no public properties

&nbsp;
&nbsp;
&nbsp;