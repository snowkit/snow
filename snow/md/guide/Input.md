[![Logo]({{{rel_path}}}images/logo.png)]({{{rel_path}}}index.html#guide)

---

##Handling input

snow is setup to handle input directly from the source, as it happens.   
The way input is delivered to you, is through a set of functions in your app that you override, like with `ready` and `update` and so on.

snow has support for multitouch events, gamepad/controller events, keyboard and text events, as well as mouse events. 

**note**   
As snow is a low level framework, it does not make assumptions about data structures and tries to avoid unnecessary allocations.
For this reason, the functions may have many arguments but are intentionally lean and are for you to architect whichever way you see fit.   

###simple 

As input events are fairly straight forward, the code below will illustrate the signatures and not much more. 
For full documentation on each of the functions see the API reference.

--- 

Below we simply log the events as they happen.    

Since some of the information here is secondary, like timestamp and window id,   
Those arguments are ignored with the haxe _ construct for clarity.   
The full arguments all include `timestamp:Float`, `window_id:Int` except where noted.

###Mouse events

---

```
override function onmousedown( x:Int, y:Int, button:Int, _ , _ ) {
    log('mouse down / $x / $y / $button');
}

override function onmouseup( x:Int, y:Int, button:Int, _ , _ ) {
    log('mouse up / $x / $y / $button');
}

override function onmousewheel( x:Int, y:Int, _ , _ ) {
    log('mouse wheel / $x / $y');
}

override function onmousemove( x:Int, y:Int, xrel:Int, yrel:Int, _ , _ ) {
    log('mouse move / $x / $y / $xrel / $yrel');
}

```

---

###Key and text events

---

```
override function onkeydown( key:Int, scan:Int, repeat:Bool, mod:ModState, _ , _ ) {
    log('key up / $key / $scan / $repeat / $mod');
}

override function onkeyup( key:Int, scan:Int, repeat:Bool, mod:ModState, _ , _ ) {
    log('key up / $key / $scan / $repeat / $mod');
}

override function ontextinput( text:String, start:Int, length:Int, type:TextEventType, _ , _ ) {
    log('text input / $text / $start / $length / $type');
}
```

---

###Touch events

since touch events happen on the main window, they have no window_id.

---
```

override function ontouchdown( x:Float, y:Float, touch_id:Int, _ ) {
    log('touch down / $x / $y / $touch_id');
}

override function ontouchup( x:Float, y:Float, touch_id:Int, _ ) {
    log('touch up / $x / $y / $touch_id');
}

override function ontouchmove( x:Float, y:Float, dx:Float, dy:Float, touch_id:Int, _ ) {
    log('touch move / $x / $y / $dx / $dy / $touch_id');
}
```

--- 

###Gamepad events

since gamepad events are not associated with a window, they have no window_id either.   
gamepad device events are things like removing/adding gamepads at runtime.

---
```

override function ongamepadaxis( gamepad:Int, axis:Int, value:Float, _ ) {
    log('gamepad / $gamepad / $axis / $value')
}

override function ongamepadbuttondown( gamepad:Int, button:Int, value:Float, _ ) {
    log('gamepad / $gamepad / $button / $value')
}

override function ongamepadbuttonup( gamepad:Int, button:Int, value:Float, _ ) {
    log('gamepad / $gamepad / $button / $value')
}

override function ongamepaddevice( gamepad:Int, type:GamepadDeviceEventType, _ ) {
    log('gamepad / $gamepad / $type')
}
```

---

###Immediate style handlers

From the app variable you can access the `app.input` handler and query the immediate state of input whenever you like, for that frame.

The following list of functions are how you would query them, and are documented in the [API docs]({{{rel_path}}}api).

```
    function keypressed( _code:Int ) : Bool;
    function keyreleased( _code:Int ) : Bool;
    function keydown( _code:Int ) : Bool;
    function scanpressed( _code:Int ) : Bool;
    function scanreleased( _code:Int ) : Bool;
    function scandown( _code:Int ) : Bool;

    function mousepressed( _button:Int ) : Bool;
    function mousereleased( _button:Int ) : Bool;
    function mousedown( _button:Int ) : Bool;

    function gamepadpressed( _gamepad:Int, _button:Int ) : Bool;
    function gamepadreleased( _gamepad:Int, _button:Int ) : Bool;
    function gamepaddown( _gamepad:Int, _button:Int ) : Bool;
    function gamepadaxis( _gamepad:Int, _axis:Int ) : Float;
```

---

##Back

[To the guide]({{{rel_path}}}index.html#guide)

<br/><br/><br/>
<br/><br/><br/>

