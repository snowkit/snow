
[![Logo](../../images/logo.png)](../../api/index.html)

---



#Lumen



---

`class`
<span class="meta">

</span>


---

&nbsp;
&nbsp;

<h3>Members</h3> <hr/><span class="member apipage">
            <a name="assets"><a class="lift" href="#assets">assets</a></a><code class="signature apipage">assets : [lumen.assets.Assets](#lumen.assets.Assets)</code><br/></span>
        <span class="small_desc_flat">The asset system</span><span class="member apipage">
            <a name="audio"><a class="lift" href="#audio">audio</a></a><code class="signature apipage">audio : [lumen.audio.Audio](#lumen.audio.Audio)</code><br/></span>
        <span class="small_desc_flat">The audio system</span><span class="member apipage">
            <a name="config"><a class="lift" href="#config">config</a></a><code class="signature apipage">config : [lumen.types.LumenConfig](#lumen.types.LumenConfig)</code><br/></span>
        <span class="small_desc_flat">The configuration from the project file, runtime config and other configs</span><span class="member apipage">
            <a name="has_shutdown"><a class="lift" href="#has_shutdown">has\_shutdown</a></a><code class="signature apipage">has\_shutdown : [Bool](http://api.haxe.org/Bool.html)</code><br/></span>
        <span class="small_desc_flat">Set if shut dow has completed</span><span class="member apipage">
            <a name="host"><a class="lift" href="#host">host</a></a><code class="signature apipage">host : [lumen.App](#lumen.App)</code><br/></span>
        <span class="small_desc_flat">The host application</span><span class="member apipage">
            <a name="input"><a class="lift" href="#input">input</a></a><code class="signature apipage">input : [lumen.input.Input](#lumen.input.Input)</code><br/></span>
        <span class="small_desc_flat">The input system</span><span class="member apipage">
            <a name="main_window"><a class="lift" href="#main_window">main\_window</a></a><code class="signature apipage">main\_window : [lumen.window.Window](#lumen.window.Window)</code><br/></span>
        <span class="small_desc_flat">If the config specifies a default window, this is it</span><span class="member apipage">
            <a name="shutting_down"><a class="lift" href="#shutting_down">shutting\_down</a></a><code class="signature apipage">shutting\_down : [Bool](http://api.haxe.org/Bool.html)</code><br/></span>
        <span class="small_desc_flat">Set if shut down has commenced</span><span class="member apipage">
            <a name="window"><a class="lift" href="#window">window</a></a><code class="signature apipage">window : [lumen.window.Windowing](#lumen.window.Windowing)</code><br/></span>
        <span class="small_desc_flat">The window manager</span>

<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="dispatch_system_event"><a class="lift" href="#dispatch_system_event">dispatch\_system\_event</a></a><code class="signature apipage">dispatch\_system\_event(\_event:<span>[lumen.types.SystemEvent](#lumen.types.SystemEvent)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="load"><a class="lift" href="#load">load</a></a><span class="inline-block static">static</span><code class="signature apipage">load(library:<span>[String](http://api.haxe.org/String.html)</span>, method:<span>[String](http://api.haxe.org/String.html)</span>, ?args:<span>[Int](http://api.haxe.org/Int.html)=0</span>) : [Dynamic](http://api.haxe.org/Dynamic.html)</code><br/><span class="small_desc_flat">Loads a function out of a library</span>
        </span>
    <span class="method apipage">
            <a name="shutdown"><a class="lift" href="#shutdown">shutdown</a></a><code class="signature apipage">shutdown() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Shutdown the engine and quit</span>
        </span>
    

<h3>Properties</h3> <hr/><span class="property apipage">
            <a name="time"><a class="lift" href="#time">time</a></a><code class="signature apipage">time : [Float]()</code><br/><span class="small_desc_flat">The current timestamp</span>
        </span><span class="property apipage">
            <a name="uniqueid"><a class="lift" href="#uniqueid">uniqueid</a></a><code class="signature apipage">uniqueid : [String]()</code><br/><span class="small_desc_flat">Generate a unique ID to use</span>
        </span>

&nbsp;
&nbsp;
&nbsp;