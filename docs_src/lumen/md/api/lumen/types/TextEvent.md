
[![Logo](../../../images/logo.png)](../../../api/index.html)

---



<h1>TextEvent</h1>

Information about a text input event

`raw` : The raw event from the system, unmodified   
`text` : The text that this event has generated   
`type` : The type of text event   
`timestamp` : The time in seconds when this touch event occurred, use for deltas   
`window_id` : The window id this event originated from   
`start` : The start position, if the `type` is `edit`   
`length` : The length position, if the `type` is `edit`

---

`typedef`
<span class="meta">

</span>


---

&nbsp;
&nbsp;

<h3>Members</h3> <hr/><span class="member apipage">
            <a name="length"><a class="lift" href="#length">length</a></a><code class="signature apipage">length : [Int](http://api.haxe.org/Int.html)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="raw"><a class="lift" href="#raw">raw</a></a><code class="signature apipage">raw : [lumen.types.InputEvent](#lumen.types.InputEvent)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="start"><a class="lift" href="#start">start</a></a><code class="signature apipage">start : [Int](http://api.haxe.org/Int.html)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="text"><a class="lift" href="#text">text</a></a><code class="signature apipage">text : [String](http://api.haxe.org/String.html)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="timestamp"><a class="lift" href="#timestamp">timestamp</a></a><code class="signature apipage">timestamp : [Float](http://api.haxe.org/Float.html)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="type"><a class="lift" href="#type">type</a></a><code class="signature apipage">type : [lumen.types.TextEventType](#lumen.types.TextEventType)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="window_id"><a class="lift" href="#window_id">window\_id</a></a><code class="signature apipage">window\_id : [Int](http://api.haxe.org/Int.html)</code><br/></span>
        <span class="small_desc_flat"></span>

<h3>Methods</h3> <hr/>no public methods

<h3>Properties</h3> <hr/>no public properties

&nbsp;
&nbsp;
&nbsp;