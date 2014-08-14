
[![Logo](../../../images/logo.png)](../../../api/index.html)

---



<h1>InputEvent</h1>
<small>`snow.types.InputEvent`</small>

A system input event

---

`typedef`

---

&nbsp;
&nbsp;



<h3>Members</h3> <hr/><span class="member apipage">
                <a name="window_id"><a class="lift" href="#window_id">window\_id</a></a><div class="clear"></div><code class="signature apipage">window\_id : [Null](#)&lt;[Int](#)&gt;</code><br/></span>
            <span class="small_desc_flat">The window id from which this event originated</span><span class="member apipage">
                <a name="type"><a class="lift" href="#type">type</a></a><div class="clear"></div><code class="signature apipage">type : [snow.types.InputEventType](#)</code><br/></span>
            <span class="small_desc_flat">The type of input event this was</span><span class="member apipage">
                <a name="timestamp"><a class="lift" href="#timestamp">timestamp</a></a><div class="clear"></div><code class="signature apipage">timestamp : [Null](#)&lt;[Float](#)&gt;</code><br/></span>
            <span class="small_desc_flat">The time in seconds that this event occured, useful for deltas</span><span class="member apipage">
                <a name="event"><a class="lift" href="#event">event</a></a><div class="clear"></div><code class="signature apipage">event : [Dynamic](#)</code><br/></span>
            <span class="small_desc_flat">The raw platform event data, only useful if you are implementing
            a new platform or lack access to data from the system that snow does not expose</span>







---

&nbsp;
&nbsp;
&nbsp;
&nbsp;
