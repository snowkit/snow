
[![Logo](../../../images/logo.png)](../../../index.html)

---


##[API Index](../../../api/index.html#lumen.io)   
[lumen](../)     
&emsp;&emsp;&emsp;[lumen.io](./)   
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;IOFile

---

#IOFile

This class is a low level cross platform file access helper, that handles in bundle assets etc. 
    If you want a file, use `Assets` instead, unless really required.

---


[Members](#Members)   
[Methods](#Methods)   


---

&nbsp;   

<a class="lift" name="Members" ></a>
###Members   
---
<a class="lift" name="handle" href="#handle">handle</a>



`handle : Dynamic`

<span class="small_desc_flat"> The internal native file handle </span>   

&nbsp;   

&nbsp;   

<a class="lift" name="Methods" ></a>
###Methods   
---
<a class="lift" name="close" href="#close">close</a>



`close() : Dynamic`

<span class="small_desc_flat"> Close the file </span>   

<a class="lift" name="read" href="#read">read</a>



`read(dest:lumen.utils.ByteArray, size:Int, maxnum:Int) : Dynamic`

<span class="small_desc_flat"> Read a `maxnum` of items of `size` in bytes, into `dest`. Same signature/returns as `fread` </span>   

<a class="lift" name="seek" href="#seek">seek</a>



`seek(offset:Int, whence:Int) : Dynamic`

<span class="small_desc_flat"> Seek `offset` from `whence`, where whence is an int matching `set=0`, `cur=1`, `end=2`. Same signature/returns as `fseek` </span>   

<a class="lift" name="tell" href="#tell">tell</a>



`tell() : Dynamic`

<span class="small_desc_flat"> Tell the current position in the file, in bytes </span>   

<a class="lift" name="write" href="#write">write</a>



`write(src:lumen.utils.ByteArray, size:Int, num:Int) : Dynamic`

<span class="small_desc_flat"> Write `num` of items of `size` in bytes, from `src` into this file. Same signature/returns as `fwrite` </span>   



&nbsp;
&nbsp;
&nbsp;

---  


&nbsp;   
&nbsp;   