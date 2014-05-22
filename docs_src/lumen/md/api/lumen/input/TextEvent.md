
[![Logo](../../../images/logo.png)](../../../index.html)

---


##[API Index](../../../api/index.html#lumen.input)   
[lumen](../)     
&emsp;&emsp;&emsp;[lumen.input](./)   
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;TextEvent

---

#TextEvent

Information about a text input event

`raw` : The raw event from the system, unmodified   
`text` : The text that this event has generated   
`type` : The type of text event   
`timestamp` : The time in seconds when this touch event occurred, use for deltas   
`window_id` : The window id this event originated from   
`start` : The start position, if the `type` is `edit`   
`length` : The length position, if the `type` is `edit`

---


[Members](#Members)   


---

&nbsp;   

<a class="lift" name="Members" ></a>
###Members   
---
<a class="lift" name="length" href="#length">length</a>



`length : Int`

<span class="small_desc_flat">  </span>   

<a class="lift" name="raw" href="#raw">raw</a>



`raw : lumen.types.InputEvent`

<span class="small_desc_flat">  </span>   

<a class="lift" name="start" href="#start">start</a>



`start : Int`

<span class="small_desc_flat">  </span>   

<a class="lift" name="text" href="#text">text</a>



`text : String`

<span class="small_desc_flat">  </span>   

<a class="lift" name="timestamp" href="#timestamp">timestamp</a>



`timestamp : Float`

<span class="small_desc_flat">  </span>   

<a class="lift" name="type" href="#type">type</a>



`type : lumen.input.TextEventType`

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