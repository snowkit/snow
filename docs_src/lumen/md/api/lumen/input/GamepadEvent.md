
[![Logo](../../../images/logo.png)](../../../index.html)

---


##[API Index](../../../api/index.html#lumen.input)   
[lumen](../)     
&emsp;&emsp;&emsp;[lumen.input](./)   
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;GamepadEvent

---

#GamepadEvent

Information about a gamepad event

`raw` : The raw event from the system, unmodified   
`timestamp` : The time in seconds when this touch event occurred, use for deltas   
`type` : The button id, if the event `type` is `button`   
`state` : The state this event is in   
`which` : The id of the gamepad this event comes from   
`button` : The button id, if the event `type` is `button`   
`axis` : The axis id, if the event `type` is `button`   
`value` : The axis value, if the event `type` is `axis`

---


[Members](#Members)   


---

&nbsp;   

<a class="lift" name="Members" ></a>
###Members   
---
<a class="lift" name="axis" href="#axis">axis</a>



`axis : Int`

<span class="small_desc_flat">  </span>   

<a class="lift" name="button" href="#button">button</a>



`button : Int`

<span class="small_desc_flat">  </span>   

<a class="lift" name="raw" href="#raw">raw</a>



`raw : lumen.types.InputEvent`

<span class="small_desc_flat">  </span>   

<a class="lift" name="state" href="#state">state</a>



`state : lumen.input.PressedState`

<span class="small_desc_flat">  </span>   

<a class="lift" name="timestamp" href="#timestamp">timestamp</a>



`timestamp : Float`

<span class="small_desc_flat">  </span>   

<a class="lift" name="type" href="#type">type</a>



`type : lumen.input.GamepadEventType`

<span class="small_desc_flat">  </span>   

<a class="lift" name="value" href="#value">value</a>



`value : Int`

<span class="small_desc_flat">  </span>   

<a class="lift" name="which" href="#which">which</a>



`which : Int`

<span class="small_desc_flat">  </span>   



&nbsp;
&nbsp;
&nbsp;

---  


&nbsp;   
&nbsp;   