
[![Logo](../../../images/logo.png)](../../../api/index.html)

---



<h1>InputSystemBinding</h1>
<small>`snow.input.InputSystemBinding`</small>

Internal input system, accessed through `snow.Input`, not directly

---

`class`<br/>implements <code><span>snow.utils.AbstractClass</span></code>
<span class="meta">
<br/>meta: @:build(&#x27;???&#x27;), @:autoBuild(&#x27;???&#x27;), @:noCompletion
</span>


---

&nbsp;
&nbsp;



<h3>Members</h3> <hr/>





<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="init"><a class="lift" href="#init">init</a></a> <div class="clear"></div><code class="signature apipage">init() : [Void](#)</code><br/><span class="small_desc_flat">Called when the input manager initiates this system</span>
        </span>
    <span class="method apipage">
            <a name="process"><a class="lift" href="#process">process</a></a> <div class="clear"></div><code class="signature apipage">process() : [Void](#)</code><br/><span class="small_desc_flat">Called when the input manager updates this system</span>
        </span>
    <span class="method apipage">
            <a name="destroy"><a class="lift" href="#destroy">destroy</a></a> <div class="clear"></div><code class="signature apipage">destroy() : [Void](#)</code><br/><span class="small_desc_flat">Called when the input manager destroys this system</span>
        </span>
    <span class="method apipage">
            <a name="on_event"><a class="lift" href="#on_event">on\_event</a></a> <div class="clear"></div><code class="signature apipage">on\_event(\_event:[snow.types.InputEvent](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat">Called when the input manager forwards an event to this system</span>
        </span>
    <span class="method apipage">
            <a name="gamepad_add"><a class="lift" href="#gamepad_add">gamepad\_add</a></a> <div class="clear"></div><code class="signature apipage">gamepad\_add(id:[Int](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat">Open a gamepad with this id</span>
        </span>
    <span class="method apipage">
            <a name="gamepad_remove"><a class="lift" href="#gamepad_remove">gamepad\_remove</a></a> <div class="clear"></div><code class="signature apipage">gamepad\_remove(id:[Int](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat">Close a gamepad with this id</span>
        </span>
    





---

&nbsp;
&nbsp;
&nbsp;
&nbsp;