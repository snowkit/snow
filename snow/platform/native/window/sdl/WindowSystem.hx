
package snow.platform.native.window.sdl;

import snow.window.WindowSystem;

//For now, there is no SDL specific window handling needed like audio/input handlers
//So don't feel like this file is needlessly empty, it's allowing expansion

#if snow_window_sdl

    @:noCompletion class WindowSystem extends snow.platform.native.window.WindowSystem {

    } //WindowSystem

#end //snow_window_sdl