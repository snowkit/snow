package snow.modules.openal;

import snow.types.Types;

import snow.modules.openal.AL;
import snow.modules.openal.AL.Context;
import snow.modules.openal.AL.Device;

import snow.Debug.*;

@:noCompletion
typedef Sound = snow.modules.openal.sound.Sound;

    /** Internal audio system implementation for OpenAL, interact with this system through `snow.Audio`, not directly */
class Audio extends snow.core.native.audio.Audio {

    var device : Device;
    var context : Context;

    override public function init() {

            _debug('init');

        device = ALC.openDevice();

        if(device == null) {
            log('failed / didn\'t create device!');
            return;
        }

            _debug('created device / ${device} / ${ ALC.getErrorMeaning(ALC.getError(device)) }');

        context = ALC.createContext(device, null);

            _debug('created context / ${context} / ${ ALC.getErrorMeaning(ALC.getError(device)) }');

        ALC.makeContextCurrent( context );

            _debug('set current / ${ ALC.getErrorMeaning(ALC.getError(device)) }');

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

} //Audio
