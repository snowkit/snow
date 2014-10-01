
<a href="{{{rel_path}}}index.html" id="logo"><img src="{{{rel_path}}}images/logo.png" /></a>

<div class="topmenu">
[api]({{{rel_path}}}api/index.html) . [guide](#guide) ![github]({{{rel_path}}}/images/github.png)  [source](https://github.com/underscorediscovery/snow) . [issues](https://github.com/underscorediscovery/snow/issues/)
</div>

---
<script src="{{{rel_path}}}js/release.version.js"> </script>
<div class="version">current version <a href="#" id="version_notes_link" target="_blank">notes</a> <code> <a id="version_tag" target="_blank" href="#"> latest </a></code> </div>

<br/>
##About

**snow** is a free, <a href="https://github.com/underscorediscovery/snow/blob/master/LICENSE.md" data-tooltip="MIT license" class="tooltip">open source</a> light, pure and clean toolkit for building frameworks, applications and games using [haxe](http://haxe.org), targeting native platforms and web browser.
This means snow by default runs natively on **Mac**, **Windows**, **Linux** desktops, as well as **iOS** and **Android** devices. It also runs directly in the **Web** browser using webgl.

&nbsp;_how?_


&nbsp;

[ <img src="{{{rel_path}}}images/haxe.png" target="_blank" class="small-image"/> ](http://haxe.org)   

<span class="haxedesc">Haxe is an expressive, beautiful modern programming language <br/>
      that compiles its own code into other languages. <a href="http://haxe.org/" target="_blank"> learn more</a> </span>

<br/>

---

<div class="breakout">

[Get Started](#guide)
[More Details](#details)
[View Samples](#samples)

</div>

---

###Alpha

<small>
Please note   

snow is currently considered alpha, which means there may be bugs, inconsistencies, incomplete implementations, and possible minor API changes.
It is still considered fairly stable and is being used by multiple frameworks and games,
but there are things to tighten up before 1.0.0 release can be called final. 

Join us in developing and testing the framework and tools, below.
</small>

---

##Design

**snow embraces a minimal design.**   
&emsp; This means snow is to the point and does what it is designed for only.   
&emsp; This includes exposing tools to you with as much consistency as possible across platforms.   
&emsp; This allows you to focus on your code, and not platform details as much.   

**snow is built as a facilitator.**    
&emsp; This means that snow tries to avoid making assumptions, letting you decide your architecture.   
&emsp; This allows you to build frameworks, games and applications without it getting in the way.   
&emsp; This means snow is focused on portability, clarity, consistency and maintainability.   

**snow is as self contained as possible.**   
&emsp; There are no current external dependencies, except for a build pipeline called [flow](#).   

**snow strives to be reliable.**   
&emsp; There are tests of various kinds, you can read about the [testing approach]({{{rel_path}}}guide/contribute.html#tests) in the guide.

**snow has high standards.**   
&emsp; From code quality, clarity and portability to documentation to samples.

---

##Reasons

For a short intro to why snow was created, [read this blog post here](http://notes.underscorediscovery.com/snow).


##Editor support

Where possible, full code completion and building from the editor is supplied.

[Sublime Text](https://underscorediscovery.github.io/flow/guide/sublimetext.html) (mac/windows/linux) <br/><br/>
[![](images/plugins/1.png)](https://underscorediscovery.github.io/flow/guide/sublimetext.html)

[FlashDevelop](https://underscorediscovery.github.io/flow/guide/flashdevelop.html) (windows only)<br/><br/>

template is in `setup/`, but here is a [Download link](https://github.com/underscorediscovery/snow/blob/master/setup/snow_FlashDevelopTemplate.fdz?raw=true)   

[![](images/plugins/5.png)](https://underscorediscovery.github.io/flow/guide/sublimetext.html)

---

<div class="guide">
<a name="guide"> &nbsp;</a>
<h2>Guide</h2>

**Setup guide**<br/>
<br/>

**Install from git** <br/>   

`haxelib git snow https://github.com/underscorediscovery/snow.git`<br/>

<br/>
**OR** <br/>
<br/>

`git clone https://github.com/underscorediscovery/snow.git` <br/><br/>
`haxelib dev snow /path/to/snow/` <br/><br/>

<br/><br/>
**Starter guides**<br/>
<br/>
[one - start here]({{{rel_path}}}guide/one.html) <br/>
[two - life of a snow app]({{{rel_path}}}guide/two.html) <br/>

<br/>
**Feature guides** <br/>
<br/>
[windowing]({{{rel_path}}}guide/windowing.html) | [audio]({{{rel_path}}}guide/audio.html) | [assets]({{{rel_path}}}guide/assets.html) | [input]({{{rel_path}}}guide/input.html) | [render]({{{rel_path}}}guide/render.html) | [IO]({{{rel_path}}}guide/io.html) | [utils]({{{rel_path}}}guide/utils.html)
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
[being reliable - help write tests]({{{rel_path}}}guide/contribute.html#tests) <br/>
[the more you know - help write guides]({{{rel_path}}}guide/contribute.html#guides) <br/>
[what goes where? - structure guide]({{{rel_path}}}guide/structure.html) <br/>
[playing nice - code/design conventions]({{{rel_path}}}guide/code.html) <br/>

<br/>
<br/>
**In depth guides** <br/><br/>
[native code - build, modify, fix snow]({{{rel_path}}}guide/native-layer.html)   
`todo` ~~build process - how an app is made~~   
`todo` ~~native code - porting to a new platform~~   

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
   - consistent api for loading assets across platforms
   - raw bytes, text, images and audio support
   - async based api design to handle preloading easily
   - strict loading on a list or per file basis
   - images - bmp, png, jpg, gif, tga, psd
   - `web` audio - ogg, wav, mp3 (see [snags](#snags))
   - `native` audio - ogg, wav, pcm
   - `native` consistent manual file IO for platforms (like android) if needed
   - `desktop` OS file change notification events on any folder
   - `desktop` OS open/save/folder dialogs

<a name="input"><a href="#input">**input**</a></a>
   - complete callbacks for for mouse, keys, gamepad, touches
   - text input events for handling localized text reliably
   - keys - spec based keycode/scancode access/conversion
   - gamepad events for hot plugging/swapping devices at runtime
   - immediate style access in addition to event callbacks
   - `desktop` mouse - set position, window lock, window grab, and visibility
   - `mobile` multitouch supported

<a name="util"><a href="#util">**util**</a></a>
   - complete set (-1) of [Typed Arrays](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Typed_arrays) for use on all platforms
   - ByteArray util for handling bytes
   - high res timestamps, consistent Timer for repeat/once handlers for all platforms
   - open a url in the default browser
   - `native` access to ndll/dll endpoints compiled with hxcpp on native platforms

---

<h3>Further details</h3>

[**Build pipeline details**]({{{rel_path}}}guide/build-details.html) <br/>
&emsp; &emsp; [project format]({{{rel_path}}}guide/build-details.html#project) | [architectures]({{{rel_path}}}guide/build-details.html#arch)

[**Platform implementation details**]({{{rel_path}}}guide/platform-faq.html) <br/>
&emsp; &emsp; [web]({{{rel_path}}}guide/platform-faq.html#web) | [mac]({{{rel_path}}}guide/platform-faq.html#mac) | [windows]({{{rel_path}}}guide/platform-faq.html#windows) | [linux]({{{rel_path}}}guide/platform-faq.html#linux) | [android]({{{rel_path}}}guide/platform-faq.html#android) | [ios]({{{rel_path}}}guide/platform-faq.html#ios) 

---
<a name="snags">
<a href="#snags"><h3>Snags</h3></a>
</a>
The snag list below is a list of things that are known issues or inconsistencies across platforms to take note of.

- [#10](https://github.com/underscorediscovery/snow/issues/10) `native` audio - streaming is on the main thread
- [#25](https://github.com/underscorediscovery/snow/issues/25) `android` utils - url_open not implemented yet

For a full list of issues, open and resolved, refer to the [github issue tracker](https://github.com/underscorediscovery/snow/issues) <br/>
<br/>
<br/>

<a name="samples">
<a href="#samples"><h2>Samples</h2></a>
</a>


---

[feedback](https://github.com/underscorediscovery/snow/issues)
<br/>
<br/>
<br/>
<br/>
<small class="trademark"> All trademarks and registered trademarks are the property of their respective owners.</small>


