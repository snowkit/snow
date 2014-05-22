
[![Logo](../../../../images/logo.png)](../../../../index.html)

---

#Sound


##[API Index](../../../../api/index.html#lumen.audio)   
&emsp;&emsp;&emsp;parent    
[lumen.audio](../)     
&emsp;&emsp;&emsp;current    
[lumen.audio.system](./) / Sound

<br/>

---


[Members](#Members)   
[Properties](#Properties)   
[Methods](#Methods)   


---

&nbsp;   

<a class="lift" name="Members" ></a>
###Members   
---
<a class="lift" name="info" href="#info">info</a>



`info : lumen.types.AudioInfo`

<span class="small_desc_flat"> The `AudioInfo` this sound is created from </span>   

<a class="lift" name="is_stream" href="#is_stream">is_stream</a>



`is_stream : Bool`

<span class="small_desc_flat"> If the sound is a stream source </span>   

<a class="lift" name="manager" href="#manager">manager</a>



`manager : lumen.audio.Audio`

<span class="small_desc_flat"> The `Audio` system handling this sound </span>   

<a class="lift" name="name" href="#name">name</a>



`name : String`

<span class="small_desc_flat"> The name of this sound </span>   

<a class="lift" name="paused" href="#paused">paused</a>



`paused : Bool`

<span class="small_desc_flat"> If the sound is paused </span>   

<a class="lift" name="playing" href="#playing">playing</a>



`playing : Bool`

<span class="small_desc_flat"> If the sound is playing </span>   

&nbsp;   

<a class="lift" name="Properties" ></a>
###Properties   
---
<a class="lift" name="duration" href="#duration">duration</a>



`duration : Float`

<span class="small_desc_flat"> The duration of this sound, in `bytes` </span>   

<a class="lift" name="length" href="#length">length</a>



`length : Int`

<span class="small_desc_flat"> The length of this sound in `seconds` </span>   

<a class="lift" name="looping" href="#looping">looping</a>



`looping : Bool`

<span class="small_desc_flat"> If the sound is looping or not </span>   

<a class="lift" name="pan" href="#pan">pan</a>



`pan : Float`

<span class="small_desc_flat"> The pan of this sound. Pan only logically works on mono sounds, and is by default 2D sounds </span>   

<a class="lift" name="pitch" href="#pitch">pitch</a>



`pitch : Float`

<span class="small_desc_flat"> The pitch of this sound </span>   

<a class="lift" name="position" href="#position">position</a>



`position : Int`

<span class="small_desc_flat"> The current playback position of this sound in `bytes` </span>   

<a class="lift" name="time" href="#time">time</a>



`time : Float`

<span class="small_desc_flat"> The current playback time of this sound in `seconds` </span>   

<a class="lift" name="volume" href="#volume">volume</a>



`volume : Float`

<span class="small_desc_flat"> The volume of this sound </span>   

&nbsp;   

&nbsp;   

<a class="lift" name="Methods" ></a>
###Methods   
---
<a class="lift" name="bytes_to_seconds" href="#bytes_to_seconds">bytes_to_seconds</a>



`bytes_to_seconds(_bytes:Int) : Float`

<span class="small_desc_flat"> A helper for converting bytes to seconds for this sound source, using the format settings specific to this sound </span>   

<a class="lift" name="destroy" href="#destroy">destroy</a>



`destroy() : Void`

<span class="small_desc_flat"> Destroy this sound and it's data </span>   

<a class="lift" name="loop" href="#loop">loop</a>



`loop() : Void`

<span class="small_desc_flat"> Loop this sound </span>   

<a class="lift" name="new" href="#new">new</a>



`new(_manager:lumen.audio.Audio, _name:String, _audio_info:lumen.types.AudioInfo) `

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="pause" href="#pause">pause</a>



`pause() : Void`

<span class="small_desc_flat"> Pause this sound </span>   

<a class="lift" name="play" href="#play">play</a>



`play() : Void`

<span class="small_desc_flat"> Play this sound </span>   

<a class="lift" name="seconds_to_bytes" href="#seconds_to_bytes">seconds_to_bytes</a>



`seconds_to_bytes(_seconds:Float) : Int`

<span class="small_desc_flat"> A helper for converting seconds to bytes for this sound source, using the format settings specific to this sound </span>   

<a class="lift" name="stop" href="#stop">stop</a>



`stop() : Void`

<span class="small_desc_flat"> Stop this sound </span>   

<a class="lift" name="toggle" href="#toggle">toggle</a>



`toggle() : Void`

<span class="small_desc_flat"> Toggle this sound </span>   



&nbsp;
&nbsp;
&nbsp;

---  


&nbsp;   
&nbsp;   