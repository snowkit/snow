
[![Logo](../../../images/logo.png)](../../../index.html)

---

#Audio


##[API Index](../../../api/index.html#lumen.audio)   
&emsp;&emsp;&emsp;parent    
[lumen](../)     
&emsp;&emsp;&emsp;current    
[lumen.audio](./) / Audio

<br/>

---


[Members](#Members)   
[Methods](#Methods)   


---

&nbsp;   

<a class="lift" name="Members" ></a>
###Members   
---
<a class="lift" name="active" href="#active">active</a>



`active : Bool`

<span class="small_desc_flat"> Set to false to stop any and all processing in the audio system </span>   

<a class="lift" name="system" href="#system">system</a>



`system : lumen.audio.system.LumenAudioSystem`

<span class="small_desc_flat"> The implementation of the current audio system </span>   

&nbsp;   

&nbsp;   

<a class="lift" name="Methods" ></a>
###Methods   
---
<a class="lift" name="create" href="#create">create</a>



`create(_id:String, ?_name:String='', ?streaming:Bool=false) : lumen.audio.system.Sound`

<span class="small_desc_flat"> Create a sound for playing. If no name is given, a unique id is assigned. Use the sound instance or the public api by name. </span>   

<a class="lift" name="get" href="#get">get</a>



`get(_name:String) : lumen.audio.system.Sound`

<span class="small_desc_flat"> Get a sound instance by name </span>   

<a class="lift" name="pan" href="#pan">pan</a>



`pan(_name:String, _pan:Float) : Void`

<span class="small_desc_flat"> Set the pan of a sound instance by name </span>   

<a class="lift" name="pause" href="#pause">pause</a>



`pause(_name:String) : Void`

<span class="small_desc_flat"> Pause a sound instance by name </span>   

<a class="lift" name="pitch" href="#pitch">pitch</a>



`pitch(_name:String, _pitch:Float) : Void`

<span class="small_desc_flat"> Set the pitch of a sound instance by name </span>   

<a class="lift" name="play" href="#play">play</a>



`play(_name:String) : Void`

<span class="small_desc_flat"> Play a sound instance by name </span>   

<a class="lift" name="stop" href="#stop">stop</a>



`stop(_name:String) : Void`

<span class="small_desc_flat"> Stop a sound instance by name </span>   

<a class="lift" name="toggle" href="#toggle">toggle</a>



`toggle(_name:String) : Void`

<span class="small_desc_flat"> Toggle a sound instance by name, pausing the sound </span>   

<a class="lift" name="volume" href="#volume">volume</a>



`volume(_name:String, _volume:Float) : Void`

<span class="small_desc_flat"> Set the volume of a sound instance by name </span>   



&nbsp;
&nbsp;
&nbsp;

---  


&nbsp;   
&nbsp;   