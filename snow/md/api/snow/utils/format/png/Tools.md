
[![Logo](../../../../../images/logo.png)](../../../../../api/index.html)

---



<h1>Tools</h1>
<small>`snow.utils.format.png.Tools`</small>



---

`class`

---

&nbsp;
&nbsp;







<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="getHeader"><a class="lift" href="#getHeader">getHeader</a></a> <span class="inline-block static">static</span><div class="clear"></div><code class="signature apipage">getHeader(d:[snow.utils.format.png.Data](#)<span></span>) : [snow.utils.format.png.Header](#)</code><br/><span class="small_desc_flat">Returns the PNG header informations. Throws an exception if no header found.</span>
        </span>
    <span class="method apipage">
            <a name="getPalette"><a class="lift" href="#getPalette">getPalette</a></a> <span class="inline-block static">static</span><div class="clear"></div><code class="signature apipage">getPalette(d:[snow.utils.format.png.Data](#)<span></span>) : [haxe.io.Bytes](#)</code><br/><span class="small_desc_flat">Return the PNG palette colors, or null if no palette chunk was found</span>
        </span>
    <span class="method apipage">
            <a name="reverseBytes"><a class="lift" href="#reverseBytes">reverseBytes</a></a> <span class="inline-block static">static</span><div class="clear"></div><code class="signature apipage">reverseBytes(b:[haxe.io.Bytes](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat">Converts from BGRA to ARGB and the other way by reversing bytes.</span>
        </span>
    <span class="method apipage">
            <a name="extractGrey"><a class="lift" href="#extractGrey">extractGrey</a></a> <span class="inline-block static">static</span><div class="clear"></div><code class="signature apipage">extractGrey(d:[snow.utils.format.png.Data](#)<span></span>) : [haxe.io.Bytes](#)</code><br/><span class="small_desc_flat">Decode the greyscale PNG data and apply filters, extracting only the grey channel if alpha is present.</span>
        </span>
    <span class="method apipage">
            <a name="extract32"><a class="lift" href="#extract32">extract32</a></a> <span class="inline-block static">static</span><div class="clear"></div><code class="signature apipage">extract32(d:[snow.utils.format.png.Data](#)<span></span>, bytes:[haxe.io.Bytes](#)<span>=null</span>) : [haxe.io.Bytes](#)</code><br/><span class="small_desc_flat">Decode the PNG data and apply filters. By default this will output BGRA low-endian format. You can use the [reverseBytes] function to inverse the bytes to ARGB big-endian format.</span>
        </span>
    <span class="method apipage">
            <a name="buildGrey"><a class="lift" href="#buildGrey">buildGrey</a></a> <span class="inline-block static">static</span><div class="clear"></div><code class="signature apipage">buildGrey(width:[Int](#)<span></span>, height:[Int](#)<span></span>, data:[haxe.io.Bytes](#)<span></span>) : [snow.utils.format.png.Data](#)</code><br/><span class="small_desc_flat">Creates PNG data from bytes that contains one bytes (grey values) for each pixel.</span>
        </span>
    <span class="method apipage">
            <a name="buildRGB"><a class="lift" href="#buildRGB">buildRGB</a></a> <span class="inline-block static">static</span><div class="clear"></div><code class="signature apipage">buildRGB(width:[Int](#)<span></span>, height:[Int](#)<span></span>, data:[haxe.io.Bytes](#)<span></span>) : [snow.utils.format.png.Data](#)</code><br/><span class="small_desc_flat">Creates PNG data from bytes that contains three bytes (R,G and B values) for each pixel.</span>
        </span>
    <span class="method apipage">
            <a name="build32ARGB"><a class="lift" href="#build32ARGB">build32ARGB</a></a> <span class="inline-block static">static</span><div class="clear"></div><code class="signature apipage">build32ARGB(width:[Int](#)<span></span>, height:[Int](#)<span></span>, data:[haxe.io.Bytes](#)<span></span>) : [snow.utils.format.png.Data](#)</code><br/><span class="small_desc_flat">Creates PNG data from bytes that contains four bytes in ARGB format for each pixel.</span>
        </span>
    <span class="method apipage">
            <a name="build32BGRA"><a class="lift" href="#build32BGRA">build32BGRA</a></a> <span class="inline-block static">static</span><div class="clear"></div><code class="signature apipage">build32BGRA(width:[Int](#)<span></span>, height:[Int](#)<span></span>, data:[haxe.io.Bytes](#)<span></span>) : [snow.utils.format.png.Data](#)</code><br/><span class="small_desc_flat">Creates PNG data from bytes that contains four bytes in BGRA format for each pixel.</span>
        </span>
    





---

&nbsp;
&nbsp;
&nbsp;
&nbsp;
