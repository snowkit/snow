
[![Logo](../../images/logo.png)](../../index.html)

---


##[API Index](../../api/index.html#lumen)   
&emsp;&emsp;&emsp;[lumen](./)   
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;Lumen

---

#Lumen


---


[Members](#Members)   
[Properties](#Properties)   
[StaticMethods](#StaticMethods)   
[Methods](#Methods)   


---

&nbsp;   

<a class="lift" name="Members" ></a>
###Members   
---
<a class="lift" name="assets" href="#assets">assets</a>



`assets : lumen.assets.Assets`

<span class="small_desc_flat"> The asset system </span>   

<a class="lift" name="audio" href="#audio">audio</a>



`audio : lumen.audio.Audio`

<span class="small_desc_flat"> The audio system </span>   

<a class="lift" name="config" href="#config">config</a>



`config : lumen.types.LumenConfig`

<span class="small_desc_flat"> The configuration from the project file, runtime config and other configs </span>   

<a class="lift" name="has_shutdown" href="#has_shutdown">has_shutdown</a>



`has_shutdown : Bool`

<span class="small_desc_flat"> Set if shut dow has completed </span>   

<a class="lift" name="host" href="#host">host</a>



`host : lumen.App`

<span class="small_desc_flat"> The host application </span>   

<a class="lift" name="input" href="#input">input</a>



`input : lumen.input.Input`

<span class="small_desc_flat"> The input system </span>   

<a class="lift" name="main_window" href="#main_window">main_window</a>



`main_window : lumen.window.Window`

<span class="small_desc_flat"> If the config specifies a default window, this is it </span>   

<a class="lift" name="shutting_down" href="#shutting_down">shutting_down</a>



`shutting_down : Bool`

<span class="small_desc_flat"> Set if shut down has commenced </span>   

<a class="lift" name="window" href="#window">window</a>



`window : lumen.window.Windowing`

<span class="small_desc_flat"> The window manager </span>   

&nbsp;   

<a class="lift" name="Properties" ></a>
###Properties   
---
<a class="lift" name="time" href="#time">time</a>



`time : Float`

<span class="small_desc_flat"> The current timestamp </span>   

<a class="lift" name="uniqueid" href="#uniqueid">uniqueid</a>



`uniqueid : String`

<span class="small_desc_flat"> Generate a unique ID to use </span>   

&nbsp;   

<a class="lift" name="StaticMethods" ></a>
###StaticMethods   
---
<a class="lift" name="load" href="#load">load</a>



`load(library:String, method:String, ?args:Int=0) : Dynamic`

<span class="small_desc_flat"> Loads a function out of a library </span>   

&nbsp;   

<a class="lift" name="Methods" ></a>
###Methods   
---
<a class="lift" name="shutdown" href="#shutdown">shutdown</a>



`shutdown() : Void`

<span class="small_desc_flat"> Shutdown the engine and quit </span>   



&nbsp;
&nbsp;
&nbsp;

---  


&nbsp;   
&nbsp;   