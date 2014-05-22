
[![Logo](../../../images/logo.png)](../../../index.html)

---

#Window


##[API Index](../../../api/index.html#lumen.window)   
&emsp;&emsp;&emsp;parent    
[lumen](../)     
&emsp;&emsp;&emsp;current    
[lumen.window](./) / Window

<br/>

---


[Members](#Members)   
[Properties](#Properties)   
[Methods](#Methods)   


---

&nbsp;   

<a class="lift" name="Members" ></a>
###Members   
---
<a class="lift" name="asked_config" href="#asked_config">asked_config</a>



`asked_config : lumen.types.WindowConfig`

<span class="small_desc_flat"> the requested window config </span>   

<a class="lift" name="config" href="#config">config</a>



`config : lumen.types.WindowConfig`

<span class="small_desc_flat"> the actual returned window config </span>   

<a class="lift" name="fullscreen_desktop" href="#fullscreen_desktop">fullscreen_desktop</a>



`fullscreen_desktop : Bool`

<span class="small_desc_flat"> set this for fullscreen desktop mode, instead of fullscreen mode </span>   

<a class="lift" name="handle" href="#handle">handle</a>



`handle : Dynamic`

<span class="small_desc_flat"> the native window handle </span>   

<a class="lift" name="id" href="#id">id</a>



`id : Int`

<span class="small_desc_flat"> the window id, for tracking events to each window </span>   

<a class="lift" name="manager" href="#manager">manager</a>



`manager : lumen.window.Windowing`

<span class="small_desc_flat"> the manager this window belongs to </span>   

<a class="lift" name="window_event_handler" href="#window_event_handler">window_event_handler</a>



`window_event_handler : lumen.types.WindowEvent->Void`

<span class="small_desc_flat"> the window event handler callback </span>   

<a class="lift" name="window_render_handler" href="#window_render_handler">window_render_handler</a>



`window_render_handler : lumen.window.Window->Void`

<span class="small_desc_flat"> the window render handler callback </span>   

&nbsp;   

<a class="lift" name="Properties" ></a>
###Properties   
---
<a class="lift" name="bordered" href="#bordered">bordered</a>



`bordered : Bool`

<span class="small_desc_flat"> The window bordered state `(read/write)` </span>   

<a class="lift" name="fullscreen" href="#fullscreen">fullscreen</a>



`fullscreen : Bool`

<span class="small_desc_flat"> The window fullscreen state `(read/write)` </span>   

<a class="lift" name="grab" href="#grab">grab</a>



`grab : Bool`

<span class="small_desc_flat"> The window grab state `(read/write)` </span>   

<a class="lift" name="max_size" href="#max_size">max_size</a>



`max_size : lumen.window.WindowSize`

<span class="small_desc_flat"> The window maximum size `(read/write)` </span>   

<a class="lift" name="min_size" href="#min_size">min_size</a>



`min_size : lumen.window.WindowSize`

<span class="small_desc_flat"> The window minimum size `(read/write)` </span>   

<a class="lift" name="position" href="#position">position</a>



`position : lumen.window.WindowPosition`

<span class="small_desc_flat"> The window position `(read/write)` </span>   

<a class="lift" name="size" href="#size">size</a>



`size : lumen.window.WindowSize`

<span class="small_desc_flat"> The window size `(read/write)` </span>   

<a class="lift" name="title" href="#title">title</a>



`title : String`

<span class="small_desc_flat"> The window title `(read/write)` </span>   

&nbsp;   

&nbsp;   

<a class="lift" name="Methods" ></a>
###Methods   
---
<a class="lift" name="close" href="#close">close</a>



`close() : Void`

<span class="small_desc_flat"> Close the window </span>   

<a class="lift" name="new" href="#new">new</a>



`new(_manager:lumen.window.Windowing, _config:lumen.types.WindowConfig) `

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="simple_message" href="#simple_message">simple_message</a>



`simple_message(message:String, ?title:String='') : Void`

<span class="small_desc_flat"> Display a cross platform message on this window </span>   

<a class="lift" name="swap" href="#swap">swap</a>



`swap() : Void`

<span class="small_desc_flat"> Swap the back buffer of the window, call after rendering to update the window view </span>   



&nbsp;
&nbsp;
&nbsp;

---  


&nbsp;   
&nbsp;   