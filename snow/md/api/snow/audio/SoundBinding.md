
[![Logo](../../../images/logo.png)](../../../api/index.html)

---



<h1>SoundBinding</h1>
<small>`snow.audio.SoundBinding`</small>



---

`class`
<span class="meta">
<br/>meta: @:noCompletion
</span>


---

&nbsp;
&nbsp;



<h3>Members</h3> <hr/><span class="member apipage">
                <a name="manager"><a class="lift" href="#manager">manager</a></a><div class="clear"></div><code class="signature apipage">manager : [snow.audio.Audio](#)</code><br/></span>
            <span class="small_desc_flat">The `Audio` system handling this sound</span><span class="member apipage">
                <a name="name"><a class="lift" href="#name">name</a></a><div class="clear"></div><code class="signature apipage">name : [String](#)</code><br/></span>
            <span class="small_desc_flat">The name of this sound</span><span class="member apipage">
                <a name="playing"><a class="lift" href="#playing">playing</a></a><div class="clear"></div><code class="signature apipage">playing : [Bool](#)</code><br/></span>
            <span class="small_desc_flat">If the sound is playing</span><span class="member apipage">
                <a name="paused"><a class="lift" href="#paused">paused</a></a><div class="clear"></div><code class="signature apipage">paused : [Bool](#)</code><br/></span>
            <span class="small_desc_flat">If the sound is paused</span><span class="member apipage">
                <a name="loaded"><a class="lift" href="#loaded">loaded</a></a><div class="clear"></div><code class="signature apipage">loaded : [Bool](#)</code><br/></span>
            <span class="small_desc_flat">If the sound is loaded or ready to use</span><span class="member apipage">
                <a name="is_stream"><a class="lift" href="#is_stream">is\_stream</a></a><div class="clear"></div><code class="signature apipage">is\_stream : [Bool](#)</code><br/></span>
            <span class="small_desc_flat">If the sound is a stream source</span>



<h3>Properties</h3> <hr/><span class="member apipage">
                <a name="info"><a class="lift" href="#info">info</a></a> <div class="clear"></div><code class="signature apipage">info : [snow.types.AudioInfo](#)</code><br/></span>
            <span class="small_desc_flat">The `AudioInfo` this sound is created from. When assigning this it will clean up and set itself to this info instead.</span><span class="member apipage">
                <a name="pitch"><a class="lift" href="#pitch">pitch</a></a> <div class="clear"></div><code class="signature apipage">pitch : [Float](#)</code><br/></span>
            <span class="small_desc_flat">The pitch of this sound</span><span class="member apipage">
                <a name="volume"><a class="lift" href="#volume">volume</a></a> <div class="clear"></div><code class="signature apipage">volume : [Float](#)</code><br/></span>
            <span class="small_desc_flat">The volume of this sound</span><span class="member apipage">
                <a name="pan"><a class="lift" href="#pan">pan</a></a> <div class="clear"></div><code class="signature apipage">pan : [Float](#)</code><br/></span>
            <span class="small_desc_flat">The pan of this sound. Pan only logically works on mono sounds, and is by default 2D sounds</span><span class="member apipage">
                <a name="looping"><a class="lift" href="#looping">looping</a></a> <div class="clear"></div><code class="signature apipage">looping : [Bool](#)</code><br/></span>
            <span class="small_desc_flat">If the sound is looping or not. Use `loop()` to change this.</span><span class="member apipage">
                <a name="position"><a class="lift" href="#position">position</a></a> <div class="clear"></div><code class="signature apipage">position : [Float](#)</code><br/></span>
            <span class="small_desc_flat">The current playback position of this sound in `seconds`</span><span class="member apipage">
                <a name="duration"><a class="lift" href="#duration">duration</a></a> <div class="clear"></div><code class="signature apipage">duration : [Float](#)</code><br/></span>
            <span class="small_desc_flat">The duration of this sound, in `seconds`</span>



<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="on"><a class="lift" href="#on">on</a></a> <div class="clear"></div><code class="signature apipage">on(\_event:[String](#)<span></span>, \_handler:[snow.audio.Sound](#)&nbsp;-&gt; [Void](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="off"><a class="lift" href="#off">off</a></a> <div class="clear"></div><code class="signature apipage">off(\_event:[String](#)<span></span>, \_handler:[snow.audio.Sound](#)&nbsp;-&gt; [Void](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="play"><a class="lift" href="#play">play</a></a> <div class="clear"></div><code class="signature apipage">play() : [Void](#)</code><br/><span class="small_desc_flat">Play this sound</span>
        </span>
    <span class="method apipage">
            <a name="loop"><a class="lift" href="#loop">loop</a></a> <div class="clear"></div><code class="signature apipage">loop() : [Void](#)</code><br/><span class="small_desc_flat">Loop this sound</span>
        </span>
    <span class="method apipage">
            <a name="stop"><a class="lift" href="#stop">stop</a></a> <div class="clear"></div><code class="signature apipage">stop() : [Void](#)</code><br/><span class="small_desc_flat">Stop this sound</span>
        </span>
    <span class="method apipage">
            <a name="pause"><a class="lift" href="#pause">pause</a></a> <div class="clear"></div><code class="signature apipage">pause() : [Void](#)</code><br/><span class="small_desc_flat">Pause this sound</span>
        </span>
    <span class="method apipage">
            <a name="destroy"><a class="lift" href="#destroy">destroy</a></a> <div class="clear"></div><code class="signature apipage">destroy() : [Void](#)</code><br/><span class="small_desc_flat">Destroy this sound and it's data.</span>
        </span>
    <span class="method apipage">
            <a name="toggle"><a class="lift" href="#toggle">toggle</a></a> <div class="clear"></div><code class="signature apipage">toggle() : [Void](#)</code><br/><span class="small_desc_flat">Toggle this sound</span>
        </span>
    <span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a> <div class="clear"></div><code class="signature apipage">new(\_manager:[snow.audio.Audio](#)<span></span>, \_name:[String](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    





---

&nbsp;
&nbsp;
&nbsp;
&nbsp;
