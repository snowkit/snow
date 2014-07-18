
[![Logo](../../../images/logo.png)](../../../api/index.html)

---



<h1>Input</h1>
<small>`snow.input.Input`</small>

Internal input system, accessed via `app.input`

---

`class`

---

&nbsp;
&nbsp;



<h3>Members</h3> <hr/>





<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="keypressed"><a class="lift" href="#keypressed">keypressed</a></a><code class="signature apipage">keypressed(\_code:Int<span></span>) : Bool</code><br/><span class="small_desc_flat">returns true if the `Key` value was pressed in the latest frame</span>
        </span>
    <span class="method apipage">
            <a name="keyreleased"><a class="lift" href="#keyreleased">keyreleased</a></a><code class="signature apipage">keyreleased(\_code:Int<span></span>) : Bool</code><br/><span class="small_desc_flat">returns true if the `Key` value was released in the latest frame</span>
        </span>
    <span class="method apipage">
            <a name="keydown"><a class="lift" href="#keydown">keydown</a></a><code class="signature apipage">keydown(\_code:Int<span></span>) : Bool</code><br/><span class="small_desc_flat">returns true if the `Key` value is down at the time of calling this</span>
        </span>
    <span class="method apipage">
            <a name="dispatch_key_up_event"><a class="lift" href="#dispatch_key_up_event">dispatch\_key\_up\_event</a></a><code class="signature apipage">dispatch\_key\_up\_event(keycode:Int<span></span>, scancode:Int<span></span>, repeat:Bool<span></span>, mod:snow.types.ModState<span></span>, timestamp:Float<span></span>, window\_id:Int<span></span>) : Void</code><br/><span class="small_desc_flat">manually dispatch a keyboard event through the system, delivered to the app handlers, internal and external</span>
        </span>
    <span class="method apipage">
            <a name="dispatch_key_down_event"><a class="lift" href="#dispatch_key_down_event">dispatch\_key\_down\_event</a></a><code class="signature apipage">dispatch\_key\_down\_event(keycode:Int<span></span>, scancode:Int<span></span>, repeat:Bool<span></span>, mod:snow.types.ModState<span></span>, timestamp:Float<span></span>, window\_id:Int<span></span>) : Void</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="dispatch_text_event"><a class="lift" href="#dispatch_text_event">dispatch\_text\_event</a></a><code class="signature apipage">dispatch\_text\_event(text:String<span></span>, start:Int<span></span>, length:Int<span></span>, type:snow.types.TextEventType<span></span>, timestamp:Float<span></span>, window\_id:Int<span></span>) : Void</code><br/><span class="small_desc_flat">manually dispatch a text event through the system, delivered to the app handlers, internal and external</span>
        </span>
    <span class="method apipage">
            <a name="dispatch_mouse_move_event"><a class="lift" href="#dispatch_mouse_move_event">dispatch\_mouse\_move\_event</a></a><code class="signature apipage">dispatch\_mouse\_move\_event(x:Int<span></span>, y:Int<span></span>, xrel:Int<span></span>, yrel:Int<span></span>, timestamp:Float<span></span>, window\_id:Int<span></span>) : Void</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="dispatch_mouse_down_event"><a class="lift" href="#dispatch_mouse_down_event">dispatch\_mouse\_down\_event</a></a><code class="signature apipage">dispatch\_mouse\_down\_event(x:Int<span></span>, y:Int<span></span>, button:Int<span></span>, timestamp:Float<span></span>, window\_id:Int<span></span>) : Void</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="dispatch_mouse_up_event"><a class="lift" href="#dispatch_mouse_up_event">dispatch\_mouse\_up\_event</a></a><code class="signature apipage">dispatch\_mouse\_up\_event(x:Int<span></span>, y:Int<span></span>, button:Int<span></span>, timestamp:Float<span></span>, window\_id:Int<span></span>) : Void</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="dispatch_mouse_wheel_event"><a class="lift" href="#dispatch_mouse_wheel_event">dispatch\_mouse\_wheel\_event</a></a><code class="signature apipage">dispatch\_mouse\_wheel\_event(x:Int<span></span>, y:Int<span></span>, timestamp:Float<span></span>, window\_id:Int<span></span>) : Void</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="dispatch_touch_down_event"><a class="lift" href="#dispatch_touch_down_event">dispatch\_touch\_down\_event</a></a><code class="signature apipage">dispatch\_touch\_down\_event(x:Float<span></span>, y:Float<span></span>, touch\_id:Int<span></span>, timestamp:Float<span></span>) : Void</code><br/><span class="small_desc_flat">manually dispatch a touch event through the system, delivered to the app handlers, internal and external</span>
        </span>
    <span class="method apipage">
            <a name="dispatch_touch_up_event"><a class="lift" href="#dispatch_touch_up_event">dispatch\_touch\_up\_event</a></a><code class="signature apipage">dispatch\_touch\_up\_event(x:Float<span></span>, y:Float<span></span>, touch\_id:Int<span></span>, timestamp:Float<span></span>) : Void</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="dispatch_touch_move_event"><a class="lift" href="#dispatch_touch_move_event">dispatch\_touch\_move\_event</a></a><code class="signature apipage">dispatch\_touch\_move\_event(x:Float<span></span>, y:Float<span></span>, dx:Float<span></span>, dy:Float<span></span>, touch\_id:Int<span></span>, timestamp:Float<span></span>) : Void</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="dispatch_gamepad_axis_event"><a class="lift" href="#dispatch_gamepad_axis_event">dispatch\_gamepad\_axis\_event</a></a><code class="signature apipage">dispatch\_gamepad\_axis\_event(gamepad:Int<span></span>, axis:Int<span></span>, value:Float<span></span>, timestamp:Float<span></span>) : Void</code><br/><span class="small_desc_flat">manually dispatch a gamepad event through the system, delivered to the app handlers, internal and external</span>
        </span>
    <span class="method apipage">
            <a name="dispatch_gamepad_button_down_event"><a class="lift" href="#dispatch_gamepad_button_down_event">dispatch\_gamepad\_button\_down\_event</a></a><code class="signature apipage">dispatch\_gamepad\_button\_down\_event(gamepad:Int<span></span>, button:Int<span></span>, value:Float<span></span>, timestamp:Float<span></span>) : Void</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="dispatch_gamepad_button_up_event"><a class="lift" href="#dispatch_gamepad_button_up_event">dispatch\_gamepad\_button\_up\_event</a></a><code class="signature apipage">dispatch\_gamepad\_button\_up\_event(gamepad:Int<span></span>, button:Int<span></span>, value:Float<span></span>, timestamp:Float<span></span>) : Void</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="dispatch_gamepad_device_event"><a class="lift" href="#dispatch_gamepad_device_event">dispatch\_gamepad\_device\_event</a></a><code class="signature apipage">dispatch\_gamepad\_device\_event(gamepad:Int<span></span>, type:snow.types.GamepadDeviceEventType<span></span>, timestamp:Float<span></span>) : Void</code><br/><span class="small_desc_flat"></span>
        </span>
    





---

&nbsp;
&nbsp;
&nbsp;
&nbsp;