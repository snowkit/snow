
[![Logo](../../../images/logo.png)](../../../api/index.html)

---



#Input

Internal input system, accessed via `app.input`

---

`class`
<span class="meta">

</span>


---

&nbsp;
&nbsp;

<h3>Members</h3> <hr/>

<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="dispatch_gamepad_event"><a class="lift" href="#dispatch_gamepad_event">dispatch\_gamepad\_event</a></a><code class="signature apipage">dispatch\_gamepad\_event(\_event:<span>[lumen.types.GamepadEvent](#lumen.types.GamepadEvent)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">manually dispatch a gamepad event through the system, delivered to the app handlers, internal and external</span>
        </span>
    <span class="method apipage">
            <a name="dispatch_key_event"><a class="lift" href="#dispatch_key_event">dispatch\_key\_event</a></a><code class="signature apipage">dispatch\_key\_event(\_event:<span>[lumen.types.KeyEvent](#lumen.types.KeyEvent)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">manually dispatch a keyboard event through the system, delivered to the app handlers, internal and external</span>
        </span>
    <span class="method apipage">
            <a name="dispatch_mouse_event"><a class="lift" href="#dispatch_mouse_event">dispatch\_mouse\_event</a></a><code class="signature apipage">dispatch\_mouse\_event(\_event:<span>[lumen.types.MouseEvent](#lumen.types.MouseEvent)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">manually dispatch a mouse event through the system, delivered to the app handlers, internal and external</span>
        </span>
    <span class="method apipage">
            <a name="dispatch_text_event"><a class="lift" href="#dispatch_text_event">dispatch\_text\_event</a></a><code class="signature apipage">dispatch\_text\_event(\_event:<span>[lumen.types.TextEvent](#lumen.types.TextEvent)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">manually dispatch a text event through the system, delivered to the app handlers, internal and external</span>
        </span>
    <span class="method apipage">
            <a name="dispatch_touch_event"><a class="lift" href="#dispatch_touch_event">dispatch\_touch\_event</a></a><code class="signature apipage">dispatch\_touch\_event(\_event:<span>[lumen.types.TouchEvent](#lumen.types.TouchEvent)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">manually dispatch a touch event through the system, delivered to the app handlers, internal and external</span>
        </span>
    <span class="method apipage">
            <a name="keydown"><a class="lift" href="#keydown">keydown</a></a><code class="signature apipage">keydown(\_code:<span>[Int](http://api.haxe.org/Int.html)</span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat">returns true if the `Key` value is down at the time of calling this</span>
        </span>
    <span class="method apipage">
            <a name="keypressed"><a class="lift" href="#keypressed">keypressed</a></a><code class="signature apipage">keypressed(\_code:<span>[Int](http://api.haxe.org/Int.html)</span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat">returns true if the `Key` value was pressed in the latest frame</span>
        </span>
    <span class="method apipage">
            <a name="keyreleased"><a class="lift" href="#keyreleased">keyreleased</a></a><code class="signature apipage">keyreleased(\_code:<span>[Int](http://api.haxe.org/Int.html)</span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat">returns true if the `Key` value was released in the latest frame</span>
        </span>
    <span class="method apipage">
            <a name="mod_state_from_event"><a class="lift" href="#mod_state_from_event">mod\_state\_from\_event</a></a><code class="signature apipage">mod\_state\_from\_event(event:<span>[lumen.types.InputEvent](#lumen.types.InputEvent)</span>) : [lumen.types.ModState](#lumen.types.ModState)</code><br/><span class="small_desc_flat">Helper to return a `ModState` (shift, ctrl etc) from a given `InputEvent`</span>
        </span>
    

<h3>Properties</h3> <hr/>no public properties

&nbsp;
&nbsp;
&nbsp;