
[![Logo](../../../images/logo.png)](../../../index.html)

---


##[API Index](../../../api/index.html#lumen.input)   
[lumen](../)     
&emsp;&emsp;&emsp;[lumen.input](./)   
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;KeyEvent

---

#KeyEvent

Information about a keyboard event

`raw` : The raw event from the system, unmodified   
`scancode` : The `lumen.input.Scan` code value for this event   
`keycode` : The `lumen.input.Key` code value for this event   
`state` : The state of the key in this event   
`mod` : The modifier state of this event   
`repeat` : If this value is bigger than 0 this is a key repeat event of a key held down   
`timestamp` : The time in seconds when this touch event occurred, use for deltas   
`window_id` : The window id this event originated from

---


[Members](#Members)   


---

&nbsp;   

<a class="lift" name="Members" ></a>
###Members   
---
<a class="lift" name="keycode" href="#keycode">keycode</a>



`keycode : Int`

<span class="small_desc_flat">  </span>   

<a class="lift" name="mod" href="#mod">mod</a>



`mod : lumen.input.ModState`

<span class="small_desc_flat">  </span>   

<a class="lift" name="raw" href="#raw">raw</a>



`raw : lumen.types.InputEvent`

<span class="small_desc_flat">  </span>   

<a class="lift" name="repeat" href="#repeat">repeat</a>



`repeat : Bool`

<span class="small_desc_flat">  </span>   

<a class="lift" name="scancode" href="#scancode">scancode</a>



`scancode : Int`

<span class="small_desc_flat">  </span>   

<a class="lift" name="state" href="#state">state</a>



`state : lumen.input.PressedState`

<span class="small_desc_flat">  </span>   

<a class="lift" name="timestamp" href="#timestamp">timestamp</a>



`timestamp : Float`

<span class="small_desc_flat">  </span>   

<a class="lift" name="window_id" href="#window_id">window_id</a>



`window_id : Int`

<span class="small_desc_flat">  </span>   



&nbsp;
&nbsp;
&nbsp;

---  


&nbsp;   
&nbsp;   