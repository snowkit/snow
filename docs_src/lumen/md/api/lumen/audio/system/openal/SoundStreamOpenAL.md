
[![Logo](../../../../../images/logo.png)](../../../../../index.html)

---

#SoundStreamOpenAL

--- 

The openal specific implementation of SoundStream

---
<br/>

##[API Index](../../../../../api/index.html#lumen.audio)   
&emsp;&emsp;&emsp;parent    
[lumen.audio.system](../)     
&emsp;&emsp;&emsp;current    
[lumen.audio.system.openal](./) / SoundStreamOpenAL

<br/>

---


[Extends](#Extends)   
[Members](#Members)   
[Methods](#Methods)   


---

&nbsp;   

<a class="lift" name="Extends" ></a>
###Extends   
---
<a class="lift" name="lumen.audio.system.SoundStream" href="{{{rel_path}}}api/lumen/audio.system.SoundStream.html">lumen.audio.system.SoundStream</a>

&nbsp;   

<a class="lift" name="Members" ></a>
###Members   
---
<a class="lift" name="buffers" href="#buffers">buffers</a>



`buffers : Array<Int>`

<span class="small_desc_flat"> the sound buffer names </span>   

<a class="lift" name="buffers_left" href="#buffers_left">buffers_left</a>



`buffers_left : Int`

<span class="small_desc_flat"> remaining buffers to play </span>   

<a class="lift" name="format" href="#format">format</a>



`format : Int`

<span class="small_desc_flat"> mono8? stereo16? </span>   

<a class="lift" name="source" href="#source">source</a>



`source : Int`

<span class="small_desc_flat"> the sound source name </span>   

&nbsp;   

&nbsp;   

&nbsp;   

<a class="lift" name="Methods" ></a>
###Methods   
---
<a class="lift" name="destroy" href="#destroy">destroy</a>



`destroy() : Void`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="internal_pause" href="#internal_pause">internal_pause</a>



`internal_pause() : Void`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="internal_play" href="#internal_play">internal_play</a>



`internal_play() : Void`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="internal_update" href="#internal_update">internal_update</a>



`internal_update() : Void`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="loop" href="#loop">loop</a>



`loop() : Void`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="new" href="#new">new</a>



`new(_manager:lumen.audio.Audio, _name:String, _audio_info:lumen.types.AudioInfo) `

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="pause" href="#pause">pause</a>



`pause() : Void`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="play" href="#play">play</a>



`play() : Void`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="stop" href="#stop">stop</a>



`stop() : Void`

<span class="small_desc_flat"> no description </span>   



&nbsp;
&nbsp;
&nbsp;

---  


&nbsp;   
&nbsp;   