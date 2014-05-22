
[![Logo](../../../images/logo.png)](../../../index.html)

---


##[API Index](../../../api/index.html#lumen.input)   
[lumen](../)     
&emsp;&emsp;&emsp;[lumen.input](./)   
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;TouchEvent

---

#TouchEvent

Information about a touch event

`raw` : The raw event from the system, unmodified   
`state` : The state this touch event is in   
`timestamp` : The time in seconds when this touch event occurred, use for deltas   
`touch_id` : The id of the touch that this event comes from, a finger id   
`device_id` : The device id this touch comes from   
`x` : The x position in the window of the touch event   
`y` : The x position in the window of the touch event   
`dx` : The delta x value of the touch event, if the state is `moving`   
`dy` : The delta y value of the touch event, if the state is `moving`   
`pressure` : The pressure value of the touch event, where available

---


[Members](#Members)   


---

&nbsp;   

<a class="lift" name="Members" ></a>
###Members   
---
<a class="lift" name="device_id" href="#device_id">device_id</a>



`device_id : Int`

<span class="small_desc_flat">  </span>   

<a class="lift" name="dx" href="#dx">dx</a>



`dx : Float`

<span class="small_desc_flat">  </span>   

<a class="lift" name="dy" href="#dy">dy</a>



`dy : Float`

<span class="small_desc_flat">  </span>   

<a class="lift" name="pressure" href="#pressure">pressure</a>



`pressure : Float`

<span class="small_desc_flat">  </span>   

<a class="lift" name="raw" href="#raw">raw</a>



`raw : lumen.types.InputEvent`

<span class="small_desc_flat">  </span>   

<a class="lift" name="state" href="#state">state</a>



`state : lumen.input.TouchState`

<span class="small_desc_flat">  </span>   

<a class="lift" name="timestamp" href="#timestamp">timestamp</a>



`timestamp : Float`

<span class="small_desc_flat">  </span>   

<a class="lift" name="touch_id" href="#touch_id">touch_id</a>



`touch_id : Int`

<span class="small_desc_flat">  </span>   

<a class="lift" name="x" href="#x">x</a>



`x : Float`

<span class="small_desc_flat">  </span>   

<a class="lift" name="y" href="#y">y</a>



`y : Float`

<span class="small_desc_flat">  </span>   



&nbsp;
&nbsp;
&nbsp;

---  


&nbsp;   
&nbsp;   