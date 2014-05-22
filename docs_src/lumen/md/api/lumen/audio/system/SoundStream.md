
[![Logo](../../../../images/logo.png)](../../../../index.html)

---

#SoundStream


##[API Index](../../../../api/index.html#lumen.audio)   
&emsp;&emsp;&emsp;parent    
[lumen.audio](../)     
&emsp;&emsp;&emsp;current    
[lumen.audio.system](./) / SoundStream

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
<a class="lift" name="lumen.audio.system.Sound" href="{{{rel_path}}}api/lumen/audio.system.Sound.html">lumen.audio.system.Sound</a>

&nbsp;   

<a class="lift" name="Members" ></a>
###Members   
---
<a class="lift" name="buffer_count" href="#buffer_count">buffer_count</a>



`buffer_count : Int`

<span class="small_desc_flat"> The number of buffers to use in the queue for streaming. Default is `4` `todo` optionize </span>   

<a class="lift" name="buffer_length" href="#buffer_length">buffer_length</a>



`buffer_length : Int`

<span class="small_desc_flat"> The length of bytes for a single buffer to queue up to stream. Default is `176400`, about 1 second in 16 bit mono. `todo` optionize </span>   

<a class="lift" name="data_get" href="#data_get">data_get</a>



`data_get : Int->Int->lumen.types.AudioDataBlob`

<span class="small_desc_flat"> The get function, assign a function here if you want to stream data to the source manually, like generative sound. </span>   

<a class="lift" name="data_seek" href="#data_seek">data_seek</a>



`data_seek : Int->Bool`

<span class="small_desc_flat"> The seek function, assign a function here if you want to stream data to the source manually, like generative sound. </span>   

&nbsp;   

&nbsp;   

<a class="lift" name="Methods" ></a>
###Methods   
---
<a class="lift" name="default_data_get" href="#default_data_get">default_data_get</a>



`default_data_get(_start:Int, _length:Int) : lumen.types.AudioDataBlob`

<span class="small_desc_flat"> Default data get implementation uses `assets.audio_load_portion` </span>   

<a class="lift" name="default_data_seek" href="#default_data_seek">default_data_seek</a>



`default_data_seek(_to:Int) : Bool`

<span class="small_desc_flat"> Default data seek implementation uses `assets.audio_seek_source` </span>   

<a class="lift" name="new" href="#new">new</a>



`new(_manager:lumen.audio.Audio, _name:String, _audio_info:lumen.types.AudioInfo) `

<span class="small_desc_flat"> no description </span>   



&nbsp;
&nbsp;
&nbsp;

---  


&nbsp;   
&nbsp;   