/*
    Copyright Sven Bergström 2014
    created for snow https://github.com/underscorediscovery/snow
    MIT license
*/

#ifndef _SNOW_RENDER_H_
#define _SNOW_RENDER_H_


namespace snow {
    namespace render {

        void set_context_attributes(
            int red_bits, int green_bits, int blue_bits, int alpha_bits,
            int depth_bits, int stencil_bits, int antialiasing
        );

    } //render namespace
} //snow namespace

#endif //_SNOW_RENDER_H_