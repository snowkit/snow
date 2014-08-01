
<a href="{{{rel_path}}}index.html" id="logo"><img src="{{{rel_path}}}images/logo.png" /></a>

<div class="topmenu">
[api]({{{rel_path}}}api/index.html) . [guide](#guide) ![github]({{{rel_path}}}/images/github.png)  [source](https://github.com/underscorediscovery/snow) . [issues](https://github.com/underscorediscovery/snow/issues/)
</div>

---

##About

snow is a light, pure and clean toolkit for building frameworks, applications and games using [haxe](http://haxe.org), targeting native platforms and browser.
This means snow by default runs natively on **Mac**, **Windows**, **Linux** desktops, as well as **iOS** and **Android** devices. It also runs directly in the **Web** browser using webgl.

&nbsp;_how?_

&nbsp;

[ <img src="{{{rel_path}}}images/haxe.png" target="_blank" class="small-image"/> ](http://haxe.org)   

Haxe is an expressive, beautiful modern programming language that compiles it's own code into other languages. 
This allows you, a user of haxe and thus snow - to build your code into the target platform code directly.

<div class="breakout">

[Get Started](#guide)
[More Details](#details)
[View Samples](#samples)

</div>

---

##Design

snow embraces a minimal, straight arrow approach by exposing a variety of tools at your disposal,
with as much consistency as possible across targets. This allows you to focus on yout code and not the platform code.

snow is built as a facilitator only - it is focused on portability, clarity, consistency and maintainability.
This allows you to build frameworks, games and applications without it getting in the way.
This means that snow tries to avoid making assumptions, letting you decide your architecture.

snow is also as self contained as possible.
It is built with no external dependencies, except for a build pipeline called [flow](#), which makes the application.

snow has tests of various kinds, you can read more about the [testing approach]({{{rel_path}}}guide/contribute.html#tests) in the contributors guide.


<div class="guide">
<a name="guide"> &nbsp;</a>
<h2>Guide</h2>

**Setup guides**<br/>
<br/>
[Setup]({{{rel_path}}}guide/Setup.html) <br/>

<br/><br/>
**Starter guides**<br/>
<br/>
[one - start here]({{{rel_path}}}guide/one.html) <br/>
[two - life of a snow app]({{{rel_path}}}guide/two.html) <br/>
[three - dealing with assets]({{{rel_path}}}guide/three.html) <br/>
[four - interactivity]({{{rel_path}}}guide/four.html) <br/>

<br/>
**Feature guides** <br/>
<br/>
[Windowing]({{{rel_path}}}guide/windowing.html) | [Audio]({{{rel_path}}}guide/audio.html) | [Assets]({{{rel_path}}}guide/assets.html) | [Input]({{{rel_path}}}guide/input.html) | [rendering]({{{rel_path}}}guide/render.html) | [IO]({{{rel_path}}}guide/io.html) | [Utils]({{{rel_path}}}guide/utils.html)
<br/>
<br/>
**API docs**<br/>
<br/>
[API reference]({{{rel_path}}}api/index.html)
<br/>
<br/>

**Development guides**<br/>
<br/>
[want to help? - start here!]({{{rel_path}}}guide/contribute.html) <br/>
[be reliable - help write tests]({{{rel_path}}}guide/contribute.html#tests) <br/>
[the more you know - help write guides]({{{rel_path}}}guide/contribute.html#guides) <br/>
[what goes where? - structure guide]({{{rel_path}}}guide/structure.html) <br/>
[playing nice - code/design conventions]({{{rel_path}}}guide/codedesign.html) <br/>

<br/>
<br/>
**In depth guides** <br/><br/>
[structure - the snow architecture]({{{rel_path}}}guide/structure.html)   
[build process - how an app is made]({{{rel_path}}}guide/buildprocess.html)   
[native code - build, modify, fix snow.ndll]({{{rel_path}}}guide/nativesupport.html)   
[native code - porting to a new platform]({{{rel_path}}}guide/nativeporting.html)   

</div>

---

<a name="details">
<a href="#details"><h2>Details</h2></a>
</a>

[**Features**](#features)  <br/>
&emsp; &emsp; [render](#render) | [audio](#audio) | [assets](#assets) | [input](#input) | [util](#util)  <br/><br/>

<a name="features">
<a href="#features"><h3>Features</h3></a>
</a>

On top of the comprehensive, full fledged <a href="http://api.haxe.org/" target="_blank">Haxe API</a>,

<a name="render"><a href="#render">**windowing & rendering**</a></a>
   - consistent access to OpenGL API based on WebGL spec
   - normal, borderless, fullscreen or resizable windows
   - `native` auto or manual window swap control
   - `desktop` multiple window support
   - `desktop` full access to display/mode info

<a name="audio"><a href="#audio">**audio**</a></a>
   - consistent high level api, with access to platform specific implementations
   - named sound api, or object management play('sound') vs sound.play()
   - pitch, pan, volume, position, duration properties
   - play sound or stream sound, looped or not
   - on complete handling
   - `native` full direct access to OpenAL API from haxe
   - `native` auto background thread toggle

<a name="assets"><a href="#assets">**assets and io**</a></a>
   - consistent api for loading assets across targets
   - raw bytes, text, images and audio support
   - async based api design to handle preloading easily (like on web)
   - `web` audio - ogg, wav, mp3 (see [snags](#snags))
   - `web` images - bmp, png, jpg, gif
   - `native` images - these ^ + tga, psd
   - `native` audio - ogg, wav, pcm
   - `native` consistent manual file IO for targets (like android) if needed
   - `desktop` OS file change notification events on any folder
   - `desktop` OS open/save/folder dialogs

<a name="input"><a href="#input">**input**</a></a>
   - complete events for mouse, keys, gamepad, touches
   - text input events for handling localized text reliably
   - keys - simple keycode/scancode access as well as text
   - gamepad events api
   - gamepad events for hot plugging/swapping devices at runtime
   - immediate style access in addition to events handlers
   - `desktop` mouse - position, window lock, window grab, and visibility
   - `mobile` multitouch supported

<a name="util"><a href="#util">**util**</a></a>
   - (almost) full set of [Typed Arrays](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Typed_arrays) for use on all targets
   - ByteArray util for handling bytes
   - high res timestamps, consistent Timer for repeat/once handlers for all targets
   - open a url in the default browser
   - `native` access to ndll/dll endpoints compiled with hxcpp on all targets

---

<h3>Further details</h3>

[**Build pipeline details**]({{{rel_path}}}guide/builddetails.html) <br/>
&emsp; &emsp; [compiling]({{{rel_path}}}guide/builddetails.html#compiling) | [project format]({{{rel_path}}}guide/builddetails.html#project) | [architectures]({{{rel_path}}}guide/builddetails.html#arch)

[**Platform implementation details**]({{{rel_path}}}guide/platformfaq.html) <br/>
&emsp; &emsp; [web]({{{rel_path}}}guide/platformfaq.html#web) | [mac]({{{rel_path}}}guide/platformfaq.html#mac) | [windows]({{{rel_path}}}guide/platformfaq.html#windows) | [linux]({{{rel_path}}}guide/platformfaq.html#linux) | [android]({{{rel_path}}}guide/platformfaq.html#android) | [ios]({{{rel_path}}}guide/platformfaq.html#ios) 

---
<a name="snags">
<a href="#snags"><h3>Snags</h3></a>
</a>
The snag list below is a list of things that are known issues or inconsistencies across platforms to take note of.

- [#10](https://github.com/underscorediscovery/snow/issues/10) `native` audio - streaming is on the main thread
- [#24](https://github.com/underscorediscovery/snow/issues/24) `native` render - GLObject not conforming to WebGL spec

For a full list of issues, open and resolved, refer to the [github issue tracker](https://github.com/underscorediscovery/snow/issues) <br/>
<br/>
Transparent development is better for everyone, so please feel free to report issues and we will continue to keep working at them, and keeping you informed.<br/>
And of course, if you want to resolve these issues for the benefit of the library, you are most welcome - read the [contributor guide]({{{rel_path}}}guide/contribute.html).<br/>

<br/><br/>

<a name="samples">
<a href="#samples"><h2>Samples</h2></a>
</a>


