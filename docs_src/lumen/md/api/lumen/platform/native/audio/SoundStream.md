
[![Logo](../../../../../images/logo.png)](../../../../../api/index.html)

---



<h1>SoundStream</h1>



---

`class`extends <code><span>[lumen.platform.native.audio.openal.Sound]()</span></code>
<span class="meta">

</span>


---

&nbsp;
&nbsp;

<h3>Members</h3> <hr/><span class="member apipage">
            <a name="buffer_count"><a class="lift" href="#buffer_count">buffer\_count</a></a><code class="signature apipage">buffer\_count : [Int](http://api.haxe.org/Int.html)</code><br/></span>
        <span class="small_desc_flat">The number of buffers to use in the queue for streaming. Default is `4` `todo` optionize</span><span class="member apipage">
            <a name="buffer_length"><a class="lift" href="#buffer_length">buffer\_length</a></a><code class="signature apipage">buffer\_length : [Int](http://api.haxe.org/Int.html)</code><br/></span>
        <span class="small_desc_flat">The length of bytes for a single buffer to queue up to stream. Default is `176400`, about 1 second in 16 bit mono. `todo` optionize</span><span class="member apipage">
            <a name="data_get"><a class="lift" href="#data_get">data\_get</a></a><code class="signature apipage">data\_get : [Int-&gt;Int-&gt;lumen.types.AudioDataBlob]()</code><br/></span>
        <span class="small_desc_flat">The get function, assign a function here if you want to stream data to the source manually, like generative sound.</span><span class="member apipage">
            <a name="data_seek"><a class="lift" href="#data_seek">data\_seek</a></a><code class="signature apipage">data\_seek : [Int-&gt;Bool]()</code><br/></span>
        <span class="small_desc_flat">The seek function, assign a function here if you want to stream data to the source manually, like generative sound.</span>

<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a><code class="signature apipage">new(\_manager:<span>[lumen.audio.Audio](#lumen.audio.Audio)</span>, \_name:<span>[String](http://api.haxe.org/String.html)</span>, \_audio\_info:<span>[lumen.types.AudioInfo](#lumen.types.AudioInfo)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    

<h3>Properties</h3> <hr/>no public properties

&nbsp;
&nbsp;
&nbsp;