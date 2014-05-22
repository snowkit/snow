
[![Logo](../../../images/logo.png)](../../../index.html)

---


##[API Index](../../../api/index.html#lumen.input)   
[lumen](../)     
&emsp;&emsp;&emsp;[lumen.input](./)   
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;Input

---

#Input

Internal input system, accessed via `app.input`

---


[Methods](#Methods)   


---

&nbsp;   

&nbsp;   

&nbsp;   

<a class="lift" name="Methods" ></a>
###Methods   
---
<a class="lift" name="dispatch_gamepad_event" href="#dispatch_gamepad_event">dispatch_gamepad_event</a>



`dispatch_gamepad_event(_event:lumen.input.GamepadEvent) : Void`

<span class="small_desc_flat"> manually dispatch a gamepad event through the system, delivered to the app handlers, internal and external </span>   

<a class="lift" name="dispatch_key_event" href="#dispatch_key_event">dispatch_key_event</a>



`dispatch_key_event(_event:lumen.input.KeyEvent) : Void`

<span class="small_desc_flat"> manually dispatch a keyboard event through the system, delivered to the app handlers, internal and external </span>   

<a class="lift" name="dispatch_mouse_event" href="#dispatch_mouse_event">dispatch_mouse_event</a>



`dispatch_mouse_event(_event:lumen.input.MouseEvent) : Void`

<span class="small_desc_flat"> manually dispatch a mouse event through the system, delivered to the app handlers, internal and external </span>   

<a class="lift" name="dispatch_text_event" href="#dispatch_text_event">dispatch_text_event</a>



`dispatch_text_event(_event:lumen.input.TextEvent) : Void`

<span class="small_desc_flat"> manually dispatch a text event through the system, delivered to the app handlers, internal and external </span>   

<a class="lift" name="dispatch_touch_event" href="#dispatch_touch_event">dispatch_touch_event</a>



`dispatch_touch_event(_event:lumen.input.TouchEvent) : Void`

<span class="small_desc_flat"> manually dispatch a touch event through the system, delivered to the app handlers, internal and external </span>   

<a class="lift" name="keydown" href="#keydown">keydown</a>



`keydown(_code:Int) : Bool`

<span class="small_desc_flat"> returns true if the `Key` value is down at the time of calling this </span>   

<a class="lift" name="keypressed" href="#keypressed">keypressed</a>



`keypressed(_code:Int) : Bool`

<span class="small_desc_flat"> returns true if the `Key` value was pressed in the latest frame </span>   

<a class="lift" name="keyreleased" href="#keyreleased">keyreleased</a>



`keyreleased(_code:Int) : Bool`

<span class="small_desc_flat"> returns true if the `Key` value was released in the latest frame </span>   

<a class="lift" name="mod_state_from_event" href="#mod_state_from_event">mod_state_from_event</a>



`mod_state_from_event(event:lumen.types.InputEvent) : lumen.input.ModState`

<span class="small_desc_flat"> Helper to return a `ModState` (shift, ctrl etc) from a given `InputEvent` </span>   



&nbsp;
&nbsp;
&nbsp;

---  


&nbsp;   
&nbsp;   