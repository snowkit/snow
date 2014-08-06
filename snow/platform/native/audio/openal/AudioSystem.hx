package snow.platform.native.audio.openal;


import snow.types.Types;
import snow.audio.AudioSystem;

import snow.audio.openal.AL;
import snow.audio.openal.AL.Context;
import snow.audio.openal.AL.Device;

import snow.Log.log;
import snow.Log._debug;
import snow.Log._verbose;
import snow.Log._verboser;

    /** Internal audio system implementation for OpenAL, interact with this system through `snow.Audio`, not directly */
@:noCompletion
@:log_as('audio')
class AudioSystem extends snow.platform.native.audio.AudioSystem {

    var device : Device;
    var context : Context;

    override public function init() {

            _debug('init');

        device = ALC.openDevice();

            _debug('created device / ${device} / ${ AL.getErrorMeaning(AL.getError()) }');

        context = ALC.createContext(device, null);

            _debug('created context / ${context} / ${ AL.getErrorMeaning(AL.getError()) }');

        ALC.makeContextCurrent( context );

            _debug('set current / ${ AL.getErrorMeaning(AL.getError()) }');

    } //init

    override public function destroy() {

        ALC.makeContextCurrent( null );
        ALC.destroyContext( context );
        ALC.closeDevice( device );

            _debug('destroying device / ${ AL.getErrorMeaning(AL.getError()) }');

    } //destroy

    override public function suspend() {

            _debug('suspending context ');

        ALC.suspendContext( context );
        ALC.makeContextCurrent( null );

    } //suspend

    override public function resume() {

            _debug('resuming context ');

        ALC.processContext( context );
        ALC.makeContextCurrent( context );

    } //resume

} //AudioSystem
