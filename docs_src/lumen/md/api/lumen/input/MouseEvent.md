
[![Logo](../../../images/logo.png)](../../../index.html)

---


##[API Index](../../../api/index.html#lumen.input)   
[lumen](../)     
&emsp;&emsp;&emsp;[lumen.input](./)   
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;MouseEvent

---

#MouseEvent

Information about a mouse event 

`raw` : The raw event from the system, unmodified   
`timestamp` : The time in seconds when this touch event occurred, use for deltas   
`window_id` : The window id this event originated from    
`which` : Which mouse this event originated from (usually 0)   
`state` : The state this event is in   
`button` : The button id, if the event `state` is `down` or `up`   
`x` : The x position in the window of the mouse event   
`y` : The y position in the window of the mouse event   
`xrel` : The relative x position if `state` is `move` or a window has grabbed state   
`yrel` : The relative y position if `state` is `move` or a window has grabbed state

---


[Members](#Members)   


---

&nbsp;   

<a class="lift" name="Members" ></a>
###Members   
---
<a class="lift" name="button" href="#button">button</a>



`button : lumen.input.MouseButton`

<span class="small_desc_flat">  </span>   

<a class="lift" name="raw" href="#raw">raw</a>



`raw : lumen.types.InputEvent`

<span class="small_desc_flat">  </span>   

<a class="lift" name="state" href="#state">state</a>



`state : lumen.input.MouseState`

<span class="small_desc_flat">  </span>   

<a class="lift" name="timestamp" href="#timestamp">timestamp</a>



`timestamp : Float`

<span class="small_desc_flat">  </span>   

<a class="lift" name="which" href="#which">which</a>



`which : Int`

<span class="small_desc_flat">  </span>   

<a class="lift" name="window_id" href="#window_id">window_id</a>



`window_id : Int`

<span class="small_desc_flat">  </span>   

<a class="lift" name="x" href="#x">x</a>



`x : Int`

<span class="small_desc_flat">  </span>   

<a class="lift" name="xrel" href="#xrel">xrel</a>



`xrel : Int`

<span class="small_desc_flat">  </span>   

<a class="lift" name="y" href="#y">y</a>



`y : Int`

<span class="small_desc_flat">  </span>   

<a class="lift" name="yrel" href="#yrel">yrel</a>



`yrel : Int`

<span class="small_desc_flat">  </span>   



&nbsp;
&nbsp;
&nbsp;

---  


&nbsp;   
&nbsp;   