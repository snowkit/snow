package snow.modules.sdl;

import snow.api.Debug.*;
import snow.types.Types;

@:allow(snow.Snow)
class Runtime extends snow.runtime.Native {

    function new(_app:snow.Snow) {

        super(_app);
        name = 'sdl';

    } //new

    override function run() {

        trace('runtime / sdl / run');
        
        app.onevent({ type:SystemEventType.update });

    } //run

    override function shutdown() {

        trace('runtime / sdl / shutdown');

    } //shutdown


} //Runtime

