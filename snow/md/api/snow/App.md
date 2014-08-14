
[![Logo](../../images/logo.png)](../../api/index.html)

---



<h1>App</h1>
<small>`snow.App`</small>

The default type of snow application, with variable delta, update limit, render limit, timescale and more. 
    See the {App Guide} for complete details.

---

`class`

---

&nbsp;
&nbsp;



<h3>Members</h3> <hr/><span class="member apipage">
                <a name="app"><a class="lift" href="#app">app</a></a><div class="clear"></div><code class="signature apipage">app : [snow.Snow](#)</code><br/></span>
            <span class="small_desc_flat">use this to access the api features. *i.e* `app.assets.text(_id)`</span><span class="member apipage">
                <a name="timescale"><a class="lift" href="#timescale">timescale</a></a><div class="clear"></div><code class="signature apipage">timescale : [Float](#)</code><br/></span>
            <span class="small_desc_flat">the scale of time</span><span class="member apipage">
                <a name="fixed_delta"><a class="lift" href="#fixed_delta">fixed\_delta</a></a><div class="clear"></div><code class="signature apipage">fixed\_delta : [Float](#)</code><br/></span>
            <span class="small_desc_flat">if this is non zero this will be passed in</span><span class="member apipage">
                <a name="render_rate"><a class="lift" href="#render_rate">render\_rate</a></a><div class="clear"></div><code class="signature apipage">render\_rate : [Float](#)</code><br/></span>
            <span class="small_desc_flat">if this is non zero, rendering will be forced to this rate</span><span class="member apipage">
                <a name="update_rate"><a class="lift" href="#update_rate">update\_rate</a></a><div class="clear"></div><code class="signature apipage">update\_rate : [Float](#)</code><br/></span>
            <span class="small_desc_flat">if this is non zero, updates will be forced to this rate</span><span class="member apipage">
                <a name="max_frame_time"><a class="lift" href="#max_frame_time">max\_frame\_time</a></a><div class="clear"></div><code class="signature apipage">max\_frame\_time : [Float](#)</code><br/></span>
            <span class="small_desc_flat">the maximum frame time</span><span class="member apipage">
                <a name="delta_time"><a class="lift" href="#delta_time">delta\_time</a></a><div class="clear"></div><code class="signature apipage">delta\_time : [Float](#)</code><br/></span>
            <span class="small_desc_flat">the time the last frame took to run</span><span class="member apipage">
                <a name="delta_sim"><a class="lift" href="#delta_sim">delta\_sim</a></a><div class="clear"></div><code class="signature apipage">delta\_sim : [Float](#)</code><br/></span>
            <span class="small_desc_flat">the simulated time the last frame took to run, relative to scale etc</span><span class="member apipage">
                <a name="last_frame_start"><a class="lift" href="#last_frame_start">last\_frame\_start</a></a><div class="clear"></div><code class="signature apipage">last\_frame\_start : [Float](#)</code><br/></span>
            <span class="small_desc_flat">the start time of the last frame</span><span class="member apipage">
                <a name="current_time"><a class="lift" href="#current_time">current\_time</a></a><div class="clear"></div><code class="signature apipage">current\_time : [Float](#)</code><br/></span>
            <span class="small_desc_flat">the current simulation time</span><span class="member apipage">
                <a name="cur_frame_start"><a class="lift" href="#cur_frame_start">cur\_frame\_start</a></a><div class="clear"></div><code class="signature apipage">cur\_frame\_start : [Float](#)</code><br/></span>
            <span class="small_desc_flat">the start time of this frame</span><span class="member apipage">
                <a name="alpha"><a class="lift" href="#alpha">alpha</a></a><div class="clear"></div><code class="signature apipage">alpha : [Float](#)</code><br/></span>
            <span class="small_desc_flat">the alpha time for a render between frame updates</span>





<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="config"><a class="lift" href="#config">config</a></a> <div class="clear"></div><code class="signature apipage">config(config:[snow.types.AppConfig](#)<span></span>) : [snow.types.AppConfig](#)</code><br/><span class="small_desc_flat">Called by snow to request config changes, override this to change the defaults.
            This happens before ready, so the values are available when ready is called.</span>
        </span>
    <span class="method apipage">
            <a name="ready"><a class="lift" href="#ready">ready</a></a> <div class="clear"></div><code class="signature apipage">ready() : [Void](#)</code><br/><span class="small_desc_flat">Your entry point. Called for you when you can initialize your application</span>
        </span>
    <span class="method apipage">
            <a name="update"><a class="lift" href="#update">update</a></a> <div class="clear"></div><code class="signature apipage">update(dt:[Float](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat">Your update loop. Called every frame for you. The dt value depends on the timing configuration (see the {App Guide})</span>
        </span>
    <span class="method apipage">
            <a name="destroyed"><a class="lift" href="#destroyed">destroyed</a></a> <div class="clear"></div><code class="signature apipage">destroyed() : [Void](#)</code><br/><span class="small_desc_flat">Your exit point. Called for you when you should shut down your application</span>
        </span>
    <span class="method apipage">
            <a name="on_event"><a class="lift" href="#on_event">on\_event</a></a> <div class="clear"></div><code class="signature apipage">on\_event(event:[snow.types.SystemEvent](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat">Low level event handler from snow core. Often handled by the subsystems so check there first.</span>
        </span>
    <span class="method apipage">
            <a name="onkeydown"><a class="lift" href="#onkeydown">onkeydown</a></a> <div class="clear"></div><code class="signature apipage">onkeydown(keycode:[Int](#)<span></span>, scancode:[Int](#)<span></span>, repeat:[Bool](#)<span></span>, mod:[snow.types.ModState](#)<span></span>, timestamp:[Float](#)<span></span>, window\_id:[Int](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat">Called for you when a key is pressed down</span>
        </span>
    <span class="method apipage">
            <a name="onkeyup"><a class="lift" href="#onkeyup">onkeyup</a></a> <div class="clear"></div><code class="signature apipage">onkeyup(keycode:[Int](#)<span></span>, scancode:[Int](#)<span></span>, repeat:[Bool](#)<span></span>, mod:[snow.types.ModState](#)<span></span>, timestamp:[Float](#)<span></span>, window\_id:[Int](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat">Called for you when a key is released</span>
        </span>
    <span class="method apipage">
            <a name="ontextinput"><a class="lift" href="#ontextinput">ontextinput</a></a> <div class="clear"></div><code class="signature apipage">ontextinput(text:[String](#)<span></span>, start:[Int](#)<span></span>, length:[Int](#)<span></span>, type:[snow.types.TextEventType](#)<span></span>, timestamp:[Float](#)<span></span>, window\_id:[Int](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat">Called for you when text input is happening. Use this for textfields, as it handles the complexity of unicode etc.</span>
        </span>
    <span class="method apipage">
            <a name="onmousedown"><a class="lift" href="#onmousedown">onmousedown</a></a> <div class="clear"></div><code class="signature apipage">onmousedown(x:[Int](#)<span></span>, y:[Int](#)<span></span>, button:[Int](#)<span></span>, timestamp:[Float](#)<span></span>, window\_id:[Int](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat">Called for you when a mouse button is pressed</span>
        </span>
    <span class="method apipage">
            <a name="onmouseup"><a class="lift" href="#onmouseup">onmouseup</a></a> <div class="clear"></div><code class="signature apipage">onmouseup(x:[Int](#)<span></span>, y:[Int](#)<span></span>, button:[Int](#)<span></span>, timestamp:[Float](#)<span></span>, window\_id:[Int](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat">Called for you when a mouse button is released</span>
        </span>
    <span class="method apipage">
            <a name="onmousewheel"><a class="lift" href="#onmousewheel">onmousewheel</a></a> <div class="clear"></div><code class="signature apipage">onmousewheel(x:[Int](#)<span></span>, y:[Int](#)<span></span>, timestamp:[Float](#)<span></span>, window\_id:[Int](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat">Called for you when the mouse wheel moves</span>
        </span>
    <span class="method apipage">
            <a name="onmousemove"><a class="lift" href="#onmousemove">onmousemove</a></a> <div class="clear"></div><code class="signature apipage">onmousemove(x:[Int](#)<span></span>, y:[Int](#)<span></span>, xrel:[Int](#)<span></span>, yrel:[Int](#)<span></span>, timestamp:[Float](#)<span></span>, window\_id:[Int](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat">Called for you when the mouse moves</span>
        </span>
    <span class="method apipage">
            <a name="ontouchdown"><a class="lift" href="#ontouchdown">ontouchdown</a></a> <div class="clear"></div><code class="signature apipage">ontouchdown(x:[Float](#)<span></span>, y:[Float](#)<span></span>, touch\_id:[Int](#)<span></span>, timestamp:[Float](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat">Called for you when a touch is released, use the `touch_id` to track which</span>
        </span>
    <span class="method apipage">
            <a name="ontouchup"><a class="lift" href="#ontouchup">ontouchup</a></a> <div class="clear"></div><code class="signature apipage">ontouchup(x:[Float](#)<span></span>, y:[Float](#)<span></span>, touch\_id:[Int](#)<span></span>, timestamp:[Float](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat">Called for you when a touch is first pressed, use the `touch_id` to track which</span>
        </span>
    <span class="method apipage">
            <a name="ontouchmove"><a class="lift" href="#ontouchmove">ontouchmove</a></a> <div class="clear"></div><code class="signature apipage">ontouchmove(x:[Float](#)<span></span>, y:[Float](#)<span></span>, dx:[Float](#)<span></span>, dy:[Float](#)<span></span>, touch\_id:[Int](#)<span></span>, timestamp:[Float](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat">Called for you when a touch is moved, use the `touch_id` to track which</span>
        </span>
    <span class="method apipage">
            <a name="ongamepadaxis"><a class="lift" href="#ongamepadaxis">ongamepadaxis</a></a> <div class="clear"></div><code class="signature apipage">ongamepadaxis(gamepad:[Int](#)<span></span>, axis:[Int](#)<span></span>, value:[Float](#)<span></span>, timestamp:[Float](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat">Called for you when a connected gamepad axis moves, use `which` to determine gamepad id</span>
        </span>
    <span class="method apipage">
            <a name="ongamepadbuttondown"><a class="lift" href="#ongamepadbuttondown">ongamepadbuttondown</a></a> <div class="clear"></div><code class="signature apipage">ongamepadbuttondown(gamepad:[Int](#)<span></span>, button:[Int](#)<span></span>, value:[Float](#)<span></span>, timestamp:[Float](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat">Called for you when a connected gamepad button is pressed, use `which` to determine gamepad id</span>
        </span>
    <span class="method apipage">
            <a name="ongamepadbuttonup"><a class="lift" href="#ongamepadbuttonup">ongamepadbuttonup</a></a> <div class="clear"></div><code class="signature apipage">ongamepadbuttonup(gamepad:[Int](#)<span></span>, button:[Int](#)<span></span>, value:[Float](#)<span></span>, timestamp:[Float](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat">Called for you when a connected gamepad button is released, use `which` to determine gamepad id</span>
        </span>
    <span class="method apipage">
            <a name="ongamepaddevice"><a class="lift" href="#ongamepaddevice">ongamepaddevice</a></a> <div class="clear"></div><code class="signature apipage">ongamepaddevice(gamepad:[Int](#)<span></span>, type:[snow.types.GamepadDeviceEventType](#)<span></span>, timestamp:[Float](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat">Called for you when a gamepad is connected or disconnected, use `which` to determine gamepad id</span>
        </span>
    <span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a> <div class="clear"></div><code class="signature apipage">new() : [Void](#)</code><br/><span class="small_desc_flat">The default constructor of an App is empty, so you can override it if you want, but take note that this happens way before snow is ready for use. Use [ready](#ready) for entry point.</span>
        </span>
    





---

&nbsp;
&nbsp;
&nbsp;
&nbsp;
