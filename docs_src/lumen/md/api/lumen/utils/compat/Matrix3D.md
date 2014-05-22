
[![Logo](../../../../images/logo.png)](../../../../index.html)

---


##[API Index](../../../../api/index.html#lumen.utils)   
[lumen.utils](../)     
&emsp;&emsp;&emsp;[lumen.utils.compat](./)   
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;Matrix3D

---

#Matrix3D


---


[Members](#Members)   
[Properties](#Properties)   
[StaticMethods](#StaticMethods)   
[Methods](#Methods)   


---

&nbsp;   

<a class="lift" name="Members" ></a>
###Members   
---
<a class="lift" name="rawData" href="#rawData">rawData</a>



`rawData : lumen.utils.compat.Vector<Float>`

<span class="small_desc_flat">  </span>   

&nbsp;   

<a class="lift" name="Properties" ></a>
###Properties   
---
<a class="lift" name="determinant" href="#determinant">determinant</a>



`determinant : Float`

<span class="small_desc_flat">  </span>   

<a class="lift" name="position" href="#position">position</a>



`position : lumen.utils.compat.Vector3D`

<span class="small_desc_flat">  </span>   

&nbsp;   

<a class="lift" name="StaticMethods" ></a>
###StaticMethods   
---
<a class="lift" name="create2D" href="#create2D">create2D</a>



`create2D(x:Float, y:Float, ?scale:Float=1, ?rotation:Float=0) : lumen.utils.compat.Matrix3D`

<span class="small_desc_flat">  </span>   

<a class="lift" name="createABCD" href="#createABCD">createABCD</a>



`createABCD(a:Float, b:Float, c:Float, d:Float, tx:Float, ty:Float) : lumen.utils.compat.Matrix3D`

<span class="small_desc_flat">  </span>   

<a class="lift" name="createOrtho" href="#createOrtho">createOrtho</a>



`createOrtho(x0:Float, x1:Float, y0:Float, y1:Float, zNear:Float, zFar:Float) : lumen.utils.compat.Matrix3D`

<span class="small_desc_flat">  </span>   

&nbsp;   

<a class="lift" name="Methods" ></a>
###Methods   
---
<a class="lift" name="append" href="#append">append</a>



`append(lhs:lumen.utils.compat.Matrix3D) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="appendRotation" href="#appendRotation">appendRotation</a>



`appendRotation(degrees:Float, axis:lumen.utils.compat.Vector3D, ?pivotPoint:lumen.utils.compat.Vector3D) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="decompose" href="#decompose">decompose</a>



`decompose() : lumen.utils.compat.Vector<lumen.utils.compat.Vector3D>`

<span class="small_desc_flat">  </span>   

<a class="lift" name="new" href="#new">new</a>



`new(?v:lumen.utils.compat.Vector<Float>) `

<span class="small_desc_flat">  </span>   

<a class="lift" name="recompose" href="#recompose">recompose</a>



`recompose(components:lumen.utils.compat.Vector<lumen.utils.compat.Vector3D>) : Bool`

<span class="small_desc_flat">  </span>   

<a class="lift" name="transformVectors" href="#transformVectors">transformVectors</a>



`transformVectors(vin:lumen.utils.compat.Vector<Float>, vout:lumen.utils.compat.Vector<Float>) : Void`

<span class="small_desc_flat">  </span>   



&nbsp;
&nbsp;
&nbsp;

---  


&nbsp;   
&nbsp;   