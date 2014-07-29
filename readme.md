##snow
---

snow is a light, pure and clean toolkit for building frameworks, applications and games using [haxe](http://haxe.org), targetting native platforms and browser.
This means snow by default runs on Mac, Windows, Linux desktops, as well as iOS and Android devices. It also runs directly in the web browser.

###how it works

haxe is an expressive, beautiful programming language that compiles it's own code into other code languages.
This allows snow to build it's code from haxe into the target platform code, like c++, without ever needing to write c++ code.
It also exports directly to javascript, so when you target a browser it will also be using native code to the browser.

With this in mind, snow exposes a low level set of tools at your fingertips with as much consistency as possible across targets, all while sharing the same code.
snow is built as a minimal code base focused on portability and clarity, allowing you to build frameworks, games and applications without it getting in the way.

snow is self contained. It is built with no external dependencies except for [flow](#) which is the build toolchain that makes building an application from snow possible.

###features

**snow gives you cross platform access to**

- a window (if desired)
- an audio api
- input handling
- asset/image/audio file handling
- platform utilities (like native file dialogs)

**cross platform features**

- access to **OpenGL** for drawing, using the same code on all targets

**target specific features**

- on all **native** targets, the following formats are currently supported
    - jpg, png, bmp, psd, tga, gif _for image assets_
    - ogg, wav, raw pcm _for audio assets_

- on **browser** target, the following formats are currently supported
    - jpg, png, bmp, gif _for image assets_
    - ogg, wav, mp3 _for audio assets_

- on **native** targets, full direct access to OpenAL from haxe, alongside the cross platform API
- on all current **native** platforms - windowing, input and assets are all handled by SDL2, supporting a vast and consistent stable baseline across targets.


###Documentation

<a target="_blank" href="http://underscorediscovery.github.io/snow"> Full API documentation, guides and examples are available here </a>

###latest stable development builds

Sometimes new features are added that need testing ahead of stable release, you can use these builds "safely" in development and help make new version builds more stable.

Dev packages :

_todo_
gcc-multilib
g++-multilib
libgl1-mesa-dev
libglu1-mesa-dev
libgtk-3-dev

###latest bleeding edge binary builds

New binary builds are only pushed to the repo only once or twice a day when changes happen -

**BUT** new builds are run automatically on every single commit,   
and are available as soon as the build is complete and can be used directly (provided the build succeeded).

Edge binary builds :

[iOS](http://build.luxeengine.com:8111//repository/downloadAll/snow_core_ios/latest.lastSuccessful)   
[Android](http://build.luxeengine.com:8111//repository/downloadAll/snow_core_android/latest.lastSuccessful)   
[Mac](http://build.luxeengine.com:8111//repository/downloadAll/snow_core_mac/latest.lastSuccessful)   
[Linux](http://build.luxeengine.com:8111//repository/downloadAll/snow_core_linux/latest.lastSuccessful)   
[Windows](http://build.luxeengine.com:8111//repository/downloadAll/snow_core_windows/latest.lastSuccessful)   

###Automated build status

####core build status
---

iOS <a target="_blank" href="http://build.luxeengine.com:8111/viewType.html?buildTypeId=snow_core_ios&guest=1">
<img src="http://build.luxeengine.com:8111/app/rest/builds/buildType:(id:snow_core_ios)/statusIcon"/>
</a>   
Android <a target="_blank" href="http://build.luxeengine.com:8111/viewType.html?buildTypeId=snow_core_android&guest=1">
<img src="http://build.luxeengine.com:8111/app/rest/builds/buildType:(id:snow_core_android)/statusIcon"/>
</a>   
Mac <a target="_blank" href="http://build.luxeengine.com:8111/viewType.html?buildTypeId=snow_core_mac&guest=1">
<img src="http://build.luxeengine.com:8111/app/rest/builds/buildType:(id:snow_core_mac)/statusIcon"/>
</a>   
Linux <a target="_blank" href="http://build.luxeengine.com:8111/viewType.html?buildTypeId=snow_core_linux&guest=1">
<img src="http://build.luxeengine.com:8111/app/rest/builds/buildType:(id:snow_core_linux)/statusIcon"/>
</a>   
Windows <a target="_blank" href="http://build.luxeengine.com:8111/viewType.html?buildTypeId=snow_core_windows&guest=1">
<img src="http://build.luxeengine.com:8111/app/rest/builds/buildType:(id:snow_core_windows)/statusIcon"/>
</a>

####tests/samples build status
---

Android <a target="_blank" href="http://build.luxeengine.com:8111/viewType.html?buildTypeId=snow_tests_android&guest=1">
<img src="http://build.luxeengine.com:8111/app/rest/builds/buildType:(id:snow_tests_android)/statusIcon"/>
</a>   
Mac <a target="_blank" href="http://build.luxeengine.com:8111/viewType.html?buildTypeId=snow_tests_mac&guest=1">
<img src="http://build.luxeengine.com:8111/app/rest/builds/buildType:(id:snow_tests_mac)/statusIcon"/>
</a>   
Linux <a target="_blank" href="http://build.luxeengine.com:8111/viewType.html?buildTypeId=snow_tests_linux&guest=1">
<img src="http://build.luxeengine.com:8111/app/rest/builds/buildType:(id:snow_tests_linux)/statusIcon"/>
</a>   
Windows <a target="_blank" href="http://build.luxeengine.com:8111/viewType.html?buildTypeId=snow_tests_windows&guest=1">
<img src="http://build.luxeengine.com:8111/app/rest/builds/buildType:(id:snow_tests_windows)/statusIcon"/>
</a>
