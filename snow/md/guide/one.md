[![Logo]({{{rel_path}}}images/logo.png)]({{{rel_path}}}index.html#guide)

---

##one - start here

This guide assumes you have [installed and setup snow already]({{{rel_path}}}guide/setup.html).

A snow app is composed of the following pieces at minimum.   
In this guide, we will call the example application _my_app_.   

---

- my_app
    - `assets/`
    - `src/Main.hx`
    - `project.flow`

---

`assets/` this is for any project assets. This folder is not required.   
`src/Main.hx` this is entry point of the app, and extends the _snow.App_ class.   
`project.flow` this is a description for the build pipeline to generate our app.   


###Building the application

snow uses [flow](http://snowkit.org/flow) to build it's applications.   
From your project directory (cd _my_app_), you use the **flow build** command.   
This will read the project.flow file, and generate your application into the **bin/** folder.

If you wanted to build _and_ run the application, use **flow run**.   

[flow](http://snowkit.org/flow) has it's own extensive documentation on it's features, but for now we can continue!   
From here on, the guide will use `flow run` to build and run the app when suggested.

###The entry point

If you ran the application, you should have seen a blank window, with the title 'snow app'.   
We will get to configure this shortly, as this requires changing `Main.hx`, the entry point.

Here is a very simple snow app:
```
import snow.Log.log;
import snow.types.Types;

class Main extends snow.App {

    override function config( config:AppConfig ) {

        return config;

    } //config

    override function ready() {

        log('ready');

    } //ready

} //Main

```

---

####ready

This function is where you start coding your application.   
In here, snow is ready and all features and systems are available from this point forward.   


####config

There is only one function that happens before ready - the `config` function.   
The config function is used by snow to handle changes you might want to do to the default and runtime config of your application, before ready is called.

What this means is that the following order of events takes place :

- snow entry point
    - set up snow systems
    - load default configs
    - request `config` from app
    - apply (possibly modified) config
- `ready`
    - your application code

###Change the config slightly

Let's modify the window title, to better reflect the application we are building.   
Notice how we modify the existing config, and then return it?   
This let's you intercept values and ensure they are what you intended later.   
For now, just set the window title and `flow run`.

```
override function config( config:AppConfig ) {

    config.window.title = 'my_app - a guide example';

    return config;

} //config
```

###Accessing the snow features and API

To access the features of the API from within your application, you use the `app` variable which is available because you extended `snow.App` itself. The app variable is actually pointing at the snow instance so that you can use its API in a very simple form.

For example, say you wanted show a message on the default window, you would ask `app.window` to show a message.

```
override function ready() {

    app.window.simple_message('app is ready!');

} //ready
```

---

####Important endpoints

From the API, some of the more important ones will be 

methods and properties

- app.shutdown() `quit the app`
- app.time `current timestamp`

members

- app.assets `load and manage assets`
- app.config `read only after config callback`
- app.io `platform independent and specific io helpers`
- app.input `input handler`
- app.audio `audio system`
- app.windowing `windowing system`
- app.window `the default window`

---

##Moving forward

This may seem short and simple, but understanding how the application fits together will allow you to architect applications however best fits your needs.

In guide [two]({{{rel_path}}}guide/two.html) the application lifecycle and other important functions like `update` are introduced.

Or, go back [to the guide]({{{rel_path}}}index.html#guide)

<br/><br/><br/>
<br/><br/><br/>
<br/><br/><br/>

