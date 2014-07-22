
[![Logo](../../../images/logo.png)](../../../api/index.html)

---



<h1>AssetSystemBinding</h1>
<small>`snow.assets.AssetSystemBinding`</small>



---

`class`<br/>implements <code><span>snow.utils.AbstractClass</span></code>
<span class="meta">
<br/>meta: @:build(&#x27;???&#x27;), @:autoBuild(&#x27;???&#x27;), @:noCompletion
</span>


---

&nbsp;
&nbsp;



<h3>Members</h3> <hr/><span class="member apipage">
                <a name="manager"><a class="lift" href="#manager">manager</a></a><div class="clear"></div><code class="signature apipage">manager : [snow.assets.Assets](#)</code><br/></span>
            <span class="small_desc_flat"></span>





<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="image_load_info"><a class="lift" href="#image_load_info">image\_load\_info</a></a> <div class="clear"></div><code class="signature apipage">image\_load\_info(\_path:[String](#)<span></span>, \_components:[Int](#)<span>=4</span>, \_onloaded:[snow.types.ImageInfo](#)&nbsp;-&gt; [Void](#)<span>=null</span>) : [snow.types.ImageInfo](#)</code><br/><span class="small_desc_flat">Image info loader</span>
        </span>
    <span class="method apipage">
            <a name="audio_load_ogg"><a class="lift" href="#audio_load_ogg">audio\_load\_ogg</a></a> <div class="clear"></div><code class="signature apipage">audio\_load\_ogg(asset:[snow.types.AssetInfo](#)<span></span>, load:[Bool](#)<span>=true</span>) : [snow.types.AudioInfo](#)</code><br/><span class="small_desc_flat">OGG specific info loader</span>
        </span>
    <span class="method apipage">
            <a name="audio_load_portion_ogg"><a class="lift" href="#audio_load_portion_ogg">audio\_load\_portion\_ogg</a></a> <div class="clear"></div><code class="signature apipage">audio\_load\_portion\_ogg(\_info:[snow.types.AudioInfo](#)<span></span>, \_start:[Int](#)<span></span>, \_len:[Int](#)<span></span>) : [snow.types.AudioDataBlob](#)</code><br/><span class="small_desc_flat">OGG specific portion loader</span>
        </span>
    <span class="method apipage">
            <a name="audio_seek_source_ogg"><a class="lift" href="#audio_seek_source_ogg">audio\_seek\_source\_ogg</a></a> <div class="clear"></div><code class="signature apipage">audio\_seek\_source\_ogg(\_info:[snow.types.AudioInfo](#)<span></span>, \_to:[Int](#)<span></span>) : [Bool](#)</code><br/><span class="small_desc_flat">OGG specific seek handler</span>
        </span>
    <span class="method apipage">
            <a name="audio_load_wav"><a class="lift" href="#audio_load_wav">audio\_load\_wav</a></a> <div class="clear"></div><code class="signature apipage">audio\_load\_wav(asset:[snow.types.AssetInfo](#)<span></span>, load:[Bool](#)<span>=true</span>) : [snow.types.AudioInfo](#)</code><br/><span class="small_desc_flat">WAV specific info loader</span>
        </span>
    <span class="method apipage">
            <a name="audio_load_portion_wav"><a class="lift" href="#audio_load_portion_wav">audio\_load\_portion\_wav</a></a> <div class="clear"></div><code class="signature apipage">audio\_load\_portion\_wav(\_info:[snow.types.AudioInfo](#)<span></span>, \_start:[Int](#)<span></span>, \_len:[Int](#)<span></span>) : [snow.types.AudioDataBlob](#)</code><br/><span class="small_desc_flat">WAV specific portion loader</span>
        </span>
    <span class="method apipage">
            <a name="audio_seek_source_wav"><a class="lift" href="#audio_seek_source_wav">audio\_seek\_source\_wav</a></a> <div class="clear"></div><code class="signature apipage">audio\_seek\_source\_wav(\_info:[snow.types.AudioInfo](#)<span></span>, \_to:[Int](#)<span></span>) : [Bool](#)</code><br/><span class="small_desc_flat">WAV specific seek handler</span>
        </span>
    <span class="method apipage">
            <a name="audio_load_pcm"><a class="lift" href="#audio_load_pcm">audio\_load\_pcm</a></a> <div class="clear"></div><code class="signature apipage">audio\_load\_pcm(asset:[snow.types.AssetInfo](#)<span></span>, load:[Bool](#)<span>=true</span>) : [snow.types.AudioInfo](#)</code><br/><span class="small_desc_flat">PCM specific info loader</span>
        </span>
    <span class="method apipage">
            <a name="audio_load_portion_pcm"><a class="lift" href="#audio_load_portion_pcm">audio\_load\_portion\_pcm</a></a> <div class="clear"></div><code class="signature apipage">audio\_load\_portion\_pcm(\_info:[snow.types.AudioInfo](#)<span></span>, \_start:[Int](#)<span></span>, \_len:[Int](#)<span></span>) : [snow.types.AudioDataBlob](#)</code><br/><span class="small_desc_flat">PCM specific portion loader</span>
        </span>
    <span class="method apipage">
            <a name="audio_seek_source_pcm"><a class="lift" href="#audio_seek_source_pcm">audio\_seek\_source\_pcm</a></a> <div class="clear"></div><code class="signature apipage">audio\_seek\_source\_pcm(\_info:[snow.types.AudioInfo](#)<span></span>, \_to:[Int](#)<span></span>) : [Bool](#)</code><br/><span class="small_desc_flat">PCM specific seek handler</span>
        </span>
    





---

&nbsp;
&nbsp;
&nbsp;
&nbsp;