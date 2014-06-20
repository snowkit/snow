
[![Logo]({{{rel_path}}}images/logo.png)]({{{rel_path}}}index.html)

---

##The lumen App 
This is the base class for a basic lumen host application. This is what your game/app extends from. The most basic empty lumen application looks like this : 

```
class MyGame extends lumen.App {
    
    override function ready() {
        trace("initialize game here");
    }
    
}
```

lumen handles system events, input events, window events (if you request/create a window) and updating your application/game each frame. It is highly configurable/flexible and allows you to subvert the default behavior in favor of your own implementations.

That said - it does a lot for you already. Fixed timestep, variable timestep, no loop at all, these are all configurable options. Time scaling is also implemented on the lumen level, so that coding your games and applications becomes the focus for you.

###App handlers
These functions will be called by lumen for you, automatically and some of them can be configured.

`ready()` called when lumen is done, and you can initialize   
`update(delta:Float)` called once each frame, based on timing choices.   
`shutdown()` called when the application is shutting down, clean up here.   


###Timing options

**Note: All times are in seconds**

The default `lumen.App` implements fixed rate updates (capped) or uncapped updates, where either can have a fixed or variable timestep option for the delta time.  This means that the following is possible : 

- force `33ms update time` (~30fps) and set `33ms fixed delta` for deterministic delta/loop time.
- force `33ms update time` and use `variable delta time` for any rendering speed sync
- update/render at fastest time, no frame limiting, with `fixed delta time`
- update/render at fastest time, using `variable delta time`

Keep in mind that vsync is also available as an OS level sync that can cap or control the maximum update/render time.

Each of the methods below keep track of `delta_time` and `current_time`, where current_time is the simulation time according to the delta values (i.e relative to your sync, not to the system fixed time) and `delta_time` is always the time since the last frame.

To set the `capped update` : set the value of `fixed_rate` to a time in seconds.   
To set a `fixed delta` : set the value of `fixed_delta` to a time in seconds.

####Usage of update(delta:Float)

When you work on your game/app, you simply utilise the delta time passed into the update function, and the values in the `lumen.App` give you control over timescale in real time, so you don't have to manage that. For example, when moving an object horizontally each frame, you would do the following : 

```
override function update(delta:Float) {
    position.x += speed * delta;
}
```

If you were to change the timescale, the object would slow down automatically, or speed up. 

    app.timescale = 0.5;        //slow down time to 50%   
    app.timescale = 2;          //fast forward time   
    app.timescale = -1;         //rewind time   

Take note that rewinding and fast forwarding an entire game/app is up to you to implement, but the timing values will allow you to base your calculations of the same values for fixed delta, variable delta, or fixed time step without changing your code.


####"fix your timestep"
_This section is optional, for the users that want this more advanced behavior._

There is another type of update loop that is frequently desired, is a fixed time step with variable render rate, where the time frames are deterministic, and the frame rendering is interpolated when a render happens inbetween two updates. This link from Glenn Fiedler is where this method is well known from, http://gafferongames.com/game-physics/fix-your-timestep/. Another good example of the same system is explained here, with diagrams and more gameprogrammingpatterns.com/game-loop.html

In order to use this approach, you instead extend `lumen.AppFixedTimestep`, and to interpolate the frames you render with "alpha time", where the alpha time is calculated by : 

`var alpha_time = overflow / mspf;`

And then rendering with interpolated values, where `alpha_time` is the current % between two update calls, and you should render at that position instead.


##Todo 
tests / examples 


&nbsp;
&nbsp;