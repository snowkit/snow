
[![Logo](../../../images/logo.png)](../../../api/index.html)

---



<h1>TouchEvent</h1>

Information about a touch event

`raw` : The raw event from the system, unmodified   
`state` : The state this touch event is in   
`timestamp` : The time in seconds when this touch event occurred, use for deltas   
`touch_id` : The id of the touch that this event comes from, a finger id   
`device_id` : The device id this touch comes from   
`x` : The x position in the window of the touch event   
`y` : The x position in the window of the touch event   
`dx` : The delta x value of the touch event, if the state is `moving`   
`dy` : The delta y value of the touch event, if the state is `moving`   
`pressure` : The pressure value of the touch event, where available

---

`typedef`
<span class="meta">

</span>


---

&nbsp;
&nbsp;

<h3>Members</h3> <hr/><span class="member apipage">
            <a name="device_id"><a class="lift" href="#device_id">device\_id</a></a><code class="signature apipage">device\_id : [Int](http://api.haxe.org/Int.html)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="dx"><a class="lift" href="#dx">dx</a></a><code class="signature apipage">dx : [Float](http://api.haxe.org/Float.html)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="dy"><a class="lift" href="#dy">dy</a></a><code class="signature apipage">dy : [Float](http://api.haxe.org/Float.html)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="pressure"><a class="lift" href="#pressure">pressure</a></a><code class="signature apipage">pressure : [Float](http://api.haxe.org/Float.html)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="raw"><a class="lift" href="#raw">raw</a></a><code class="signature apipage">raw : [lumen.types.InputEvent](#lumen.types.InputEvent)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="state"><a class="lift" href="#state">state</a></a><code class="signature apipage">state : [lumen.types.TouchState](#lumen.types.TouchState)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="timestamp"><a class="lift" href="#timestamp">timestamp</a></a><code class="signature apipage">timestamp : [Float](http://api.haxe.org/Float.html)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="touch_id"><a class="lift" href="#touch_id">touch\_id</a></a><code class="signature apipage">touch\_id : [Int](http://api.haxe.org/Int.html)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="x"><a class="lift" href="#x">x</a></a><code class="signature apipage">x : [Float](http://api.haxe.org/Float.html)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="y"><a class="lift" href="#y">y</a></a><code class="signature apipage">y : [Float](http://api.haxe.org/Float.html)</code><br/></span>
        <span class="small_desc_flat"></span>

<h3>Methods</h3> <hr/>no public methods

<h3>Properties</h3> <hr/>no public properties

&nbsp;
&nbsp;
&nbsp;