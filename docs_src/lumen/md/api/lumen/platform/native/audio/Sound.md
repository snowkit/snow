
[![Logo](../../../../../images/logo.png)](../../../../../api/index.html)

---



#Sound



---

`class`extends <code><span>[lumen.audio.SoundBinding]()</span></code>
<span class="meta">

</span>


---

&nbsp;
&nbsp;

<h3>Members</h3> <hr/><span class="member apipage">
            <a name="info"><a class="lift" href="#info">info</a></a><a title="inherited from lumen.audio.SoundBinding" class="tooltip inherited">&gt;</a><code class="signature apipage">info : [lumen.types.AudioInfo](#lumen.types.AudioInfo)</code><br/></span>
        <span class="small_desc_flat">The `AudioInfo` this sound is created from</span><span class="member apipage">
            <a name="is_stream"><a class="lift" href="#is_stream">is\_stream</a></a><a title="inherited from lumen.audio.SoundBinding" class="tooltip inherited">&gt;</a><code class="signature apipage">is\_stream : [Bool](http://api.haxe.org/Bool.html)</code><br/></span>
        <span class="small_desc_flat">If the sound is a stream source</span><span class="member apipage">
            <a name="manager"><a class="lift" href="#manager">manager</a></a><a title="inherited from lumen.audio.SoundBinding" class="tooltip inherited">&gt;</a><code class="signature apipage">manager : [lumen.audio.Audio](#lumen.audio.Audio)</code><br/></span>
        <span class="small_desc_flat">The `Audio` system handling this sound</span><span class="member apipage">
            <a name="name"><a class="lift" href="#name">name</a></a><a title="inherited from lumen.audio.SoundBinding" class="tooltip inherited">&gt;</a><code class="signature apipage">name : [String](http://api.haxe.org/String.html)</code><br/></span>
        <span class="small_desc_flat">The name of this sound</span><span class="member apipage">
            <a name="paused"><a class="lift" href="#paused">paused</a></a><a title="inherited from lumen.audio.SoundBinding" class="tooltip inherited">&gt;</a><code class="signature apipage">paused : [Bool](http://api.haxe.org/Bool.html)</code><br/></span>
        <span class="small_desc_flat">If the sound is paused</span><span class="member apipage">
            <a name="playing"><a class="lift" href="#playing">playing</a></a><a title="inherited from lumen.audio.SoundBinding" class="tooltip inherited">&gt;</a><code class="signature apipage">playing : [Bool](http://api.haxe.org/Bool.html)</code><br/></span>
        <span class="small_desc_flat">If the sound is playing</span>

<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a><a title="inherited from lumen.audio.SoundBinding" class="tooltip inherited">&gt;</a><code class="signature apipage">new(\_manager:<span>[lumen.audio.Audio](#lumen.audio.Audio)</span>, \_name:<span>[String](http://api.haxe.org/String.html)</span>, \_audio\_info:<span>[lumen.types.AudioInfo](#lumen.types.AudioInfo)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="bytes_to_seconds"><a class="lift" href="#bytes_to_seconds">bytes\_to\_seconds</a></a><a title="inherited from lumen.audio.SoundBinding" class="tooltip inherited">&gt;</a><code class="signature apipage">bytes\_to\_seconds(\_bytes:<span>[Int](http://api.haxe.org/Int.html)</span>) : [Float](http://api.haxe.org/Float.html)</code><br/><span class="small_desc_flat">A helper for converting bytes to seconds for this sound source, using the format settings specific to this sound</span>
        </span>
    <span class="method apipage">
            <a name="destroy"><a class="lift" href="#destroy">destroy</a></a><a title="inherited from lumen.audio.SoundBinding" class="tooltip inherited">&gt;</a><code class="signature apipage">destroy() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Destroy this sound and it's data</span>
        </span>
    <span class="method apipage">
            <a name="loop"><a class="lift" href="#loop">loop</a></a><a title="inherited from lumen.audio.SoundBinding" class="tooltip inherited">&gt;</a><code class="signature apipage">loop() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Loop this sound</span>
        </span>
    <span class="method apipage">
            <a name="pause"><a class="lift" href="#pause">pause</a></a><a title="inherited from lumen.audio.SoundBinding" class="tooltip inherited">&gt;</a><code class="signature apipage">pause() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Pause this sound</span>
        </span>
    <span class="method apipage">
            <a name="play"><a class="lift" href="#play">play</a></a><a title="inherited from lumen.audio.SoundBinding" class="tooltip inherited">&gt;</a><code class="signature apipage">play() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Play this sound</span>
        </span>
    <span class="method apipage">
            <a name="seconds_to_bytes"><a class="lift" href="#seconds_to_bytes">seconds\_to\_bytes</a></a><a title="inherited from lumen.audio.SoundBinding" class="tooltip inherited">&gt;</a><code class="signature apipage">seconds\_to\_bytes(\_seconds:<span>[Float](http://api.haxe.org/Float.html)</span>) : [Int](http://api.haxe.org/Int.html)</code><br/><span class="small_desc_flat">A helper for converting seconds to bytes for this sound source, using the format settings specific to this sound</span>
        </span>
    <span class="method apipage">
            <a name="stop"><a class="lift" href="#stop">stop</a></a><a title="inherited from lumen.audio.SoundBinding" class="tooltip inherited">&gt;</a><code class="signature apipage">stop() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Stop this sound</span>
        </span>
    <span class="method apipage">
            <a name="toggle"><a class="lift" href="#toggle">toggle</a></a><a title="inherited from lumen.audio.SoundBinding" class="tooltip inherited">&gt;</a><code class="signature apipage">toggle() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Toggle this sound</span>
        </span>
    

<h3>Properties</h3> <hr/><span class="property apipage">
            <a name="duration"><a class="lift" href="#duration">duration</a></a><a title="inherited from lumen.audio.SoundBinding" class="tooltip inherited">&gt;</a><code class="signature apipage">duration : [Float]()</code><br/><span class="small_desc_flat">The duration of this sound, in `bytes`</span>
        </span><span class="property apipage">
            <a name="length"><a class="lift" href="#length">length</a></a><a title="inherited from lumen.audio.SoundBinding" class="tooltip inherited">&gt;</a><code class="signature apipage">length : [Int]()</code><br/><span class="small_desc_flat">The length of this sound in `seconds`</span>
        </span><span class="property apipage">
            <a name="looping"><a class="lift" href="#looping">looping</a></a><a title="inherited from lumen.audio.SoundBinding" class="tooltip inherited">&gt;</a><code class="signature apipage">looping : [Bool]()</code><br/><span class="small_desc_flat">If the sound is looping or not</span>
        </span><span class="property apipage">
            <a name="pan"><a class="lift" href="#pan">pan</a></a><a title="inherited from lumen.audio.SoundBinding" class="tooltip inherited">&gt;</a><code class="signature apipage">pan : [Float]()</code><br/><span class="small_desc_flat">The pan of this sound. Pan only logically works on mono sounds, and is by default 2D sounds</span>
        </span><span class="property apipage">
            <a name="pitch"><a class="lift" href="#pitch">pitch</a></a><a title="inherited from lumen.audio.SoundBinding" class="tooltip inherited">&gt;</a><code class="signature apipage">pitch : [Float]()</code><br/><span class="small_desc_flat">The pitch of this sound</span>
        </span><span class="property apipage">
            <a name="position"><a class="lift" href="#position">position</a></a><a title="inherited from lumen.audio.SoundBinding" class="tooltip inherited">&gt;</a><code class="signature apipage">position : [Int]()</code><br/><span class="small_desc_flat">The current playback position of this sound in `bytes`</span>
        </span><span class="property apipage">
            <a name="time"><a class="lift" href="#time">time</a></a><a title="inherited from lumen.audio.SoundBinding" class="tooltip inherited">&gt;</a><code class="signature apipage">time : [Float]()</code><br/><span class="small_desc_flat">The current playback time of this sound in `seconds`</span>
        </span><span class="property apipage">
            <a name="volume"><a class="lift" href="#volume">volume</a></a><a title="inherited from lumen.audio.SoundBinding" class="tooltip inherited">&gt;</a><code class="signature apipage">volume : [Float]()</code><br/><span class="small_desc_flat">The volume of this sound</span>
        </span>

&nbsp;
&nbsp;
&nbsp;