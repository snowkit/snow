
[![Logo](../../images/logo.png)](../../index.html)

---

#WindowEvents


&emsp;&emsp;&emsp;home   
[API Index](../../api/index.html#lumen)   
&emsp;&emsp;&emsp;parent    
_none_   
&emsp;&emsp;&emsp;current    
[lumen](./) / WindowEvents

<br/>

---


[Members](#Members)   
[Methods](#Methods)   


---

&nbsp;   

<a class="lift" name="Members" ></a>
###Members   
---
<a class="lift" name="we_close" href="#we_close">we_close</a>



`we_close : Int`

<span class="small_desc_flat"> A window is being closed </span>   

<a class="lift" name="we_created" href="#we_created">we_created</a>



`we_created : Int`

<span class="small_desc_flat"> A window is created </span>   

<a class="lift" name="we_enter" href="#we_enter">we_enter</a>



`we_enter : Int`

<span class="small_desc_flat"> A window is entered by a mouse </span>   

<a class="lift" name="we_exposed" href="#we_exposed">we_exposed</a>



`we_exposed : Int`

<span class="small_desc_flat"> A window is exposed </span>   

<a class="lift" name="we_focus_gained" href="#we_focus_gained">we_focus_gained</a>



`we_focus_gained : Int`

<span class="small_desc_flat"> A window has gained focus </span>   

<a class="lift" name="we_focus_lost" href="#we_focus_lost">we_focus_lost</a>



`we_focus_lost : Int`

<span class="small_desc_flat"> A window has lost focus </span>   

<a class="lift" name="we_hidden" href="#we_hidden">we_hidden</a>



`we_hidden : Int`

<span class="small_desc_flat"> A window is hidden </span>   

<a class="lift" name="we_leave" href="#we_leave">we_leave</a>



`we_leave : Int`

<span class="small_desc_flat"> A window is left by a mouse </span>   

<a class="lift" name="we_maximized" href="#we_maximized">we_maximized</a>



`we_maximized : Int`

<span class="small_desc_flat"> A window is maximized </span>   

<a class="lift" name="we_minimized" href="#we_minimized">we_minimized</a>



`we_minimized : Int`

<span class="small_desc_flat"> A window is minimized </span>   

<a class="lift" name="we_moved" href="#we_moved">we_moved</a>



`we_moved : Int`

<span class="small_desc_flat"> A window is moved </span>   

<a class="lift" name="we_resized" href="#we_resized">we_resized</a>



`we_resized : Int`

<span class="small_desc_flat"> A window is resized, by the user or code. </span>   

<a class="lift" name="we_restored" href="#we_restored">we_restored</a>



`we_restored : Int`

<span class="small_desc_flat"> A window is restored </span>   

<a class="lift" name="we_shown" href="#we_shown">we_shown</a>



`we_shown : Int`

<span class="small_desc_flat"> A window is shown </span>   

<a class="lift" name="we_size_changed" href="#we_size_changed">we_size_changed</a>



`we_size_changed : Int`

<span class="small_desc_flat"> A window is resized, by the OS or internals. </span>   

<a class="lift" name="we_unknown" href="#we_unknown">we_unknown</a>



`we_unknown : Int`

<span class="small_desc_flat"> An unknown window event </span>   

&nbsp;   

<a class="lift" name="Methods" ></a>
###Methods   
---
<a class="lift" name="typed" href="#typed">typed</a>



`typed(type:Int) : lumen.WindowEventType`

<span class="small_desc_flat"> returns a typed `WindowEventType` from an integer ID, for communication between internal native + haxe code </span>   



&nbsp;
&nbsp;
&nbsp;

---  


&nbsp;   
&nbsp;   