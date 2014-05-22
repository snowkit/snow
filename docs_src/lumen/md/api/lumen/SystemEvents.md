
[![Logo](../../images/logo.png)](../../index.html)

---

#SystemEvents


##[API Index](../../api/index.html#lumen)   
&emsp;&emsp;&emsp;parent    
_none_   
&emsp;&emsp;&emsp;current    
[lumen](./) / SystemEvents

<br/>

---


[Members](#Members)   
[StaticMethods](#StaticMethods)   


---

&nbsp;   

<a class="lift" name="Members" ></a>
###Members   
---
<a class="lift" name="se_app_didenterbackground" href="#se_app_didenterbackground">se_app_didenterbackground</a>



<span class="inline-block static">static</span>`se_app_didenterbackground : Int`

<span class="small_desc_flat"> An event for when the app enters the background, called by the OS (mobile specific) </span>   

<a class="lift" name="se_app_didenterforeground" href="#se_app_didenterforeground">se_app_didenterforeground</a>



<span class="inline-block static">static</span>`se_app_didenterforeground : Int`

<span class="small_desc_flat"> An event for when the app enters the foreground, called by the OS (mobile specific) </span>   

<a class="lift" name="se_app_lowmemory" href="#se_app_lowmemory">se_app_lowmemory</a>



<span class="inline-block static">static</span>`se_app_lowmemory : Int`

<span class="small_desc_flat"> An system low memory event, clear memory if you can. Called by the OS (mobile specific) </span>   

<a class="lift" name="se_app_terminating" href="#se_app_terminating">se_app_terminating</a>



<span class="inline-block static">static</span>`se_app_terminating : Int`

<span class="small_desc_flat"> An system terminating event, called by the OS (mobile specific) </span>   

<a class="lift" name="se_app_willenterbackground" href="#se_app_willenterbackground">se_app_willenterbackground</a>



<span class="inline-block static">static</span>`se_app_willenterbackground : Int`

<span class="small_desc_flat"> An event for just before the app enters the background, called by the OS (mobile specific) </span>   

<a class="lift" name="se_app_willenterforeground" href="#se_app_willenterforeground">se_app_willenterforeground</a>



<span class="inline-block static">static</span>`se_app_willenterforeground : Int`

<span class="small_desc_flat"> An event for just before the app enters the foreground, called by the OS (mobile specific) </span>   

<a class="lift" name="se_init" href="#se_init">se_init</a>



<span class="inline-block static">static</span>`se_init : Int`

<span class="small_desc_flat"> An internal system init event </span>   

<a class="lift" name="se_input" href="#se_input">se_input</a>



<span class="inline-block static">static</span>`se_input : Int`

<span class="small_desc_flat"> An system input event </span>   

<a class="lift" name="se_quit" href="#se_quit">se_quit</a>



<span class="inline-block static">static</span>`se_quit : Int`

<span class="small_desc_flat"> An system quit event. Initiated by user, can be cancelled/ignored </span>   

<a class="lift" name="se_ready" href="#se_ready">se_ready</a>



<span class="inline-block static">static</span>`se_ready : Int`

<span class="small_desc_flat"> An internal system ready event </span>   

<a class="lift" name="se_shutdown" href="#se_shutdown">se_shutdown</a>



<span class="inline-block static">static</span>`se_shutdown : Int`

<span class="small_desc_flat"> An system shutdown event </span>   

<a class="lift" name="se_unknown" href="#se_unknown">se_unknown</a>



<span class="inline-block static">static</span>`se_unknown : Int`

<span class="small_desc_flat"> An unknown system event </span>   

<a class="lift" name="se_update" href="#se_update">se_update</a>



<span class="inline-block static">static</span>`se_update : Int`

<span class="small_desc_flat"> An internal system update event </span>   

<a class="lift" name="se_window" href="#se_window">se_window</a>



<span class="inline-block static">static</span>`se_window : Int`

<span class="small_desc_flat"> An system window event </span>   

&nbsp;   

<a class="lift" name="StaticMethods" ></a>
###StaticMethods   
---
<a class="lift" name="typed" href="#typed">typed</a>



`typed(type:Int) : lumen.SystemEventType`

<span class="small_desc_flat"> returns a typed `SystemEventType` from an integer ID, for communication between internal native + haxe code </span>   

&nbsp;   



&nbsp;
&nbsp;
&nbsp;

---  


&nbsp;   
&nbsp;   