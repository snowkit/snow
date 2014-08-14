
[![Logo](../../images/logo.png)](../../api/index.html)

---



<h1>AppFixedTimestep</h1>
<small>`snow.AppFixedTimestep`</small>

Read the {App Guide} for full info, and for even more information see : http://gafferongames.com/game-physics/fix-your-timestep/
    this stores and calculates a fixed game update loop, and rendering interpolation is required
    for smooth updates between frames.

---

`class`extends <code><span>snow.App</span></code>

---

&nbsp;
&nbsp;



<h3>Members</h3> <hr/><span class="member apipage">
                <a name="frame_time"><a class="lift" href="#frame_time">frame\_time</a></a><div class="clear"></div><code class="signature apipage">frame\_time : [Float](#)</code><br/></span>
            <span class="small_desc_flat">fixed simulation update speed</span><span class="member apipage">
                <a name="overflow"><a class="lift" href="#overflow">overflow</a></a><div class="clear"></div><code class="signature apipage">overflow : [Float](#)</code><br/></span>
            <span class="small_desc_flat">the overflow of the updates. This is used internally, for you, to calculate the alpha time for rendering interpolation as follows `alpha = overflow / frame_time;`</span>





<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a> <div class="clear"></div><code class="signature apipage">new() : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    





---

&nbsp;
&nbsp;
&nbsp;
&nbsp;
