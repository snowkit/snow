
[![Logo](../../../images/logo.png)](../../../index.html)

---


##[API Index](../../../api/index.html#lumen.window)   
[lumen](../)     
&emsp;&emsp;&emsp;[lumen.window](./)   
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;Windowing

---

#Windowing

A window manager, accessed via `app.window`

---


[Members](#Members)   
[Methods](#Methods)   


---

&nbsp;   

<a class="lift" name="Members" ></a>
###Members   
---
<a class="lift" name="window_count" href="#window_count">window_count</a>



`window_count : Int`

<span class="small_desc_flat"> The number of windows in this manager </span>   

<a class="lift" name="window_list" href="#window_list">window_list</a>



`window_list : Map<Int,lumen.window.Window>`

<span class="small_desc_flat"> The list of windows in this manager </span>   

&nbsp;   

&nbsp;   

<a class="lift" name="Methods" ></a>
###Methods   
---
<a class="lift" name="create" href="#create">create</a>



`create(_config:lumen.types.WindowConfig) : lumen.window.Window`

<span class="small_desc_flat"> Create a window with the given config </span>   

<a class="lift" name="desktop_get_display_bounds" href="#desktop_get_display_bounds">desktop_get_display_bounds</a>



`desktop_get_display_bounds(display:Int) : lumen.window.DisplayBounds`

<span class="small_desc_flat"> `Desktop only` Get the bounds of the display by index </span>   

<a class="lift" name="desktop_get_display_count" href="#desktop_get_display_count">desktop_get_display_count</a>



`desktop_get_display_count() : Int`

<span class="small_desc_flat"> `Desktop only` Get the number of displays present </span>   

<a class="lift" name="desktop_get_display_current_mode" href="#desktop_get_display_current_mode">desktop_get_display_current_mode</a>



`desktop_get_display_current_mode(display:Int) : lumen.window.DisplayMode`

<span class="small_desc_flat"> `Desktop only` Get the current mode information of the display by index </span>   

<a class="lift" name="desktop_get_display_mode" href="#desktop_get_display_mode">desktop_get_display_mode</a>



`desktop_get_display_mode(display:Int, mode_index:Int) : lumen.window.DisplayMode`

<span class="small_desc_flat"> `Desktop only` Get the information from a specific mode index, the index obtrained from iterating with `desktop_get_display_mode_count` value </span>   

<a class="lift" name="desktop_get_display_mode_count" href="#desktop_get_display_mode_count">desktop_get_display_mode_count</a>



`desktop_get_display_mode_count(display:Int) : Int`

<span class="small_desc_flat"> `Desktop only` Get the number of display modes present </span>   

<a class="lift" name="desktop_get_display_name" href="#desktop_get_display_name">desktop_get_display_name</a>



`desktop_get_display_name(display:Int) : String`

<span class="small_desc_flat"> `Desktop only` Get the name of the display by index, where available </span>   

<a class="lift" name="desktop_get_display_native_mode" href="#desktop_get_display_native_mode">desktop_get_display_native_mode</a>



`desktop_get_display_native_mode(display:Int) : lumen.window.DisplayMode`

<span class="small_desc_flat"> `Desktop only` Get the native mode information of the display by index </span>   



&nbsp;
&nbsp;
&nbsp;

---  


&nbsp;   
&nbsp;   