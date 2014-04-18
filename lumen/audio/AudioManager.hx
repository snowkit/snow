package lumen.audio;

import lumen.LumenTypes;

import lumen.al.AL;
import lumen.al.AL.Context;
import lumen.al.AL.Device;
import lumen.utils.ByteArray;
import lumen.utils.Float32Array;

class AudioManager {

    var lib : Lumen;

    var device : Device;
    var context : Context;
    var source : Int;
    var buffer : Int;

    public function new( _lib:Lumen ) {

        lib = _lib;

        device = ALC.openDevice();
        context = ALC.createContext(device, null);

        ALC.makeContextCurrent( context );

        source = AL.genSource();

        AL.sourcef( source, AL.PITCH, 1 );
        AL.sourcef( source, AL.GAIN, 1 );
        AL.source3f( source, AL.POSITION, 0, 0, 0 );
        AL.source3f( source, AL.VELOCITY, 0, 0, 0 );

        AL.sourcei( source, AL.LOOPING, AL.TRUE );

        buffer = AL.genBuffer();

            //intentionally doing incorrect combos
        trace( AL.getDoublev(AL.SPEED_OF_SOUND, 1) );   trace( AL.getErrorMeaning(AL.getError()) );
        trace( AL.getBooleanv(AL.SPEED_OF_SOUND, 1) );  trace( AL.getErrorMeaning(AL.getError()) );
        trace( AL.getIntegerv(AL.SPEED_OF_SOUND, 1) );  trace( AL.getErrorMeaning(AL.getError()) );
        trace( AL.getFloatv(AL.SPEED_OF_SOUND, 1) );    trace( AL.getErrorMeaning(AL.getError()) );

        #if mac
        var data = getBytes( "../Resources/assets/sound.pcm" );
        #else
        var data = getBytes( "./assets/sound.pcm" );
        #end

        AL.bufferData(buffer, AL.FORMAT_MONO16, new Float32Array(data), data.byteLength, 16000 );

                trace( AL.getErrorMeaning(AL.getError()) );

        AL.sourcei(source, AL.BUFFER, buffer);

                trace( AL.getErrorMeaning(AL.getError()) );

        AL.sourcePlay(source);

                trace( AL.getErrorMeaning(AL.getError()) );

    } //new

    public function destroy() {
        
        ALC.closeDevice( device );

    }

    var pitch : Float = 1;
    var dir : Int = 1;

    public function update() {
        pitch += 0.01 * dir;
        if(pitch > 2) dir = -1;
        if(pitch <= 0.1) dir = 1;

        AL.sourcef( source, AL.PITCH, pitch );
    }

    public static function getBytes(id:String):ByteArray {
        return ByteArray.readFile( id );
    }

    public static function read_file( _path:String ) : String {
        var f = sys.io.File.read( _path, false );
        var d = f.readAll().toString();
        f.close();
        return d;
    }
    
    public static function save_file( _path:String, _content:String ) {
        var file : sys.io.FileOutput = sys.io.File.write( _path, false);
            file.writeString(_content);
            file.close();
    }    

} //AudioManager