
[![Logo](../../../images/logo.png)](../../../api/index.html)

---



<h1>IOFile</h1>
<small>`snow.io.IOFile`</small>

This class is a low level cross platform file access helper, that handles in bundle assets etc.
    If you want a file, use `Assets` instead, unless really required.

---

`class`

---

&nbsp;
&nbsp;



<h3>Members</h3> <hr/><span class="member apipage">
                <a name="handle"><a class="lift" href="#handle">handle</a></a><div class="clear"></div><code class="signature apipage">handle : [Dynamic](#)</code><br/></span>
            <span class="small_desc_flat">The internal native file handle</span>





<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="read"><a class="lift" href="#read">read</a></a> <div class="clear"></div><code class="signature apipage">read(dest:[snow.utils.ByteArray](#)<span></span>, size:[Int](#)<span></span>, maxnum:[Int](#)<span></span>) : [Dynamic](#)</code><br/><span class="small_desc_flat">Read a `maxnum` of items of `size` in bytes, into `dest`. Same signature/returns as `fread`</span>
        </span>
    <span class="method apipage">
            <a name="write"><a class="lift" href="#write">write</a></a> <div class="clear"></div><code class="signature apipage">write(src:[snow.utils.ByteArray](#)<span></span>, size:[Int](#)<span></span>, num:[Int](#)<span></span>) : [Dynamic](#)</code><br/><span class="small_desc_flat">Write `num` of items of `size` in bytes, from `src` into this file. Same signature/returns as `fwrite`</span>
        </span>
    <span class="method apipage">
            <a name="seek"><a class="lift" href="#seek">seek</a></a> <div class="clear"></div><code class="signature apipage">seek(offset:[Int](#)<span></span>, whence:[Int](#)<span></span>) : [Dynamic](#)</code><br/><span class="small_desc_flat">Seek `offset` from `whence`, where whence is an int matching `set=0`, `cur=1`, `end=2`. Same signature/returns as `fseek`</span>
        </span>
    <span class="method apipage">
            <a name="tell"><a class="lift" href="#tell">tell</a></a> <div class="clear"></div><code class="signature apipage">tell() : [Dynamic](#)</code><br/><span class="small_desc_flat">Tell the current position in the file, in bytes</span>
        </span>
    <span class="method apipage">
            <a name="close"><a class="lift" href="#close">close</a></a> <div class="clear"></div><code class="signature apipage">close() : [Dynamic](#)</code><br/><span class="small_desc_flat">Close the file</span>
        </span>
    





---

&nbsp;
&nbsp;
&nbsp;
&nbsp;