
[![Logo](../../../../../images/logo.png)](../../../../../api/index.html)

---



<h1>UInt8ClampedArray</h1>
<small>`snow.platform.native.utils.UInt8ClampedArray`</small>

Note that this class is included for completeness and perhaps doesn't yield
        the performance benefits one might assume by the smaller size. The difference between UInt8Array and
        Uint8Clamped array is simply that a clamp is applied to any value added into the array,
        such that the values never go below 0 and above 255.

---

`class`extends <code><span>snow.platform.native.utils.ArrayBufferView</span></code>

---

&nbsp;
&nbsp;





<h3>Properties</h3> <hr/><span class="member apipage">
                <a name="BYTES_PER_ELEMENT"><a class="lift" href="#BYTES_PER_ELEMENT">BYTES\_PER\_ELEMENT</a></a> <div class="clear"></div><code class="signature apipage">BYTES\_PER\_ELEMENT : [Int](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="length"><a class="lift" href="#length">length</a></a> <div class="clear"></div><code class="signature apipage">length : [Int](#)</code><br/></span>
            <span class="small_desc_flat"></span>



<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="set"><a class="lift" href="#set">set</a></a> <div class="clear"></div><code class="signature apipage">set(bufferOrArray:[Dynamic](#)<span></span>, offset:[Int](#)<span>=0</span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="subarray"><a class="lift" href="#subarray">subarray</a></a> <div class="clear"></div><code class="signature apipage">subarray(start:[Int](#)<span></span>, end:[Int](#)<span>=null</span>) : [snow.platform.native.utils.UInt8ClampedArray](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a> <div class="clear"></div><code class="signature apipage">new(bufferOrArray:[Dynamic](#)<span></span>, start:[Int](#)<span>=0</span>, length:[Int](#)<span>=null</span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    





---

&nbsp;
&nbsp;
&nbsp;
&nbsp;
