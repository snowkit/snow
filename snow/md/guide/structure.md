
<a href="" id="logo"><img src="{{{rel_path}}}images/logo.png" /></a>

---

##Structure

snow consists of three main layers :

- #### API layer
- #### adapter layer
- #### support layer

**API**

This is the user facing API that you as a snow user interact with.
The API is where you access everything from that you would use in your app.

It is written in haxe code, and resides in the `snow/` folder.

**adapter layer**

This is the code that adapts the API to the platform you are building for.

It is also written in haxe code, and resides in the `snow/` folder.
On native targets, this includes code to load functions from snow.ndll.
On the web target, this includes code that interacts with the browser.


**support layer**

This is the low level platform specific code that interacts with the target.

On **web**, this is written in haxe code, and resides in the `snow` folder (mostly in the adapter).

On **native**, this is written in c++ - and is built into and loaded from `snow.ndll`.
It resides in `project/src` and is compiled using `hxcpp`

---

<img src="{{{rel_path}}}images/structure.png" class="center"/>

---
