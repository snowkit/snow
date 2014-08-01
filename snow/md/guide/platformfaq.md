
<a href="{{{rel_path}}}index.html" id="logo"><img src="{{{rel_path}}}images/logo.png" /></a>

---

<a name="platforms">
<a href="#platforms"><h2>Platform Implementation Details</h2></a>
</a>

<a name="web"><a href="#web">**web**</a></a>
- render - direct WebGL canvas
- input - keys from page, mouse from element
- windowing - multiple “windows” separate GL context (unavoidable)
- audio - by default handled by HowlerJS
- io - handled by httprequest
- assets - images loaded via new Image(), and getImageData
- must be served over http due to this ^
- flow will run a built in dev server for you
- fullscreen toggle changes some style properties on the canvas

<a name="native"><a href="#native">**native**</a></a>
- all native targets use the latest SDL2 release, including mobile.
- all audio is handled by OpenAL by default
- all assets are handled by SDL_RWOps
- image assets are handled by stb_image
- audio files use libvorbis, libogg and custom wav loader

<a name="mac"><a href="#mac">**mac**</a></a>
- render - OpenGL
- io - cocoa file dialogs
- io - FSEvents file events
- audio - native OpenAL.framework is used

<a name="linux"><a href="#linux">**linux**</a></a>
- render - OpenGL
- io - GTK file dialogs
- io - inotify file events
- audio - openalsoft is used

<a name="windows"><a href="#windows">**windows**</a></a>
- render - OpenGL
- io - Windows file dialogs
- io - ReadDirectoryChangesW file events
- audio - openalsoft is used

<a name="android"><a href="#android">**android**</a></a>
- render - OpenGLES2 (because of WebGL spec)
- audio - openalsoft based on apportable is used

<a name="ios"><a href="#ios">**iOS**</a></a>
- render - OpenGLES2 (because of WebGL spec)
- audio - native OpenAL.framework is used

<br/><br/>
