[![Logo]({{{rel_path}}}images/logo.png)]({{{rel_path}}}index.html#guide)

---

##Windowing

The windowing system handles anything related to the display, and the application windows.   

###The default window

By default, snow will create a window for you, which can be configured through the **config** function override in your app, which is discussed in guide [one]({{{rel_path}}}guide/one.html).   

The default window config is stored against the **app.config.window** node for later reference, and doesn't affect the window after **config** happens.   

To change the properties or state of the window, you would use the window instance directly, from **app.window**. 
This allows you to change things like the title, the window decorations, fullscreen state, changing the position or size of a window after it is created.   

The same applies for windows that you create manually, the window instance is used to manage the window, including removing the window through **destroy**.

####Disable the default window

There are times a window is not desired, for example, on a headless server or for command line applications. 
To bypass creating the default window, you would set the flag **has_window** on the **AppConfig** in the config function to false.

You can see an example of this in the **tests/unit/** folder, where the application runs without a window, or a main loop.

---

```
override function config( config:AppConfig ) {

    config.has_window = false;

    return config;

} //config
```

---

####Rendering and Window Events

To listen for window events, you assign an **onevent** handler directly to the window. Likewise, for rendering, you assign an **onrender** handler to the window that will be called whenever the window is being rendered. 

Only call rendering commands within here, as the function ensures that the window is current for drawing into, and ensures that drawing happens in order with the window swapping (unless you handle this manually, see advanced control below).

An example of rendering and event callbacks, [window events]({{{rel_path}}}api/snow/types/WindowEventType.html) and [window](api/snow/window/Window.html) docs.

---
```
override function ready() {

    app.window.onrender = on_render;
    app.window.onevent = on_window_event;

} //ready


function on_render( window:Window ) {
    
    // ...draw stuff

} //on_render


function on_window_event( event:WindowEvent ) {
    
    switch(event.type) {

        case WindowEventType.window_resized: {
            //handle resizing
        }

        case WindowEventType.window_focus_gained: {
            //handle focus change
        }

    } //switch type

} //on_window_event


```

---

####Advanced control

By default, windows will swap automatically, but this can be disabled through the **window.auto_swap = false;** flag, and you must call **window.swap()** when you want it to swap the buffers.
Also by default, windows will call render automatically, along with the rest of the windows. To control the window rendering manually, disable the **window.auto_render** flag and call **window.render** manually.

This is of course not required, and is for advanced use only.


###Windowing features

The **app.windowing** instance on the other hand, is the window manager. This tracks the existing windows, 
and exposes api functions for the desktop and systems to use to handle vertical sync, the system cursor state, 
or anything that is not directly related to a window in particular. 

Anything related to a window would be from the window instance, everything else is from the window manager.

You can see the full list of options from the [windowing api docs]({{{rel_path}}}api/snow/window/Windowing.html).

Take note that some functions are platform specific, such as the name of the display on web is going to be the browser name, not the physical display name and so on.

---

####Creating multiple windows

To create a window, simply call **app.windowing.create( window_config:WindowConfig )** with the requested config. 
This config is a request, and not all features might be honored by the OS window system, or the platform. 
To find out what config you really obtained, the returned *Window* instance has a **config** and an **asked_config** node for comparison.

```
override function ready() {

    var window2 : Window = app.windowing.create({
        title:'second window',
        resizable : true,
        width : 320,
        height : 420
    });

} //ready
```

---

##Back

[To the guide]({{{rel_path}}}index.html#guide)

<br/><br/><br/>
<br/><br/><br/>