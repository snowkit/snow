
[![Logo](../../../images/logo.png)](../../../api/index.html)

---



<h1>Audio</h1>



---

`class`
<span class="meta">

</span>


---

&nbsp;
&nbsp;

<h3>Members</h3> <hr/><span class="member apipage">
            <a name="active"><a class="lift" href="#active">active</a></a><code class="signature apipage">active : [Bool](http://api.haxe.org/Bool.html)</code><br/></span>
        <span class="small_desc_flat">Set to false to stop any and all processing in the audio system</span><span class="member apipage">
            <a name="system"><a class="lift" href="#system">system</a></a><code class="signature apipage">system : [lumen.audio.AudioSystem](#lumen.audio.AudioSystem)</code><br/></span>
        <span class="small_desc_flat">The implementation of the current audio system</span>

<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="create"><a class="lift" href="#create">create</a></a><code class="signature apipage">create(\_id:<span>[String](http://api.haxe.org/String.html)</span>, ?\_name:<span>[String](http://api.haxe.org/String.html)=&#x27;&#x27;</span>, ?streaming:<span>[Bool](http://api.haxe.org/Bool.html)=false</span>) : [lumen.audio.Sound](#lumen.audio.Sound)</code><br/><span class="small_desc_flat">Create a sound for playing. If no name is given, a unique id is assigned. Use the sound instance or the public api by name.</span>
        </span>
    <span class="method apipage">
            <a name="get"><a class="lift" href="#get">get</a></a><code class="signature apipage">get(\_name:<span>[String](http://api.haxe.org/String.html)</span>) : [lumen.audio.Sound](#lumen.audio.Sound)</code><br/><span class="small_desc_flat">Get a sound instance by name</span>
        </span>
    <span class="method apipage">
            <a name="pan"><a class="lift" href="#pan">pan</a></a><code class="signature apipage">pan(\_name:<span>[String](http://api.haxe.org/String.html)</span>, \_pan:<span>[Float](http://api.haxe.org/Float.html)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Set the pan of a sound instance by name</span>
        </span>
    <span class="method apipage">
            <a name="pause"><a class="lift" href="#pause">pause</a></a><code class="signature apipage">pause(\_name:<span>[String](http://api.haxe.org/String.html)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Pause a sound instance by name</span>
        </span>
    <span class="method apipage">
            <a name="pitch"><a class="lift" href="#pitch">pitch</a></a><code class="signature apipage">pitch(\_name:<span>[String](http://api.haxe.org/String.html)</span>, \_pitch:<span>[Float](http://api.haxe.org/Float.html)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Set the pitch of a sound instance by name</span>
        </span>
    <span class="method apipage">
            <a name="play"><a class="lift" href="#play">play</a></a><code class="signature apipage">play(\_name:<span>[String](http://api.haxe.org/String.html)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Play a sound instance by name</span>
        </span>
    <span class="method apipage">
            <a name="stop"><a class="lift" href="#stop">stop</a></a><code class="signature apipage">stop(\_name:<span>[String](http://api.haxe.org/String.html)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Stop a sound instance by name</span>
        </span>
    <span class="method apipage">
            <a name="toggle"><a class="lift" href="#toggle">toggle</a></a><code class="signature apipage">toggle(\_name:<span>[String](http://api.haxe.org/String.html)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Toggle a sound instance by name, pausing the sound</span>
        </span>
    <span class="method apipage">
            <a name="volume"><a class="lift" href="#volume">volume</a></a><code class="signature apipage">volume(\_name:<span>[String](http://api.haxe.org/String.html)</span>, \_volume:<span>[Float](http://api.haxe.org/Float.html)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Set the volume of a sound instance by name</span>
        </span>
    

<h3>Properties</h3> <hr/>no public properties

&nbsp;
&nbsp;
&nbsp;