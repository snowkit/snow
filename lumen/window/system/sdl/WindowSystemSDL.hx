
package lumen.window.system.sdl;

import lumen.window.system.WindowSystem;

//For now, there is no SDL specific window handling needed like audio/input handlers
//So don't feel like this file is needlessly empty

#if lumen_window_sdl

    class WindowSystemSDL extends WindowSystem {

        override public function init() {
        } //init

        override public function update() {
        } //update

        override public function destroy() {
        } //destroy

    } //WindowSystemSDL

#end //lumen_window_sdl