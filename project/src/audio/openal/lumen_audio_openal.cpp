#include <hx/CFFI.h>

#if defined(HX_MACOS) || defined(IPHONE)
    #include <OpenAL/al.h>
    #include <OpenAL/alc.h>
#else
    #include <AL/al.h>
    #include <AL/alc.h>
#endif

#include "hx_bindings.h"
#include "common/Object.h"
#include "common/ByteArray.h"

namespace lumen {

    class ALHX_ALDevice : public Object {
        public:
            ALCdevice *al_device;

            ALHX_ALDevice(ALCdevice *_device) {
                al_device = _device;
            }

            ~ALHX_ALDevice() {
                if(al_device) {
                    alcCloseDevice(al_device);                
                }
            }
    };

    class ALHX_ALContext : public Object {
        public:
            ALCcontext *al_context;

            ALHX_ALContext(ALCcontext *_context) {
                al_context = _context;
            }

            ~ALHX_ALContext() {
                if(al_context) {
                    alcDestroyContext(al_context);                
                }
            }
    };


    value alhx_DopplerFactor(value _value) {
        
        alDopplerFactor(val_float(_value));

        return alloc_null();

    } DEFINE_PRIM(alhx_DopplerFactor, 1);

    value alhx_DopplerVelocity(value _value) {
        
        alDopplerVelocity(val_float(_value));

        return alloc_null();

    } DEFINE_PRIM(alhx_DopplerVelocity, 1);

    value alhx_SpeedOfSound(value _value) {
        
        alSpeedOfSound(val_float(_value));

        return alloc_null();

    } DEFINE_PRIM(alhx_SpeedOfSound, 1);


    value alhx_DistanceModel(value _distanceModel) {

        alDistanceModel( val_float(_distanceModel) );

        return alloc_null();

    } DEFINE_PRIM(alhx_DistanceModel, 1);

    value alhx_Enable(value _capability) {

        alEnable( val_int(_capability) );

        return alloc_null();

    } DEFINE_PRIM(alhx_Enable, 1);

    value alhx_Disable(value _capability) {

        alDisable( val_int(_capability) );

        return alloc_null();

    } DEFINE_PRIM(alhx_Disable, 1);

    value alhx_IsEnabled(value _capability) {

        return alloc_bool( alIsEnabled(val_int(_capability)) );

    } DEFINE_PRIM(alhx_IsEnabled, 1);

    value alhx_GetString(value _param) {

        return alloc_string( alGetString(val_int(_param)) );

    } DEFINE_PRIM(alhx_GetString, 1);

    value alhx_GetBooleanv(value _param, value _count) {

        int count = val_int(_count);
        ALboolean* vals = new ALboolean[count];

        alGetBooleanv( val_int(_param), vals );
        
        value result = alloc_array(count);

        for( int i = 0; i < count; ++i ) {
            val_array_set_i(result, i, alloc_bool(vals[i]) );
        }

        return result;

    } DEFINE_PRIM(alhx_GetBooleanv, 2);

    value alhx_GetIntegerv(value _param, value _count) {
        
        int count = val_int(_count);
        ALint* vals = new ALint[count];

        alGetIntegerv( val_int(_param), vals );
        
        value result = alloc_array(count);

        for( int i = 0; i < count; ++i ) {
            val_array_set_i(result, i, alloc_int(vals[i]) );
        }

        return result;

    } DEFINE_PRIM(alhx_GetIntegerv, 2);

    value alhx_GetFloatv(value _param, value _count) {

        int count = val_int(_count);
        ALfloat* vals = new ALfloat[count];

        alGetFloatv( val_int(_param), vals );
        
        value result = alloc_array(count);

        for( int i = 0; i < count; ++i ) {
            val_array_set_i(result, i, alloc_float(vals[i]) );
        }

        return result;

    } DEFINE_PRIM(alhx_GetFloatv, 2);

    value alhx_GetDoublev(value _param, value _count) {
        
        int count = val_int(_count);
        ALdouble* vals = new ALdouble[count];

        alGetDoublev( val_int(_param), vals );
        
        value result = alloc_array(count);

        for( int i = 0; i < count; ++i ) {
            val_array_set_i(result, i, alloc_float((float)vals[i]) );
        }

        return result;

    } DEFINE_PRIM(alhx_GetDoublev, 2);

    value alhx_GetBoolean(value _param) {
        return alloc_bool( alGetBoolean(val_int(_param)) );
    } DEFINE_PRIM(alhx_GetBoolean, 1);

    value alhx_GetInteger(value _param) {
        return alloc_int( alGetInteger(val_int(_param)) );
    } DEFINE_PRIM(alhx_GetInteger, 1);

    value alhx_GetFloat(value _param) {
        return alloc_float( alGetFloat(val_int(_param)) );
    } DEFINE_PRIM(alhx_GetFloat, 1);

    value alhx_GetDouble(value _param) {
        return alloc_float( (float)alGetDouble(val_int(_param)) );
    } DEFINE_PRIM(alhx_GetDouble, 1);
    

    value alhx_GetError() {
        return alloc_int( alGetError() );
    } DEFINE_PRIM(alhx_GetError, 0);

    value alhx_IsExtensionPresent(value _extname) {
        return alloc_bool( alIsExtensionPresent(val_string(_extname)) );
    } DEFINE_PRIM(alhx_IsExtensionPresent, 1);

    value alhx_GetProcAddress(value _fname) {
        return alloc_null();  //:todo:
    } DEFINE_PRIM(alhx_GetProcAddress, 1);

    value alhx_GetEnumValue(value _ename) {
        return alloc_int( alGetEnumValue(val_string(_ename)) );
    } DEFINE_PRIM(alhx_GetEnumValue, 1);


    value alhx_Listenerf(value _param, value _value) {

        alListenerf( val_int(_param), val_float(_value) );

        return alloc_null();

    } DEFINE_PRIM(alhx_Listenerf, 2);

    value alhx_Listener3f(value _param, value _value1, value _value2, value _value3) {

        alListener3f( val_int(_param), val_float(_value1),val_float(_value2),val_float(_value3) );

        return alloc_null();

    } DEFINE_PRIM(alhx_Listener3f, 4);

    value alhx_Listenerfv(value _param, value _values) {
        
        float* vals = val_array_float(_values);

        if(vals) {
            alListenerfv( val_int(_param), vals );
        } else {
            //warn: try val_array normal approach?
        }

        return alloc_null();

    } DEFINE_PRIM(alhx_Listenerfv, 2);

    value alhx_Listeneri(value _param, value _value) {

        alListeneri( val_int(_param), val_int(_value) );

        return alloc_null();

    } DEFINE_PRIM(alhx_Listeneri, 2);

    value alhx_Listener3i(value _param, value _value1, value _value2, value _value3) {

        alListener3i( val_int(_param), val_int(_value1),val_int(_value2),val_int(_value3) );

        return alloc_null();

    } DEFINE_PRIM(alhx_Listener3i, 4);

    value alhx_Listeneriv(value _param, value _values) {

        int *vals = val_array_int(_values);
        
        if(vals) {            
            alListeneriv( val_int(_param), vals );
        } else {
            //warn: try val_array normal approach?
        }

        return alloc_null();

    } DEFINE_PRIM(alhx_Listeneriv, 2);

    value alhx_GetListenerf(value _param) {

        float the_value;

        alGetListenerf( val_int(_param), &the_value );

        return alloc_float(the_value);

    } DEFINE_PRIM(alhx_GetListenerf, 1);

    value alhx_GetListener3f(value _param) {

        ALfloat val1, val2, val3;

        alGetListener3f( val_int(_param), &val1, &val2, &val3 );
        
        value result = alloc_array(3);

            val_array_set_i(result, 0, alloc_float(val1) );
            val_array_set_i(result, 1, alloc_float(val2) );
            val_array_set_i(result, 2, alloc_float(val3) );

        return result;

    } DEFINE_PRIM(alhx_GetListener3f, 1);

    value alhx_GetListenerfv(value _param, value _count) {

        int count = val_int(_count);
        ALfloat* vals = new ALfloat[count];

        alGetListenerfv( val_int(_param), vals );
        
        value result = alloc_array(count);

        for( int i = 0; i < count; ++i ) {
            val_array_set_i(result, i, alloc_float(vals[i]) );
        }

        return result;

    } DEFINE_PRIM(alhx_GetListenerfv, 2);

    value alhx_GetListeneri(value _param) {

        int the_value;

        alGetListeneri( val_int(_param), &the_value );

        return alloc_int(the_value);

    } DEFINE_PRIM(alhx_GetListeneri, 1);

    value alhx_GetListener3i(value _param) {

        ALint val1, val2, val3;

        alGetListener3i( val_int(_param), &val1, &val2, &val3 );
        
        value result = alloc_array(3);

            val_array_set_i(result, 0, alloc_int(val1) );
            val_array_set_i(result, 1, alloc_int(val2) );
            val_array_set_i(result, 2, alloc_int(val3) );

        return result;

    } DEFINE_PRIM(alhx_GetListener3i, 1);

    value alhx_GetListeneriv(value _param, value _count) {
        
        int count = val_int(_count);
        ALint* vals = new ALint[count];

        alGetListeneriv( val_int(_param), vals );
        
        value result = alloc_array(count);

        for( int i = 0; i < count; ++i ) {
            val_array_set_i(result, i, alloc_int(vals[i]) );
        }

        return result;

    } DEFINE_PRIM(alhx_GetListeneriv, 2);

// --- > not official api

    value alhx_GenSource() {

        ALuint source;

        alGenSources((ALuint)1, &source);

        return alloc_int(source);

    } DEFINE_PRIM(alhx_GenSource, 0);

    value alhx_DeleteSource(value _source) {
        
        ALuint source = val_int(_source);
        
        alDeleteSources(1, &source);

        return alloc_null();

    } DEFINE_PRIM(alhx_DeleteSource, 1);

// --- > 

    value alhx_GenSources(value _n) {
            
        int count = val_int(_n);
        ALuint* sources = new ALuint[count];

        alGenSources( count, sources );
        
        value result = alloc_array(count);

        for( int i = 0; i < count; ++i ) {
            val_array_set_i(result, i, alloc_int(sources[i]) );
        }

        return result;

    } DEFINE_PRIM(alhx_GenSources, 1);

    value alhx_DeleteSources(value _n, value _sources) {
        
        int *sources = val_array_int(_sources);
        
        if(sources) {
            alDeleteSources( val_int(_n), (ALuint*)sources );
        } else {
            //warn: try val_array normal approach?
        }

        return alloc_null();

    } DEFINE_PRIM(alhx_DeleteSources, 2);

    value alhx_IsSource(value _source) {

        return alloc_bool( alIsSource(val_int(_source)) );

    } DEFINE_PRIM(alhx_IsSource, 1);


    value alhx_Sourcef(value _source, value _param, value _value) {

        alSourcef(val_int(_source), val_int(_param), val_float(_value));

        return alloc_null();

    } DEFINE_PRIM(alhx_Sourcef, 3);

    value alhx_Source3f(value _source, value _param, value _value1, value _value2, value _value3) {

        alSource3f(val_int(_source), val_int(_param), val_float(_value1), val_float(_value2), val_float(_value3));

        return alloc_null();

    } DEFINE_PRIM(alhx_Source3f, 5);

    value alhx_Sourcefv(value _source, value _param, value _values) {

        float *vals = val_array_float(_values);
        
        if(vals) {
            alSourcefv( val_int(_source), val_int(_param), vals );
        } else {
            //warn: try val_array normal approach?
        }

        return alloc_null();

    } DEFINE_PRIM(alhx_Sourcefv, 3);

    value alhx_Sourcei(value _source, value _param, value _value) {

        alSourcei(val_int(_source), val_int(_param), val_int(_value));

        return alloc_null();

    } DEFINE_PRIM(alhx_Sourcei, 3);

    value alhx_Source3i(value _source, value _param, value _value1, value _value2, value _value3) {

        alSource3i(val_int(_source), val_int(_param), val_int(_value1), val_int(_value2), val_int(_value3));

        return alloc_null();

    } DEFINE_PRIM(alhx_Source3i, 5);

    value alhx_Sourceiv(value _source, value _param, value _values) {

        int *vals = val_array_int(_values);
        
        if(vals) {
            alSourceiv( val_int(_source), val_int(_param), vals );
        } else {
            //warn: try val_array normal approach?
        }

        return alloc_null();

    } DEFINE_PRIM(alhx_Sourceiv, 3);

    value alhx_GetSourcef(value _source, value _param) {

        float the_value;

        alGetSourcef( val_int(_source), val_int(_param), &the_value );

        return alloc_float(the_value);

    } DEFINE_PRIM(alhx_GetSourcef, 2);

    value alhx_GetSource3f(value _source, value _param) {

        ALfloat val1, val2, val3;

        alGetBuffer3f( val_int(_source), val_int(_param), &val1, &val2, &val3 );
        
        value result = alloc_array(3);

            val_array_set_i(result, 0, alloc_float( val1 ) );
            val_array_set_i(result, 1, alloc_float( val2 ) );
            val_array_set_i(result, 2, alloc_float( val3 ) );

        return result;

    } DEFINE_PRIM(alhx_GetSource3f, 2);

    value alhx_GetSourcefv(value _source, value _param, value _count) {
    
        int count = val_int(_count);
        ALfloat* vals = new ALfloat[count];

        alGetSourcefv( val_int(_source), val_int(_param), vals );
        
        value result = alloc_array(count);

        for( int i = 0; i < count; ++i ) {
            val_array_set_i(result, i, alloc_float(vals[i]) );
        }

        return result;

    } DEFINE_PRIM(alhx_GetSourcefv, 2);

    value alhx_GetSourcei(value _source, value _param) {

        int the_value;

        alGetSourcei( val_int(_source), val_int(_param), &the_value );

        return alloc_int(the_value);

    } DEFINE_PRIM(alhx_GetSourcei, 2);

    value alhx_GetSource3i(value _source, value _param) {
        
        ALint val1, val2, val3;

        alGetSource3i( val_int(_source), val_int(_param), &val1, &val2, &val3 );
        
        value result = alloc_array(3);

            val_array_set_i(result, 1, alloc_int( val1 ) );
            val_array_set_i(result, 2, alloc_int( val2 ) );
            val_array_set_i(result, 3, alloc_int( val3 ) );

        return result;
        
    } DEFINE_PRIM(alhx_GetSource3i, 2);

    value alhx_GetSourceiv(value _source, value _param, value _count) {
        
        int count = val_int(_count);
        ALint* vals = new ALint[count];

        alGetSourceiv( val_int(_source), val_int(_param), vals );
        
        value result = alloc_array(count);

        for( int i = 0; i < count; ++i ) {
            val_array_set_i(result, i, alloc_int(vals[i]) );
        }

        return result;

    } DEFINE_PRIM(alhx_GetSourceiv, 3);


    value alhx_SourcePlayv(value _n, value _sources) {

        int *vals = val_array_int(_sources);
        
        if(vals) {
            alSourcePlayv( val_int(_n), (ALuint*)vals );
        } else {
            //warn: try val_array normal approach?
        }

        return alloc_null();

    } DEFINE_PRIM(alhx_SourcePlayv, 2);

    value alhx_SourceStopv(value _n, value _sources) {
        
        int *vals = val_array_int(_sources);
        
        if(vals) {
            alSourceStopv( val_int(_n), (ALuint*)vals );
        } else {
            //warn: try val_array normal approach?
        }

        return alloc_null();

    } DEFINE_PRIM(alhx_SourceStopv, 2);

    value alhx_SourceRewindv(value _n, value _sources) {

        int *vals = val_array_int(_sources);
        
        if(vals) {
            alSourceRewindv( val_int(_n), (ALuint*)vals );
        } else {
            //warn: try val_array normal approach?
        }

        return alloc_null(); 

    } DEFINE_PRIM(alhx_SourceRewindv, 2);

    value alhx_SourcePausev(value _n, value _sources) {
        
        int *vals = val_array_int(_sources);
        
        if(vals) {
            alSourcePausev( val_int(_n), (ALuint*)vals );
        } else {
            //warn: try val_array normal approach?
        }

        return alloc_null();

    } DEFINE_PRIM(alhx_SourcePausev, 2);


    value alhx_SourcePlay(value _source) {

        alSourcePlay( val_int(_source) );

        return alloc_null();

    } DEFINE_PRIM(alhx_SourcePlay, 1);

    value alhx_SourceStop(value _source) {

        alSourceStop( val_int(_source) );

        return alloc_null();

    } DEFINE_PRIM(alhx_SourceStop, 1);

    value alhx_SourceRewind(value _source) {

        alSourceRewind( val_int(_source) );

        return alloc_null();

    } DEFINE_PRIM(alhx_SourceRewind, 1);

    value alhx_SourcePause(value _source) {

        alSourcePause( val_int(_source) );

        return alloc_null();

    } DEFINE_PRIM(alhx_SourcePause, 1);


    value alhx_SourceQueueBuffers(value _source, value _nb, value _buffers) {

        int* buffers = val_array_int(_buffers);

        if(buffers) {
            alSourceQueueBuffers( val_int(_source), val_int(_nb), (ALuint*)buffers );
        } else {
            //warn: try val_array normal approach?
        }

        return alloc_null();

    } DEFINE_PRIM(alhx_SourceQueueBuffers, 3);

    value alhx_SourceUnqueueBuffers(value _source, value _nb, value _buffers) {
        
        int* buffers = val_array_int(_buffers);

        if(buffers) {
            alSourceUnqueueBuffers( val_int(_source), val_int(_nb), (ALuint*)buffers );
        } else {
            //warn: try val_array normal approach?
        }

        return alloc_null();

    } DEFINE_PRIM(alhx_SourceUnqueueBuffers, 3);


    value alhx_GenBuffers(value _n) {

        int count = val_int(_n);
        ALuint* buffers = new ALuint[count];

        alGenBuffers( count, buffers );
        
        value result = alloc_array(count);

        for( int i = 0; i < count; ++i ) {
            val_array_set_i(result, i, alloc_int(buffers[i]) );
        }

        return result;

    } DEFINE_PRIM(alhx_GenBuffers, 1);

    value alhx_DeleteBuffers(value _n, value _buffers) {
        
        int *buffers = val_array_int(_buffers);
        
        if(buffers) {
            alDeleteBuffers( val_int(_n), (ALuint*)buffers );
        } else {
            //warn: try val_array normal approach
        }

        return alloc_null();

    } DEFINE_PRIM(alhx_DeleteBuffers, 2);

    value alhx_IsBuffer(value _buffer) {

        return alloc_bool( alIsBuffer(val_int(_buffer)) );

    } DEFINE_PRIM(alhx_IsBuffer, 1);

//unofficial api 

    value alhx_GenBuffer() {

        ALuint buffer;

        alGenBuffers( (ALuint)1, &buffer );

        return alloc_int(buffer);

    } DEFINE_PRIM(alhx_GenBuffer, 0);

    value alhx_DeleteBuffer(value _buffer) {

        ALuint buffer = val_int(_buffer);

        alDeleteBuffers((ALuint)1, &buffer );

        return alloc_null();

    } DEFINE_PRIM(alhx_DeleteBuffer, 1);

// // end unofficial api 

    value alhx_BufferData(value _buffer, value _format, value _data, value _size, value _freq) {

        ByteArray bytes(_data);
        int bytesize = bytes.Size();

        const float *data = (float *)bytes.Bytes();
        int n_elems = bytesize / sizeof(float);
            
            //since size is explicitly passed in,
            //we are going to use that, but the calculated count is n_elems>>2;
        int count = val_int(_size); 

        alBufferData( val_int(_buffer), val_int(_format), data, count, val_int(_freq) );

        return alloc_null();

    } DEFINE_PRIM(alhx_BufferData, 5);


    value alhx_Bufferf(value _buffer, value _param, value _value) {

        alBufferf(val_int(_buffer), val_int(_param), val_float(_value) );

        return alloc_null();

    } DEFINE_PRIM(alhx_Bufferf, 3);

    value alhx_Buffer3f(value _buffer, value _param, value _value1, value _value2, value _value3) {
        
        alBuffer3f(val_int(_buffer), val_int(_param), val_float(_value1),val_float(_value2),val_float(_value3) );

        return alloc_null();

    } DEFINE_PRIM(alhx_Buffer3f, 5);

    value alhx_Bufferfv(value _buffer, value _param, value _values) {
        
        float *vals = val_array_float(_values);
        
        if(vals) {
            alBufferfv( val_int(_buffer), val_int(_param), vals );
        } else {
            //warn: try val_array normal approach?
        }

        return alloc_null();

    } DEFINE_PRIM(alhx_Bufferfv, 3);

    value alhx_Bufferi(value _buffer, value _param, value _value) {

        alBufferi(val_int(_buffer), val_int(_param), val_int(_value) );

        return alloc_null();

    } DEFINE_PRIM(alhx_Bufferi, 3);

    value alhx_Buffer3i(value _buffer, value _param, value _value1, value _value2, value _value3) {

        alBuffer3i(val_int(_buffer), val_int(_param), val_int(_value1),val_int(_value2),val_int(_value3) );

        return alloc_null();

    } DEFINE_PRIM(alhx_Buffer3i, 5);

    value alhx_Bufferiv(value _buffer, value _param, value _values) {
            
        int *vals = val_array_int(_values);
        
        if(vals) {
            alBufferiv( val_int(_buffer), val_int(_param), vals );
        } else {
            //warn: try val_array normal approach?
        }

        return alloc_null();

    } DEFINE_PRIM(alhx_Bufferiv, 3);

    value alhx_GetBufferf(value _buffer, value _param) {

        float the_value;
        
        alGetBufferf( val_int(_buffer), val_int(_param), &the_value );

        return alloc_float(the_value);

    } DEFINE_PRIM(alhx_GetBufferf, 2);

    value alhx_GetBuffer3f(value _buffer, value _param) {

        ALfloat val1, val2, val3;

        alGetBuffer3f( val_int(_buffer), val_int(_param), &val1, &val2, &val3 );
        
        value result = alloc_array(3);

            val_array_set_i(result, 0, alloc_float( val1 ) );
            val_array_set_i(result, 1, alloc_float( val2 ) );
            val_array_set_i(result, 2, alloc_float( val3 ) );

        return result;
        
    } DEFINE_PRIM(alhx_GetBuffer3f, 2);

    value alhx_GetBufferfv(value _buffer, value _param, value _count) {
        
        int count = val_int(_count);
        ALfloat* vals = new ALfloat[count];

        alGetBufferfv( val_int(_buffer), val_int(_param), vals );
        
        value result = alloc_array(count);

        for( int i = 0; i < count; ++i ) {
            val_array_set_i(result, i, alloc_float(vals[i]) );
        }

        return result;

    } DEFINE_PRIM(alhx_GetBufferfv, 3);

    value alhx_GetBufferi(value _buffer, value _param) {
        
        int the_value;
        
        alGetBufferi( val_int(_buffer), val_int(_param), &the_value );

        return alloc_int(the_value);

    } DEFINE_PRIM(alhx_GetBufferi, 2);

    value alhx_GetBuffer3i(value _buffer, value _param) {
        
        ALint val1, val2, val3;

        alGetBuffer3i( val_int(_buffer), val_int(_param), &val1, &val2, &val3 );
        
        value result = alloc_array(3);

            val_array_set_i(result, 0, alloc_int( val1 ) );
            val_array_set_i(result, 1, alloc_int( val2 ) );
            val_array_set_i(result, 2, alloc_int( val3 ) );

        return result;

    } DEFINE_PRIM(alhx_GetBuffer3i, 2);

    value alhx_GetBufferiv(value _buffer, value _param, value _count) {
        
        int count = val_int(_count);
        ALint* vals = new ALint[count];

        alGetBufferiv( val_int(_buffer), val_int(_param), vals );
        
        value result = alloc_array(count);

        for( int i = 0; i < count; ++i ) {
            val_array_set_i(result, i, alloc_int(vals[i]) );
        }

        return result;

    } DEFINE_PRIM(alhx_GetBufferiv, 3);


//ALC

    value alhx_alcCreateContext(value _device, value _attrlist) {
        
        ALHX_ALDevice* device;

        if( Object_from_hx(_device, device) ) {

            int* attrlist = val_array_int(_attrlist);

            ALCcontext *_al_context = alcCreateContext( device->al_device, attrlist );

            if(!_al_context) {
                printf("/ lumen / failed to create AL context\n");
                return alloc_null();
            }

            ALHX_ALContext* context = new ALHX_ALContext(_al_context);

            return Object_to_hx(context);

        } //fetch device

        return alloc_null();

    } DEFINE_PRIM(alhx_alcCreateContext, 2);

    value alhx_alcMakeContextCurrent(value _context) {

        ALHX_ALContext* context;

        if( Object_from_hx(_context, context) ) {

            alcMakeContextCurrent( context->al_context );

        } //fetch context

        return alloc_null();

    } DEFINE_PRIM(alhx_alcMakeContextCurrent, 1);

    value alhx_alcProcessContext(value _context) {

        ALHX_ALContext* context;

        if( Object_from_hx(_context, context) ) {

            alcProcessContext( context->al_context );

        } //fetch context

        return alloc_null();

    } DEFINE_PRIM(alhx_alcProcessContext, 1);

    value alhx_alcSuspendContext(value _context) {

        ALHX_ALContext* context;

        if( Object_from_hx(_context, context) ) {

            alcSuspendContext( context->al_context );

        } //fetch context

        return alloc_null();

    } DEFINE_PRIM(alhx_alcSuspendContext, 1);

    value alhx_alcDestroyContext(value _context) {

        ALHX_ALContext* context;

        if( Object_from_hx(_context, context) ) {

            alcDestroyContext( context->al_context );

        } //fetch context

        return alloc_null();

    } DEFINE_PRIM(alhx_alcDestroyContext, 1);

    value alhx_alcGetCurrentContext() {

        ALCcontext *_al_context = alcGetCurrentContext();

        ALHX_ALContext* context = new ALHX_ALContext(_al_context);

        return Object_to_hx(context);

    } DEFINE_PRIM(alhx_alcGetCurrentContext, 0);

    value alhx_alcGetContextsDevice(value _context) {

        ALHX_ALContext* context;

        if( Object_from_hx(_context, context) ) {

            ALCdevice* _al_device = alcGetContextsDevice( context->al_context );
            
            ALHX_ALDevice* device = new ALHX_ALDevice(_al_device);

            return Object_to_hx(device);

        } //fetch context

        return alloc_null();

    } DEFINE_PRIM(alhx_alcGetContextsDevice, 1);


    value alhx_alcOpenDevice(value _devicename) {        

        ALCdevice* _al_device = alcOpenDevice( _devicename == val_null ? 0 : val_string(_devicename) );
        
        if(!_al_device) {
            printf("/ lumen / failed to create AL device. \n");
            return alloc_null();
        }

        ALHX_ALDevice* device = new ALHX_ALDevice(_al_device);

        return Object_to_hx(device);

    } DEFINE_PRIM(alhx_alcOpenDevice, 1);

    value alhx_alcCloseDevice(value _device) {
        
        ALHX_ALDevice* device;

        if( Object_from_hx(_device, device) ) {

            alcCloseDevice( device->al_device );

        } //fetch device

        return alloc_null();

    } DEFINE_PRIM(alhx_alcCloseDevice, 1);


    value alhx_alcGetError(value _device) {

        ALHX_ALDevice* device;

        if( Object_from_hx(_device, device) ) {

            alcGetError( device->al_device );

        } //fetch device

        return alloc_null();

    } DEFINE_PRIM(alhx_alcGetError, 1);

    value alhx_alcGetString(value _device, value _param) {

        ALHX_ALDevice* device;

        if( Object_from_hx(_device, device) ) {

            return alloc_string( alcGetString(device->al_device, val_int(_param)) );

        } //fetch device

        return alloc_null();

    } DEFINE_PRIM(alhx_alcGetString, 2);

    value alhx_alcGetIntegerv(value _device, value _param, value _size) {

        ALHX_ALDevice* device;

        if( Object_from_hx(_device, device) ) {

            int count = val_int(_size);
            ALint* vals = new ALint[count];

            alcGetIntegerv( device->al_device, val_int(_param), count, vals );
            
            value result = alloc_array(count);

            for( int i = 0; i < count; ++i ) {
                val_array_set_i(result, i, alloc_int(vals[i]) );
            }

            return result;

        } //fetch device

        return alloc_null();

    } DEFINE_PRIM(alhx_alcGetIntegerv, 3);


} //namespace lumen

extern "C" int lumen_audio_openal_register_prims() { 
    return 0;
}