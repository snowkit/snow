
[![Logo](../../../../images/logo.png)](../../../../index.html)

---

#ALC


&emsp;&emsp;&emsp;home   
[API Index](../../../../api/index.html#lumen.audio)   
&emsp;&emsp;&emsp;parent    
[lumen.audio](../)     
&emsp;&emsp;&emsp;current    
[lumen.audio.al](./) / ALC

<br/>

---


[Members](#Members)   
[Methods](#Methods)   


---

&nbsp;   

<a class="lift" name="Members" ></a>
###Members   
---
<a class="lift" name="ALL_ATTRIBUTES" href="#ALL_ATTRIBUTES">ALL_ATTRIBUTES</a>



`ALL_ATTRIBUTES : Int`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="ALL_DEVICES_SPECIFIER" href="#ALL_DEVICES_SPECIFIER">ALL_DEVICES_SPECIFIER</a>



`ALL_DEVICES_SPECIFIER : Int`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="ATTRIBUTES_SIZE" href="#ATTRIBUTES_SIZE">ATTRIBUTES_SIZE</a>



`ATTRIBUTES_SIZE : Int`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="DEFAULT_ALL_DEVICES_SPECIFIER" href="#DEFAULT_ALL_DEVICES_SPECIFIER">DEFAULT_ALL_DEVICES_SPECIFIER</a>



`DEFAULT_ALL_DEVICES_SPECIFIER : Int`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="DEFAULT_DEVICE_SPECIFIER" href="#DEFAULT_DEVICE_SPECIFIER">DEFAULT_DEVICE_SPECIFIER</a>



`DEFAULT_DEVICE_SPECIFIER : Int`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="DEVICE_SPECIFIER" href="#DEVICE_SPECIFIER">DEVICE_SPECIFIER</a>



`DEVICE_SPECIFIER : Int`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="ENUMERATE_ALL_EXT" href="#ENUMERATE_ALL_EXT">ENUMERATE_ALL_EXT</a>



`ENUMERATE_ALL_EXT : Int`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="EXTENSIONS" href="#EXTENSIONS">EXTENSIONS</a>



`EXTENSIONS : Int`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="FALSE" href="#FALSE">FALSE</a>



`FALSE : Int`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="FREQUENCY" href="#FREQUENCY">FREQUENCY</a>



`FREQUENCY : Int`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="INVALID_CONTEXT" href="#INVALID_CONTEXT">INVALID_CONTEXT</a>



`INVALID_CONTEXT : Int`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="INVALID_CONTEXT_MEANING" href="#INVALID_CONTEXT_MEANING">INVALID_CONTEXT_MEANING</a>



`INVALID_CONTEXT_MEANING : String`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="INVALID_DEVICE" href="#INVALID_DEVICE">INVALID_DEVICE</a>



`INVALID_DEVICE : Int`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="INVALID_DEVICE_MEANING" href="#INVALID_DEVICE_MEANING">INVALID_DEVICE_MEANING</a>



`INVALID_DEVICE_MEANING : String`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="INVALID_ENUM" href="#INVALID_ENUM">INVALID_ENUM</a>



`INVALID_ENUM : Int`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="INVALID_ENUM_MEANING" href="#INVALID_ENUM_MEANING">INVALID_ENUM_MEANING</a>



`INVALID_ENUM_MEANING : String`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="INVALID_VALUE" href="#INVALID_VALUE">INVALID_VALUE</a>



`INVALID_VALUE : Int`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="INVALID_VALUE_MEANING" href="#INVALID_VALUE_MEANING">INVALID_VALUE_MEANING</a>



`INVALID_VALUE_MEANING : String`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="MONO_SOURCES" href="#MONO_SOURCES">MONO_SOURCES</a>



`MONO_SOURCES : Int`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="NO_ERROR" href="#NO_ERROR">NO_ERROR</a>



`NO_ERROR : Int`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="OUT_OF_MEMORY" href="#OUT_OF_MEMORY">OUT_OF_MEMORY</a>



`OUT_OF_MEMORY : Int`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="OUT_OF_MEMORY_MEANING" href="#OUT_OF_MEMORY_MEANING">OUT_OF_MEMORY_MEANING</a>



`OUT_OF_MEMORY_MEANING : String`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="REFRESH" href="#REFRESH">REFRESH</a>



`REFRESH : Int`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="STEREO_SOURCES" href="#STEREO_SOURCES">STEREO_SOURCES</a>



`STEREO_SOURCES : Int`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="SYNC" href="#SYNC">SYNC</a>



`SYNC : Int`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="TRUE" href="#TRUE">TRUE</a>



`TRUE : Int`

<span class="small_desc_flat"> no description </span>   

&nbsp;   

<a class="lift" name="Methods" ></a>
###Methods   
---
<a class="lift" name="closeDevice" href="#closeDevice">closeDevice</a>



`closeDevice(device:Dynamic) : Bool`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="createContext" href="#createContext">createContext</a>



`createContext(device:Dynamic, ?attrlist:Array<Int>) : Dynamic`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="destroyContext" href="#destroyContext">destroyContext</a>



`destroyContext(context:Dynamic) : Void`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="getContextsDevice" href="#getContextsDevice">getContextsDevice</a>



`getContextsDevice(context:Dynamic) : Dynamic`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="getCurrentContext" href="#getCurrentContext">getCurrentContext</a>



`getCurrentContext() : Dynamic`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="getError" href="#getError">getError</a>



`getError(device:Dynamic) : Int`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="getErrorMeaning" href="#getErrorMeaning">getErrorMeaning</a>



`getErrorMeaning(error:Int) : String`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="getIntegerv" href="#getIntegerv">getIntegerv</a>



`getIntegerv(device:Dynamic, param:Int, size:Int) : Array<Int>`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="getString" href="#getString">getString</a>



`getString(device:Dynamic, param:Int) : String`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="makeContextCurrent" href="#makeContextCurrent">makeContextCurrent</a>



`makeContextCurrent(context:Dynamic) : Bool`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="openDevice" href="#openDevice">openDevice</a>



`openDevice(?devicename:String) : Dynamic`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="processContext" href="#processContext">processContext</a>



`processContext(context:Dynamic) : Void`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="suspendContext" href="#suspendContext">suspendContext</a>



`suspendContext(context:Dynamic) : Void`

<span class="small_desc_flat"> no description </span>   



&nbsp;
&nbsp;
&nbsp;

---  


&nbsp;   
&nbsp;   