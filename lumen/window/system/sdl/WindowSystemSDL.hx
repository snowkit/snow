
package lumen.window.system.sdl;

import lumen.window.system.WindowSystem;

//For now, there is no SDL specific window handling needed like audio/input handlers
//So don't feel like this file is needlessly empty

#if lumen_window_sdl

    @:noCompletion class WindowSystemSDL extends WindowSystem {

        @:noCompletion override public function init() {
        } //init

        @:noCompletion override public function update() {
        } //update

        @:noCompletion override public function destroy() {
        } //destroy

    } //WindowSystemSDL

#end //lumen_window_sdl