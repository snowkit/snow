
package lumen.platform.native.window.sdl;

import lumen.window.WindowSystem;

//For now, there is no SDL specific window handling needed like audio/input handlers
//So don't feel like this file is needlessly empty, it's allowing expansion

#if lumen_window_sdl

    @:noCompletion class WindowSystem extends lumen.platform.native.window.WindowSystem {

    } //WindowSystem

#end //lumen_window_sdl