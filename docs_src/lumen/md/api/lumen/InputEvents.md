
[![Logo](../../images/logo.png)](../../index.html)

---

#InputEvents


&emsp;&emsp;&emsp;home   
[API Index](../../api/index.html#lumen)   
&emsp;&emsp;&emsp;parent    
_none_   
&emsp;&emsp;&emsp;current    
[lumen](./) / InputEvents

<br/>

---


[Members](#Members)   
[Methods](#Methods)   


---

&nbsp;   

<a class="lift" name="Members" ></a>
###Members   
---
<a class="lift" name="ie_controller" href="#ie_controller">ie_controller</a>



`ie_controller : Int`

<span class="small_desc_flat"> An controller input event. Use these instead of joystick on desktop. </span>   

<a class="lift" name="ie_joystick" href="#ie_joystick">ie_joystick</a>



`ie_joystick : Int`

<span class="small_desc_flat"> An joystick input event. On mobile, accellerometer is a joystick (for now) </span>   

<a class="lift" name="ie_key" href="#ie_key">ie_key</a>



`ie_key : Int`

<span class="small_desc_flat"> An keyboard input event </span>   

<a class="lift" name="ie_mouse" href="#ie_mouse">ie_mouse</a>



`ie_mouse : Int`

<span class="small_desc_flat"> An mouse input event </span>   

<a class="lift" name="ie_touch" href="#ie_touch">ie_touch</a>



`ie_touch : Int`

<span class="small_desc_flat"> An touch input event </span>   

<a class="lift" name="ie_unknown" href="#ie_unknown">ie_unknown</a>



`ie_unknown : Int`

<span class="small_desc_flat"> An unknown input event </span>   

&nbsp;   

<a class="lift" name="Methods" ></a>
###Methods   
---
<a class="lift" name="typed" href="#typed">typed</a>



`typed(type:Int) : lumen.InputEventType`

<span class="small_desc_flat"> returns a typed `InputEventType` from an integer ID, for communication between internal native + haxe code </span>   



&nbsp;
&nbsp;
&nbsp;

---  


&nbsp;   
&nbsp;   