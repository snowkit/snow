/*
    Copyright Sven Bergström 2014
    created for snow https://github.com/underscorediscovery/snow
    MIT license
*/

#ifndef STATIC_LINK
#define IMPLEMENT_API
#endif

#if defined(HX_WINDOWS) || defined(HX_MACOS) || defined(HX_LINUX)
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

#include "common/snow_hx.h"

namespace snow {

        //have id's etc been inited?
    static int global_snow_init = false;
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


    value snow_init( value _on_event, value _init_config ) {

            //fetch the callback for system events
        system_event_handler = new AutoGCRoot(_on_event);

            //fetch config values
        bool has_loop = property_bool(_init_config, id_has_loop, true);
        snow::log_level = property_int(_init_config, id_log_level, 1);

        if(snow::log_level > 1) {
            snow::log(1, "/ snow / native / log level set to %d\n", snow::log_level);
        }

            //now init the core
        snow::core::snow_init( has_loop );

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


    value snow_pref_path(value _package, value _app) {

        return alloc_string( snow::core::pref_path( val_string(_package), val_string(_app) ) );

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




    value snow_window_create( value _in_render_config, value _in_config, value _on_created ) {

            //fetch the callback for when it's done opening the window
        AutoGCRoot *on_created = new AutoGCRoot( _on_created );

            //fetch window config from the haxe side
        snow::window::RenderConfig render_config = snow::window::render_config_from_hx(_in_render_config);
        snow::window::WindowConfig config = snow::window::window_config_from_hx(_in_config);
            //create the actual window
        snow::window::create_window( render_config, config, on_created );

        return alloc_null();

    } DEFINE_PRIM(snow_window_create, 3);


    value snow_window_update( value _window ) {

        snow::window::Window* window = snow::from_hx<snow::window::Window>(_window);

        if( window ) {
            window->update();
        }

        return alloc_null();

    } DEFINE_PRIM(snow_window_update, 1);


    value snow_window_render( value _window ) {

        snow::window::Window* window = snow::from_hx<snow::window::Window>(_window);

        if( window ) {
            window->render();
        }

        return alloc_null();

    } DEFINE_PRIM(snow_window_render, 1);


    value snow_window_swap( value _window ) {

        snow::window::Window* window = snow::from_hx<snow::window::Window>(_window);

        if( window ) {
            window->swap();
        }

        return alloc_null();

    } DEFINE_PRIM(snow_window_swap, 1);


    value snow_window_close( value _window ) {

        snow::window::Window* window = snow::from_hx<snow::window::Window>(_window);

        if( window ) {
            window->close();
        }

        return alloc_null();

    } DEFINE_PRIM(snow_window_close, 1);

    value snow_window_show( value _window ) {

        snow::window::Window* window = snow::from_hx<snow::window::Window>(_window);

    if( window ) {
           window->show();
        }

        return alloc_null();

    } DEFINE_PRIM(snow_window_show, 1);

    value snow_window_destroy_window( value _window ) {

        snow::window::Window* window = snow::from_hx<snow::window::Window>(_window);

        snow::window::destroy_window(window);

        return alloc_null();

    } DEFINE_PRIM(snow_window_destroy_window, 1);


    value snow_window_simple_message( value _window, value _message, value _title ) {

        snow::window::Window* window = snow::from_hx<snow::window::Window>(_window);

        if( window ) {
            window->simple_message( val_string(_message), val_string(_title) );
        }

        return alloc_null();

    } DEFINE_PRIM(snow_window_simple_message, 3);


    value snow_window_set_size(value _window, value _x, value _y) {

        snow::window::Window* window = snow::from_hx<snow::window::Window>(_window);

        if( window ) {
            window->set_size( val_int(_x), val_int(_y) );
        }

        return alloc_null();

    } DEFINE_PRIM(snow_window_set_size, 3);


    value snow_window_set_position(value _window, value _x, value _y) {

        snow::window::Window* window = snow::from_hx<snow::window::Window>(_window);

        if( window ) {
            window->set_position( val_int(_x), val_int(_y) );
        }

        return alloc_null();

    } DEFINE_PRIM(snow_window_set_position, 3);


    value snow_window_set_title(value _window, value _title) {

        snow::window::Window* window = snow::from_hx<snow::window::Window>(_window);

        if( window ) {
            window->set_title( val_string(_title) );
        }

        return alloc_null();

    } DEFINE_PRIM(snow_window_set_title, 2);


    value snow_window_set_max_size(value _window, value _x, value _y) {

        snow::window::Window* window = snow::from_hx<snow::window::Window>(_window);

        if( window ) {
            window->set_max_size( val_int(_x), val_int(_y) );
        }

        return alloc_null();

    } DEFINE_PRIM(snow_window_set_max_size, 3);


    value snow_window_set_min_size(value _window, value _x, value _y) {

        snow::window::Window* window = snow::from_hx<snow::window::Window>(_window);

        if( window ) {
            window->set_min_size( val_int(_x), val_int(_y) );
        }

        return alloc_null();

    } DEFINE_PRIM(snow_window_set_min_size, 3);


    value snow_window_grab(value _window, value _enable) {

        snow::window::Window* window = snow::from_hx<snow::window::Window>(_window);

        if( window ) {
            window->grab( val_bool(_enable) );
        }

        return alloc_null();

    } DEFINE_PRIM(snow_window_grab, 2);

    value snow_window_set_cursor_position(value _window, value _x, value _y) {

        snow::window::Window* window = snow::from_hx<snow::window::Window>(_window);

        if( window ) {
            window->set_cursor_position( val_int(_x), val_int(_y) );
        }

        return alloc_null();

    } DEFINE_PRIM(snow_window_set_cursor_position, 3);


    value snow_window_fullscreen( value _window, value _enable, value _flag ) {

        snow::window::Window* window = snow::from_hx<snow::window::Window>(_window);

        if( window ) {
            window->fullscreen( val_bool(_enable), val_int(_flag) );
        }

        return alloc_null();

    } DEFINE_PRIM(snow_window_fullscreen, 3);


    value snow_window_bordered(value _window, value _enable) {

        snow::window::Window* window = snow::from_hx<snow::window::Window>(_window);

        if( window ) {
            window->bordered( val_bool(_enable) );
        }

        return alloc_null();

    } DEFINE_PRIM(snow_window_bordered, 2);





// input bindings



    //text input


    value snow_input_text_start() {

        snow::input::snow_text_start();

        return alloc_null();

    } DEFINE_PRIM(snow_input_text_start, 0)


    value snow_input_text_stop() {

        snow::input::snow_text_stop();

        return alloc_null();

    } DEFINE_PRIM(snow_input_text_stop, 0)


    value snow_input_text_rect( value _x, value _y, value _w, value _h ) {

        snow::input::snow_text_rect( val_int(_x), val_int(_y), val_int(_w), val_int(_h) );

        return alloc_null();

    } DEFINE_PRIM(snow_input_text_rect, 4)






// audio loading





//ogg

    value snow_assets_audio_load_info_ogg( value _id, value _do_read, value _bytes, value _byteOffset, value _byteLength ) {

        bool from_bytes = !val_is_null(_bytes);
        bool do_read = val_bool(_do_read);
        std::string _asset_id(val_string(_id));

            //the destination for the read, if any
        QuickVec<unsigned char> buffer;
            //the source data ogg info
        snow::assets::audio::OGG_file_source* ogg_source = new snow::assets::audio::OGG_file_source();
        ogg_source->source_name = _asset_id;

        if(!from_bytes) {
            ogg_source->file_source = snow::io::iosrc_from_file(_asset_id.c_str(), "rb");
        } else {
            int byteOffset = val_int(_byteOffset);
            int byteLength = val_int(_byteLength);
            const unsigned char* bytes = snow::bytes_from_hx(_bytes);
            ogg_source->file_source = snow::io::iosrc_from_mem( (void*)(bytes + byteOffset), byteLength );
        }

        bool success = snow::assets::audio::load_info_ogg( buffer, _asset_id.c_str(), ogg_source, do_read );

        if(!success) {
            if(ogg_source) { delete ogg_source; ogg_source = NULL; }
            return alloc_null();
        } //!success

        value data = snow::bytes_to_hx( &buffer[0], buffer.size() );

        value _object = alloc_empty_object();

            alloc_field( _object, id_id, _id );
            alloc_field( _object, id_format, alloc_int( 1 )); //1 here is ogg

            alloc_field( _object, id_handle, snow::to_hx<snow::assets::audio::OGG_file_source>( ogg_source ) );

            value _dataobject = alloc_empty_object();

                alloc_field( _dataobject, id_channels, alloc_int( ogg_source->info->channels ));
                alloc_field( _dataobject, id_rate, alloc_int( ogg_source->info->rate ));
                alloc_field( _dataobject, id_bitrate, alloc_int( ogg_source->info->bitrate_nominal ));
                alloc_field( _dataobject, id_bits_per_sample, alloc_int( 16 ) ); //:todo: optionize?
                alloc_field( _dataobject, id_bytes, data );
                alloc_field( _dataobject, id_length, alloc_int(ogg_source->length) );
                alloc_field( _dataobject, id_length_pcm, alloc_int(ogg_source->length_pcm) );

            alloc_field( _object, id_data, _dataobject );

        return _object;

    } DEFINE_PRIM(snow_assets_audio_load_info_ogg, 5);

    value snow_assets_audio_read_bytes_ogg( value _info, value _start, value _len ) {

        QuickVec<unsigned char> buffer;

        value _handle = property_value(_info, id_handle);

        snow::assets::audio::OGG_file_source* ogg_source = snow::from_hx<snow::assets::audio::OGG_file_source>(_handle);

        if( !val_is_null(_handle) && ogg_source ) {

            bool complete = snow::assets::audio::read_bytes_ogg( ogg_source, buffer, val_int(_start), val_int(_len) );

            value data = snow::bytes_to_hx( &buffer[0], buffer.size() );

            value _object = alloc_empty_object();

                alloc_field( _object, id_bytes, data );
                alloc_field( _object, id_complete, alloc_bool(complete) );

            return _object;

        } else {

            return alloc_null();

        }

    } DEFINE_PRIM(snow_assets_audio_read_bytes_ogg, 3);

    value snow_assets_audio_seek_bytes_ogg( value _info, value _to ) {

        value _handle = property_value(_info, id_handle);

        snow::assets::audio::OGG_file_source* ogg_source = snow::from_hx<snow::assets::audio::OGG_file_source>(_handle);

        if( !val_is_null(_handle) && ogg_source ) {

            return alloc_bool(snow::assets::audio::seek_bytes_ogg( ogg_source, val_int(_to) ));

        }

        return alloc_bool(false);

    } DEFINE_PRIM(snow_assets_audio_seek_bytes_ogg, 2);

//wav

    value snow_assets_audio_load_info_wav( value _id, value _do_read, value _bytes, value _byteOffset, value _byteLength ) {

        bool from_bytes = !val_is_null(_bytes);
        bool do_read = val_bool(_do_read);
        std::string _asset_id(val_string(_id));

            //the destination for the read, if any
        QuickVec<unsigned char> buffer;

            //the source information for the wav file
        snow::assets::audio::WAV_file_source* wav_source = new snow::assets::audio::WAV_file_source();
        wav_source->source_name = _asset_id;

        if(!from_bytes) {
            wav_source->file_source = snow::io::iosrc_from_file(_asset_id.c_str(), "rb");
        } else {
            int byteOffset = val_int(_byteOffset);
            int byteLength = val_int(_byteLength);
            const unsigned char* bytes = snow::bytes_from_hx(_bytes);
            wav_source->file_source = snow::io::iosrc_from_mem( (void*)(bytes + byteOffset), byteLength );
        }

        bool success = snow::assets::audio::load_info_wav( buffer, _asset_id.c_str(), wav_source, do_read );

        if(!success) {
            if(wav_source) { delete wav_source; wav_source = NULL; }
            return alloc_null();
        } //!success

        value data = snow::bytes_to_hx( &buffer[0], buffer.size() );

        value _object = alloc_empty_object();

            alloc_field( _object, id_id, _id );
            alloc_field( _object, id_format, alloc_int(2) ); //2 here is wav

            alloc_field( _object, id_handle, snow::to_hx<snow::assets::audio::WAV_file_source>( wav_source ) );

            value _dataobject = alloc_empty_object();

                alloc_field( _dataobject, id_channels, alloc_int(wav_source->channels) );
                alloc_field( _dataobject, id_rate, alloc_int(wav_source->rate) );
                alloc_field( _dataobject, id_bitrate, alloc_int(wav_source->bitrate) );
                alloc_field( _dataobject, id_bits_per_sample, alloc_int(wav_source->bits_per_sample) );
                alloc_field( _dataobject, id_bytes, data );
                alloc_field( _dataobject, id_length, alloc_int(wav_source->length) );
                alloc_field( _dataobject, id_length_pcm, alloc_int(wav_source->length_pcm) );

            alloc_field( _object, id_data, _dataobject );

        return _object;

    } DEFINE_PRIM(snow_assets_audio_load_info_wav, 5);


    value snow_assets_audio_read_bytes_wav( value _info, value _start, value _len ) {

        QuickVec<unsigned char> buffer;

        value _handle = property_value(_info, id_handle);

        snow::assets::audio::WAV_file_source* wav_source = snow::from_hx<snow::assets::audio::WAV_file_source>(_handle);

        if( !val_is_null(_handle) && wav_source ) {

            bool complete = snow::assets::audio::read_bytes_wav( wav_source, buffer, val_int(_start), val_int(_len) );

            value data = snow::bytes_to_hx( &buffer[0], buffer.size() );

            value _object = alloc_empty_object();

                alloc_field( _object, id_bytes, data );
                alloc_field( _object, id_complete, alloc_bool(complete) );

            return _object;

        } else {

            return alloc_null();

        }

    } DEFINE_PRIM(snow_assets_audio_read_bytes_wav, 3);


    value snow_assets_audio_seek_bytes_wav( value _info, value _to ) {

        value _handle = property_value(_info, id_handle);

        snow::assets::audio::WAV_file_source* wav_source = snow::from_hx<snow::assets::audio::WAV_file_source>(_handle);

        if( !val_is_null(_handle) && wav_source ) {

            return alloc_bool(snow::assets::audio::seek_bytes_wav( wav_source, val_int(_to) ));

        }

        return alloc_bool(false);

    } DEFINE_PRIM(snow_assets_audio_seek_bytes_wav, 2);

//pcm


    value snow_assets_audio_load_info_pcm( value _id, value _do_read, value _bytes, value _byteOffset, value _byteLength ) {

        bool from_bytes = !val_is_null(_bytes);
        bool do_read = val_bool(_do_read);
        std::string _asset_id(val_string(_id));

            //the destination for the read, if any
        QuickVec<unsigned char> buffer;
            //the source information for the pcm file
        snow::assets::audio::PCM_file_source* pcm_source = new snow::assets::audio::PCM_file_source();
        pcm_source->source_name = _asset_id;

        if(!from_bytes) {
            pcm_source->file_source = snow::io::iosrc_from_file(_asset_id.c_str(), "rb");
        } else {
            int byteOffset = val_int(_byteOffset);
            int byteLength = val_int(_byteLength);
            const unsigned char* bytes = snow::bytes_from_hx(_bytes);
            pcm_source->file_source = snow::io::iosrc_from_mem( (void*)(bytes + byteOffset), byteLength );
        }

        bool success = snow::assets::audio::load_info_pcm( buffer, _asset_id.c_str(), pcm_source, do_read );

        if(!success) {
            if(pcm_source) { delete pcm_source; pcm_source = NULL; }
            return alloc_null();
        } //!success

        value data = snow::bytes_to_hx( &buffer[0], buffer.size() );

        value _object = alloc_empty_object();

            alloc_field( _object, id_id, _id );
            alloc_field( _object, id_format, alloc_int(3) ); //3 here is pcm

            alloc_field( _object, id_handle, snow::to_hx<snow::assets::audio::PCM_file_source>( pcm_source ) );

            value _dataobject = alloc_empty_object();

                alloc_field( _dataobject, id_channels, alloc_int(pcm_source->channels) );
                alloc_field( _dataobject, id_rate, alloc_int(pcm_source->rate) );
                alloc_field( _dataobject, id_bitrate, alloc_int(pcm_source->bitrate) );
                alloc_field( _dataobject, id_bits_per_sample, alloc_int(pcm_source->bits_per_sample) );
                alloc_field( _dataobject, id_bytes, data );
                alloc_field( _dataobject, id_length, alloc_int(pcm_source->length) );
                alloc_field( _dataobject, id_length_pcm, alloc_int(pcm_source->length_pcm) );

            alloc_field( _object, id_data, _dataobject );

        return _object;

    } DEFINE_PRIM(snow_assets_audio_load_info_pcm, 5);


    value snow_assets_audio_read_bytes_pcm( value _info, value _start, value _len ) {

        QuickVec<unsigned char> buffer;

        value _handle = property_value(_info, id_handle);

        snow::assets::audio::PCM_file_source* pcm_source = snow::from_hx<snow::assets::audio::PCM_file_source>(_handle);

        if( !val_is_null(_handle) && pcm_source ) {

            bool complete = snow::assets::audio::read_bytes_pcm( pcm_source, buffer, val_int(_start), val_int(_len) );

            value data = snow::bytes_to_hx( &buffer[0], buffer.size() );

            value _object = alloc_empty_object();

                alloc_field( _object, id_bytes, data );
                alloc_field( _object, id_complete, alloc_bool(complete) );

            return _object;

        } else {

            return alloc_null();

        }

    } DEFINE_PRIM(snow_assets_audio_read_bytes_pcm, 3);


    value snow_assets_audio_seek_bytes_pcm( value _info, value _to ) {

        value _handle = property_value(_info, id_handle);

        snow::assets::audio::PCM_file_source* pcm_source = snow::from_hx<snow::assets::audio::PCM_file_source>(_handle);

        if( !val_is_null(_handle) && pcm_source ) {

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

        value data = snow::bytes_to_hx( &buffer[0], buffer.size() );

        value _object = alloc_empty_object();

            alloc_field( _object, id_id, _id );
            alloc_field( _object, id_width, alloc_int(w) );
            alloc_field( _object, id_height, alloc_int(h) );
            alloc_field( _object, id_bpp, alloc_int(bpp) );
            alloc_field( _object, id_bpp_source, alloc_int(bpp_source) );
            alloc_field( _object, id_data, data );

        return _object;

    } DEFINE_PRIM(snow_assets_image_load_info, 2);


    value snow_assets_image_info_from_bytes( value _id, value _bytes, value _byteOffset, value _byteLength, value _req_bpp ) {

        QuickVec<unsigned char> buffer;

        int w = 0, h = 0, bpp = 0, bpp_source = 0;
        int req_bpp = val_int(_req_bpp);
        int byteOffset = val_int(_byteOffset);
        int byteLength = val_int(_byteLength);

        bool success =
            snow::assets::image::info_from_bytes(
                buffer,
                snow::bytes_from_hx(_bytes),
                byteOffset,
                byteLength,
                val_string(_id),
                &w, &h, &bpp, &bpp_source,
                req_bpp
            );

        if(!success) {
            return alloc_null();
        }

        value result_bytes = snow::bytes_to_hx( &buffer[0], buffer.size() );

        value _object = alloc_empty_object();

            alloc_field( _object, id_id, _id );
            alloc_field( _object, id_width, alloc_int(w) );
            alloc_field( _object, id_height, alloc_int(h) );
            alloc_field( _object, id_bpp, alloc_int(bpp) );
            alloc_field( _object, id_bpp_source, alloc_int(bpp_source) );
            alloc_field( _object, id_data, result_bytes );

        return _object;

    } DEFINE_PRIM(snow_assets_image_info_from_bytes, 5);




//io bindings


    //url helper

        value snow_io_url_open(value _url) {

            snow::io::url_open( std::string(val_string(_url)) );

            return alloc_null();

        } DEFINE_PRIM(snow_io_url_open, 1);

    //file dialogs

        value snow_io_dialog_open(value _title, value _filters) {

            std::vector<snow::io::file_filter> filters = snow::io::file_filter_list_from_hx(_filters);
            std::string result = snow::io::dialog_open( std::string(val_string(_title)), filters );

            return alloc_string( result.c_str() );

        } DEFINE_PRIM(snow_io_dialog_open, 2);

        value snow_io_dialog_save(value _title, value _filters) {

            std::vector<snow::io::file_filter> filters = snow::io::file_filter_list_from_hx(_filters);
            std::string result = snow::io::dialog_save( std::string(val_string(_title)), filters );

            return alloc_string( result.c_str() );

        } DEFINE_PRIM(snow_io_dialog_save, 2);

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

            snow::io::iosrc* src = snow::io::iosrc_from_file( val_string(_id), val_string(_mode) );

            if(!src) {
                return alloc_null();
            }

            snow::io::iosrc_file* iosrc = new snow::io::iosrc_file();

                iosrc->file_source = src;

            return snow::to_hx<snow::io::iosrc_file>( iosrc );

        } DEFINE_PRIM(snow_iosrc_from_file, 2);


        value snow_iosrc_file_read(value _handle, value _dest, value _size, value _maxnum) {

            snow::io::iosrc_file* iosrc = snow::from_hx<snow::io::iosrc_file>( _handle );
            QuickVec<unsigned char> buffer;

            if( iosrc ) {

                if(!val_is_null(_dest)) {

                    unsigned char* dest = snow::bytes_from_hx_rw(_dest);

                    int res = snow::io::read(iosrc->file_source, dest, val_int(_size), val_int(_maxnum));

                    return alloc_int(res);
                }

            } //object from hx

            return alloc_int(-1);

        } DEFINE_PRIM(snow_iosrc_file_read, 4);


        value snow_iosrc_file_write(value _handle, value _data, value _size, value _num) {

            snow::io::iosrc_file* iosrc = snow::from_hx<snow::io::iosrc_file>( _handle );

            if( iosrc ) {

                if(!val_is_null(_data)) {

                    const unsigned char* data = snow::bytes_from_hx(_data);

                    long size = val_int(_size);
                    long num = val_int(_num);
                    long len = size * num;

                    int res = snow::io::write(iosrc->file_source, data, size, num);

                    return alloc_int(res);

                } //data != null

            } //object from hx

            return alloc_int(-1);

        } DEFINE_PRIM(snow_iosrc_file_write, 4);


        value snow_iosrc_file_seek(value _handle, value _offset, value _whence) {

            snow::io::iosrc_file* iosrc = snow::from_hx<snow::io::iosrc_file>( _handle );

            if( iosrc ) {

                int res = snow::io::seek(iosrc->file_source, val_int(_offset), val_int(_whence));

                return alloc_int(res);

            } //object from hx

            return alloc_int(-1);

        } DEFINE_PRIM(snow_iosrc_file_seek, 3);


        value snow_iosrc_file_tell(value _handle) {

            snow::io::iosrc_file* iosrc = snow::from_hx<snow::io::iosrc_file>( _handle );

            if( iosrc ) {

                int res = snow::io::tell(iosrc->file_source);

                return alloc_int(res);

            } //object from hx

            return alloc_int(-1);

        } DEFINE_PRIM(snow_iosrc_file_tell, 1);


        value snow_iosrc_file_close(value _handle) {

            snow::io::iosrc_file* iosrc = snow::from_hx<snow::io::iosrc_file>( _handle );

            if( iosrc ) {

                int res = snow::io::close(iosrc->file_source);

                    //close should free the filesource
                iosrc->file_source = NULL;

                delete iosrc;
                iosrc = NULL;

                return alloc_int(res);

            } //object from hx

            return alloc_int(-1);

        } DEFINE_PRIM(snow_iosrc_file_close, 1);





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
    int id_bytes;
    int id_handle;
    int id_complete;
    int id_has_loop;
    int id_log_level;

    int id_window;
    int id_window_id;
    int id_timestamp;
    int id_data1;
    int id_data2;

    int id_path;
    int id_file;
    int id_extension;
    int id_desc;

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

    int id_render_config;
    int id_opengl;
    int id_profile;
    int id_major;
    int id_minor;

    int id_config;
    int id_title;
    int id_fullscreen;
    int id_fullscreen_desktop;
    int id_resizable;
    int id_borderless;
    int id_antialiasing;
    int id_red_bits;
    int id_green_bits;
    int id_blue_bits;
    int id_alpha_bits;
    int id_depth_bits;
    int id_stencil_bits;
    int id_depth;
    int id_stencil;


    #ifdef STATIC_LINK
        extern "C" int snow_opengl_register_prims();
        #ifdef SNOW_USE_OPENAL
            extern "C" int snow_audio_openal_register_prims();
        #endif //SNOW_USE_OPENAL
    #endif //STATIC_LINK

    extern "C" int snow_register_prims() {

          snow_entry_point();

            #ifdef STATIC_LINK
                snow_opengl_register_prims();
                #ifdef SNOW_USE_OPENAL
                    snow_audio_openal_register_prims();
                #endif //SNOW_USE_OPENAL
            #endif

        return 0;

    } //snow_register_prims



} //snow namespace
