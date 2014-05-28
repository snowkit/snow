
[![Logo](../../images/logo.png)](../../api/index.html)

---



<h1>AppFixedTimestep</h1>

Read the {App Guide} for full info, and for even more information see : http://gafferongames.com/game-physics/fix-your-timestep/
    this stores and calculates a fixed game update loop, and rendering interpolation is required
    for smooth updates between frames.

---

`class`extends <code><span>[lumen.App]()</span></code>
<span class="meta">

</span>


---

&nbsp;
&nbsp;

<h3>Members</h3> <hr/><span class="member apipage">
            <a name="frame_time"><a class="lift" href="#frame_time">frame\_time</a></a><code class="signature apipage">frame\_time : [Float](http://api.haxe.org/Float.html)</code><br/></span>
        <span class="small_desc_flat">fixed simulation update speed</span><span class="member apipage">
            <a name="overflow"><a class="lift" href="#overflow">overflow</a></a><code class="signature apipage">overflow : [Float](http://api.haxe.org/Float.html)</code><br/></span>
        <span class="small_desc_flat">the overflow of the updates. This is used to calculate the alpha time for rendering interpolation, `var alpha_time = overflow / frame_time;`</span><span class="member apipage">
            <a name="app"><a class="lift" href="#app">app</a></a><a title="inherited from lumen.App" class="tooltip inherited">&gt;</a><code class="signature apipage">app : [lumen.Lumen](#lumen.Lumen)</code><br/></span>
        <span class="small_desc_flat">use this to access the api features. *i.e* `app.assets.get_text(_id)`</span><span class="member apipage">
            <a name="cur_frame_start"><a class="lift" href="#cur_frame_start">cur\_frame\_start</a></a><a title="inherited from lumen.App" class="tooltip inherited">&gt;</a><code class="signature apipage">cur\_frame\_start : [Float](http://api.haxe.org/Float.html)</code><br/></span>
        <span class="small_desc_flat">the start time of this frame</span><span class="member apipage">
            <a name="current_time"><a class="lift" href="#current_time">current\_time</a></a><a title="inherited from lumen.App" class="tooltip inherited">&gt;</a><code class="signature apipage">current\_time : [Float](http://api.haxe.org/Float.html)</code><br/></span>
        <span class="small_desc_flat">the current simulation time</span><span class="member apipage">
            <a name="delta_sim"><a class="lift" href="#delta_sim">delta\_sim</a></a><a title="inherited from lumen.App" class="tooltip inherited">&gt;</a><code class="signature apipage">delta\_sim : [Float](http://api.haxe.org/Float.html)</code><br/></span>
        <span class="small_desc_flat">the simulated time the last frame took to run, relative to scale etc</span><span class="member apipage">
            <a name="delta_time"><a class="lift" href="#delta_time">delta\_time</a></a><a title="inherited from lumen.App" class="tooltip inherited">&gt;</a><code class="signature apipage">delta\_time : [Float](http://api.haxe.org/Float.html)</code><br/></span>
        <span class="small_desc_flat">the time the last frame took to run</span><span class="member apipage">
            <a name="fixed_delta"><a class="lift" href="#fixed_delta">fixed\_delta</a></a><a title="inherited from lumen.App" class="tooltip inherited">&gt;</a><code class="signature apipage">fixed\_delta : [Float](http://api.haxe.org/Float.html)</code><br/></span>
        <span class="small_desc_flat">if this is non zero this will be passed in</span><span class="member apipage">
            <a name="fixed_rate"><a class="lift" href="#fixed_rate">fixed\_rate</a></a><a title="inherited from lumen.App" class="tooltip inherited">&gt;</a><code class="signature apipage">fixed\_rate : [Float](http://api.haxe.org/Float.html)</code><br/></span>
        <span class="small_desc_flat">if this is non zero, updates will be forced to this rate</span><span class="member apipage">
            <a name="last_frame_start"><a class="lift" href="#last_frame_start">last\_frame\_start</a></a><a title="inherited from lumen.App" class="tooltip inherited">&gt;</a><code class="signature apipage">last\_frame\_start : [Float](http://api.haxe.org/Float.html)</code><br/></span>
        <span class="small_desc_flat">the start time of the last frame</span><span class="member apipage">
            <a name="max_frame_time"><a class="lift" href="#max_frame_time">max\_frame\_time</a></a><a title="inherited from lumen.App" class="tooltip inherited">&gt;</a><code class="signature apipage">max\_frame\_time : [Float](http://api.haxe.org/Float.html)</code><br/></span>
        <span class="small_desc_flat">the maximum frame time</span><span class="member apipage">
            <a name="timescale"><a class="lift" href="#timescale">timescale</a></a><a title="inherited from lumen.App" class="tooltip inherited">&gt;</a><code class="signature apipage">timescale : [Float](http://api.haxe.org/Float.html)</code><br/></span>
        <span class="small_desc_flat">the scale of time</span>

<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a><a title="inherited from lumen.App" class="tooltip inherited">&gt;</a><code class="signature apipage">new() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="get_asset_list"><a class="lift" href="#get_asset_list">get\_asset\_list</a></a><a title="inherited from lumen.App" class="tooltip inherited">&gt;</a><code class="signature apipage">get\_asset\_list() : [Array](http://api.haxe.org/Array.html)&lt;[lumen.types.AssetInfo](#lumen.types.AssetInfo)&gt;</code><br/><span class="small_desc_flat">override this if you want to change how the asset list is loaded/handled. By default it uses the asset manifest generated by the build tools.</span>
        </span>
    <span class="method apipage">
            <a name="get_runtime_config"><a class="lift" href="#get_runtime_config">get\_runtime\_config</a></a><a title="inherited from lumen.App" class="tooltip inherited">&gt;</a><code class="signature apipage">get\_runtime\_config() : [Dynamic](http://api.haxe.org/Dynamic.html)</code><br/><span class="small_desc_flat">override this if you want to change how the runtime config is loaded/handled</span>
        </span>
    <span class="method apipage">
            <a name="ongamepadaxis"><a class="lift" href="#ongamepadaxis">ongamepadaxis</a></a><a title="inherited from lumen.App" class="tooltip inherited">&gt;</a><code class="signature apipage">ongamepadaxis(\_event:<span>[lumen.types.GamepadEvent](#lumen.types.GamepadEvent)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Called for you when a connected gamepad axis moves, use `which` to determine gamepad id</span>
        </span>
    <span class="method apipage">
            <a name="ongamepadbuttondown"><a class="lift" href="#ongamepadbuttondown">ongamepadbuttondown</a></a><a title="inherited from lumen.App" class="tooltip inherited">&gt;</a><code class="signature apipage">ongamepadbuttondown(\_event:<span>[lumen.types.GamepadEvent](#lumen.types.GamepadEvent)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Called for you when a connected gamepad button is pressed, use `which` to determine gamepad id</span>
        </span>
    <span class="method apipage">
            <a name="ongamepadbuttonup"><a class="lift" href="#ongamepadbuttonup">ongamepadbuttonup</a></a><a title="inherited from lumen.App" class="tooltip inherited">&gt;</a><code class="signature apipage">ongamepadbuttonup(\_event:<span>[lumen.types.GamepadEvent](#lumen.types.GamepadEvent)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Called for you when a connected gamepad button is released, use `which` to determine gamepad id</span>
        </span>
    <span class="method apipage">
            <a name="ongamepaddevice"><a class="lift" href="#ongamepaddevice">ongamepaddevice</a></a><a title="inherited from lumen.App" class="tooltip inherited">&gt;</a><code class="signature apipage">ongamepaddevice(\_event:<span>[lumen.types.GamepadEvent](#lumen.types.GamepadEvent)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Called for you when a gamepad is connected or disconnected, use `which` to determine gamepad id</span>
        </span>
    <span class="method apipage">
            <a name="onkeydown"><a class="lift" href="#onkeydown">onkeydown</a></a><a title="inherited from lumen.App" class="tooltip inherited">&gt;</a><code class="signature apipage">onkeydown(\_event:<span>[lumen.types.KeyEvent](#lumen.types.KeyEvent)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Called for you when a key is pressed down</span>
        </span>
    <span class="method apipage">
            <a name="onkeyup"><a class="lift" href="#onkeyup">onkeyup</a></a><a title="inherited from lumen.App" class="tooltip inherited">&gt;</a><code class="signature apipage">onkeyup(\_event:<span>[lumen.types.KeyEvent](#lumen.types.KeyEvent)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Called for you when a key is released</span>
        </span>
    <span class="method apipage">
            <a name="onmousedown"><a class="lift" href="#onmousedown">onmousedown</a></a><a title="inherited from lumen.App" class="tooltip inherited">&gt;</a><code class="signature apipage">onmousedown(\_event:<span>[lumen.types.MouseEvent](#lumen.types.MouseEvent)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Called for you when a mouse button is pressed</span>
        </span>
    <span class="method apipage">
            <a name="onmousemove"><a class="lift" href="#onmousemove">onmousemove</a></a><a title="inherited from lumen.App" class="tooltip inherited">&gt;</a><code class="signature apipage">onmousemove(\_event:<span>[lumen.types.MouseEvent](#lumen.types.MouseEvent)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Called for you when the mouse moves</span>
        </span>
    <span class="method apipage">
            <a name="onmouseup"><a class="lift" href="#onmouseup">onmouseup</a></a><a title="inherited from lumen.App" class="tooltip inherited">&gt;</a><code class="signature apipage">onmouseup(\_event:<span>[lumen.types.MouseEvent](#lumen.types.MouseEvent)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Called for you when a mouse button is released</span>
        </span>
    <span class="method apipage">
            <a name="onmousewheel"><a class="lift" href="#onmousewheel">onmousewheel</a></a><a title="inherited from lumen.App" class="tooltip inherited">&gt;</a><code class="signature apipage">onmousewheel(\_event:<span>[lumen.types.MouseEvent](#lumen.types.MouseEvent)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Called for you when the mouse wheel moves</span>
        </span>
    <span class="method apipage">
            <a name="ontextinput"><a class="lift" href="#ontextinput">ontextinput</a></a><a title="inherited from lumen.App" class="tooltip inherited">&gt;</a><code class="signature apipage">ontextinput(\_event:<span>[lumen.types.TextEvent](#lumen.types.TextEvent)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Called for you when text input is happening. Use this for textfields, as it handles the complexity of unicode etc.</span>
        </span>
    <span class="method apipage">
            <a name="ontouchdown"><a class="lift" href="#ontouchdown">ontouchdown</a></a><a title="inherited from lumen.App" class="tooltip inherited">&gt;</a><code class="signature apipage">ontouchdown(\_event:<span>[lumen.types.TouchEvent](#lumen.types.TouchEvent)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Called for you when a touch is released, use the `touch_id` to track which</span>
        </span>
    <span class="method apipage">
            <a name="ontouchmove"><a class="lift" href="#ontouchmove">ontouchmove</a></a><a title="inherited from lumen.App" class="tooltip inherited">&gt;</a><code class="signature apipage">ontouchmove(\_event:<span>[lumen.types.TouchEvent](#lumen.types.TouchEvent)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Called for you when a touch is moved, use the `touch_id` to track which</span>
        </span>
    <span class="method apipage">
            <a name="ontouchup"><a class="lift" href="#ontouchup">ontouchup</a></a><a title="inherited from lumen.App" class="tooltip inherited">&gt;</a><code class="signature apipage">ontouchup(\_event:<span>[lumen.types.TouchEvent](#lumen.types.TouchEvent)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Called for you when a touch is first pressed, use the `touch_id` to track which</span>
        </span>
    <span class="method apipage">
            <a name="ready"><a class="lift" href="#ready">ready</a></a><a title="inherited from lumen.App" class="tooltip inherited">&gt;</a><code class="signature apipage">ready() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Your entry point. Called for you when you can initialize your application</span>
        </span>
    <span class="method apipage">
            <a name="update"><a class="lift" href="#update">update</a></a><a title="inherited from lumen.App" class="tooltip inherited">&gt;</a><code class="signature apipage">update(dt:<span>[Float](http://api.haxe.org/Float.html)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Your update loop. Called every frame for you. The dt value depends on the timing configuration (see the {App Guide})</span>
        </span>
    

<h3>Properties</h3> <hr/>no public properties

&nbsp;
&nbsp;
&nbsp;