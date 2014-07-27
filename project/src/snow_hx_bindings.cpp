#ifndef STATIC_LINK
#define IMPLEMENT_API
#endif

#if defined(HX_WINDOWS) || defined(HX_MACOS) || defined(HX_LINUX)
// Include neko glue....
#define NEKO_COMPATIBLE
#endif

#include <hx/CFFI.h>

#ifdef ANDROID
#include <android/log.h>
#endif

#include "snow_hx_bindings.h"

#include "snow_core.h"
#include "snow_window.h"
#include "snow_input.h"
#include "snow_io.h"

#include "assets/snow_assets_audio.h"
#include "assets/snow_assets_image.h"

#include "common/ByteArray.h"
#include "lzma.h"

namespace snow {

        //has id's etc been inited?
    static int global_snow_init = false;
        //a "kind" type for native wrapped objects
    vkind global_snow_object_kind;
        //core event haxe callback handler
        //a core system event handler implementation (defined in snow_hx_bindings.h)
    AutoGCRoot *system_event_handler = 0;

    extern "C" void snow_entry_point() {

        if (global_snow_init){
            return;
        }

       global_snow_init = true;

       snow_init_ids();

    } DEFINE_ENTRY_POINT(snow_entry_point)




// core bindings




extern double timestamp();


    value snow_init( value _on_event, value _run_loop ) {

            //fetch the callback for system events
        system_event_handler = new AutoGCRoot(_on_event);
        bool run_loop = val_bool(_run_loop);

            //now init the core
        snow::core::snow_init( run_loop );

        return alloc_null();

    } DEFINE_PRIM(snow_init, 2);


    value snow_shutdown() {

            //now shutdown the core
        snow::core::snow_shutdown();

        return alloc_null();

    } DEFINE_PRIM(snow_shutdown, 0);


    value snow_timestamp() {

        return alloc_float( snow::timestamp() );

    } DEFINE_PRIM(snow_timestamp, 0);





//application helpers





    value snow_app_path() {

        return alloc_string( snow::core::app_path() );

    } DEFINE_PRIM(snow_app_path, 0);


    value snow_pref_path(value _org, value _app) {

        return alloc_string( snow::core::pref_path( val_string(_org), val_string(_app) ) );

    } DEFINE_PRIM(snow_pref_path, 2);





//render bindings



    value snow_system_enable_vsync( value _enable ) {

        int result = snow::window::system_enable_vsync( val_bool(_enable) );

        return alloc_int( result );

    } DEFINE_PRIM(snow_system_enable_vsync, 1);


    value snow_system_show_cursor(value _enable) {

        snow::window::system_show_cursor( val_bool(_enable) );

        return alloc_null();

    } DEFINE_PRIM(snow_system_show_cursor, 1);

    value snow_system_lock_cursor(value _enable) {

        snow::window::system_lock_cursor( val_bool(_enable) );

        return alloc_null();

    } DEFINE_PRIM(snow_system_lock_cursor, 1);



//display bindings



    value snow_desktop_get_display_count() {

        return alloc_int( snow::window::desktop_get_display_count() );

    } DEFINE_PRIM(snow_desktop_get_display_count, 0);


    value snow_desktop_get_display_mode_count(value _display) {

        return alloc_int( snow::window::desktop_get_display_mode_count( val_int(_display) ));

    } DEFINE_PRIM(snow_desktop_get_display_mode_count, 1);


    value snow_desktop_get_display_native_mode(value _display) {

        return snow::window::desktop_get_display_native_mode( val_int(_display) );

    } DEFINE_PRIM(snow_desktop_get_display_native_mode, 1);


    value snow_desktop_get_display_current_mode(value _display) {

        return snow::window::desktop_get_display_current_mode( val_int(_display) );

    } DEFINE_PRIM(snow_desktop_get_display_current_mode, 1);


    value snow_desktop_get_display_mode(value _display, value _mode_index) {

        return snow::window::desktop_get_display_mode( val_int(_display), val_int(_mode_index) );

    } DEFINE_PRIM(snow_desktop_get_display_mode, 2);


    value snow_desktop_get_display_bounds(value _display) {

        return snow::window::desktop_get_display_bounds( val_int(_display) );

    } DEFINE_PRIM(snow_desktop_get_display_bounds, 1);


    value snow_desktop_get_display_name(value _display) {

        return alloc_string( snow::window::desktop_get_display_name( val_int(_display) ));

    } DEFINE_PRIM(snow_desktop_get_display_name, 1);





// window bindings





    value snow_window_create( value _in_config, value _on_created ) {

            //fetch the callback for when it's done opening the window
        AutoGCRoot *on_created = new AutoGCRoot( _on_created );

            //fetch window config from the haxe side
        snow::window::window_config config = snow::window::window_config_from_hx(_in_config);
            //create the actual window
        snow::window::create_window( config, on_created );

        return alloc_null();

    } DEFINE_PRIM(snow_window_create, 2);


    value snow_window_update( value _window ) {

        snow::window::Window* window = NULL;

        if( Object_from_hx(_window, window) ) {

            window->update();

        } //fetch window

        return alloc_null();

    } DEFINE_PRIM(snow_window_update, 1);


    value snow_window_render( value _window ) {

        snow::window::Window* window = NULL;

        if( Object_from_hx(_window, window) ) {

            window->render();

        } //fetch window

        return alloc_null();

    } DEFINE_PRIM(snow_window_render, 1);


    value snow_window_swap( value _window ) {

        snow::window::Window* window = NULL;

        if( Object_from_hx(_window, window) ) {

            window->swap();

        } //fetch window

        return alloc_null();

    } DEFINE_PRIM(snow_window_swap, 1);


    value snow_window_close( value _window ) {

        snow::window::Window* window = NULL;

        if( Object_from_hx(_window, window) ) {

            window->close();

        } //fetch window

        return alloc_null();

    } DEFINE_PRIM(snow_window_close, 1);


    value snow_window_simple_message( value _window, value _message, value _title ) {

        snow::window::Window* window = NULL;

        if( Object_from_hx(_window, window) ) {

            window->simple_message( val_string(_message), val_string(_title) );

        } //fetch window

        return alloc_null();

    } DEFINE_PRIM(snow_window_simple_message, 3);


    value snow_window_set_size(value _window, value _x, value _y) {

        snow::window::Window* window = NULL;

        if( Object_from_hx(_window, window) ) {

            window->set_size( val_int(_x), val_int(_y) );

        } //fetch window

        return alloc_null();

    } DEFINE_PRIM(snow_window_set_size, 3);


    value snow_window_set_position(value _window, value _x, value _y) {

        snow::window::Window* window = NULL;

        if( Object_from_hx(_window, window) ) {

            window->set_position( val_int(_x), val_int(_y) );

        } //fetch window

        return alloc_null();

    } DEFINE_PRIM(snow_window_set_position, 3);


    value snow_window_set_title(value _window, value _title) {

        snow::window::Window* window = NULL;

        if( Object_from_hx(_window, window) ) {

            window->set_title( val_string(_title) );

        } //fetch window

        return alloc_null();

    } DEFINE_PRIM(snow_window_set_title, 2);


    value snow_window_set_max_size(value _window, value _x, value _y) {

        snow::window::Window* window = NULL;

        if( Object_from_hx(_window, window) ) {

            window->set_max_size( val_int(_x), val_int(_y) );

        } //fetch window

        return alloc_null();

    } DEFINE_PRIM(snow_window_set_max_size, 3);


    value snow_window_set_min_size(value _window, value _x, value _y) {

        snow::window::Window* window = NULL;

        if( Object_from_hx(_window, window) ) {

            window->set_min_size( val_int(_x), val_int(_y) );

        } //fetch window

        return alloc_null();

    } DEFINE_PRIM(snow_window_set_min_size, 3);


    value snow_window_grab(value _window, value _enable) {

        snow::window::Window* window = NULL;

        if( Object_from_hx(_window, window) ) {

            window->grab( val_bool(_enable) );

        } //fetch window

        return alloc_null();

    } DEFINE_PRIM(snow_window_grab, 2);

    value snow_window_set_cursor_position(value _window, value _x, value _y) {

        snow::window::Window* window = NULL;

        if( Object_from_hx(_window, window) ) {

            window->set_cursor_position( val_int(_x), val_int(_y) );

        } //fetch window

        return alloc_null();

    } DEFINE_PRIM(snow_window_set_cursor_position, 3);


    value snow_window_fullscreen( value _window, value _enable, value _flag ) {

        snow::window::Window* window = NULL;

        if( Object_from_hx(_window, window) ) {

            window->fullscreen( val_bool(_enable), val_int(_flag) );

        } //fetch window

        return alloc_null();

    } DEFINE_PRIM(snow_window_fullscreen, 3);


    value snow_window_bordered(value _window, value _enable) {

        snow::window::Window* window = NULL;

        if( Object_from_hx(_window, window) ) {

            window->bordered( val_bool(_enable) );

        } //fetch window

        return alloc_null();

    } DEFINE_PRIM(snow_window_bordered, 2);





// input bindings




    value snow_gamepad_open( value _id ) {

        snow::input::snow_gamepad_open(val_int(_id));

        return alloc_null();

    } DEFINE_PRIM(snow_gamepad_open, 1)

    value snow_gamepad_close( value _id ) {

        snow::input::snow_gamepad_close(val_int(_id));

        return alloc_null();

    } DEFINE_PRIM(snow_gamepad_close, 1)






// audio loading





//ogg

    value snow_assets_audio_load_info_ogg( value _id, value _do_read ) {

        bool do_read = val_bool(_do_read);
            //the destination for the read, if any
        QuickVec<unsigned char> buffer;
            //the source data ogg info
        snow::assets::audio::OGG_file_source* ogg_source = NULL;

        bool success = snow::assets::audio::load_info_ogg( buffer, val_string(_id), ogg_source, do_read );

        if(!success) {
            return alloc_null();
        } //!success

        value _object = alloc_empty_object();

            alloc_field( _object, id_id, _id );
            alloc_field( _object, id_format, alloc_int( 1 )); //1 here is ogg
            alloc_field( _object, id_channels, alloc_int( ogg_source->info->channels ));
            alloc_field( _object, id_rate, alloc_int( ogg_source->info->rate ));
            alloc_field( _object, id_bitrate, alloc_int( ogg_source->info->bitrate_nominal ));
            alloc_field( _object, id_bits_per_sample, alloc_int( 16 ) ); //:todo: optionize?
            alloc_field( _object, id_data, ByteArray(buffer).mValue );
            alloc_field( _object, id_length, alloc_int(ogg_source->length) );
            alloc_field( _object, id_length_pcm, alloc_int(ogg_source->length_pcm) );
            alloc_field( _object, id_handle, Object_to_hx(ogg_source) );

        return _object;

    } DEFINE_PRIM(snow_assets_audio_load_info_ogg, 2);

    value snow_assets_audio_read_bytes_ogg( value _info, value _start, value _len ) {

        QuickVec<unsigned char> buffer;

        value _handle = property_value(_info, id_handle);

        snow::assets::audio::OGG_file_source* ogg_source = NULL;

        if( !val_is_null(_handle) && Object_from_hx(_handle, ogg_source) ) {

            bool complete = snow::assets::audio::read_bytes_ogg( ogg_source, buffer, val_int(_start), val_int(_len) );

            ByteArray data(buffer);

            value _object = alloc_empty_object();

                alloc_field( _object, id_data, data.mValue );
                alloc_field( _object, id_complete, alloc_bool(complete) );

            return _object;

            return ByteArray(buffer).mValue;

        } else {

            return alloc_null();

        }

    } DEFINE_PRIM(snow_assets_audio_read_bytes_ogg, 3);

    value snow_assets_audio_seek_bytes_ogg( value _info, value _to ) {

        value _handle = property_value(_info, id_handle);

        snow::assets::audio::OGG_file_source* ogg_source = NULL;

        if( !val_is_null(_handle) && Object_from_hx(_handle, ogg_source) ) {

            return alloc_bool(snow::assets::audio::seek_bytes_ogg( ogg_source, val_int(_to) ));

        }

        return alloc_bool(false);

    } DEFINE_PRIM(snow_assets_audio_seek_bytes_ogg, 2);

//wav

    value snow_assets_audio_load_info_wav( value _id, value _do_read ) {

        bool do_read = val_bool(_do_read);
            //the destination for the read, if any
        QuickVec<unsigned char> buffer;
            //the source information for the wav file
        snow::assets::audio::WAV_file_source* wav_source = NULL;

        bool success = snow::assets::audio::load_info_wav( buffer, val_string(_id), wav_source, do_read );

        if(!success) {
            return alloc_null();
        } //!success

        ByteArray data(buffer);

        value _object = alloc_empty_object();

            alloc_field( _object, id_id, _id );
            alloc_field( _object, id_channels, alloc_int(wav_source->channels) );
            alloc_field( _object, id_rate, alloc_int(wav_source->rate) );
            alloc_field( _object, id_format, alloc_int(2) ); //2 here is wav
            alloc_field( _object, id_bitrate, alloc_int(wav_source->bitrate) );
            alloc_field( _object, id_bits_per_sample, alloc_int(wav_source->bits_per_sample) );
            alloc_field( _object, id_data, data.mValue );
            alloc_field( _object, id_length, alloc_int(wav_source->length) );
            alloc_field( _object, id_length_pcm, alloc_int(wav_source->length_pcm) );
            alloc_field( _object, id_handle, Object_to_hx(wav_source) );

        return _object;

    } DEFINE_PRIM(snow_assets_audio_load_info_wav, 2);


    value snow_assets_audio_read_bytes_wav( value _info, value _start, value _len ) {

        QuickVec<unsigned char> buffer;

        value _handle = property_value(_info, id_handle);

        snow::assets::audio::WAV_file_source* wav_source = NULL;

        if( !val_is_null(_handle) && Object_from_hx(_handle, wav_source) ) {

            bool complete = snow::assets::audio::read_bytes_wav( wav_source, buffer, val_int(_start), val_int(_len) );

            ByteArray data(buffer);

            value _object = alloc_empty_object();

                alloc_field( _object, id_data, data.mValue );
                alloc_field( _object, id_complete, alloc_bool(complete) );

            return _object;

        } else {

            return alloc_null();

        }

    } DEFINE_PRIM(snow_assets_audio_read_bytes_wav, 3);


    value snow_assets_audio_seek_bytes_wav( value _info, value _to ) {

        value _handle = property_value(_info, id_handle);

        snow::assets::audio::WAV_file_source* wav_source = NULL;

        if( !val_is_null(_handle) && Object_from_hx(_handle, wav_source) ) {

            return alloc_bool(snow::assets::audio::seek_bytes_wav( wav_source, val_int(_to) ));

        }

        return alloc_bool(false);

    } DEFINE_PRIM(snow_assets_audio_seek_bytes_wav, 2);


//pcm


    value snow_assets_audio_load_info_pcm( value _id, value _do_read ) {

        bool do_read = val_bool(_do_read);
            //the destination for the read, if any
        QuickVec<unsigned char> buffer;
            //the source information for the pcm file
        snow::assets::audio::PCM_file_source* pcm_source = NULL;

        bool success = snow::assets::audio::load_info_pcm( buffer, val_string(_id), pcm_source, do_read );

        if(!success) {
            return alloc_null();
        } //!success

        ByteArray data(buffer);

        value _object = alloc_empty_object();

            alloc_field( _object, id_id, _id );
            alloc_field( _object, id_channels, alloc_int(pcm_source->channels) );
            alloc_field( _object, id_rate, alloc_int(pcm_source->rate) );
            alloc_field( _object, id_format, alloc_int(3) ); //3 here is pcm
            alloc_field( _object, id_bitrate, alloc_int(pcm_source->bitrate) );
            alloc_field( _object, id_bits_per_sample, alloc_int(pcm_source->bits_per_sample) );
            alloc_field( _object, id_data, data.mValue );
            alloc_field( _object, id_length, alloc_int(pcm_source->length) );
            alloc_field( _object, id_length_pcm, alloc_int(pcm_source->length_pcm) );
            alloc_field( _object, id_handle, Object_to_hx(pcm_source) );

        return _object;

    } DEFINE_PRIM(snow_assets_audio_load_info_pcm, 2);


    value snow_assets_audio_read_bytes_pcm( value _info, value _start, value _len ) {

        QuickVec<unsigned char> buffer;

        value _handle = property_value(_info, id_handle);

        snow::assets::audio::PCM_file_source* pcm_source = NULL;

        if( !val_is_null(_handle) && Object_from_hx(_handle, pcm_source) ) {

            bool complete = snow::assets::audio::read_bytes_pcm( pcm_source, buffer, val_int(_start), val_int(_len) );

            ByteArray data(buffer);

            value _object = alloc_empty_object();

                alloc_field( _object, id_data, data.mValue );
                alloc_field( _object, id_complete, alloc_bool(complete) );

            return _object;

        } else {

            return alloc_null();

        }

    } DEFINE_PRIM(snow_assets_audio_read_bytes_pcm, 3);


    value snow_assets_audio_seek_bytes_pcm( value _info, value _to ) {

        value _handle = property_value(_info, id_handle);

        snow::assets::audio::PCM_file_source* pcm_source = NULL;

        if( !val_is_null(_handle) && Object_from_hx(_handle, pcm_source) ) {

            return alloc_bool(snow::assets::audio::seek_bytes_pcm( pcm_source, val_int(_to) ));

        }

        return alloc_bool(false);

    } DEFINE_PRIM(snow_assets_audio_seek_bytes_pcm, 2);





// Assets / Images





    value snow_assets_image_load_info( value _id, value _req_bpp ) {

        QuickVec<unsigned char> buffer;

        int w = 0, h = 0, bpp = 0, bpp_source = 0;
        int req_bpp = val_int(_req_bpp);

        bool success = snow::assets::image::load_info( buffer, val_string(_id), &w, &h, &bpp, &bpp_source, req_bpp );

        if(!success) {
            return alloc_null();
        }

        value _object = alloc_empty_object();

            alloc_field( _object, id_id, _id );
            alloc_field( _object, id_width, alloc_int(w) );
            alloc_field( _object, id_height, alloc_int(h) );
            alloc_field( _object, id_bpp, alloc_int(bpp) );
            alloc_field( _object, id_bpp_source, alloc_int(bpp_source) );
            alloc_field( _object, id_data, ByteArray(buffer).mValue );

        return _object;

    } DEFINE_PRIM(snow_assets_image_load_info, 2);


    value snow_assets_image_info_from_bytes( value _id, value _bytes, value _req_bpp ) {

        QuickVec<unsigned char> buffer;

        int w = 0, h = 0, bpp = 0, bpp_source = 0;
        int req_bpp = val_int(_req_bpp);

        bool success = snow::assets::image::info_from_bytes( buffer, ByteArray(_bytes), val_string(_id), &w, &h, &bpp, &bpp_source, req_bpp );

        if(!success) {
            return alloc_null();
        }

        value _object = alloc_empty_object();

            alloc_field( _object, id_id, _id );
            alloc_field( _object, id_width, alloc_int(w) );
            alloc_field( _object, id_height, alloc_int(h) );
            alloc_field( _object, id_bpp, alloc_int(bpp) );
            alloc_field( _object, id_bpp_source, alloc_int(bpp_source) );
            alloc_field( _object, id_data, ByteArray(buffer).mValue );

        return _object;

    } DEFINE_PRIM(snow_assets_image_info_from_bytes, 3);




//io bindings


    //url helper

        value snow_io_url_open(value _url) {

            snow::io::url_open( std::string(val_string(_url)) );

            return alloc_null();

        } DEFINE_PRIM(snow_io_url_open, 1);

    //file dialogs

        value snow_io_dialog_open(value _title) {

            std::string result = snow::io::dialog_open( std::string(val_string(_title)) );

            return alloc_string( result.c_str() );

        } DEFINE_PRIM(snow_io_dialog_open, 1);

        value snow_io_dialog_save(value _title) {

            std::string result = snow::io::dialog_save( std::string(val_string(_title)) );

            return alloc_string( result.c_str() );

        } DEFINE_PRIM(snow_io_dialog_save, 1);

        value snow_io_dialog_folder(value _title) {

            std::string result = snow::io::dialog_folder( std::string(val_string(_title)) );

            return alloc_string( result.c_str() );

        } DEFINE_PRIM(snow_io_dialog_folder, 1);


    //file notifications

        value snow_io_add_watch(value _path) {

            snow::io::add_watch( std::string(val_string(_path)) );

            return alloc_null();

        } DEFINE_PRIM(snow_io_add_watch, 1);

        value snow_io_remove_watch(value _path) {

            bool removed = snow::io::remove_watch( std::string(val_string(_path)) );

            return alloc_bool(removed);

        } DEFINE_PRIM(snow_io_remove_watch, 1);

    //file io

        value snow_iosrc_from_file(value _id, value _mode) {

            snow::io::iosrc_file* iosrc = new snow::io::iosrc_file();

            iosrc->file_source = snow::io::iosrc_fromfile( val_string(_id), val_string(_mode) );

            return Object_to_hx(iosrc);

        } DEFINE_PRIM(snow_iosrc_from_file, 2);


        value snow_iosrc_file_read(value _handle, value _dest, value _size, value _maxnum) {

            snow::io::iosrc_file* iosrc = NULL;
            QuickVec<unsigned char> buffer;

            if( Object_from_hx(_handle, iosrc) ) {

                if(!val_is_null(_dest)) {

                    ByteArray dest(_dest);

                    int res = snow::io::read(iosrc->file_source, dest.Bytes(), val_int(_size), val_int(_maxnum));

                    return alloc_int(res);
                }

            } //object from hx

            return alloc_int(-1);

        } DEFINE_PRIM(snow_iosrc_file_read, 4);


        value snow_iosrc_file_write(value _handle, value _data, value _size, value _num) {

            snow::io::iosrc_file* iosrc = NULL;

            if( Object_from_hx(_handle, iosrc) ) {

                if(!val_is_null(_data)) {

                    ByteArray data(_data);

                    long size = val_int(_size);
                    long num = val_int(_num);
                    long len = size * num;

                    if(data.Size() != len) {
                        data.Resize(len);
                    }

                    int res = snow::io::write(iosrc->file_source, data.Bytes(), size, num);

                    return alloc_int(res);

                } //data != null

            } //object from hx

            return alloc_int(-1);

        } DEFINE_PRIM(snow_iosrc_file_write, 4);


        value snow_iosrc_file_seek(value _handle, value _offset, value _whence) {

            snow::io::iosrc_file* iosrc = NULL;

            if( Object_from_hx(_handle, iosrc) ) {

                int res = snow::io::seek(iosrc->file_source, val_int(_offset), val_int(_whence));

                return alloc_int(res);

            } //object from hx

            return alloc_int(-1);

        } DEFINE_PRIM(snow_iosrc_file_seek, 3);


        value snow_iosrc_file_tell(value _handle) {

            snow::io::iosrc_file* iosrc = NULL;

            if( Object_from_hx(_handle, iosrc) ) {

                int res = snow::io::tell(iosrc->file_source);

                return alloc_int(res);

            } //object from hx

            return alloc_int(-1);

        } DEFINE_PRIM(snow_iosrc_file_tell, 1);


        value snow_iosrc_file_close(value _handle) {

            snow::io::iosrc_file* iosrc = NULL;

            if( Object_from_hx(_handle, iosrc) ) {

                int res = snow::io::close(iosrc->file_source);

                return alloc_int(res);

            } //object from hx

            return alloc_int(-1);

        } DEFINE_PRIM(snow_iosrc_file_close, 1);



//LZMA bindings





    value snow_lzma_encode(value input_value) {

       buffer input_buffer = val_to_buffer(input_value);
       buffer output_buffer = alloc_buffer_len(0);

       native_toolkit_lzma::Lzma::Encode(input_buffer, output_buffer);

       return buffer_val(output_buffer);

    } DEFINE_PRIM(snow_lzma_encode,1);

    value snow_lzma_decode(value input_value) {

       buffer input_buffer = val_to_buffer(input_value);
       buffer output_buffer = alloc_buffer_len(0);

       native_toolkit_lzma::Lzma::Decode(input_buffer, output_buffer);

       return buffer_val(output_buffer);

    } DEFINE_PRIM(snow_lzma_decode,1);





//ByteArray bindings





    value snow_byte_array_overwrite_file(value inFilename, value inBytes) {

        ByteArray::ToFile(val_os_string(inFilename), ByteArray(inBytes));

        return alloc_null();

    } DEFINE_PRIM(snow_byte_array_overwrite_file, 2);


    value snow_byte_array_read_file(value inFilename) {

        ByteArray result = ByteArray::FromFile(val_os_string(inFilename));

        return result.mValue;

    } DEFINE_PRIM(snow_byte_array_read_file,1);


    value snow_byte_array_get_native_pointer(value inByteArray) {

        ByteArray bytes(inByteArray);

        if (!val_is_null (bytes.mValue)) {
            return alloc_int((intptr_t)bytes.Bytes ());
        }

        return alloc_null();

    } DEFINE_PRIM(snow_byte_array_get_native_pointer,1);




//Native glue stuff


    int id_id;
    int id_type;
    int id_event;
    int id_x;
    int id_y;
    int id_width;
    int id_height;
    int id_text;
    int id_length;
    int id_data;
    int id_handle;
    int id_complete;

    int id_window;
    int id_window_id;
    int id_timestamp;
    int id_data1;
    int id_data2;

    int id_path;
    int id_filewatch;

    int id_refresh_rate;

    int id_input;
    int id_start;
    int id_state;
    int id_repeat;
    int id_mod;
    int id_sym;
    int id_keysym;
    int id_scancode;
    int id_which;
    int id_xrel;
    int id_yrel;
    int id_button;
    int id_dx;
    int id_dy;
    int id_finger_id;
    int id_touch_id;
    int id_pressure;
    int id_axis;
    int id_value;
    int id_ball;
    int id_hat;

    int id_bpp;
    int id_bpp_source;

    int id_format;
    int id_length_pcm;
    int id_channels;
    int id_rate;
    int id_bitrate;
    int id_bits_per_sample;
    int id_bitrate_upper;
    int id_bitrate_nominal;
    int id_bitrate_lower;
    int id_bitrate_window;

    int id_title;
    int id_fullscreen;
    int id_resizable;
    int id_borderless;
    int id_antialiasing;
    int id_depth_bits;
    int id_stencil_bits;



    #ifdef STATIC_LINK
        extern "C" int snow_opengl_sdl2_register_prims();
        extern "C" int snow_audio_openal_register_prims();
    #endif //STATIC_LINK

    extern "C" int snow_register_prims() {

          snow_entry_point();

            #ifdef STATIC_LINK
                snow_opengl_sdl2_register_prims();
                snow_audio_openal_register_prims();
            #endif

        return 0;

    } //snow_register_prims



} //snow namespace

