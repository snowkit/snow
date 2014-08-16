[![Logo]({{{rel_path}}}images/logo.png)]({{{rel_path}}}index.html#guide)

---

##Rendering


###OpenGL

Currently, rendering is handled by OpenGL on all platforms, using a shared API based on the WebGL specifications.

This does not exclude using higher level OpenGL features on platforms that support it, but it does mean that the majority of rendering code can be identical across **all platforms**. 
The majority of the bindings and implementations were originally from [nme](http://github.com/haxenme/nme) and were modified and changed to suit snow and it's goals.

To use the GL features, you simply **import snow.render.opengl.GL;** and all the classes, types and methods are available to you.  

All features of GL (except the types) are accessed via the GL class as static functions and values. 
For example to clear the screen, **GL.clear( GL.COLOR_BUFFER_BIT )** would be called.

Rendering functions should be called within your [window]({{{rel_path}}}guide/windowing.html) **onrender** function and as soon as **ready** is called, if a default window was requested, you may call OpenGL functions.

###Learning OpenGL

The bindings and API map to WebGL specification, so most WebGL tutorials would translate fairly seamlessly through minor syntax changes.   

This document is not aiming to teach OpenGL as this is a task unto itself, so the following resources might be of interest if you are just entering the OpenGL space. Be warned, that many tutorials on the internet feature outdated API calls and are not suited to modern rendering on modern hardware, so be sure that the tutorials you are reading conform to OpenGL 3.x+, OpenGL ES 2.0+, or WebGL specification and above.

In all tutorials, you may skip all the boilerplate on window + context creation and focus purely on rendering and onward. There are MANY tutorials online, so you should have no trouble finding more.

The linked resources conform to these requirements :

- http://learningwebgl.com/blog/?page_id=1217
- http://open.gl/
- http://www.opengl-tutorial.org/
- http://tomdalling.com/blog/category/modern-opengl/
- http://duriansoftware.com/joe/An-intro-to-modern-OpenGL.-Table-of-Contents.html
- http://code.tutsplus.com/articles/webgl-essentials-part-i--net-25856

###Important notes on portability

snow is designed to expose and offer you access to a rendering API on the platform that it is running on. This means that OpenGL may not be available on a near future target specifically, but a different API might be. This means that generally speaking (as is good common sense programming of graphical applications) you should be abstracting your rendering functions into discrete places such that the backend can be changed with minimal effort.

Of course, if you only plan on targetting platforms that support OpenGL, you may use it to the fullest extent without concern for portability.
Currently, it runs the same on iOS, Android, Web, Mac, Windows and Linux, so you can go pretty far with the assumption of OpenGL only.

###Future implementations

As snow is designed to handle multiple rendering options, there are plans on the roadmap to expose higher level OpenGL functions for desktops (like OpenGL 3.x and 4.x specific functions), as well as, when the time comes and OpenGL ES 3.0 and WebGL 2.0 become available and usable, bindings and access to the rendering features will be made available.

**We are always open to getting help with this**.

Currently, the snow development team has no direct goals or need for a DirectX binding implementation. If the community would need/want this, binding ANGLE, or DirectX api's in a similar fashion would not be discouraged, and if the implementations align with the snow API and goals would most certainly be considered for inclusion of the official API.

---

##Back

[To the guide]({{{rel_path}}}index.html#guide)

<br/><br/><br/>
<br/><br/><br/>