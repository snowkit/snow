[![Logo]({{{rel_path}}}images/logo.png)]({{{rel_path}}}index.html#guide)

---

##two - life of a snow app

This guide assumes you have read guide [one]({{{rel_path}}}guide/one.html).

###Application lifecycle

The following is what happens by default, with a snow app.   
Highlighted functions are overridden in your app.

---

- snow entry
    - `config`
    - `ready`
    - loop
        - `update(delta:Float)`
        - `on_event(event:SystemEvent)`
    - `destroyed`
- snow shutdown

---

config and ready were discussed in guide [one]({{{rel_path}}}guide/one.html), so we move onto

#### loop

**`update`**   
By default, a snow app will run a loop and call your update function until it shuts down.   

The delta value is the difference in time (seconds) between the last update and this update.   
This is used for many aspects of realtime applications and is discussed in the [app detail guide]({{{rel_path}}}guide/app.html).   

**`on_event`**   
For lower level events handling only.   

This is called whenever a system event comes through from the platform, of any kind.   
It is useful if you want to handle events yourself, should you need to.   

This is referenced here for completeness, and is discussed in the [events detail guide]({{{rel_path}}}guide/events.html).   
**You don't need to use this for window, input and other higher level events**. 

#### destroyed

This function is called whenever snow gets a shutdown event.   
These events can happen from the system, from snow itself, or from your application.

From this function, make sure you clean up and destroy everything as there is no coming back from here.

###Important notes

The above loop structure is “by default”, which as you may suspect, can be configured.   
Through your flow file, you can request that the snow app does not enter the loop, and simply executes the same cycle, excluding the loop portion.

This can be really useful for running unit tests in their natural habitat, rather than in isolation.   
It can also be useful when creating command line tools or converters that do not require a loop at all.

To read more about the snow config itself, see the [snow config api docs]({{{rel_path}}}api/snow/types/SnowConfig.html).

---

##Moving forward

To find out more about the features and details, [jump back to the guide]({{{rel_path}}}index.html#guide)

<br/><br/><br/>
<br/><br/><br/>

