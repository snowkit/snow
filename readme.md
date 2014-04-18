###lumen 
---

access to native windowing, audio, rendering and input

Things that are done:

-[x] main event loop   
-[x] opening multiple windows   
-[x] all input events to haxe   
-[x] all system events to haxe   
-[x] OpenGL bindings to haxe   
-[x] OpenAL bindings to haxe   

Things that are still required for usage, semi ordered in importance:

- [ ] per platform init/shutdown hooks (like mac bundle path location) 
- [ ] platform helpers, pathing etc (app data path, etc)
- [ ] asset access/management (get bytes)
- [ ] image format helpers (stb_image likely)
- [ ] audio formats helpers
- [ ] loop timing and control (capped,uncapped,etc) 
- [ ] flag control (no audio, no input, no windowing, no GL)

Things that are required for the API :

- [ ] lumen.App host function signatures for events (onmousedown, onmouseup, onsystemevent, oninputevent, etc)
- [ ] window API endpoint (set position, size, close etc)
- [ ] audio API endpoints (play, etc)
- [ ] input API endpoints
- [ ] input/sdl2/InputSDL2.hx mapping specific flags input to endpoint
- [ ] audio/openal/AudioSDL2.hx mapping specific openal api to endpoint

Lower priority things that require investigating :

- [ ] template hooks, allowing injecting arbitrary c++ from app project folder 

Platform specific things to resolve so far :

- [ ] Linux includes a lib/libGL.so for linking, but in lime was loaded dynamically so the binary can be loaded without loading GL on systems that don't have it. This requires declaring all the used gl end points as external (including ones from glew, I think, which is why I left it for now) and then loading the libGL.so from the system at runtime. Not so hard, but not critical yet.
- [ ] mobile platforms share the same window init code but only allow one window (makes sense) and have some special events (which are wired into the loop structure, but require being emitted and handled immediately, not in the poll loop), for example this is a base android example I got working on SDL2 in no time : http://pastie.org/9086590
- [ ] android has weird loop considerations when requesting being backgrounded, these might very well be user side but the SDL2 tries to (on newer androids) handle context recreation for you, but I don't think it will re create the textures created from haxe side, will need to investigate. 
- [ ] iOS has a request animation frame like update loop that is important to hook into, which I think from reading the SDL stuff says that it handles it with some flags and a callback for you, which we can ideally make the same on all platforms so that there isn't much per platform specific code dancing in the core 
