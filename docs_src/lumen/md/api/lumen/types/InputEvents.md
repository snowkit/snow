
[![Logo](../../../images/logo.png)](../../../index.html)

---


##[API Index](../../../api/index.html#lumen.types)   
[lumen](../)     
&emsp;&emsp;&emsp;[lumen.types](./)   
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;InputEvents

---

#InputEvents


---


[Members](#Members)   
[StaticMethods](#StaticMethods)   


---

&nbsp;   

<a class="lift" name="Members" ></a>
###Members   
---
<a class="lift" name="ie_controller" href="#ie_controller">ie_controller</a>



<span class="inline-block static">static</span>`ie_controller : Int`

<span class="small_desc_flat"> An controller input event. Use these instead of joystick on desktop. </span>   

<a class="lift" name="ie_joystick" href="#ie_joystick">ie_joystick</a>



<span class="inline-block static">static</span>`ie_joystick : Int`

<span class="small_desc_flat"> An joystick input event. On mobile, accellerometer is a joystick (for now) </span>   

<a class="lift" name="ie_key" href="#ie_key">ie_key</a>



<span class="inline-block static">static</span>`ie_key : Int`

<span class="small_desc_flat"> An keyboard input event </span>   

<a class="lift" name="ie_mouse" href="#ie_mouse">ie_mouse</a>



<span class="inline-block static">static</span>`ie_mouse : Int`

<span class="small_desc_flat"> An mouse input event </span>   

<a class="lift" name="ie_touch" href="#ie_touch">ie_touch</a>



<span class="inline-block static">static</span>`ie_touch : Int`

<span class="small_desc_flat"> An touch input event </span>   

<a class="lift" name="ie_unknown" href="#ie_unknown">ie_unknown</a>



<span class="inline-block static">static</span>`ie_unknown : Int`

<span class="small_desc_flat"> An unknown input event </span>   

&nbsp;   

<a class="lift" name="StaticMethods" ></a>
###StaticMethods   
---
<a class="lift" name="typed" href="#typed">typed</a>



`typed(type:Int) : lumen.types.InputEventType`

<span class="small_desc_flat"> returns a typed `InputEventType` from an integer ID, for communication between internal native + haxe code </span>   

&nbsp;   



&nbsp;
&nbsp;
&nbsp;

---  


&nbsp;   
&nbsp;   