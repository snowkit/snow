
[![Logo](../../images/logo.png)](../../index.html)

---


##[API Index](../../api/index.html#lumen)   
&emsp;&emsp;&emsp;[lumen](./)   
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;AppFixedTimestep

---

#AppFixedTimestep

Read the {App Guide} for full info, and for even more information see : http://gafferongames.com/game-physics/fix-your-timestep/
    this stores and calculates a fixed game update loop, and rendering interpolation is required
    for smooth updates between frames.

---


[Extends](#Extends)   
[Members](#Members)   
[Methods](#Methods)   


---

&nbsp;   

<a class="lift" name="Extends" ></a>
###Extends   
---
<a class="lift" name="lumen.App" href="{{{rel_path}}}api/lumen/App.html">lumen.App</a>

&nbsp;   

<a class="lift" name="Members" ></a>
###Members   
---
<a class="lift" name="mspf" href="#mspf">mspf</a>



`mspf : Float`

<span class="small_desc_flat"> fixed simulation update speed </span>   

<a class="lift" name="overflow" href="#overflow">overflow</a>



`overflow : Float`

<span class="small_desc_flat"> the overflow of the updates. This is used to calculate the alpha time for rendering interpolation, `var alpha_time = overflow / mspf;` </span>   

&nbsp;   

&nbsp;   

<a class="lift" name="Methods" ></a>
###Methods   
---
<a class="lift" name="new" href="#new">new</a>



`new() `

<span class="small_desc_flat">  </span>   



&nbsp;
&nbsp;
&nbsp;

---  


&nbsp;   
&nbsp;   